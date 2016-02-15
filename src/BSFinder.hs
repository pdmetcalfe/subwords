module BSFinder (isFoundIn)

where

import qualified Data.ByteString as B
import Data.Function

isFoundIn' :: B.ByteString -> B.ByteString -> Bool
isFoundIn' x y
  | B.null x  = True
  | B.null y  = False
  | otherwise = case (compare `on` B.head) x y of
    LT -> False
    EQ -> (isFoundIn' `on` B.tail) x y
    GT -> isFoundIn' x (B.tail y)

isFoundIn :: B.ByteString -> B.ByteString -> Bool
isFoundIn = isFoundIn' `on` B.sort
