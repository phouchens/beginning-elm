module RippleCarryAdderTests exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import RippleCarryAdder exposing (..)
import Test exposing (..)


inverterTests : Test
inverterTests =
    describe "Inverter tests"
        [ test "1 should return 0" <|
            \_ -> inverter 1 |> Expect.equal 0
        , test "0 should return 1" <|
            \_ -> inverter 0 |> Expect.equal 1
        ]


andGateTests : Test
andGateTests =
    describe "AndGate tests"
        [ test "is 0 when both inputs are 0" <|
            \_ -> andGate 0 0 |> Expect.equal 0
        , test "is 1 when both inpts are 1" <|
            \_ -> andGate 1 1 |> Expect.equal 1
        , test "is 0 when one input 0 and the other 1" <|
            \_ -> andGate 0 1 |> Expect.equal 0
        ]


orGateTests : Test
orGateTests =
    describe "OrGate tests"
        [ test "is 0 when both inputs are 0" <|
            \_ -> orGate 0 0 |> Expect.equal 0
        , test "is 1 when an input is 1" <|
            \_ -> orGate 0 1 |> Expect.equal 1
        , test "is 1 when the other input is 1" <|
            \_ -> orGate 1 0 |> Expect.equal 1
        , test "is 1 when both inputs are 1" <|
            \_ -> orGate 1 1 |> Expect.equal 1
        ]
