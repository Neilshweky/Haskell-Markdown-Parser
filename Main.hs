module Main where

import Text.Parsec.Char
import Text.ParserCombinators.Parsec hiding (runParser)
import Control.Applicative hiding ((<|>), many, optional)
import Control.Monad (guard, when, join,liftM2)
import Data.List (reverse)
import Data.Char (isSpace, isAlpha, isAlphaNum)
import Data.Set (Set)
import qualified Data.Set as Set (fromList, member)
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
  | BlockQuote [Block]
  | CodeBlock Info PlainText
  | ThematicBreak
  | UnorderedList [ListItem]
  | OrderedList Int [ListItem]
  | LiteralBlock String
  deriving (Eq, Show)

type ListItem = [Block]
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
  | Code String
  | Link Text String (Maybe String)
  | Image String String (Maybe String)
  | HardBreak
  deriving (Eq, Show)

--TODO fix code spans
someTill :: Parser a -> Parser end -> Parser [a]
someTill p end = scan
                 where scan = (try ((:[]) <$> p <* end)) <|>
                              (liftA2 (:) p scan) <|> empty

someTillNonCommittal :: Parser a -> Parser end -> Parser [a]
someTillNonCommittal p end = scan
                  where scan = (try ((:[]) <$> p <* (lookAhead $ end))) <|>
                              (liftA2 (:) p scan) <|> empty

runParser :: Parser a -> String -> Either ParseError a
runParser p s = parse p "" s

sorroundP :: Bool -> Parser start -> Parser end -> Parser Text
sorroundP isPar start end = start *> (mergeInlines <$> someTill (inlineP isPar) (try end))

parseSurrounded :: Bool -> String -> String -> Parser Text
parseSurrounded isPar start end = sorroundP isPar (string start) (string end)

boldP :: Bool -> Parser Inline
boldP isPar = Bold <$> ((parseSurrounded isPar "**" "**") <|> try (parseSurrounded isPar "__" "__"))

italicsP :: Bool -> Parser Inline
italicsP isPar = Italics <$> ((parseSurrounded isPar "*" "*") <|> (parseSurrounded isPar "_" "_"))

-- strip whitespace?
codeP :: Parser Inline
codeP = Code 
        <$> (try (string "``" *> p (string "``"))
        <|> (char '`' *> p (char '`')))
  where
    p :: Parser a -> Parser String
    p = manyTill (notFollowedBy (string "\n\n") >> f <$> anyChar)
    f x = if x=='\n' then ' ' else x

rsvdChars :: String
rsvdChars = "*_`)[] <!#\n\\"

reserved :: Char -> Bool
reserved c = c `elem` rsvdChars

literalP :: Parser Inline
literalP = Literal . dropJustWsp <$> some (notFollowedBy (endOfLine *> wsp *> endOfLine) *> (try (char '\\') *> (satisfy (/='\n')) <|> satisfy (not . reserved)))

-- escapedP :: Parser Inline
-- escapedP = char '\\' *> (Literal <$> ((:[]) <$> anyChar))


linkDestTitleP :: Parser (String, Maybe String)
linkDestTitleP = (char '(' *> many (char ' ') *> p <* many (char ' ') <* (char ')'))
  where              
    p = (,) <$> destLinkP <*> titleP
    destLinkP :: Parser String
    destLinkP = try (char '<' *> manyTill (satisfy (/= '\n')) (char '>')) 
                <|> many (satisfy (\c -> c /= ' ' && c /= ')' && c /= '\n'))
    titleP :: Parser (Maybe String)
    titleP = try (Just <$> (some (char ' ') *> try wrappedTitleP)) <|> const Nothing <$> (many (char ' ') *> string "")
    wrappedTitleP :: Parser String
    wrappedTitleP = choice [
      char '"' *> manyTill anyChar  (char '"'),
      char '\'' *> manyTill anyChar  (char '\''),
      char '(' *> manyTill anyChar  (char ')')
      ]

linkP :: Bool -> Parser Inline
linkP isPar = (\text (link, title) -> Link text link title)
                <$> (char '[' *> (mergeInlines <$> manyTill inlineP' (char ']')))
                <*> linkDestTitleP
  where
    inlineP' :: Parser Inline
    inlineP' = try $ do
                  notFollowedBy autoLinkP
                  notFollowedBy $ linkP isPar
                  inlineP isPar

imageP :: Parser Inline
imageP = (\alt (link, title) -> Image alt link title)
         <$> (string "![" *>  manyTill anyChar (char ']'))
         <*> linkDestTitleP

autoLinkP :: Parser Inline
autoLinkP = (\s -> Link [Literal s] s Nothing) <$> p
  where
    p :: Parser String
    p = char '<' *> ((++) <$> prefixP <*> (notFollowedBy codeP >> many urlChar <* (char '>')))
    prefixP :: Parser String
    prefixP = (\a b c -> a:b++[c])
                <$> satisfy isAlpha
                <*> some (satisfy (\c -> isAlphaNum c || c == '.' || c == '+' || c == '-'))
                <*> char ':'
    urlChar :: Parser Char
    urlChar = satisfy (flip Set.member whiteList)
    whiteList :: Set Char
    whiteList =  Set.fromList ("ABCDEFGHIJKLMNOPQRSTUVWXYZ" 
                            ++ "abcdefghijklmnopqrstuvwxyz"
                            ++ "0123456789-._~:/?#[]@!$&'()*+,;=")

hardBreakP :: Bool -> Parser Inline
hardBreakP isPar = do
  guard isPar
  try $ string "\\" <|> (count 2 (char ' ') <* many (char ' '))
  try $ lookAhead $ char '\n' <* many (char ' ') <* satisfy (/= '\n')
  return HardBreak

inlineP :: Bool -> Parser Inline
inlineP isPar = notFollowedBy (endOfLine *> wsp *> endOfLine) *> choice [
  try codeP, try imageP, try autoLinkP, try $ linkP isPar,
  try $ boldP isPar, try $ italicsP isPar, try $ hardBreakP isPar, try literalP
  <|> Literal . (:[]) <$> ((try (endOfLine <* wsp)) <|> (oneOf rsvdChars)) 
  ]

textPBase :: Bool -> Parser Text
textPBase isPar = mergeInlines <$> some (inlineP isPar)

textP :: Parser Text
textP = textPBase False

removeTrailingWsp :: String -> String
removeTrailingWsp [] = []
removeTrailingWsp [' '] = []
removeTrailingWsp (x:xs) = x:(removeTrailingWsp xs)

mergeInlines :: Text -> Text
mergeInlines [] = []
mergeInlines [x] = [x]
mergeInlines (x1:x2:xs) = case (x1, x2) of
  (Literal a, Literal b@"\n") -> mergeInlines $ (Literal ((removeTrailingWsp a) ++ b)):xs
  (Literal a, Literal b) -> mergeInlines $ (Literal (a ++ b)):xs
  (Bold a, Bold b) -> mergeInlines $ (Bold (mergeInlines $ a ++ b)):xs
  (Italics a, Italics b) -> mergeInlines $ (Italics (mergeInlines $ a ++ b)):xs
  (Strong a, Strong b) -> mergeInlines $ (Strong (mergeInlines $ a ++ b)):xs
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
    l <- some (char '#') 
    guard ((length l) < 7 && (length l) > 0)
    tRaw <- some (char ' ') *> (try (someTill (inlineP False)  endOfLine) <|> textP)
    let t = mergeInlines tRaw
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
  l <- string [c,c] *> some (char c) <* wsp
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

reservedBlock :: Char -> Bool
reservedBlock c = c `elem` ['#', '>', '-', '~', '*']

interruptsP :: Parser Block
interruptsP = (try thematicBreakP) <|> (try headingP) <|> (try codeBlockP) <|> (try listP)

lineP :: Parser Text
lineP = do 
  -- _ <- notFollowedBy endOfLine
  -- _ <- notFollowedBy interruptsP
  -- _ <- wsp
  text <- textP 
  return text

paragraphP :: Parser Block
paragraphP = Paragraph . mergeInlines <$>
  (try (someTill inlineP' (try (endOfLine *> endOfLine) <|> lookAhead (endOfLine <* wsp <* lookAhead interruptsP)))
  <|> some inlineP')
  where inlineP' = inlineP True

tbP :: Char -> Parser Block 
tbP c = do
  t <- count 3 (char c <* wsp)
  i <- many (char (head t) <* wsp) *> optionMaybe (satisfy (/='\n'))
  case i of
    Just _ -> (do fail "no other chars in thematic breaks")
    Nothing -> (do return ())
  return ThematicBreak

thematicBreakP :: Parser Block
thematicBreakP = wsp *> (tbP '*' <|> tbP '~' <|> tbP '-')

-- blockQuoteP start here tomorrow!

-- cLineP :: Parser [Block]
-- cLineP = do
--   sps <- (wsp <* (oneOf ">"))
--   block <- blockP
--   _ <- many (try (wsp *> endOfLine))
--   blocks <- many (indentedBlockQP (length sps + length sps2 + 1)) 
--   return (block:blocks)
  

-- indentedBlockQP :: Int -> Parser Block
-- indentedBlockQP i = do
--   _ <- lookAhead (wsp *> noneOf "-*+")
--   sps <- try (count i (char ' '))
--   block <- try blockP
--   _ <- many (try (wsp *> endOfLine))
--   return block

-- blockQuoteP :: Parser Block
-- blockQuoteP = BlockQuote <$> some cLineP

-- -- no p in list item if no \n
uListItemP :: Parser [Block]
uListItemP = do
  sps <- lookAhead (wsp <* (oneOf "-*+"))
  sps2 <- try (wsp *> (oneOf "-*+") *> some (char ' '))
  block <- blockP
  _ <- many (try (wsp *> endOfLine))
  blocks <- many (indentedBlockP (length sps + length sps2 + 1)) 
  return (block:blocks)
  

indentedBlockP :: Int -> Parser Block
indentedBlockP i = do
  _ <- lookAhead (wsp *> noneOf "-*+")
  sps <- try (count i (char ' '))
  --sps2 <- lookAhead wsp
  block <- blockP--try indentedBlockP (i + ) <|>  try blockP
  _ <- many (try (wsp *> endOfLine))
  return block

--
oListItemP :: Parser [Block]
oListItemP = do
  sps <- lookAhead (wsp <* beginningIntP)
  num <- lookAhead beginningIntP
  sps2 <- try (wsp *> beginningIntP *> some (char ' '))
  block <- blockP
  _ <- many (try (wsp *> endOfLine))
  blocks <- many (orderedIndentedBlockP (length sps + length sps2 + length num + 1)) 
  return (block:blocks)
  

orderedIndentedBlockP :: Int -> Parser Block
orderedIndentedBlockP i = do
  _ <- lookAhead (wsp *> notFollowedBy beginningIntP)
  sps <- try (count i (char ' '))
  block <- try blockP
  _ <- many (try (wsp *> endOfLine))
  return block
--

bulletListP :: Parser Block
bulletListP = do
  blocks <- some (try uListItemP) -- [Block]
  return (UnorderedList blocks)

beginningIntP :: Parser String
beginningIntP = do
  start <- ((many digit) <* char '.')
  guard (length start < 10)
  return start

orderedListP :: Parser Block 
orderedListP = do
  start <- lookAhead beginningIntP
  blocks <- some (try oListItemP) -- [Block]
  return (OrderedList ((read :: String -> Int) start) blocks)

listP :: Parser Block
listP = bulletListP <|> orderedListP

blockP :: Parser Block
blockP = ((try indentedCodeBlockP) <|> (try thematicBreakP) <|> (try listP) <|> (try headingP) 
          <|> (try codeBlockP) <|> (try paragraphP)) <* optional (many endOfLine)

documentP :: Parser Document
documentP = many blockP 



main :: IO ()
main = putStrLn "Hello, Haskell!"