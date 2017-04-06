module State exposing (init, update, subscriptions)

import Types exposing (..)
import Time exposing (millisecond)
import Random exposing (generate, float, list, pair)


init : ( Model, Cmd Msg )
init =
    ( []
    , generate Init (list 5 (pair (float 0.0 1.0) (float 0.0 1.0)))
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
    case msg of
        Init velocitylist ->
            ( [], Cmd.none )

        Tick ->
            case model of
                [] ->
                    ( model, Cmd.none )

                h :: t ->
                    ( [ updateBoid h ]
                    , Cmd.none
                    )
