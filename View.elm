module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model
import Update
import List
import Nav


userFromId : List Model.User -> String -> Maybe Model.User
userFromId users idStr =
    let
        id =
            Result.withDefault 0 (String.toInt idStr)
    in
        List.filter (\user -> id == user.id) users |> List.head


homePage : Html Update.Msg
homePage =
    h1 [] [ text "Home" ]


aboutPage : Html Update.Msg
aboutPage =
    h1 [] [ text "about" ]


notFoundPage : Html Update.Msg
notFoundPage =
    h1 [] [ text "page not found" ]


usersPage : Model.Model -> Html Update.Msg
usersPage model =
    div []
        [ h1 [] [ text "users" ]
        , ul [] (List.map (\user -> li [] [ link user.name ("/#/users/" ++ toString user.id) ]) model.users)
        ]


lessonListPage : Model.Model -> Html Update.Msg
lessonListPage model =
    div []
        [ h1 [] [ text "Lessons" ]
        , ul [] (List.map (\lesson -> li [] [ link lesson.lessonName ("/#/lesson" ++ toString lesson.lessonId) ]) model.lessonList)
        ]


userPage : Model.Model -> String -> Html Update.Msg
userPage model idStr =
    let
        user =
            userFromId model.users idStr
    in
        case user of
            Just u ->
                div []
                    [ h1 [] [ text ("User Profile") ]
                    , h2 [] [ link u.name ("/#/users/" ++ idStr ++ "/hobbies") ]
                    ]

            Nothing ->
                div [] [ h1 [] [ text "user not found" ] ]


hobbiesPage : Model.Model -> String -> Html Update.Msg
hobbiesPage model idStr =
    let
        user =
            userFromId model.users idStr
    in
        case user of
            Just u ->
                div []
                    [ h1 [] [ text "user hobbies" ]
                    , ul [] (List.map (\hobby -> li [] [ text hobby ]) u.hobbies)
                    ]

            Nothing ->
                text "user not found"


pageBody : Model.Model -> Html Update.Msg
pageBody model =
    let
        routepath =
            Nav.fromUrlHash model.currentRoute.hash
    in
        case routepath of
            [] ->
                homePage

            [ "home" ] ->
                homePage

            [ "about" ] ->
                aboutPage

            [ "users" ] ->
                usersPage model

            [ "users", userId ] ->
                userPage model userId

            [ "users", userId, "hobbies" ] ->
                hobbiesPage model userId

            [ "lessonList" ] ->
                lessonListPage model

            _ ->
                notFoundPage


menuStyle : Html.Attribute Update.Msg
menuStyle =
    style [ ( "list-style-type", "none" ) ]


menuElementStyle : Html.Attribute Update.Msg
menuElementStyle =
    style [ ( "display", "inline" ), ( "margin-left", "10px" ) ]


link : String -> String -> Html Update.Msg
link name url =
    a [ href url ] [ text name ]


view : Model.Model -> Html Update.Msg
view model =
    div [ style [ ( "maring", "20px" ) ] ]
        [ ul [ menuStyle ]
            [ li [ menuElementStyle ] [ link "home" "#/home" ]
            , li [ menuElementStyle ] [ link "about" "#/about" ]
            , li [ menuElementStyle ] [ link "users" "#/users" ]
            , li [ menuElementStyle ] [ link "Lesson List" "#/lessonList" ]
            ]
        , pageBody model
        ]
