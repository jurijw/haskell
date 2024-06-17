-- Learning functional programming via Haskell!
-- I am following the series by Philipp Hagenlocher
-- and using this file to take notes and create a
-- sort of reference sheet to refer back to in the
-- future. His exercises will be solved in separate
-- files in the exercises/ directory

-- To avoid namespace conflicts with the Prelude module, we could use the following: 
-- import qualified Prelude as P

-- Modules must be imported at the start of the file!
import Data.List

-- Every Haskell file must have a main function!
main :: IO ()
main = putStrLn "Let's learn Haskell!"

mySum :: [Int] -> Int
mySum [] = 0
mySum (x : xs) = x + mySum xs

-- Turnary operator
x :: Bool
x = False

-- if x then True else False
inRange :: Int -> Int -> Int -> Bool
inRange x low high = x >= low && x <= high
-- Instead of variables, if we want to save the state of an expression, we can use so-called let bindings:
inRange x low high =
  let inLowerBound = x >= low
      inUpperBound = x <= high
   in inLowerBound && inUpperBound
-- Similarly, we can use where bindings. In both cases, everything is evaluated lazily.
inRange x low high =
  if inLowerBound then inUpperBound else False
  where
    inLowerBound = x >= low
    inUpperBound = x <= high

-- Can use functions in an "infix" style (basically in-line)
myAdd :: Int -> Int -> Int
myAdd x y = x + y

-- So the following are equivalent
-- myAdd 5 3
-- 5 `myAdd` 3

-- There are no loops in Haskell! Instead everything must be implemented recursively. Note that all tail recursive calls can be mapped to a while / for loop and sometimes this is what the compilers will do when compiling Haskell code. Thus, one should always strive for a tail recursive implementation.

fac n =
  if n <= 1
    then
      1
    else
      n * fac (n - 1)
-- We can also use "guards" in lieu of the if then else statement

fac n
  | n <= 1 = 1
  | otherwise = n * fac (n - 1)

-- Note that neither of these functions are tail recursive yet!
-- To achieve tail recursion, we can make use of an auxillary
-- function and an accumalator:

fac n = aux n 1 
  where
    aux n acc
      | n <= 1 = acc 
      | otherwise = aux (n-1) (n*acc)

-- In the example above, the recursive call is essentially what is being "returned" by the 
-- aux function. There are no expressions that need to be evaluated after the recursive call.
-- This avoids stack overflows, which can be caused in a regular recursive function.

-- List methods: Haskell provides some out-of-the-box convenience methods for working with lists.
-- These can be imported using import Data.List (must be done at the start of the file!)

exampleList = [1, 2, 3, 4, 5]
car = head exampleList -- evaluates to [1]
cdr = tail exampleList -- evaluates to [2,3,4,5]

-- head and tail cannot be called on empty lists!
-- Thankfully, we can check if a list is empty using the
-- null function, which returns True iff a list is empty.

