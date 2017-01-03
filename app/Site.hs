{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE OverloadedStrings #-}

module Site (app, App(..)) where

import Application
import Snap
import Snap.Core
import Snap.Snaplet
import Snap.Util.FileServe
import Control.Monad.IO.Class (liftIO)
import System.Posix (getEnvDefault)
import Data.ByteString (ByteString)
import Handlers.Home (indexHandler)
import Handlers.About (aboutHandler)

-- The application's routes
routes :: [(ByteString, Handler App App ())]
routes = [ ("/", indexHandler)
         , ("/about", aboutHandler)
         ]
---------------------------


app :: SnapletInit App App
app = makeSnaplet "my app" "my example application" Nothing $ do
  conf <- liftIO $ ServerConfig . read <$> getEnvDefault "SNAP_ENV" "development"
  addRoutes routes
  return $ App conf
