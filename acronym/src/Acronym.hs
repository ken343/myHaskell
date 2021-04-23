module Acronym (abbreviate) where
import qualified Data.Text as T
import           Data.Text (Text)

-- I do not trust my understanding of the '$' operator's precedence/relationship
-- with ':' or infix functions to try and clean up some of this code.
grabLetters :: String -> String -> String
grabLetters [] acc = acc
grabLetters all@(s:ss) acc
  | s `elem` separators = if (head ss) `elem` separators then grabLetters ss acc else grabLetters (tail ss) ((head ss) : acc)
  | multiCapCheck all acc = grabLetters ss acc
  | s `elem` capitals = grabLetters ss (s : acc) 
  | otherwise = grabLetters ss acc
  where separators = [' ', '-', '_']
        capitals = ['A'..'Z']


multiCapCheck :: String -> String -> Bool
multiCapCheck xs [] = False
multiCapCheck (x:xs) (y:ys) -- Do I add a flag here to indicate detection of consecutive capital letters?
  | x `elem` capitals && y `elem` capitals = True
  | otherwise = False
  where capitals = ['A'..'Z']

-- grabLetters will not grab the first letter of the String if it is lowercase.
-- firstLetter will extract it in this event.
firstLetter :: String -> String
firstLetter (s:ss)
  | s `elem` ['a'..'z'] = [s]
  | otherwise = []

orientString :: String -> String
orientString ss = T.unpack . T.toUpper . T.pack $ reverse ss

abbreviate :: String -> String
abbreviate xs = orientString $ (grabLetters xs []) ++ (firstLetter xs)
