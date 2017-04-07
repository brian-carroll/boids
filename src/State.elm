module State exposing (init, update, subscriptions)

import Types exposing (..)
import Time exposing (millisecond)
import Random exposing (generate, float, list, pair)


t : Float
t =
    16 * millisecond


maxWidth : Float
maxWidth =
    500.0


numBoids : Int
numBoids =
    50


init : ( Model, Cmd Msg )
init =
    ( []
    , generate Init (list numBoids (list 4 (float 0.0 1.0)))
    )


initBoid : List Float -> Boid
initBoid rand4 =
    case rand4 of
        [ a, b, c, d ] ->
            { x = (a * maxWidth) - (maxWidth / 2.0)
            , y = (b * maxWidth) - (maxWidth / 2.0)
            , vx = (c * 1) - 0.05
            , vy = (d * 1) - 0.05
            }

        _ ->
            { x = 0.0, y = 0.0, vx = 0.0, vy = 0.0 }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every t (always Tick)
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Init randlist ->
            ( List.map initBoid randlist
            , Cmd.none
            )

        Tick ->
            ( List.map updateBoid model
            , Cmd.none
            )


updateBoid : Boid -> Boid
updateBoid boid =
    let
        x_tmp =
            boid.x + (t * boid.vx)

        y_tmp =
            boid.y + (t * boid.vy)

        ( x_new, vx_new ) =
            if x_tmp < -maxWidth then
                ( -maxWidth, -boid.vx )
            else if x_tmp > maxWidth then
                ( maxWidth, -boid.vx )
            else
                ( x_tmp, boid.vx )

        ( y_new, vy_new ) =
            if y_tmp < -maxWidth then
                ( -maxWidth, -boid.vy )
            else if y_tmp > maxWidth then
                ( maxWidth, -boid.vy )
            else
                ( y_tmp, boid.vy )
    in
        { boid
            | x = x_new
            , y = y_new
            , vx = vx_new
            , vy = vy_new
        }
