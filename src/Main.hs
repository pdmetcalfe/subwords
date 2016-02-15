import System.IO (stdin)
import System.Environment (getArgs)

import qualified Data.ByteString.Char8 as B

import Data.Conduit ((=$=), ($$))
import qualified Data.Conduit.Binary as CB
import qualified Data.Conduit.List as CL

import BSFinder2

main :: IO ()
main = do
  [target] <- fmap B.pack `fmap` getArgs
  CB.sourceHandle stdin =$=
    CB.lines =$=
    CL.filter (`isFoundIn` target) $$
    CL.mapM_ B.putStrLn
