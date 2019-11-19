module Main where

import Text.Parsec.Char
import Text.ParserCombinators.Parsec hiding (runParser)
import Control.Applicative hiding ((<|>), many, optional)
import Control.Monad (guard)
import Data.List (reverse)
import Data.Char (isSpace)
-- list of top level stuff
type Document = [Block]

data HeadingLevel 
  = H1
  | H2
  | H3
  | H4
  | H5
  | H6
  deriving (Eq, Show)
-- types of top level elements
data Block 
  = Heading HeadingLevel Text
  | Paragraph Text
  | BlockQuote Text
  | CodeBlock Info PlainText
  deriving (Eq, Show)

type Info = String
type PlainText = String
-- A combination of strings and inlines
type Text = [Inline]

-- Either a string or an inline
data Inline 
  = Literal String
  | Bold Text
  | Italics Text
  | Strong Text
  | Code Text
  deriving (Eq, Show)

--TODO fix code spans
someTill :: Parser a -> Parser end -> Parser [a]
someTill p end = scan
                 where scan = (try ((:[]) <$> p <* end)) <|>
                              (liftA2 (:) p scan)

runParser :: Parser a -> String -> Either ParseError a
runParser p s = parse p "" s


sorroundP :: Parser start -> Parser end -> Parser Text
sorroundP start end = start *> someTill inlineP (try end)

parseSurrounded :: String -> String -> Parser Text
parseSurrounded start end = sorroundP (string start) (string end)

boldP :: Parser Inline
boldP = Bold <$> ((parseSurrounded "**" "**") <|> (parseSurrounded "__" "__"))

italicsP :: Parser Inline
italicsP = Italics <$> ((parseSurrounded "*" "*") <|> (parseSurrounded "_" "_"))

-- strip whitespace?
codeP :: Parser Inline
codeP = Code <$> ((try (parseSurrounded "``" "``")) <|> (parseSurrounded "`" "`"))

reserved :: Char -> Bool
reserved c = c `elem` ['*', '_', '`']

literalP :: Parser Inline
literalP = Literal <$> some (satisfy (not . reserved))

-- escapedP :: Parser Inline
-- escapedP = char '\\' *> (Literal <$> ((:[]) <$> anyChar))

inlineP :: Parser Inline 
inlineP = (try boldP) <|> (try italicsP) <|> (try codeP) <|> literalP

textP :: Parser Text
textP = some inlineP  

paragraphP :: Parser Block
paragraphP = Paragraph <$> textP

headingLevel :: Int -> HeadingLevel
headingLevel 1 = H1
headingLevel 2 = H2
headingLevel 3 = H3
headingLevel 4 = H4
headingLevel 5 = H5
headingLevel 6 = H6
headingLevel _ = H1

dropSpaces :: [Inline] -> [Inline]
dropSpaces ((Literal l):[]) = if length list == 0 then [] else [Literal list] where
      dropS ls@(x:xs) = if (x == ' ' || x == '#') then dropS xs else ls
      dropS [] = []

      list = (reverse (dropS (reverse l)))
dropSpaces (x:[]) = [x]
dropSpaces [] = []
dropSpaces (x:xs) = x:(dropSpaces xs)

 

headingP :: Parser Block
headingP = 
  do -- parse initial spaces
    sps <- many (char ' ')
    guard (length sps <= 3)
    l <- many1 (char '#') 
    guard ((length l) < 7 && (length l) > 0)
    _ <- some (char ' ')
    t <- textP
    if length t == 0 then return (Heading (headingLevel (length l)) t)
                     else return (Heading (headingLevel (length l)) (dropSpaces t))


reservedCode :: Char -> Bool
reservedCode c = c `elem` ['`','~']

plainTextP :: Char -> Parser PlainText
plainTextP c = many (satisfy (not . (==c)))                   

codeBlockP :: Parser Block
codeBlockP = codeBlockSurround '`' <|> codeBlockSurround '~'

wsp :: Parser String
wsp = (many (char ' ')) 


dropWsp s = reverse (dropS (reverse s)) where
  dropS ls@(x:xs) = if (x == '\n') then xs else 
                    if (x == ' ') then dropS xs else ls
  dropS [] = []

dropJustWsp s = reverse (dropS (reverse s)) where
  dropS ls@(x:xs) = if (x == ' ') then dropS xs else ls
  dropS [] = []

-- only backticks
codeBlockSurround :: Char -> Parser Block
codeBlockSurround c = do
  sps <- many (char ' ')
  guard (length sps <= 3)
  l <- char c *> char c *> many1 (char c) <* wsp
  i <- many (alphaNum <|> char ' ') <* endOfLine
  text <- plainTextP c 
  _ <- count (2 + length l) (char c) <* many (char c)
  return (CodeBlock (dropJustWsp i) (dropWsp text))

blockP :: Parser Block
blockP = (try headingP) <|> (try codeBlockP) <|> paragraphP

documentP :: Parser Document
documentP = some blockP



main :: IO ()
main = putStrLn "Hello, Haskell!"
