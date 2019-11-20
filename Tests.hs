module Tests where

import Test.HUnit (Test(..), (~?=), (~:), runTestTT)
-- import Test.QuickCheck (Arbitrary(..), Testable(..), Gen, elements,
--     oneof, frequency, sized, quickCheckWith, stdArgs, maxSize,
--     classify,  maxSuccess, listOf, resize, scale, (==>))


import Main


tInlines :: Test
tInlines = TestList [  tBoldTest, tItalicsTest, tCodeTest, tCodeDouble, tLiteralTest, 
                        tLiteralUntilTest, tTextBold, tTextBoldUnderline, 
                        tTextBoldItalics, tTextNested, tStrongEmph, tTextNotClosed, tTextOneNotClosed ]

tBoldTest :: Test
tBoldTest = "bold test" ~: 
        runParser boldP "**hello**" ~?= Right (Bold [Literal "hello"])

tItalicsTest :: Test
tItalicsTest = "italics test" ~: 
        runParser italicsP "*hello*" ~?= Right (Italics [Literal "hello"])
    
tCodeTest :: Test
tCodeTest = "Code test" ~: 
        runParser codeP "`hello`" ~?= Right (Code [Literal "hello"])

tCodeDouble :: Test
tCodeDouble = "Code Double" ~: 
        runParser codeP "``hello``" ~?= Right (Code [Literal "hello"])                
        
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

tTextNotClosed :: Test
tTextNotClosed = "TextNotClosed test" ~: 
        runParser textP "**Hello" ~?= Right [Literal "*",Literal "*",Literal "Hello"]

tTextOneNotClosed :: Test
tTextOneNotClosed = "TextOneNotClosed test" ~: 
        runParser textP "**Hello*" ~?= Right [Literal "*",Italics [Literal "Hello"]]

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
    runParser blockP "    #### hello" ~?= Right (CodeBlock "" "#### hello")

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

-- CODE BLOCK tests

tCodeBlock :: Test
tCodeBlock = TestList [ tCBInfo, tCBInfoTildas, tCBWhiteSpace, tCBCode,
                        tCBTwoBackTicks, tCBNoInfo, tCB4BackTicks,
                        tCB5EndBackTicks, tCBEmpty, tCBNewLines, tCB3Spaces,
                        tCB4Spaces, tCBInfoSpaces ]

tCBInfo :: Test 
tCBInfo = "code block info test" ~: 
    runParser codeBlockP "```ruby\n```" ~?= Right (CodeBlock "ruby" "")

tCBInfoTildas :: Test 
tCBInfoTildas = "code block info tildas test" ~: 
    runParser codeBlockP "~~~ruby\n~~~" ~?= Right (CodeBlock "ruby" "")

tCBWhiteSpace :: Test 
tCBWhiteSpace = "code block info test" ~: 
    runParser codeBlockP "```    ruby     \n```" ~?= Right (CodeBlock "ruby" "")

tCBCode :: Test 
tCBCode = "code block info test" ~: 
    runParser codeBlockP "```js\nconsole.log(\"Hello, World\")\n   ```" ~?= Right (CodeBlock "js" "console.log(\"Hello, World\")")

tCBTwoBackTicks :: Test 
tCBTwoBackTicks = "code block TwoBackTicks test" ~: 
    runParser blockP "``ruby``" ~?= Right (Paragraph [Code [Literal "ruby"]])

tCBNoInfo :: Test 
tCBNoInfo = "code block NoInfo test" ~: 
    runParser blockP "```\nruby```" ~?= Right (CodeBlock "" "ruby")

tCB4BackTicks :: Test 
tCB4BackTicks = "code block 4 back ticks test" ~: 
    runParser blockP "````\nruby````" ~?= Right (CodeBlock "" "ruby")

tCB5EndBackTicks :: Test 
tCB5EndBackTicks = "code block 5 end back ticks test" ~: 
    runParser blockP "````\nruby`````" ~?= Right (CodeBlock "" "ruby")

tCBEmpty :: Test 
tCBEmpty = "code block empty test" ~: 
    runParser blockP "````\n`````" ~?= Right (CodeBlock "" "")

tCBNewLines :: Test 
tCBNewLines = "code block NewLines test" ~: 
    runParser blockP "````\n\n\n\n`````" ~?= Right (CodeBlock "" "\n\n")

tCB3Spaces :: Test 
tCB3Spaces = "code block 3 spaces test" ~: 
    runParser blockP "   ````\n\n\n\n`````" ~?= Right (CodeBlock "" "\n\n")

tCB4Spaces :: Test 
tCB4Spaces = "code block 4 spaces test" ~: 
    runParser blockP "    ```\nruby```" ~?= Right (CodeBlock "" "```\n")

tCBInfoSpaces :: Test 
tCBInfoSpaces = "code block infoSpaces test" ~: 
    runParser codeBlockP "```ruby lang\n```" ~?= Right (CodeBlock "ruby lang" "")
-- test going past fewer end back ticks/unclosed
--test indentation equals front, if more than 3 spaces at end backticks not closing seq

--Indented code block
tIndentedCode :: Test
tIndentedCode = TestList [ tICB, tICBMd, tICBList, tICBMultipleLB, tICBEmptySpaces,
                            tICBMultipleLBWithSpace, tPagraphBeforeICB, tPagraphBeforeICB2, 
                            tICBTrailingLB, tICBTrailingWsp ]

tICB :: Test 
tICB = "indented code block test" ~: 
    runParser indentedCodeBlockP "    a simple\n      indented code block" ~?= Right (CodeBlock "" "a simple\n  indented code block")

tICBMd :: Test 
tICBMd = "indented code block md test" ~: 
    runParser indentedCodeBlockP "    *hello*" ~?= Right (CodeBlock "" "*hello*")

tICBList :: Test 
tICBList = "indented code block list test" ~: 
    runParser indentedCodeBlockP "    - hello*" ~?= Right (CodeBlock "" "- hello*")

tICBMultipleLB :: Test 
tICBMultipleLB = "indented code block multiple line breaks test" ~: 
    runParser indentedCodeBlockP "    a simple\n\n\n      indented code block" ~?= Right (CodeBlock "" "a simple\n\n\n  indented code block")

tICBEmptySpaces :: Test 
tICBEmptySpaces = "indented code block empty line with spaces test" ~: 
    runParser indentedCodeBlockP "    a simple\n      \n      indented code block" ~?= Right (CodeBlock "" "a simple\n  \n  indented code block")

tICBMultipleLBWithSpace :: Test 
tICBMultipleLBWithSpace = "indented code block multiple line breaks with space test" ~: 
    runParser indentedCodeBlockP "    a simple\n \n\n      indented code block" ~?= Right (CodeBlock "" "a simple\n\n\n  indented code block")

tPagraphBeforeICB :: Test 
tPagraphBeforeICB = "paragraph before icb test" ~: 
    runParser documentP "a simple\n    indented code block" ~?= Right [Paragraph [Literal "a simple", Literal "    indented code block"]]

tPagraphBeforeICB2 :: Test 
tPagraphBeforeICB2 = "paragraph before icb 2 lb test" ~: 
    runParser documentP "a simple\n\n    indented code block" ~?= Right [Paragraph [Literal "a simple"],CodeBlock "" "indented code block"]


tICBTrailingLB :: Test 
tICBTrailingLB = "indented code block trailing lb test" ~: 
    runParser documentP "    a simple\n    " ~?= Right [(CodeBlock "" "a simple\n")]

tICBTrailingWsp :: Test 
tICBTrailingWsp = "indented code block trailing wsp test" ~: 
    runParser documentP "    a simple  \n    " ~?= Right [(CodeBlock "" "a simple  \n")]

-- Thematic Break tests

tThematicBreaks :: Test
tThematicBreaks = TestList [ tTB, tTBTilda, tTBDash, tTBPlus, tTB2,
                             tTBSpaces, tTB4Spaces, tTBMoreThan3, tTBSpaceBetween,
                             tTBOtherChar, tTBOtherChar2, tTBMixSyms ]

tTB :: Test 
tTB = "thematic break test" ~: 
    runParser blockP "***" ~?= Right ThematicBreak

tTBTilda :: Test 
tTBTilda = "thematic break tilda test" ~: 
    runParser blockP "~~~" ~?= Right ThematicBreak

tTBDash :: Test 
tTBDash = "thematic break dash test" ~: 
    runParser blockP "---" ~?= Right ThematicBreak

tTBPlus :: Test 
tTBPlus = "thematic break Plus test" ~: 
    runParser blockP "+++" ~?= Right (Paragraph [Literal "+++"])
    
tTB2 :: Test 
tTB2 = "thematic break 2 test" ~: 
    runParser blockP "--" ~?= Right (Paragraph [Literal "--"])

tTBSpaces :: Test 
tTBSpaces = "thematic break Spaces test" ~: 
    runParser blockP "   ---" ~?= Right ThematicBreak

tTB4Spaces :: Test 
tTB4Spaces = "thematic break 4Spaces test" ~: 
    runParser blockP "    ---" ~?= Right (CodeBlock "" "---")

tTBMoreThan3 :: Test 
tTBMoreThan3 = "thematic break MoreThan3 test" ~: 
    runParser blockP "-----------------" ~?= Right ThematicBreak

tTBSpaceBetween :: Test 
tTBSpaceBetween = "thematic break SpaceBetween test" ~: 
    runParser blockP "-  -     -  - -    - --  " ~?= Right ThematicBreak

tTBOtherChar :: Test 
tTBOtherChar = "thematic break OtherChar test" ~: 
    runParser blockP "---a" ~?= Right (Paragraph [Literal "---a"])
--
tTBOtherChar2 :: Test 
tTBOtherChar2 = "thematic break OtherChar2 test" ~: 
    runParser blockP "---a--" ~?= Right (Paragraph [Literal "---a--"])

--
tTBMixSyms :: Test 
tTBMixSyms = "thematic break MixSyms test" ~: 
    runParser blockP "*~*" ~?= Right (Paragraph [Italics [Literal "~"]])





-- tDocLeadingWsp :: Test 
-- tDocLeadingWsp = "indented code block test" ~: 
--     runParser documentP "\n\n\n   \n       \n\n    \n    a simple\n      indented code block" ~?= Right [(CodeBlock "" "a simple\n  indented code block")]
    

main :: IO ()
main = do
    _ <- runTestTT (TestList [ tInlines, tHeading, tCodeBlock, 
                                tIndentedCode, tThematicBreaks ])
    return ()