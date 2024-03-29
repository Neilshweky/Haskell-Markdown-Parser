{-# LANGUAGE OverloadedStrings #-} 

module HtmlConvert where

import MarkDownParse
import qualified MarkDownParse as M
import Lucid hiding (br_, hr_)
import qualified  Lucid as H
import Lucid.Base (makeXmlElementNoEnd)
import Data.Text as Text (pack)

------------------ CUSTOM ELEMENTS
br_ :: Html ()
br_ = makeXmlElementNoEnd "br "

hr_ :: Html ()
hr_ = makeXmlElementNoEnd "hr "

breakLine :: Html ()
breakLine = toHtml ("\n" :: String)

noTitleLink_ :: Text -> String -> Html ()
noTitleLink_ t h = a_ [href_ $ pack h] (convertText t)

noTitleImg_ :: String -> String -> Html ()
noTitleImg_ a s = with (makeXmlElementNoEnd "img") [ src_ $ pack s, alt_ $ pack a]

-------------------

groupElements :: [Html ()] -> Html ()
groupElements = foldl (<>) mempty

convertDocument :: Document -> Html ()
convertDocument xs = H.doctypehtml_ (groupElements $ map convertBlock xs) <> breakLine

convertDocumentNoDoctype :: Document -> Html ()
convertDocumentNoDoctype xs = groupElements $ map (\x -> convertBlock x <> breakLine)  xs

convertBlock :: Block -> Html ()
convertBlock (Heading n t) = h n (convertText t) where
  h H1 = h1_
  h H2 = h2_
  h H3 = h3_
  h H4 = h4_
  h H5 = h5_
  h H6 = h6_
convertBlock (Paragraph t) = p_ $ convertText $ textFilter t
convertBlock (BlockQuote bs) = blockquote_ $ groupElements $ map convertBlock bs
convertBlock (CodeBlock info text) = pre_ $ if info /= "" 
                                      then with cbHtml [class_ $ pack ("language-" ++ info)] 
                                      else cbHtml 
  where cbHtml = code_ $ toHtml text
convertBlock ThematicBreak = hr_
convertBlock (UnorderedList lis) = ul_ $ convertListItems lis
convertBlock (OrderedList start lis) = ol_ [start_ $ pack $ show start] (convertListItems lis)
 
convertListItems :: [ListItem] -> Html ()
convertListItems ls = groupElements $ map (li_ . convertListItem) ls

convertListItem :: ListItem -> Html ()
convertListItem [Paragraph text] = convertText $ textFilter text
convertListItem xs = foldr (\x acc -> convertBlock x <> breakLine <> acc) mempty xs

textFilter :: Text -> Text
textFilter [] = []
textFilter [Literal s] = [Literal $ foldr (\x ys -> if null ys && (x == ' ' || x == '\n') then ys else x:ys) [] s]
textFilter (x:xs) = let ys = textFilter xs in if f x ys then x:ys else ys
  where
    f x xs = case (x, xs) of
      (Literal "\n", []) -> False
      _ -> True

convertText :: Text -> Html ()
convertText xs = groupElements $ map convertInline xs

convertInline :: Inline -> Html ()
convertInline (Literal s) = toHtml $ f s
  where
    f :: String -> String
    f "\n" = "\n"
    f xs = foldr (\c acc -> if null acc && c == '\n' then acc else c:acc) [] xs
convertInline (Bold t) = strong_ $ convertText t
convertInline (Italics t) = em_ $ convertText t
convertInline (Strong t) = strong_ $ convertText t
convertInline (Code s) = code_ $ toHtml s
convertInline (Link text href Nothing) = noTitleLink_ text href
convertInline (Link text href (Just tit)) = with (noTitleLink_ text href) [title_ $ pack tit]
convertInline (Image alt src Nothing) = noTitleImg_ alt src
convertInline (Image alt src (Just tit)) = with (noTitleImg_ alt src) [title_ $ pack tit]
convertInline HardBreak = br_