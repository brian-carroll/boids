module State exposing (init, update, subscriptions)

import Types exposing (..)
import Time exposing (second)
import Random exposing (generate, float, list, pair)


t : Float
t =
    second / 60.0


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
        ( x_new, vx_new ) =
            bounceOffWalls ( boid.x, boid.vx )

        ( y_new, vy_new ) =
            bounceOffWalls ( boid.y, boid.vy )
    in
        { boid
            | x = x_new
            , y = y_new
            , vx = vx_new
            , vy = vy_new
        }


bounceOffWalls : ( Float, Float ) -> ( Float, Float )
bounceOffWalls ( pos, vel ) =
    let
        pos_step =
            pos + (t * vel)
    in
        if pos_step < -maxWidth then
            ( -maxWidth, -vel )
        else if pos_step > maxWidth then
            ( maxWidth, -vel )
        else
            ( pos_step, vel )
