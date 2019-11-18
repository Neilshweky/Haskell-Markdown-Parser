module Tests where

import Test.HUnit (Test(..), (~?=), (~:), runTestTT)
-- import Test.QuickCheck (Arbitrary(..), Testable(..), Gen, elements,
--     oneof, frequency, sized, quickCheckWith, stdArgs, maxSize,
--     classify,  maxSuccess, listOf, resize, scale, (==>))


import Main


tInlines :: Test
tInlines = TestList [  tBoldTest, tItalicsTest, tCodeTest, tLiteralTest, 
                        tLiteralUntilTest, tTextBold, tTextBoldUnderline, 
                        tTextBoldItalics, tTextNested, tStrongEmph ]

tBoldTest :: Test
tBoldTest = "bold test" ~: 
        runParser boldP "**hello**" ~?= Right (Bold [Literal "hello"])

tItalicsTest :: Test
tItalicsTest = "italics test" ~: 
        runParser italicsP "*hello*" ~?= Right (Italics [Literal "hello"])
    
tCodeTest :: Test
tCodeTest = "Code test" ~: 
        runParser codeP "`hello`" ~?= Right (Code [Literal "hello"])
        
tLiteralTest :: Test
tLiteralTest = "Literal test" ~: 
        runParser literalP "hello" ~?= Right (Literal "hello")

tLiteralUntilTest :: Test
tLiteralUntilTest = "LiteralUntil test" ~: 
        runParser literalP "hello* world" ~?= Right (Literal "hello")


tTextBold :: Test
tTextBold = "TextBold test" ~: 
        runParser textP "world **Hello**" ~?= Right [Literal "world ",Bold [Literal "Hello"]]

tTextBoldUnderline :: Test
tTextBoldUnderline = "TextBoldUnderline test" ~: 
        runParser textP "world __Hello__" ~?= Right [Literal "world ",Bold [Literal "Hello"]]

tTextBoldItalics :: Test
tTextBoldItalics = "TextBoldItalics test" ~: 
        runParser textP "hey **Hello***world*" ~?= Right [Literal "hey ",Bold [Literal "Hello"],Italics [Literal "world"]]

tTextNested :: Test
tTextNested = "TextNested test" ~: 
        runParser textP "**Hello, *fucking*, world**" ~?= Right [Bold [Literal "Hello, ",Italics [Literal "fucking"],Literal ", world"]]
        
tStrongEmph :: Test
tStrongEmph = "StrongEmph test" ~: 
        runParser textP "***Hello***" ~?= Right [Bold [Italics [Literal "Hello"]]]



main :: IO ()
main = do
    _ <- runTestTT tInlines
    return ()