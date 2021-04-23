{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_acronym (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,7,0,11] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/ken/exercism/haskell/acronym/.stack-work/install/x86_64-linux-tinfo6/cd4b293b91e6cd3bb954fc0f3e98a05fcb1b4534a9dd73f2c53256b7cbcd0fa4/8.8.4/bin"
libdir     = "/home/ken/exercism/haskell/acronym/.stack-work/install/x86_64-linux-tinfo6/cd4b293b91e6cd3bb954fc0f3e98a05fcb1b4534a9dd73f2c53256b7cbcd0fa4/8.8.4/lib/x86_64-linux-ghc-8.8.4/acronym-1.7.0.11-3kKjpCX3mUvI2PPXWxPBIM-test"
dynlibdir  = "/home/ken/exercism/haskell/acronym/.stack-work/install/x86_64-linux-tinfo6/cd4b293b91e6cd3bb954fc0f3e98a05fcb1b4534a9dd73f2c53256b7cbcd0fa4/8.8.4/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/ken/exercism/haskell/acronym/.stack-work/install/x86_64-linux-tinfo6/cd4b293b91e6cd3bb954fc0f3e98a05fcb1b4534a9dd73f2c53256b7cbcd0fa4/8.8.4/share/x86_64-linux-ghc-8.8.4/acronym-1.7.0.11"
libexecdir = "/home/ken/exercism/haskell/acronym/.stack-work/install/x86_64-linux-tinfo6/cd4b293b91e6cd3bb954fc0f3e98a05fcb1b4534a9dd73f2c53256b7cbcd0fa4/8.8.4/libexec/x86_64-linux-ghc-8.8.4/acronym-1.7.0.11"
sysconfdir = "/home/ken/exercism/haskell/acronym/.stack-work/install/x86_64-linux-tinfo6/cd4b293b91e6cd3bb954fc0f3e98a05fcb1b4534a9dd73f2c53256b7cbcd0fa4/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "acronym_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "acronym_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "acronym_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "acronym_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "acronym_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "acronym_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
