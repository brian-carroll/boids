module Main exposing (main)

{-| Boids
    West London Hack Night, April 2017
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
