module Main where

import Text.Parsec.Char
import Text.ParserCombinators.Parsec hiding (runParser)
import Control.Applicative hiding ((<|>), many, optional)
import Control.Monad (guard, when, join)
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
  | ThematicBreak
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
  | Link Text String (Maybe String)
  deriving (Eq, Show)

--TODO fix code spans
someTill :: Parser a -> Parser end -> Parser [a]
someTill p end = scan
                 where scan = (try ((:[]) <$> p <* end)) <|>
                              (liftA2 (:) p scan) <|> empty

runParser :: Parser a -> String -> Either ParseError a
runParser p s = parse p "" s


sorroundP :: Parser start -> Parser end -> Parser Text
sorroundP start end = start *> someTill inlineP (try end)

parseSurrounded :: String -> String -> Parser Text
parseSurrounded start end = sorroundP (string start) (string end)

boldP :: Parser Inline
boldP = Bold <$> ((parseSurrounded "**" "**") <|> try (parseSurrounded "__" "__")) 

italicsP :: Parser Inline
italicsP = Italics <$> ((parseSurrounded "*" "*") <|> (parseSurrounded "_" "_"))

-- strip whitespace?
codeP :: Parser Inline
codeP = Code <$> ((try (parseSurrounded "``" "``")) <|> (parseSurrounded "`" "`"))

reserved :: Char -> Bool
reserved c = c `elem` ['*', '_', '`','\n', ')', '[', ']']

literalP :: Parser Inline
literalP = Literal <$> some (satisfy (not . reserved))

-- escapedP :: Parser Inline
-- escapedP = char '\\' *> (Literal <$> ((:[]) <$> anyChar))

linkP :: Parser Inline
linkP =  try parseLink <|> parseAutoLink where
  parseLink :: Parser Inline
  parseLink = (\text (link, title) -> Link text link title) 
                <$> (char '[' *> (mergeInlines <$> manyTill inlineP' (char ']')))
                <*> (char '(' *> many (char ' ') *> linkTitleP <* many (char ' ') <* (char ')'))
  linkTitleP ::  Parser (String, Maybe String)
  linkTitleP = (,) <$> destLinkP <*> titleP
  destLinkP :: Parser String
  destLinkP = try (char '<' *> manyTill (satisfy (/= '\n')) (char '>')) 
              <|> many (satisfy (\c -> c /= ' ' && c /= ')' && c /= '\n'))
  titleP :: Parser (Maybe String)
  titleP = try (Just <$> (some (char ' ') *> wrappedTitleP)) <|> const Nothing <$> (many (char ' ') *> string "")
  wrappedTitleP = choice [
    char '"' *> manyTill anyChar  (char '"'),
    char '\'' *> manyTill anyChar  (char '\''),
    char '(' *> manyTill anyChar  (char ')')
    ]
  inlineP' :: Parser Inline
  inlineP' = try (notFollowedBy linkP) >> inlineP
  parseAutoLink :: Parser Inline
  -- TODO: auto link
  parseAutoLink = unexpected "unimplemented"

inlineP :: Parser Inline 
inlineP = (try linkP) <|> (try boldP) <|> (try italicsP) <|> (try codeP) <|> (try literalP) 
          <|> Literal . (:[]) <$> (oneOf "'*', '_', '`','\n', ')', '[', ']'")

textP :: Parser Text
textP = mergeInlines <$> some inlineP

mergeInlines :: Text -> Text
mergeInlines [] = []
mergeInlines [x] = [x]
mergeInlines (x1:x2:xs) = case (x1, x2) of
  (Literal a, Literal b) -> mergeInlines $ (Literal (a ++ b)):xs
  (Bold a, Bold b) -> mergeInlines $ (Bold (a ++ b)):xs
  (Italics a, Italics b) -> mergeInlines $ (Italics (a ++ b)):xs
  (Strong a, Strong b) -> mergeInlines $ (Strong (a ++ b)):xs
  (Code a, Code b) -> mergeInlines $ (Code (a++b)):xs
  _ -> x1:(mergeInlines (x2:xs))


--Done inline parsers

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

 

wsp :: Parser String
wsp = (many (char ' ')) 

headingP :: Parser Block
headingP = 
  do -- parse initial spaces
    sps <- wsp
    guard (length sps < 4)
    l <- many1 (char '#') 
    guard ((length l) < 7 && (length l) > 0)
    t <- some (char ' ') *> textP
    return (Heading (headingLevel (length l)) (if length t == 0 then t else (dropSpaces t)))


plainTextP :: Char -> Parser PlainText
plainTextP c = many (satisfy (/=c))                   

codeBlockP :: Parser Block
codeBlockP = codeBlockSurround '`' <|> codeBlockSurround '~'

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
  sps <- wsp
  guard (length sps <= 3)
  l <- string [c,c] *> many1 (char c) <* wsp
  i <- many (alphaNum <|> char ' ') <* endOfLine
  text <- plainTextP c 
  _ <- count (2 + length l) (char c) <* many (char c)
  return (CodeBlock (dropJustWsp i) (dropWsp text))

eolWspP :: Parser Char
eolWspP = do
  i <- endOfLine
  l <- lookAhead wsp
  when ((length l) < 4) (do { _ <- wsp; return () })
  return i

indentedLineP :: Parser PlainText
indentedLineP = do
  _ <- count 4 (char ' ') 
  t <- many (satisfy (not . (=='\n')))
  t' <- many (eolWspP)
  return (t <> t')


indentedCodeBlockP :: Parser Block
indentedCodeBlockP = (CodeBlock "") <$> join <$> some indentedLineP

lineP :: Parser Text
lineP = do 
  _ <- lookAhead $ satisfy (not . (=='\n'))
  text <- (try (someTill inlineP (char '\n'))) <|> textP
  return text

paragraphP :: Parser Block
paragraphP = Paragraph <$> join <$> some lineP

tbP :: Char -> Parser Block 
tbP c = do
  t <- count 3 (char c <* wsp)
  i <- many (char (head t) <* wsp) *> optionMaybe endOfLine *> optionMaybe anyChar
  case i of
    Just _ -> (do fail "no other chars in thematic breaks")
    Nothing -> (do return ())
  return ThematicBreak

thematicBreakP :: Parser Block
thematicBreakP = wsp *> (tbP '*' <|> tbP '~' <|> tbP '-')

-- blockQuoteP start here tomorrow!

blockP :: Parser Block
blockP = ((try indentedCodeBlockP) <|> (try thematicBreakP) <|> (try headingP) <|> (try codeBlockP) <|> paragraphP) <* optional (try (manyTill anyChar endOfLine) <|> many anyChar)

documentP :: Parser Document
documentP = some blockP



main :: IO ()
main = putStrLn "Hello, Haskell!"
