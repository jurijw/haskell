-- List exercises!

import Data.List 

-- Create a function myElem that returns True if an element is in a given list and returns False otherwise
myElem :: (Eq a) => a -> [a] -> Bool

-- Recursive approach
myElem target [] = False
myElem target (x:xs)
  | x == target  = True
  | otherwise    = myElem target xs 

-- Another approach using some of the povided convenience functions
-- This approach creates a new list containing only elements that match
-- the target and then checks if that list is empty or not.

myElemAlt :: (Eq a) => a -> [a] -> Bool
myElemAlt target inputList = not (null filteredList)
  where filteredList = [x | x <- inputList, x == target]