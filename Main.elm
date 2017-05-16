module Main exposing (..)

import Navigation
import Model
import Update
import View
import Subscriptions


main : Program Never Model.Model Update.Msg
main =
    Navigation.program Update.UrlChange
        { init = init
        , view = View.view
        , update = Update.update
        , subscriptions = Subscriptions.subscriptions
        }


initialUsers : List Model.User
initialUsers =
    [ Model.User 1 "Fred" [ "running", "climbing" ] ]


initialLessonList : List Model.Lesson
initialLessonList =
    [ Model.Lesson 1 "Lesson1" "Lesson1url" ]


init : Navigation.Location -> ( Model.Model, Cmd Update.Msg )
init location =
    { currentRoute = location, users = initialUsers, lessonList = initialLessonList } ! []



-- Model
--Update
--Navigation
--view
-- subscriptions
