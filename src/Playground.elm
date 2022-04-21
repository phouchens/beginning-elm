module Playground exposing (main)

import Html
import Regex


computeSpeed distance time =
    distance / time


computeTime startTime endTime =
    endTime - startTime


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


add a b =
    a + b


multiply c d =
    c * d


divide e f =
    e / f


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


descending a b =
    case compare a b of
        LT ->
            GT

        GT ->
            LT

        EQ ->
            EQ


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
        ( "Valid emal", "green" )

    else
        ( "Invalid email", "red" )


multiplyByFive number =
    let
        multiplier =
            5
    in
    number * multiplier


main =
    multiplyByFive 3
        |> String.fromInt
        |> Html.text



--main =
--    Html.text (String.fromFloat (add 5 (multiply 10 (divide 30 10))))
--main =
--    divide 30 10
--        |> multiply 10
--        |> add 5
--        |> String.fromFloat
--        |> Html.text
--main =
--    Html.text <| String.fromFloat <| add 5 <| multiply 10 <| divide 30 10
--main =
--    computeTime 2 3
--        |> computeSpeed 7.67
--        |> escapeEarth 11
--        |> Html.text
