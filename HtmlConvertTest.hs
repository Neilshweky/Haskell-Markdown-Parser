{-# LANGUAGE OverloadedStrings #-}

module HtmlConvertTest where

import MarkDownParse hiding (main)
import HtmlConvert
import Lucid (renderText, renderToFile)
import Data.Text.Lazy (unpack)
import Test.HUnit



--------- Inline element tests

tInline :: Test
tInline = "test html convert on inline elements" ~: TestList [
    tLiteral, tBold, tItalics, tInlineCode, tLink, tImage, tHardBreak
  ] where
    render :: Inline -> String
    render = unpack . renderText . convertInline

    tLiteral :: Test
    tLiteral = render (Literal "literal string") ~?= "literal string"

    tBold :: Test
    tBold = render (Bold [Literal "bold string"]) ~?= "<strong>bold string</strong>"

    tItalics :: Test
    tItalics = render (Italics [Literal "italics string"]) ~?= "<em>italics string</em>"

    tInlineCode :: Test
    tInlineCode = render (Code "code content") ~?= "<code>code content</code>"

    tLink :: Test
    tLink = TestList [
        render (Link [Literal "display"] "link.com" Nothing) ~?= "<a href=\"link.com\">display</a>"
      , render (Link [Literal "display"] "link.com" (Just "tit")) ~?= "<a href=\"link.com\" title=\"tit\">display</a>"
      ]

    tImage :: Test
    tImage = TestList [
        render (Image "alt" "src" Nothing) ~?= "<img src=\"src\" alt=\"alt\"/>"
      , render (Image "alt" "src" (Just "tit")) ~?= "<img src=\"src\" title=\"tit\" alt=\"alt\"/>"
      ]

    tHardBreak :: Test
    tHardBreak = render HardBreak ~?= "<br />"

tText :: Test
tText = "test html convert on text elements" ~: TestList [
    tEmpty, tCombination
  ] where
    render :: Text -> String
    render = unpack . renderText . convertText
    
    tEmpty :: Test
    tEmpty = render [] ~?= ""
    
    tCombination :: Test
    tCombination = TestList [
        render [Literal "literal",
            Bold [Literal "bold"],
            Italics [Literal "italics"]] ~?= "literal<strong>bold</strong><em>italics</em>"
      , render [Literal "l1", Literal "l2"] ~?= "l1l2"
      , render [Bold [Bold [Literal "boldbold"]]] ~?= "<strong><strong>boldbold</strong></strong>"
      , render [Bold [Italics [Literal "both"]]] ~?= "<strong><em>both</em></strong>"
      , render [Literal "line1", HardBreak, Bold [Literal "line2\nline3"]] ~?= "line1<br /><strong>line2\nline3</strong>"
      , render [Link [Image "alt" "src" (Just "img tit"),
                      HardBreak, Bold [Literal "click to jump"]] "href" (Just "link tit")] ~?=
          "<a href=\"href\" title=\"link tit\"><img src=\"src\" title=\"img tit\" alt=\"alt\"/>" ++
          "<br /><strong>click to jump</strong></a>"
      ]

tBlock :: Test
tBlock = "test html convert on block elements" ~: TestList [
  tHeading, tParagraph, tBlockQuote, tCodeBlock, tThematicBreak, tUnorderedList
  ] where
    render :: Block -> String
    render = unpack . renderText . convertBlock

    tHeading :: Test
    tHeading = TestList [
        render (Heading H1 []) ~?= "<h1></h1>"
      , render (Heading H2 [Literal "heading 2"]) ~?= "<h2>heading 2</h2>"
      , render (Heading H3 [Bold [Literal "heading 3"]]) ~?= "<h3><strong>heading 3</strong></h3>"
      , render (Heading H6 [Italics [Literal "smallest heading"]]) ~?= "<h6><em>smallest heading</em></h6>"
      ]
    
    tParagraph :: Test
    tParagraph = TestList [
        render (Paragraph []) ~?= "<p></p>"
      , render (Paragraph [Literal "literal paragraph"]) ~?= "<p>literal paragraph</p>"
      , render (Paragraph [Literal "literal sentence." ,
                           Bold [Literal "bold sentence."],
                           Italics [Literal "italics sentence."],
                           Bold [Italics [Literal "bold and italics sentence."]] ]) ~?=
          "<p>literal sentence.<strong>bold sentence.</strong><em>italics sentence.</em>" ++
          "<strong><em>bold and italics sentence.</em></strong></p>"
      ]
    
    tBlockQuote :: Test
    tBlockQuote = TestList [
        render (BlockQuote []) ~?= "<blockquote></blockquote>"
      , render (BlockQuote [Paragraph [Literal "para"]]) ~?= "<blockquote><p>para</p></blockquote>"
      , render (BlockQuote [Paragraph [Literal "para1"], Paragraph [Literal "para2"]]) ~?=
          "<blockquote><p>para1</p><p>para2</p></blockquote>"
      , render (BlockQuote [BlockQuote [Paragraph [Literal "para"]]]) ~?= 
          "<blockquote><blockquote><p>para</p></blockquote></blockquote>"
      ]

    tCodeBlock :: Test
    tCodeBlock = TestList [
        render (CodeBlock "haskell" "putStrLn \"hello haskell\"") ~?= 
          "<pre><code class=\"language-haskell\">putStrLn &quot;hello haskell&quot;</code></pre>"
      , render (CodeBlock "" "no info block") ~?=
        "<pre><code>no info block</code></pre>"
      ]

    tThematicBreak :: Test
    tThematicBreak = render ThematicBreak ~?= "<hr />" 

    tUnorderedList :: Test
    tUnorderedList = TestList [
        render (UnorderedList []) ~?= "<ul></ul>"
      , render (UnorderedList [[Paragraph [Literal "line"]]]) ~?= "<ul><li>line</li></ul>"
      , render (UnorderedList [[Paragraph [Literal "line"]]
                              , [CodeBlock "" "code line"]
                              , [Heading H6 [Literal "heading line"]]]) ~?=
                                "<ul><li>line</li><li><pre><code>code line</code></pre>\n</li><li><h6>heading line</h6>\n</li></ul>"
      , render (UnorderedList [[UnorderedList [[Paragraph [Literal "inner1"]]]]
                              ,[UnorderedList [[Paragraph [Literal "inner2"]]]]]) ~?=
                                "<ul><li><ul><li>inner1</li></ul>\n</li><li><ul><li>inner2</li></ul>\n</li></ul>"
      , "multiple blocks in one list item in a unordered list" ~:
        render (UnorderedList [[Paragraph [Literal "para1"], Heading H2 [Literal "heading"], Paragraph [Literal "para2"]]]) ~?=
          "<ul><li><p>para1</p>\n<h2>heading</h2>\n<p>para2</p>\n</li></ul>"
      , "multiple blocks and multiple list items in a unordered list" ~:
        render (UnorderedList [[Paragraph [Literal "para1"], Heading H2 [Literal "heading"]], [Paragraph [Literal "para2"]]]) ~?=
          "<ul><li><p>para1</p>\n<h2>heading</h2>\n</li><li>para2</li></ul>"
      ]

tDocument :: Test
tDocument = "test html convert on document elements" ~: TestList [
    render [] ~?= "<!DOCTYPE HTML><html></html>\n"
  , render [Heading H1 [Literal "HTML DOC"]] ~?= "<!DOCTYPE HTML><html><h1>HTML DOC</h1></html>\n"
  , render [Paragraph [Literal "paragraph"]] ~?= "<!DOCTYPE HTML><html><p>paragraph</p></html>\n"
  , render [Heading H1 [Literal "Article Title"], Paragraph [Literal "Article content."]] ~?=
          "<!DOCTYPE HTML><html><h1>Article Title</h1><p>Article content.</p></html>\n"
  ] where
    render = renderText . convertDocument

main :: IO ()
main = do
  _ <- runTestTT $ "html convert tests" ~: TestList [
    tInline, tText, tBlock, tDocument
    ]
  return ()

fileWrite :: IO ()
fileWrite = do
  let heading = Heading H1 [Literal "My ", Italics [Literal "First"], Literal " Title"]
  let content = Paragraph [Literal "Writen on ", Bold [Literal "Nov-18-2019"]]
  renderToFile "sample.html" $ convertDocument [heading, content]