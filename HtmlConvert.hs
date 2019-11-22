{-# LANGUAGE OverloadedStrings #-} 

module HtmlConvert where

import Main
import qualified Main as M
import Lucid hiding (br_, hr_)
import qualified  Lucid as H
import Lucid.Base (makeXmlElementNoEnd)
import Data.Text as Text (pack)

------------------ CUSTOM ELEMENTS
br_ :: Html ()
br_ = makeXmlElementNoEnd "br"

hr_ :: Html ()
hr_ = makeXmlElementNoEnd "hr"

noTitleLink_ :: Text -> String -> Html ()
noTitleLink_ t h = a_ [href_ $ pack h] (convertText t)

noTitleImg_ :: String -> String -> Html ()
noTitleImg_ a s = img_ [alt_ $ pack a, src_ $ pack s]

-------------------

groupElements :: [Html ()] -> Html ()
groupElements = foldl (<>) mempty

convertDocument :: Document -> Html ()
convertDocument xs = H.doctypehtml_ $ groupElements $ map convertBlock xs


convertBlock :: Block -> Html ()
convertBlock (Heading n t) = h n (convertText t) where
  h H1 = h1_
  h H2 = h2_
  h H3 = h3_
  h H4 = h4_
  h H5 = h5_
  h H6 = h6_
convertBlock (Paragraph t) = p_ $ convertText t
convertBlock (BlockQuote bs) = blockquote_ $ groupElements $ map convertBlock bs
convertBlock (CodeBlock info text) = pre_ $ code_ [class_ $ pack info] $ toHtml text
convertBlock ThematicBreak = hr_
convertBlock (UnorderedList bs) = ul_ $ groupElements $ map (li_ . convertBlock) bs

convertText :: Text -> Html ()
convertText xs = groupElements $ map convertInline xs

convertInline :: Inline -> Html ()
convertInline (Literal s) = toHtml s
convertInline (Bold t) = strong_ $ convertText t
convertInline (Italics t) = em_ $ convertText t
convertInline (Strong t) = strong_ $ convertText t
convertInline (Code s) = code_ $ toHtml s
convertInline (Link text href Nothing) = noTitleLink_ text href
convertInline (Link text href (Just tit)) = with (noTitleLink_ text href) [title_ $ pack tit]
convertInline (Image alt src Nothing) = noTitleImg_ alt src
convertInline (Image alt src (Just tit)) = with (noTitleImg_ alt src) [title_ $ pack tit]
convertInline HardBreak = br_