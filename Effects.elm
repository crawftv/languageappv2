module Effects exposing (..)

import Json.Decode as Decode exposing (string, int, list, map3, field)


--import Json.Decode.Pipeline exposing (decode, required)

import Model


{- decodeLesson : Decode.Decoder Model.Lesson
   decodeLesson =
       decode Model.Lesson
           |> required "lessonId" int
           |> required "lessonName" string
           |> required "lessonUrl" string
-}


decodeLesson : Decode.Decoder (List Model.Lesson)
decodeLesson =
    list <|
        map3 Model.Lesson
            (field "lessonID" int)
            (field "lessonName" string)
            (field "lessonurl" string)
