{-# LANGUAGE OverloadedStrings #-} 

module HtmlConvert where

import Main
import Lucid
import qualified Main as M
import qualified  Lucid as H

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

convertText :: Text -> Html ()
convertText xs = groupElements $ map convertInline xs

convertInline :: Inline -> Html ()
convertInline (Literal s) = toHtml s
convertInline (Bold t) = strong_ $ convertText t
convertInline (Italics t) = em_ $ convertText t
