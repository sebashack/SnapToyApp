{-# LANGUAGE TemplateHaskell #-}
module Application where

import Control.Lens.TH


data ServerConfig = ServerConfig { envName :: String }

data App = App {  _config :: ServerConfig }

makeLenses ''App
