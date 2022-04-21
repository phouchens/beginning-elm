module Test.Generated.Main exposing (main)

import Example
import RippleCarryAdderTests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = ConsoleReport UseColor
        , seed = 204788239490077
        , processes = 4
        , globs =
            []
        , paths =
            [ "/home/prh/dev/beginning-elm/tests/Example.elm"
            , "/home/prh/dev/beginning-elm/tests/RippleCarryAdderTests.elm"
            ]
        }
        [ ( "Example"
          , [ Test.Runner.Node.check Example.suite
            , Test.Runner.Node.check Example.guardianNames
            , Test.Runner.Node.check Example.additionTests
            , Test.Runner.Node.check Example.comparisonTests
            ]
          )
        , ( "RippleCarryAdderTests"
          , [ Test.Runner.Node.check RippleCarryAdderTests.inverterTests
            , Test.Runner.Node.check RippleCarryAdderTests.andGateTests
            , Test.Runner.Node.check RippleCarryAdderTests.orGateTests
            ]
          )
        ]