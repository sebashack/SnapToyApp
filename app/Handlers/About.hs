{-# LANGUAGE OverloadedStrings #-}
module Handlers.About (aboutHandler) where

import Snap.Snaplet (Handler)
import Text.Blaze.Html5 (Html)
import Snap.Blaze (blaze)
import Application
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A


about :: Html
about = H.docTypeHtml $ do
  H.head $ do
    H.title "About Us"
  H.body $ do
    H.h1 "About Us"
    H.p "We are the best of the best in here!..."
   

aboutHandler :: Handler App App ()
aboutHandler = blaze $ about
