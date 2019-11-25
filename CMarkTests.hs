module CMarkTests where

import Test.HUnit (Test(..), (~?=), (~:), runTestTT)
import Data.Either (isLeft)
-- import Test.QuickCheck (Arbitrary(..), Testable(..), Gen, elements,
--     oneof, frequency, sized, quickCheckWith, stdArgs, maxSize,
--     classify,  maxSuccess, listOf, resize, scale, (==>))


import Main
    

tArrayTest :: Test
tArrayTest = TestList (testArray 4)

testArray 0 = []
testArray n = (n ~?= n): (testArray (n-1))
