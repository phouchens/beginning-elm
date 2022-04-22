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


halfAdderTests : Test
halfAdderTests =
    describe "HalfAdder tests"
        [ test "sum and carry-out are 0 when both inputs are 0" <|
            \_ -> halfAdder 0 0 |> Expect.equal { carry = 0, sum = 0 }
        , test "sum is 1 and carry out is 0 when 1st input is 0 and 2nd is 1" <|
            \_ -> halfAdder 1 0 |> Expect.equal { carry = 0, sum = 1 }
        , test "sum is 1 and carry out is 0 when 1st input is 1 and 2nd is 0" <|
            \_ -> halfAdder 0 1 |> Expect.equal { carry = 0, sum = 1 }
        , test " sum is 0 and carry out is 1 when both inputs are 1" <|
            \_ -> halfAdder 1 1 |> Expect.equal { carry = 1, sum = 0 }
        ]


fullAdderTests =
    describe "Full adder"
        [ describe "when both inputs are 0"
            [ test "and carry-in is 0 too, then both sum and carry-out are 0" <|
                \_ ->
                    fullAdder 0 0 0
                        |> Expect.equal { carry = 0, sum = 0 }
            , test "but carry-in is 1, then sum is 1 and carry-out is 0" <|
                \_ ->
                    fullAdder 0 0 1
                        |> Expect.equal { carry = 0, sum = 1 }
            ]
        , describe "when the 1st input is 0, and the 2nd input is 1"
            [ test "and carry-in is 0, then sum is 1 and carry-out is 0" <|
                \_ ->
                    fullAdder 0 1 0
                        |> Expect.equal { carry = 0, sum = 1 }
            , test "and carry-in is 1, then sum is 0 and carry-out is 1" <|
                \_ ->
                    fullAdder 0 1 1
                        |> Expect.equal { carry = 1, sum = 0 }
            ]
        , describe "when the 1st input is 1, and the 2nd input is 0"
            [ test "and carry-in is 0, then sum is 1 and carry-out is 0" <|
                \_ ->
                    fullAdder 1 0 0
                        |> Expect.equal { carry = 0, sum = 1 }
            , test "and carry-in is 1, then sum is 0 and carry-out is 1" <|
                \_ ->
                    fullAdder 1 0 1
                        |> Expect.equal { carry = 1, sum = 0 }
            ]
        , describe "when the 1st input is 1, and the 2nd input is 1"
            [ test "and carry-in is 0, then sum is 0 and carry-out is 1" <|
                \_ ->
                    fullAdder 1 1 0
                        |> Expect.equal { carry = 1, sum = 0 }
            , test "and carry-in is 1, then sum is 1 and carry-out is 1" <|
                \_ ->
                    fullAdder 1 1 1
                        |> Expect.equal { carry = 1, sum = 1 }
            ]
        ]


rippleCarryAdderTests =
    describe "4-bit ripple carry adder"
        [ describe "given two binary numbers and a carry-in digit"
            [ test "returns the sum of those numbers and a carry-out digit" <|
                \_ ->
                    rippleCarryAdder 1001 1101 1
                        |> Expect.equal 10111
            ]
        , describe "when the 1st input is 1111, and the 2nd input is 1111"
            [ test "and carry-in is 0, the output is 11110" <|
                \_ ->
                    rippleCarryAdder 1111 1111 0
                        |> Expect.equal 11110
            , test "and carry-in is 1, the output is 11111" <|
                \_ ->
                    rippleCarryAdder 1111 1111 1
                        |> Expect.equal 11111
            ]
        , describe "when the 1st input is 0000, and the 2nd input is 0000"
            [ test "and carry-in is 0, the output is 0000" <|
                \_ ->
                    rippleCarryAdder 0 0 0
                        |> Expect.equal 0
            , test "and carry-in is 1, the output is 0001" <|
                \_ ->
                    rippleCarryAdder 0 0 1
                        |> Expect.equal 1
            ]
        ]
