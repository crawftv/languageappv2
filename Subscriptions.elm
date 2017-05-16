module Subscriptions exposing (..)

import Model
import Update


subscriptions : Model.Model -> Sub Update.Msg
subscriptions model =
    Sub.none
