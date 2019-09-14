{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hsc2hs (
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
version = Version [0,68,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/local/.cabal/store/ghc-8.6.5/hsc2hs-0.68.6-d5fc6a4f/bin"
libdir     = "/Users/local/.cabal/store/ghc-8.6.5/hsc2hs-0.68.6-d5fc6a4f/lib"
dynlibdir  = "/Users/local/.cabal/store/ghc-8.6.5/lib"
datadir    = "/Users/local/.cabal/store/ghc-8.6.5/hsc2hs-0.68.6-d5fc6a4f/share"
libexecdir = "/Users/local/.cabal/store/ghc-8.6.5/hsc2hs-0.68.6-d5fc6a4f/libexec"
sysconfdir = "/Users/local/.cabal/store/ghc-8.6.5/hsc2hs-0.68.6-d5fc6a4f/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hsc2hs_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hsc2hs_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hsc2hs_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hsc2hs_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hsc2hs_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hsc2hs_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
