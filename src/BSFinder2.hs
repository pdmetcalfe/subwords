module BSFinder2 (isFoundIn)

where

import qualified Data.ByteString as B
import qualified Data.Map.Strict as Map
import Data.Word

import CharCount


removeChar :: Word8 -> Map.Map Word8 Int -> Maybe (Map.Map Word8 Int)
removeChar x m = case Map.updateLookupWithKey upd x m of
  (Nothing, _) -> Nothing
  (Just x , y) -> if x >= 0 then Just y else Nothing
  where
    upd _ = Just . pred


isFoundIn' :: B.ByteString -> Map.Map Word8 Int -> Bool
isFoundIn' x y
  | B.null x  = True
  | otherwise = case removeChar (B.head x) y of
                     Nothing -> False
                     Just yy -> isFoundIn' (B.tail x) yy


isFoundIn :: B.ByteString -> B.ByteString -> Bool
isFoundIn x = isFoundIn' x . countChars
