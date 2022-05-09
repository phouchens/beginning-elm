module HttpExamples exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)
import Http


type alias Model =
    List String


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick SendHttpRequest ]
            [ text "Get data from server" ]
        , h3 [] [ text "Old School main characters" ]
        , ul [] (List.map viewNickname model)
        ]


viewNickname : String -> Html Msg
viewNickname nickName =
    li [] [ text nickName ]


type Msg
    = SendHttpRequest
    | DataReceived (Result Http.Error String)


url : String
url =
    "http://localhost:5016/old-school.txt"


getNicknames : Cmd Msg
getNicknames =
    Http.get
        { url = url
        , expect = Http.expectString DataReceived
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SendHttpRequest ->
            ( model, getNicknames )

        DataReceived (Ok nicknamesStr) ->
            let
                nicknames =
                    String.split "," nicknamesStr
            in
            ( nicknames, Cmd.none )

        DataReceived (Err _) ->
            ( model, Cmd.none )


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( [], Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
