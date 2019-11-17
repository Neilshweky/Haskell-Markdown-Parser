module Main where

-- list of top level stuff
type Document = [Block]

-- types of top level elements
data Block = 
    Heading Int Text
  | Paragraph Text
  deriving (Eq, Show)

-- A combination of strings and inlines
type Text = [Inline]

-- Either a string or an inline
data Inline = 
    Literal String
  | Bold Text
  | Italics Text
  deriving (Eq, Show)





main :: IO ()
main = putStrLn "Hello, Haskell!"
