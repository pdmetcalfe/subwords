module DictFinder (isFoundIn)

where

import qualified Data.ByteString as B
import qualified Data.Map.Strict as Map

import Data.Function

import CharCount



isFoundIn :: B.ByteString -> B.ByteString -> Bool
isFoundIn = Map.isSubmapOfBy (<=) `on` countChars

