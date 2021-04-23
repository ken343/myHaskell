module Acronym (abbreviate) where
import qualified Data.Text as T

-- Acronym.abbreviate is an over-engineered function used to create an
-- acronym from a string when mixed cases and punction are involved. In
-- hindsight I should probably learn how to use the split functions... >.<

-- I do not trust my understanding of the '$' operator's precedence/relationship
-- with ':' or infix functions to try and clean up some of this code.
-- grabLetters produces an ancronym that doesn't change case, is backwards, and
-- is will miss the first letter if it is lower case
grabLetters :: String -> String -> Bool -> String
grabLetters [] acc _ = acc
grabLetters (s:ss) acc capFlag
  | s `elem` separators = if head ss `elem` separators 
                             then grabLetters ss acc False
                             else grabLetters (tail ss) (head ss : acc) False
  | s `elem` capitals && capFlag = grabLetters ss acc True
  | s `elem` capitals && not capFlag = grabLetters ss (s : acc) True
  | otherwise = grabLetters ss acc False
  where separators = [' ', '-', '_']
        capitals = ['A'..'Z']

-- grabLetters will not grab the first letter of the String if it is lowercase.
-- firstLetter will extract it in this event.
firstLetter :: String -> String
firstLetter [] = []
firstLetter (s : _)
  | s `elem` ['a'..'z'] = [s]
  | otherwise = []

orientString :: String -> String
orientString ss = T.unpack . T.toUpper . T.pack $ reverse ss

abbreviate :: String -> String
abbreviate xs = orientString $ grabLetters xs [] False ++ firstLetter xs

