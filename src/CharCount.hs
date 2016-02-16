module CharCount (countChars)

where

import qualified Data.Map.Strict as Map
import qualified Data.ByteString as B

import Data.Word


countChars :: B.ByteString -> Map.Map Word8 Int
countChars = B.foldr (\k -> Map.insertWith (+) k 1) Map.empty
