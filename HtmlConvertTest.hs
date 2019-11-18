{-# LANGUAGE OverloadedStrings #-}

module HtmlConvertTest where

import Main
import HtmlConvert
import Lucid
import Test.HUnit

tInline :: Test
tInline = "test html convert on inline elements" ~: TestList [
    render (Literal "literal string") ~?= "literal string"
  , render (Bold [Literal "bold string"]) ~?= "<strong>bold string</strong>"
  , render (Italics [Literal "italics string"]) ~?= "<em>italics string</em>"
  ] where
    render = renderText . convertInline

tText :: Test
tText = "test html convert on text elements" ~: TestList [
    render [] ~?= ""
  , render [Literal "literal",
            Bold [Literal "bold"],
            Italics [Literal "italics"]] ~?= "literal<strong>bold</strong><em>italics</em>"
  , render [Literal "l1", Literal "l2"] ~?= "l1l2"
  , render [Bold [Bold [Literal "boldbold"]]] ~?= "<strong><strong>boldbold</strong></strong>"
  , render [Bold [Italics [Literal "both"]]] ~?= "<strong><em>both</em></strong>"
  ] where
    render = renderText . convertText

tBlock :: Test
tBlock = "test html convert on block elements" ~: TestList [
    render (Heading 1 []) ~?= "<h1></h1>"
  , render (Heading 2 [Literal "heading 2"]) ~?= "<h2>heading 2</h2>"
  , render (Heading 3 [Bold [Literal "heading 3"]]) ~?= "<h3><strong>heading 3</strong></h3>"
  , render (Heading 6 [Italics [Literal "smallest heading"]]) ~?= "<h6><em>smallest heading</em></h6>"
  , render (Paragraph []) ~?= "<p></p>"
  , render (Paragraph [Literal "literal paragraph"]) ~?= "<p>literal paragraph</p>"
  , render (Paragraph [Literal "literal sentence." ,
                       Bold [Literal "bold sentence."],
                       Italics [Literal "italics sentence."],
                       Bold [Italics [Literal "bold and italics sentence."]] ]) ~?=
                        "<p>literal sentence.<strong>bold sentence.</strong><em>italics sentence.</em><strong><em>bold and italics sentence.</em></strong></p>"
  ] where
    render = renderText . convertBlock

tDocument :: Test
tDocument = "test html convert on document elements" ~: TestList [
    render [] ~?= "<!DOCTYPE HTML><html></html>"
  , render [Heading 1 [Literal "HTML DOC"]] ~?= "<!DOCTYPE HTML><html><h1>HTML DOC</h1></html>"
  , render [Paragraph [Literal "paragraph"]] ~?= "<!DOCTYPE HTML><html><p>paragraph</p></html>"
  , render [Heading 1 [Literal "Article Title"], Paragraph [Literal "Article content."]] ~?=
          "<!DOCTYPE HTML><html><h1>Article Title</h1><p>Article content.</p></html>"
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
  let heading = Heading 1 [Literal "My ", Italics [Literal "First"], Literal " Title"]
  let content = Paragraph [Literal "Writen on ", Bold [Literal "Nov-18-2019"]]
  renderToFile "sample.html" $ convertDocument [heading, content]