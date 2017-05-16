module Nav exposing (..)

import List exposing (..)
import Model


fromUrlHash : String -> Model.RoutePath
fromUrlHash urlHash =
    urlHash |> String.split "/" |> drop 1
