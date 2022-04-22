module FuzzTests exposing (addOneTest, addTests)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)


addOneTest : Test
addOneTest =
    describe "addOne"
        [ fuzz frequencyFuzzer "adds 1 to any integer" <|
            \num -> addOne num |> Expect.equal (num + 1)
        ]


addTests : Test
addTests =
    describe "add tests"
        [ fuzz2 int int "adds two given integers" <|
            \num1 num2 ->
                add num1 num2
                    |> Expect.equal (num1 + num2)
        ]


addOne : Int -> Int
addOne x =
    1 + x


add : Int -> Int -> Int
add x y =
    x + y


frequencyFuzzer : Fuzzer Int
frequencyFuzzer =
    frequency
        [ ( 70, constant 7 )
        , ( 12, intRange 8 9 )
        , ( 6, constant 6 )
        , ( 9, intRange 2 4 )
        , ( 1, constant 5 )
        , ( 1, constant 1 )
        , ( 1, constant 10 )
        ]
