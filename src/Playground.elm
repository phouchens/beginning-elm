module Playground exposing (..)

import Html
import Regex


add : Int -> Int -> Int
add num1 num2 =
    num1 + num2


computeSpeed : Float -> Float -> Float
computeSpeed distance time =
    distance / time


computeTime : Float -> Float -> Float
computeTime startTime endTime =
    endTime - startTime


escapeEarth : Float -> Float -> String -> String
escapeEarth myVelocity mySpeed fuelStatus =
    let
        escapeVelocityInKmPerSec =
            11.186

        orbitalSpeedInKmPerSec =
            7.67

        whereToLand =
            if fuelStatus == "low" then
                "Land on droneship"

            else
                "Land on launchpad"
    in
    if myVelocity > escapeVelocityInKmPerSec then
        "Godspeed"

    else if mySpeed == orbitalSpeedInKmPerSec then
        "Stay in orbit"

    else
        whereToLand


multiply : number -> number -> number
multiply c d =
    c * d


divide : Float -> Float -> Float
divide e f =
    e / f


weekday : Int -> String
weekday dayInNumber =
    case dayInNumber of
        0 ->
            "Sunday"

        1 ->
            "Monday"

        2 ->
            "Tuesday"

        3 ->
            "Wednesday"

        4 ->
            "Thursday"

        5 ->
            "Friday"

        6 ->
            "Saturday"

        _ ->
            "Unknown day"


hashtag : Int -> String
hashtag dayInNumber =
    case weekday dayInNumber of
        "Sunday" ->
            "#SinDay"

        "Monday" ->
            "#MondayBlues"

        "Tuesday" ->
            "#TakeMeBackTuesday"

        "Wednesday" ->
            "#HumpDay"

        "Thursday" ->
            "#ThrowbackThursday"

        "Friday" ->
            "#FlashBackFriday"

        "Saturday" ->
            "#SaturdaysAreForTheBoys"

        _ ->
            "#Whatevs"


descending : String -> String -> Order
descending a b =
    case compare a b of
        LT ->
            GT

        GT ->
            LT

        EQ ->
            EQ


evilometer : String -> String -> Order
evilometer character1 character2 =
    case ( character1, character2 ) of
        ( "Joffrey", "Ramsay" ) ->
            LT

        ( "Joffrey", "Night King" ) ->
            LT

        ( "Ramsay", "Joffrey" ) ->
            GT

        ( "Ramsay", "Night King" ) ->
            LT

        ( "Night King", "Joffrey" ) ->
            GT

        ( "Night King", "Ramsay" ) ->
            GT

        _ ->
            GT


validateEmail : String -> ( String, String )
validateEmail email =
    let
        emailPattern =
            "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b"

        regex =
            Maybe.withDefault Regex.never <|
                Regex.fromString emailPattern

        isValid =
            Regex.contains regex email
    in
    if isValid then
        ( "Valid email", "green" )

    else
        ( "Invalid email", "red" )


multiplyByFive : Int -> Int
multiplyByFive number =
    let
        multiplier =
            5
    in
    number * multiplier


scoreMultiplyer =
    2


highestScores =
    [ 316, 320, 312, 370, 337, 318, 314 ]


doubleScores : List Int -> List Int
doubleScores scores =
    List.map (\x -> x * scoreMultiplyer) scores


type Greeting
    = Howdy
    | Hola
    | Namaste String
    | NumericalHi Int Int


sayHello : Greeting -> String
sayHello greeting =
    case greeting of
        Howdy ->
            "How y'all doing?"

        Hola ->
            "Hola amigo"

        Namaste message ->
            message

        NumericalHi val1 val2 ->
            val1 + val2 |> String.fromInt


signUp : String -> String -> Result String String
signUp email ageStr =
    case String.toInt ageStr of
        Nothing ->
            Err "Age Must be Int"

        Just age ->
            let
                emailPattern =
                    "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b"

                regex =
                    Maybe.withDefault Regex.never <| Regex.fromString emailPattern

                isValidEmail =
                    Regex.contains regex email
            in
            if age < 13 then
                Err "You need to be at least 13 years old to sign up."

            else if isValidEmail then
                Ok "Your account has been created successfully!"

            else
                Err "You entered an invalid email."


main =
    multiplyByFive 3
        |> String.fromInt
        |> Html.text
