module State exposing (init, update, subscriptions)

import Types exposing (..)
import Time exposing (second)
import Random exposing (generate, float, list, pair)
import Math.Vector2 exposing (Vec2)


t : Float
t =
    second / 60.0


maxWidth : Float
maxWidth =
    500.0


numBoids : Int
numBoids =
    50


vectorGenerator : Float -> Float -> Random.Generator Vec2
vectorGenerator lower upper =
    Random.pair (Random.float lower upper) (Random.float lower upper)
        |> Random.map Math.Vector2.fromTuple


boidGenerator : Random.Generator Boid
boidGenerator =
    Random.map2
        (\vector1 vector2 -> { position = vector1, velocity = vector2 })
        (vectorGenerator -0.5 0.5)
        (vectorGenerator -0.1 0.1)


init : ( Model, Cmd Msg )
init =
    ( []
    , generate Init <|
        list numBoids <|
            boidGenerator
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every t (always Tick)
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Init boidList ->
            ( boidList
            , Cmd.none
            )

        Tick ->
            ( List.map updateBoid model
            , Cmd.none
            )


updateBoid : Boid -> Boid
updateBoid boid =
    boid
        |> bounceOffWalls


bounceOffWalls : Boid -> Boid
bounceOffWalls boid =
    let
        ( x, y ) =
            Math.Vector2.toTuple boid.position

        ( vx, vy ) =
            Math.Vector2.toTuple boid.velocity

        ( x_new, vx_new ) =
            bounceOffWallsComponent ( x, vx )

        ( y_new, vy_new ) =
            bounceOffWallsComponent ( y, vy )
    in
        { boid
            | position = Math.Vector2.fromTuple ( x_new, y_new )
            , velocity = Math.Vector2.fromTuple ( vx_new, vy_new )
        }


bounceOffWallsComponent : ( Float, Float ) -> ( Float, Float )
bounceOffWallsComponent ( pos, vel ) =
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
