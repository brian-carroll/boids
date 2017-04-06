module State exposing (init, update, subscriptions)

import Types exposing (..)
import Time exposing (millisecond)
import Tuple exposing (first, second)


init : ( Model, Cmd Msg )
init =
    ( [ { x = 0.0
        , y = 0.0
        , vx = 0.1
        , vy = 0.1
        }
      ]
    , Cmd.none
    )


t : Float
t =
    16 * millisecond


maxWidth : Float
maxWidth =
    500.0


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every t (always Tick)
        ]


updateBoid : Boid -> Boid
updateBoid boid =
    { boid
        | x = min maxWidth (boid.x + (t * boid.vx))
        , y = min maxWidth (boid.y + (t * boid.vy))
        , vx = boid.vx
        , vy = boid.vy
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case model of
        [] ->
            ( model, Cmd.none )

        h :: t ->
            ( [ updateBoid h ]
            , Cmd.none
            )
