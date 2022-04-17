module Playground exposing (main)

import Html


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


main =
    escapeEarth 10 6.7 "low"
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
