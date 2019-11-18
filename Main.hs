module Main where

import Text.ParserCombinators.Parsec hiding (runParser)
import Control.Applicative hiding ((<|>))
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
  | Code Text
  deriving (Eq, Show)


someTill :: Parser a -> Parser end -> Parser [a]
someTill p end = scan
                 where scan = (try ((:[]) <$> p <* end)) <|>
                              (liftA2 (:) p scan)

runParser :: Parser a -> String -> Either ParseError a
runParser p s = parse p "" s


sorroundP :: Parser start -> Parser end -> Parser String
sorroundP start end = start *> someTill anyChar (try end)

parseSurrounded :: String -> String -> Parser Text
parseSurrounded start end = do 
  surroundedText <- sorroundP (string start) (string end)
  case runParser textP surroundedText of
    Left err -> fail $ show err
    Right res -> return res

boldP :: Parser Inline
boldP = Bold <$> (parseSurrounded "__" "__")

italicsP :: Parser Inline
italicsP = Italics <$> (parseSurrounded "**" "**")


literalP :: Parser Inline
literalP = Literal <$> some anyChar

inlineP :: Parser Inline 
inlineP = boldP <|> italicsP <|> literalP


textP :: Parser Text
textP = some inlineP  

main :: IO ()
main = putStrLn "Hello, Haskell!"
