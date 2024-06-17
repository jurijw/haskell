-- List exercises!

-- Create a function myElem that returns True if an element is in a given list and returns False otherwise
myElem :: (Eq a) => a -> [a] -> Bool

-- Recursive approach
myElem target [] = False
myElem target (x:xs)
  | x == target  = True
  | otherwise    = myElem target xs 