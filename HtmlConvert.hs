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
  h 1 = h1_
  h 2 = h2_
  h 3 = h3_
  h 4 = h4_
  h 5 = h5_
  h 6 = h6_
  h n = error ("unexpcted heading level: " ++ show n)
convertBlock (Paragraph t) = p_ $ convertText t

convertText :: Text -> Html ()
convertText xs = groupElements $ map convertInline xs

convertInline :: Inline -> Html ()
convertInline (Literal s) = toHtml s
convertInline (Bold t) = strong_ $ convertText t
convertInline (Italics t) = em_ $ convertText t
