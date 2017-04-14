module Main exposing (main)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import RandomModel exposing (model)
import State exposing (update)
import Types exposing (Msg(..))


main : BenchmarkProgram
main =
    program suite


suite : Benchmark
suite =
    describe "Update"
        [ benchmark2 "" update Tick model
        ]
