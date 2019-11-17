module Main where

-- list of top level stuff
data Block = 
    Block [Markdown]
  deriving (Eq, Show)

-- types of top level elements
data Markdown = 
    Heading Int Text
  | TopText Text
  deriving (Eq, Show)

-- A combination of strings and inlines
data Text =
    Text [Element]
  deriving (Eq, Show)

-- Either a string or an inline
data Element = 
    TextElt String 
  | InlineElt Inline
  deriving (Eq, Show)

-- Inline with a text inside
data Inline = 
    Bold Text
  | Italics Text
  deriving (Eq, Show)




main :: IO ()
main = putStrLn "Hello, Haskell!"
