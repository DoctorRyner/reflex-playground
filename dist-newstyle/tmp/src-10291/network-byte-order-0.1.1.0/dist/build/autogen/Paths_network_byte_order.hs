{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_network_byte_order (
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
version = Version [0,1,1,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/local/.cabal/store/ghc-8.6.5/ntwrk-byt-rdr-0.1.1.0-a43ad807/bin"
libdir     = "/Users/local/.cabal/store/ghc-8.6.5/ntwrk-byt-rdr-0.1.1.0-a43ad807/lib"
dynlibdir  = "/Users/local/.cabal/store/ghc-8.6.5/lib"
datadir    = "/Users/local/.cabal/store/ghc-8.6.5/ntwrk-byt-rdr-0.1.1.0-a43ad807/share"
libexecdir = "/Users/local/.cabal/store/ghc-8.6.5/ntwrk-byt-rdr-0.1.1.0-a43ad807/libexec"
sysconfdir = "/Users/local/.cabal/store/ghc-8.6.5/ntwrk-byt-rdr-0.1.1.0-a43ad807/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "network_byte_order_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "network_byte_order_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "network_byte_order_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "network_byte_order_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "network_byte_order_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "network_byte_order_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
