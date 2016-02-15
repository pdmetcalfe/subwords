module DictFinder (isFoundIn)

where

import qualified Data.ByteString as B
import qualified Data.Map.Strict as Map

import Data.Function
import Data.Word


countChars :: B.ByteString -> Map.Map Word8 Int
countChars = B.foldr (\k -> Map.insertWith (+) k 1) Map.empty


isFoundIn :: B.ByteString -> B.ByteString -> Bool
isFoundIn = Map.isSubmapOfBy (<=) `on` countChars

