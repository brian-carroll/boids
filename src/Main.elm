module Main exposing (main)

{-| Rock Paper Scissors
    West London Hack Night
@docs main
-}

-- External modules

import Html


-- Local modules

import Types exposing (..)
import View
import State exposing (init, update, subscriptions)


{-| Entry point for the app
-}
main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = View.root
        }
