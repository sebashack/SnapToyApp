{-# LANGUAGE OverloadedStrings #-}
module Handlers.Home (indexHandler) where

import Snap.Snaplet (Handler)
import Text.Blaze.Html5 (Html)
import Snap.Blaze (blaze)
import Application
import Control.Monad (forM_)
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A


members :: [String] -> Html
members orgs = H.docTypeHtml $ do
  H.head $ do
    H.title "Home"
  H.body $ do
    H.h1 "Welcome to my SnapToy"
    H.p "A list of organizations:"
    H.ul $ forM_ orgs (H.li . H.toHtml)


indexHandler :: Handler App App ()
indexHandler = blaze $ members [ "Google"
                               , "Amazon"
                               , "Twilio"
                               , "StackBuilders"
                               , "Facebook"
                               , "Spotify"
                               , "Twitter" ]
  
