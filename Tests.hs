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

-- BLOCK-Level tests
tHeading :: Test
tHeading = TestList [  tHeadingH1, tHeadingH3, tHeadingH7, tHeadingNoSpace,
                        tHeadingInline, tHeadingSpaceBefore, tHeadingIndentSpace,
                        tHeadingIndentSpace2, tHeadingIndentSpace4, tHeadingEscape,
                        tHeadingTrailingSpace, tHeadingTrailingSpaceBold, tHeadingClosing,
                        tHeadingTrailingClosing, tHeadingTrailingClosingLetter, tHeadingEmpty ] 


tHeadingH1 :: Test 
tHeadingH1 = "heading h1 test" ~: 
    runParser headingP "# hello" ~?= Right (Heading H1 [Literal "hello"])

tHeadingH3 :: Test 
tHeadingH3 = "heading h3 test" ~: 
    runParser headingP "### hello" ~?= Right (Heading H3 [Literal "hello"])

tHeadingH7 :: Test 
tHeadingH7 = "heading h7 test" ~: 
    runParser blockP "####### hello" ~?= Right (Paragraph [Literal "####### hello"])

tHeadingNoSpace :: Test 
tHeadingNoSpace = "heading no space test" ~: 
    runParser blockP "####hello" ~?= Right (Paragraph [Literal "####hello"])

tHeadingInline :: Test 
tHeadingInline = "heading inline test" ~: 
    runParser blockP "#### *hello*" ~?= Right (Heading H4 [Italics [Literal "hello"]])

tHeadingSpaceBefore :: Test 
tHeadingSpaceBefore = "heading space before test" ~: 
    runParser blockP "####        *hello*" ~?= Right (Heading H4 [Italics [Literal "hello"]])

tHeadingIndentSpace :: Test 
tHeadingIndentSpace = "heading indent space test" ~: 
    runParser blockP "   #### hello" ~?= Right (Heading H4 [Literal "hello"])

tHeadingIndentSpace2 :: Test 
tHeadingIndentSpace2 = "heading indent space 2 test" ~: 
    runParser blockP "  #### hello" ~?= Right (Heading H4 [Literal "hello"])

tHeadingIndentSpace4 :: Test 
tHeadingIndentSpace4 = "heading indent space 4 test" ~: 
    runParser blockP "    #### hello" ~?= Right (Paragraph [Literal "    #### hello"])

tHeadingEscape :: Test 
tHeadingEscape = "heading escape test" ~: 
    runParser blockP "\\## hello" ~?= Right (Paragraph [Literal "\\## hello"])

tHeadingTrailingSpace :: Test 
tHeadingTrailingSpace = "heading TrailingSpace test" ~: 
    runParser blockP "## hello    " ~?= Right (Heading H2 [Literal "hello"])

tHeadingTrailingSpaceBold :: Test 
tHeadingTrailingSpaceBold = "heading TrailingSpaceBold test" ~: 
    runParser blockP "## **hello   **    " ~?= Right (Heading H2 [Bold [Literal "hello   "]])

tHeadingClosing :: Test 
tHeadingClosing = "heading Closing test" ~: 
    runParser blockP "## hello ##" ~?= Right (Heading H2 [Literal "hello"])

tHeadingTrailingClosing :: Test 
tHeadingTrailingClosing = "heading trailing closing test" ~: 
    runParser blockP "## hello ###   " ~?= Right (Heading H2 [Literal "hello"])

tHeadingTrailingClosingLetter :: Test 
tHeadingTrailingClosingLetter = "heading trailing closing letter test" ~: 
    runParser blockP "## hello ### b  " ~?= Right (Heading H2 [Literal "hello ### b"])

tHeadingEmpty :: Test 
tHeadingEmpty = "heading empty test" ~: 
    runParser blockP "## ###  " ~?= Right (Heading H2 [])




main :: IO ()
main = do
    _ <- runTestTT tInlines
    return ()