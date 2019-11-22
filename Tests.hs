module Tests where

import Test.HUnit (Test(..), (~?=), (~:), runTestTT)
import Data.Either (isLeft)
-- import Test.QuickCheck (Arbitrary(..), Testable(..), Gen, elements,
--     oneof, frequency, sized, quickCheckWith, stdArgs, maxSize,
--     classify,  maxSuccess, listOf, resize, scale, (==>))


import Main


tInlines :: Test
tInlines = TestList [  tBoldTest, tItalicsTest, tCodeTest, tCodeDouble, tLiteralTest, 
                        tLiteralUntilTest, tLinkTest, tAutoLinkTest, tImageTest,
                        tTextBold, tTextBoldUnderline, tTextAutoLink, tTextLink,
                        tTextBoldItalics, tTextNested, tStrongEmph, tTextNotClosed, tTextOneNotClosed ]

tBoldTest :: Test
tBoldTest = "bold test" ~: TestList [ 
        runParser boldP "**hello**" ~?= Right (Bold [Literal "hello"])
    ,   runParser boldP "**hel\nlo**" ~?= Right (Bold [Literal "hel\nlo"])
    ,   isLeft (runParser boldP "**hel\n\nlo**") ~?= True
    ]

tItalicsTest :: Test
tItalicsTest = "italics test" ~: TestList [
        runParser italicsP "*hello*" ~?= Right (Italics [Literal "hello"])
    ,   runParser italicsP "*hel\nlo*" ~?= Right (Italics [Literal "hel\nlo"])
    ,   isLeft (runParser italicsP "*hel\n\nlo*") ~?= True
    ]
    
tCodeTest :: Test
tCodeTest = "Code test" ~:  TestList [
        runParser codeP "`hello`" ~?= Right (Code "hello")
    ,   runParser codeP "`hel\nlo`" ~?= Right (Code "hel lo")
    ,   isLeft (runParser codeP "`hello\n\nlo`") ~?= True
    ]

tCodeDouble :: Test
tCodeDouble = "Code Double" ~: TestList [
        runParser codeP "``hello``" ~?= Right (Code "hello")      
    ,   runParser codeP "``hel\nlo``" ~?= Right (Code "hel lo")
    ]

tLiteralTest :: Test
tLiteralTest = "Literal test" ~: TestList [
        runParser literalP "hello" ~?= Right (Literal "hello")
    ,   runParser literalP "line1\nline2" ~?= Right (Literal "line1\nline2")
    ,   runParser literalP "line1\n\nline2" ~?= Right (Literal "line1")
    ]

tLiteralUntilTest :: Test
tLiteralUntilTest = "LiteralUntil test" ~: 
        runParser literalP "hello* world" ~?= Right (Literal "hello")

tLinkTest :: Test
tLinkTest = "Link test" ~: TestList [
        parse "[bar](url)" ~?= Right (Link [Literal "bar"] "url" Nothing)
    ,   parse "[bar](<url>)" ~?= Right (Link [Literal "bar"] "url" Nothing)
    ,   parse "[bar](<ur  l>)" ~?= Right (Link [Literal "bar"] "ur  l" Nothing)
    ,   parse "[bar](url \"title\")" ~?= Right (Link [Literal "bar"] "url" (Just "title"))
    ,   parse "[bar](url 'title')" ~?= Right (Link [Literal "bar"] "url" (Just "title"))
    ,   parse "[bar](url (title))" ~?= Right (Link [Literal "bar"] "url" (Just "title"))
    ,   parse "[bar](<url> \"title\")" ~?= Right (Link [Literal "bar"] "url" (Just "title"))
    ,   parse "[bar](<url> 'title')" ~?= Right (Link [Literal "bar"] "url" (Just "title"))
    ,   parse "[bar](<url> (title))" ~?= Right (Link [Literal "bar"] "url" (Just "title"))
    ,   parse "[bar](   url   )" ~?= Right (Link [Literal "bar"] "url" Nothing)
    ,   isLeft (parse "[bar](ur  l)") ~?= True
    ,   isLeft (parse "[bar[bar](foo)](foo)") ~?= True
    ,   parse "[]())" ~?= Right (Link [] "" Nothing)
    ,   parse "[ba\nr](<url> (title))" ~?= Right (Link [Literal "ba\nr"] "url" (Just "title"))
    ,   parse "[bar](<url> (tit\nle))" ~?= Right (Link [Literal "bar"] "url" (Just "tit\nle"))
    ,   isLeft (parse "[bar](<ur\nl> (title))") ~?= True
    ] 
    where parse = runParser linkP

tAutoLinkTest :: Test
tAutoLinkTest = "AutoLink Test" ~: TestList [
        parse "<https://google.com>" ~?= Right (Link [Literal "https://google.com"] "https://google.com" Nothing)
    ,   parse "<a1:>" ~?= Right (Link [Literal "a1:"] "a1:" Nothing)
    ,   parse "<a-.+:>" ~?= Right (Link [Literal "a-.+:"] "a-.+:" Nothing)
    ,   isLeft (parse "<>") ~?= True
    ,   isLeft (parse "<aaaa>") ~?= True
    ,   isLeft (parse "<a:aaaa>") ~?= True
    ,   isLeft (parse "<1a:aaaa>") ~?= True
    ,   isLeft (parse "<a?x:aaaa>") ~?= True
    ,   isLeft (parse "<ftp:x.^.z>") ~?= True
    ,   isLeft (parse "<ftp://file") ~?= True
    ,   isLeft (parse "ftp://file>") ~?= True
    ,   isLeft (parse "<ftp://file  >") ~?= True
    ]
    where parse = runParser autoLinkP

tImageTest :: Test
tImageTest = "Image Test" ~: TestList [
        parse "![]()" ~?= Right (Image "" "" Nothing)
    ,   parse "![alt]()" ~?= Right (Image "alt" "" Nothing)
    ,   parse "![](src)" ~?= Right (Image "" "src" Nothing)
    ,   parse "![alt](<src> \"title\")" ~?= Right (Image "alt" "src" (Just "title"))
    ,   parse "![__alt__](src (title))" ~?= Right (Image "__alt__" "src" (Just "title")) 
    ]
    where parse = runParser imageP

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
        runParser textP "**Hello" ~?= Right [Literal "**Hello"]

tTextOneNotClosed :: Test
tTextOneNotClosed = "TextOneNotClosed test" ~: 
        runParser textP "**Hello*" ~?= Right [Literal "*",Italics [Literal "Hello"]]

tTextLink :: Test
tTextLink = "TextLink test" ~: TestList [
        parse "[bar](url)" ~?= Right [Link [Literal "bar"] "url" Nothing]
    ,   parse "*foo[bar*](url)" ~?= Right [Literal "*foo", Link [Literal "bar*"] "url" Nothing]
    ,   parse "*foo[bar](url)*" ~?= Right [Italics [Literal "foo", Link [Literal "bar"] "url" Nothing]]
    ,   parse "[*bar*](url)" ~?= Right [Link [Italics [Literal "bar"]] "url" Nothing]
    ,   parse "text[link](url)text" ~?= Right [Literal "text", Link [Literal "link"] "url" Nothing, Literal "text"]
    ,   parse "`[`]()" ~?= Right [Code "[", Literal "]()"]
    ,   parse "[`]()`" ~?= Right [Literal "[", Code "]()"]
    ] where parse = runParser textP

tTextAutoLink :: Test
tTextAutoLink = "TextAutoLink" ~: TestList [
        parse "<ftp://file>" ~?= Right [Link [Literal "ftp://file"] "ftp://file" Nothing]
    ,   parse "_<ftp://file>_" ~?= Right [Italics [Link [Literal "ftp://file"] "ftp://file" Nothing]]
    ,   parse "<ftp://_file_>" ~?= Right [Link [Literal "ftp://_file_"] "ftp://_file_" Nothing]
    ,   parse "_<ftp://file_>" ~?= Right [Literal "_", Link [Literal "ftp://file_"] "ftp://file_" Nothing]
    ,   parse "[<ftp://file>]()" ~?= Right [Literal "[", Link [Literal "ftp://file"] "ftp://file" Nothing,Literal "]()"]
    ,   parse "text<link:url>text" ~?= Right [Literal "text", Link [Literal "link:url"] "link:url" Nothing, Literal "text"]
    ,   parse "<`>`" ~?= Right [Literal "<", Code ">"]
    ] where parse = runParser textP

tTextImage :: Test
tTextImage = "TextImage" ~: TestList [
        "concated with other inlines" ~: 
        parse "`code`![alt](src)_italics___bold__text" ~?= 
            Right [Code "code", Image "alt" "src" Nothing, Italics [Literal "italics"], Bold [Literal "bold"], Literal "text"]
    ,   "image in image" ~: 
        parse "![![]()]()" ~?= Right [Image "![" "" Nothing, Literal "]()"] 
    ,   "inlines in image" ~: 
        parse "![__alt__]()" ~?= Right [Image "__alt__" "" Nothing]
    ,   "image in link" ~: 
        parse "[![alt](src)](href)" ~?= Right [Link [Image "alt" "src" Nothing] "href" Nothing]
    ,   "image in autolink" ~: 
        parse "<![alt](src)>" ~?= Right [Literal "<", Image "alt" "src" Nothing, Literal ">"]
    ,   "image in italics" ~:
        parse "_![_](_)_" ~?= Right [Italics [Image "_" "_" Nothing]]
    ,   "priority with bold" ~: 
        parse "__![__]()" ~?= Right [Literal "__", Image "__" "" Nothing]
    ,   "priority with inline code block" ~: 
        parse "`![`]()" ~?= Right [Code "![", Literal "]()"]
    ,   parse "![`]()`" ~?= Right [Literal "![", Code "]()"]
    ]
    where parse = runParser textP
    

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
    runParser blockP "``ruby``" ~?= Right (Paragraph [Code "ruby"])

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
    runParser documentP "a simple\n    not indented code block" ~?= Right [Paragraph [Literal "a simple\n    not indented code block"]]

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

-- Paragraph tests
tParagraph :: Test
tParagraph = TestList [ tPar, tParBadHeading, tParIntCodeBlock ]

tPar :: Test 
tPar = "paragraph test" ~: 
    runParser documentP "hello, world\n # hello" ~?= Right ([Paragraph [Literal "hello, world"], Heading H1 [Literal "hello"]])

tParBadHeading :: Test 
tParBadHeading = "paragraph bad heading test" ~: 
    runParser documentP "hello, world\n ######## hello" ~?= Right ([Paragraph [Literal "hello, world", Literal "######## hello"]])

tParIntCodeBlock :: Test 
tParIntCodeBlock = "paragraph bad heading test" ~: 
    runParser documentP "hello, world\n ```\n```" ~?= Right ([Paragraph [Literal "hello, world"], CodeBlock "" ""])

-- tDocLeadingWsp :: Test 
-- tDocLeadingWsp = "indented code block test" ~: 
--     runParser documentP "\n\n\n   \n       \n\n    \n    a simple\n      indented code block" ~?= Right [(CodeBlock "" "a simple\n  indented code block")]
 
-- LIST TESTS 
-- tUnorderedList :: Test
-- tUnorderedList = TestList [ tUL, tULHeading, tUL3Spaces, tULICB ]
    
-- tUL :: Test 
-- tUL = "UL test" ~: 
--     runParser listP "- hello\n- world" ~?= Right (UnorderedList [Paragraph [Literal "hello"],Paragraph [Literal "world"]])

-- tULHeading :: Test 
-- tULHeading = "ULHeading test" ~: 
--     runParser listP "- ## hello  \n- world" ~?= Right (UnorderedList [Heading H2 [Literal "hello"],Paragraph [Literal "world"]])

-- tUL3Spaces :: Test 
-- tUL3Spaces = "UL3Spaces test" ~: 
--     runParser listP "   - ## hello  \n- world" ~?= Right (UnorderedList [Heading H2 [Literal "hello"],Paragraph [Literal "world"]])

-- --
-- tULICB :: Test 
-- tULICB = "ULICB test" ~: 
--     runParser listP "   - ## hello  \n- world" ~?= Right (UnorderedList [Heading H2 [Literal "hello"],Paragraph [Literal "world"]])



main :: IO ()
main = do
    _ <- runTestTT (TestList [ tInlines, tHeading, tCodeBlock, 
                                tIndentedCode, tThematicBreaks, tParagraph
                                 ])
    return ()