{-# LANGUAGE OverloadedStrings #-}
module Server where


import Web.Scotty

import Data.Monoid (mconcat)
import HtmlConvert (convertDocumentNoDoctype)
import Lucid (renderText, renderToFile)
import Data.Text.Lazy (unpack, pack)
import Network.Wai.Middleware.Cors
import MarkDownParse (documentP, runParser)

main = scotty 3000 $ do
  middleware simpleCors
  get "/:word" $ do
    beam <- param "word"
    html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]
  post "/parse" $ do
    md <- param "md"
    let parseResult = runParser documentP md
    case parseResult of
      Left err -> html $ pack (show err)
      Right doc -> html $ renderText (convertDocumentNoDoctype doc)
    