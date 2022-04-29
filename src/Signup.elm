module Signup exposing (User)

import Css exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled exposing (..)
import VirtualDom

type alias User =
    { name : String
    , email : String
    , password : String
    , loggedIn : Bool
    }


initialModel : User
initialModel =
    { name = ""
    , email = ""
    , password = ""
    , loggedIn = False
    }


view : User -> Html msg
view user =
    div []
        [ h1 [ css [ paddingLeft (cm 3) ] ] [ text "Sign up" ]
        , styledForm [] 
            [ div []
                [ text "Name"
                , styledInput [ id "name", type_ "text" ] []
                ]
            , div []
                [ text "Email"
                , styledInput [ id "email", type_ "text" ] []
                ]
            , div []
                [ text "Password"
                , styledInput [ id "password", type_ "text" ] []
                ]
            , div []
                [ styledButton [ type_ "submit" ] 
                    [ text "Create my account" ]
                ]
            ]
       ]

main : VirtualDom.Node msg
main = 
    toUnstyled <| view initialModel


styledForm : List (Attribute msg) -> List (Html msg) -> Html msg
styledForm =
    styled Html.Styled.form
        [ borderRadius (px 5)
        , backgroundColor (hex "#f2f2f2")
        , padding (px 20)
        , Css.width (px 300)
        ]


styledInput : List (Attribute msg) -> List (Html msg) -> Html msg
styledInput =
    styled Html.Styled.input
        [ display block
        , Css.width (px 260)
        , padding2 (px 12) (px 20)
        , margin2 (px 8) (px 0)
        , border (px 0)
        , borderRadius (px 4)
        ]

styledButton : List (Attribute msg) -> List (Html msg) -> Html msg
styledButton = 
    styled Html.Styled.button
        [ Css.width (px 300)
        , backgroundColor (hex "#397cd5")
        , color (hex "#fff")
        , padding2 (px 14) (px 20)
        , marginTop (px 10)
        , border (px 0)
        , borderRadius (px 4)
        , fontSize (px 16)
        ]

