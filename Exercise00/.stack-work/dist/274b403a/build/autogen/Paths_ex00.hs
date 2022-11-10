{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_ex00 (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\ellio\\OneDrive - TCDUD.onmicrosoft.com\\Documents\\College\\Year 3\\Semester 1\\Functional Programming\\functional-programming\\Exercise00\\.stack-work\\install\\8e1c05f7\\bin"
libdir     = "C:\\Users\\ellio\\OneDrive - TCDUD.onmicrosoft.com\\Documents\\College\\Year 3\\Semester 1\\Functional Programming\\functional-programming\\Exercise00\\.stack-work\\install\\8e1c05f7\\lib\\x86_64-windows-ghc-8.10.7\\ex00-0.1.0.0-JBeJ4FElBJFBwhHzSJK9mB"
dynlibdir  = "C:\\Users\\ellio\\OneDrive - TCDUD.onmicrosoft.com\\Documents\\College\\Year 3\\Semester 1\\Functional Programming\\functional-programming\\Exercise00\\.stack-work\\install\\8e1c05f7\\lib\\x86_64-windows-ghc-8.10.7"
datadir    = "C:\\Users\\ellio\\OneDrive - TCDUD.onmicrosoft.com\\Documents\\College\\Year 3\\Semester 1\\Functional Programming\\functional-programming\\Exercise00\\.stack-work\\install\\8e1c05f7\\share\\x86_64-windows-ghc-8.10.7\\ex00-0.1.0.0"
libexecdir = "C:\\Users\\ellio\\OneDrive - TCDUD.onmicrosoft.com\\Documents\\College\\Year 3\\Semester 1\\Functional Programming\\functional-programming\\Exercise00\\.stack-work\\install\\8e1c05f7\\libexec\\x86_64-windows-ghc-8.10.7\\ex00-0.1.0.0"
sysconfdir = "C:\\Users\\ellio\\OneDrive - TCDUD.onmicrosoft.com\\Documents\\College\\Year 3\\Semester 1\\Functional Programming\\functional-programming\\Exercise00\\.stack-work\\install\\8e1c05f7\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ex00_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ex00_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "ex00_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "ex00_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ex00_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ex00_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
