module State exposing (..)

-- module State exposing (init, update, subscriptions)

import Types exposing (..)
import Time exposing (second)
import Random exposing (generate, float, list, pair)
import Math.Vector2 exposing (Vec2)


config =
    { tick = second / 60.0
    , maxWidth = 500.0
    , numBoids = 10
    , alignFactor = 0.01
    }


invNumBoids : Float
invNumBoids =
    1 / (toFloat config.numBoids)


vectorGenerator : Float -> Float -> Random.Generator Vec2
vectorGenerator lower upper =
    Random.pair (Random.float lower upper) (Random.float lower upper)
        |> Random.map Math.Vector2.fromTuple


boidGenerator : Random.Generator Boid
boidGenerator =
    Random.map2
        (\vector1 vector2 -> { position = vector1, velocity = vector2 })
        (vectorGenerator -0.5 0.5)
        (vectorGenerator -0.5 0.5)


init : ( Model, Cmd Msg )
init =
    ( []
    , generate Init <|
        list config.numBoids <|
            boidGenerator
    )


testModel : Model
testModel =
    [ { position = Math.Vector2.fromTuple ( 300, 400 ), velocity = Math.Vector2.fromTuple ( 0.03, 0.04 ) }
    , { position = Math.Vector2.fromTuple ( 80, 60 ), velocity = Math.Vector2.fromTuple ( 0.08, 0.06 ) }
    ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every config.tick (always Tick)
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Init boidList ->
            ( boidList
            , Cmd.none
            )

        Tick ->
            ( updateBoids model
            , Cmd.none
            )


updateBoids : List Boid -> List Boid
updateBoids boids =
    boids
        |> List.map bounceOffWalls
        |> alignBoids


alignBoids : List Boid -> List Boid
alignBoids boids =
    let
        avgVelocity =
            Math.Vector2.scale invNumBoids <| List.foldl (\b v -> Math.Vector2.add b.velocity v) (Math.Vector2.fromTuple ( 0.0, 0.0 )) boids
    in
        List.map (alignBoid avgVelocity) boids


alignBoid : Vec2 -> Boid -> Boid
alignBoid alignDirection boid =
    { boid
        | velocity =
            Math.Vector2.add boid.velocity <|
                Math.Vector2.scale config.alignFactor <|
                    (Math.Vector2.sub alignDirection boid.velocity)
    }


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
            pos + (config.tick * vel)
    in
        if pos_step < -config.maxWidth then
            ( -config.maxWidth, -vel )
        else if pos_step > config.maxWidth then
            ( config.maxWidth, -vel )
        else
            ( pos_step, vel )
