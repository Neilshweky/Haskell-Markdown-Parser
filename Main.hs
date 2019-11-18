module Main where

import Text.ParserCombinators.Parsec hiding (runParser)
import Control.Applicative hiding ((<|>), many)
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
  | CodeBlock Text
  deriving (Eq, Show)

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


someTill :: Parser a -> Parser end -> Parser [a]
someTill p end = scan
                 where scan = (try ((:[]) <$> p <* end)) <|>
                              (liftA2 (:) p scan)

runParser :: Parser a -> String -> Either ParseError a
runParser p s = parse p "" s


surroundP :: Parser start -> Parser end -> Parser Text
surroundP start end = start *> someTill inlineP (try end)

parseSurrounded :: String -> String -> Parser Text
parseSurrounded start end = between (string start) (string end) textP
  -- do 
  -- surroundedText <- surroundP (string start) (string end)
  -- case runParser textP surroundedText of
  --   Left err -> fail $ show err
  --   Right res -> return res

boldP :: Parser Inline
boldP = Bold <$> ((parseSurrounded "**" "**") <|> (parseSurrounded "__" "__"))

italicsP :: Parser Inline
italicsP = Italics <$> ((parseSurrounded "*" "*") <|> (parseSurrounded "_" "_"))

-- strip whitespace?
codeP :: Parser Inline
codeP = Code <$> (parseSurrounded "`" "`")

reserved :: Char -> Bool
reserved c = c `elem` ['*', '_', '`', '\\']

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

blockP :: Parser Block
blockP = paragraphP

documentP :: Parser Document
documentP = some blockP

main :: IO ()
main = putStrLn "Hello, Haskell!"
