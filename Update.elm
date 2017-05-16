module Update exposing (..)

import Model
import Navigation
import Http exposing (..)
import Effects


type Msg
    = UrlChange Navigation.Location
    | NewLessonList (Result Http.Error (List Model.Lesson))


update : Msg -> Model.Model -> ( Model.Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            { model | currentRoute = location } ! []

        NewLessonList (Ok lesson) ->
            { model | lessonList = lesson } ! []

        NewLessonList (Err _) ->
            model ! []


getLessonList : Cmd Msg
getLessonList =
    let
        url =
            "lessonList.json"
    in
        Http.send NewLessonList (Http.get url Effects.decodeLesson)
