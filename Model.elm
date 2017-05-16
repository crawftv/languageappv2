module Model exposing (..)

import Navigation


type alias Model =
    { currentRoute : Navigation.Location
    , users : List User
    , lessonList : List Lesson
    }


type alias Lesson =
    { lessonId : Int
    , lessonName : String
    , lessonUrl : String
    }


type alias User =
    { id : Int
    , name : String
    , hobbies : List Hobby
    }


type alias Hobby =
    String


type alias RoutePath =
    List String
