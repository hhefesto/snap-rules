module Paths_snap_rules (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/hefesto/dev/snap-rules/.stack-work/install/x86_64-linux/lts-6.4/7.10.3/bin"
libdir     = "/home/hefesto/dev/snap-rules/.stack-work/install/x86_64-linux/lts-6.4/7.10.3/lib/x86_64-linux-ghc-7.10.3/snap-rules-0.1.0.0-H4FHlWrF05k5UuQD8NTm3X"
datadir    = "/home/hefesto/dev/snap-rules/.stack-work/install/x86_64-linux/lts-6.4/7.10.3/share/x86_64-linux-ghc-7.10.3/snap-rules-0.1.0.0"
libexecdir = "/home/hefesto/dev/snap-rules/.stack-work/install/x86_64-linux/lts-6.4/7.10.3/libexec"
sysconfdir = "/home/hefesto/dev/snap-rules/.stack-work/install/x86_64-linux/lts-6.4/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "snap_rules_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "snap_rules_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "snap_rules_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "snap_rules_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "snap_rules_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
