{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Applicative
import Snap.Core
import Snap.Snaplet
import Snap.Snaplet.Config
import Snap.Util.FileServe
import Snap.Http.Server
import System.Posix (getEnvDefault)
import Site

main :: IO ()
main = do
  conf <- getConf
  (msg, site, cleanup) <- runSnaplet (Just "development") app
  httpServe conf site
  cleanup


getConf :: IO (Config Snap AppConfig)
getConf = do
  port <- getEnvDefault "PORT" "3000"
  setPort (read port) <$> commandLineAppConfig defaultConfig

  
