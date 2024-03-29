{-# LANGUAGE DeriveGeneric #-}
module CMarkTests where

import qualified Data.ByteString.Lazy as B
import Data.Aeson
import GHC.Generics
import Control.Monad (mzero)
import Test.HUnit (Test(..), (~?=), (~:), runTestTT)
import Data.Either (isLeft, fromRight)
import Lucid (renderText, renderToFile)
import Data.Text.Lazy (unpack)
import Data.Set (Set)
import qualified Data.Set as Set
import Text.Parsec.Char
import Text.ParserCombinators.Parsec hiding (runParser)

-- import Test.QuickCheck (Arbitrary(..), Testable(..), Gen, elements,
--     oneof, frequency, sized, quickCheckWith, stdArgs, maxSize,
--     classify,  maxSuccess, listOf, resize, scale, (==>))


import MarkDownParse hiding (main)
import HtmlConvert

data CMarkTest = CMarkTest {
        markdown :: String,
        html  :: String,
        example  :: Int,
        start_line  :: Int,
        end_line  :: Int,
        section  :: String
} deriving (Generic, Show)

instance FromJSON CMarkTest
instance ToJSON CMarkTest

jsonFile :: FilePath
jsonFile = "tests.json"

getJSON :: IO B.ByteString
getJSON = B.readFile jsonFile


main :: IO ()
main = do
    d <- (eitherDecode <$> getJSON) :: IO (Either String [CMarkTest])   
    -- case d of
    --     Left err -> putStrLn err
    --     Right ps -> print ps
    let (Right ps) = d
    -- let ps' = filter (\p -> Set.member (section p) includedSections) ps 
    _ <- runTestTT (TestList (testList ps))
    return ()
-- Features not supporting: 
-- tabs, escapings, link reference, 1) lists, block quotes, 
-- Setext headings, HTML blocks, autolinks for images

includedSections :: Set String
includedSections = Set.fromList ["Tabs"]
    
testList :: [CMarkTest] -> [Test]
testList = map (\x -> "Example No:" ++ show (example x) ~: render (markdown x) ~?= html x)

decoder :: Parser String
decoder = many $ choice [
    try $ '&' <$ string "&amp;",
    try $ '<' <$ string "&lt;",
    try $ '>' <$ string "&gt;",
    try $ '"' <$ string "&quot;",
    try $ '\'' <$ string "&#39;",
    try $ '/' <$ string " &#47;",
    anyChar
    ]

render :: String -> String
render x = case runParser documentP x of
    Left err -> ""
    Right doc -> (unpack . renderText . convertDocumentNoDoctype) doc
    --fromRight "" $ runParser decoder ((unpack . renderText . convertDocumentNoDoctype) doc)



-- tArrayTest :: Test
-- tArrayTest = TestList (testArray 4)

-- testArray :: [a]
