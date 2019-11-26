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
import Text.StringLike
import Data.Set (Set)
import HTMLEntities.Decoder
import   qualified          Text.HTML.TagSoup as TS
import qualified Data.Set as Set
import Text.Parsec.Char
import Text.ParserCombinators.Parsec hiding (runParser)

-- import Test.QuickCheck (Arbitrary(..), Testable(..), Gen, elements,
--     oneof, frequency, sized, quickCheckWith, stdArgs, maxSize,
--     classify,  maxSuccess, listOf, resize, scale, (==>))


import Main
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

includedSections :: Set String
includedSections = Set.fromList ["Lists"]
    
testList :: [CMarkTest] -> [Test]
testList (x:xs) = ("Example No:" ++ show (example x) ~: render (markdown x) ~?= (html x)):[] --(testList xs)
testList [] = []

decoder :: Parser String
decoder = many $ choice [
    try $ const '&' <$> string "&amp;",
    try $ const '<' <$> string "&lt;",
    try $ const '>' <$> string "&gt;",
    try $ const '"' <$> string "&quot;",
    try $ const '\'' <$> string "&#39;",
    try $ const '/' <$> string " &#47;",
    anyChar
    ]

render :: String -> String
render x = case (runParser documentP x) of
    Left err -> ""
    Right doc -> fromRight "" $ runParser decoder ((unpack . renderText . convertDocumentNoDoctype) doc)


-- credit to: https://stackoverflow.com/a/28372448/3192218
decodeHTMLentities :: (StringLike str, Show str) => str -> str   
decodeHTMLentities s = TS.fromTagText $ head $ TS.parseTags s

-- tArrayTest :: Test
-- tArrayTest = TestList (testArray 4)

-- testArray :: [a]
