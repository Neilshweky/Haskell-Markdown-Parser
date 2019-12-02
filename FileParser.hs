module FileParser where

import HtmlConvert (convertDocument)
import Lucid (renderToFile)

import Main (documentP, runParser)

fileParse :: String -> String -> IO()
fileParse from to = do
    content <- readFile from
    let parseResult = runParser documentP content
    print parseResult
    case parseResult of
        Left err -> writeFile to $ show err
        Right doc -> renderToFile to $ convertDocument doc
