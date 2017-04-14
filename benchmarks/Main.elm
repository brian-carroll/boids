module Main exposing (main)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import Data.InitModel100
import Data.Converged100
import State exposing (update)
import Types exposing (Msg(..))


main : BenchmarkProgram
main =
    program suite


suite : Benchmark
suite =
    describe "Update (all boids at once)"
        [ benchmark2 "Init" update (Tick 17) Data.InitModel100.model
        , benchmark2 "Converged" update (Tick 17) Data.Converged100.model
        ]
