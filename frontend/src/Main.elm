port module Main exposing (..)

import Browser
import Html exposing (Html, button, div, img, input, label, text)
import Html.Attributes exposing (autocomplete, class, for, id, src, type_)
import Html.Events exposing (onClick, onInput)



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- PORTS


port sendGreetRequest : String -> Cmd msg


port greetReceiver : (String -> msg) -> Sub msg



-- MODEL


type alias Model =
    { userName : String
    , greetedWith : String
    }


init : () -> ( Model, Cmd msg )
init _ =
    ( { userName = ""
      , greetedWith = "Please enter your name below 👇"
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = SetUserName String
    | Submit
    | Recv String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetUserName name ->
            ( { model | userName = name }, Cmd.none )

        Submit ->
            ( model, sendGreetRequest model.userName )

        Recv greetings ->
            ( { model | greetedWith = greetings }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    greetReceiver Recv



-- VIEW

logo : String -> Html Msg
logo file =
  div [ class "max-w-xs mx-auto" ] [img [ src <| "assets/images/" ++ file ] [] ]


view : Model -> Html Msg
view model =
    div [ class "container p-6 mx-auto text-white flex flex-col items-center", id "app" ]
        [
          div [ class "flex flex-wrap justify-center mb-3" ] [
            div [ class "basis-full" ] [ logo "wails-logo.png" ]
            , logo "elm-logo.png"
            , logo "tailwind-logo.png"
          ]

        , label [ class "result",  for "name" ] [ text model.greetedWith ]
        , div [ class "input-box", id "input" ]
            [ input
                [ class "shadow-inner rounded px-4 py-2 mr-2 text-black"
                , id "name"
                , type_ "text"
                , autocomplete False
                , onInput SetUserName
                ]
                []
            , button [ class "px-4 py-2 bg-sky-500/75 rounded font-semibold", onClick Submit ] [ text "Greet" ]
            ]
        ]
