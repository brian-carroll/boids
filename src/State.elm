module State exposing (..)

-- module State exposing (init, update, subscriptions)

import Time exposing (second)
import Random exposing (generate, float, list, pair)
import Mouse
import Math.Vector2 as V2 exposing (Vec2)
import Types exposing (..)


cfg =
    { tick = second / 60.0
    , maxWidth = 500.0
    , numBoids = 200
    , alignFactor = 0.005
    , minDist = 20
    , collisionFactor = 0.00005
    , centringFactor = 0.00001
    , mouseFactor = 0.0001
    }


v0 : Vec2
v0 =
    V2.fromTuple ( 0.0, 0.0 )


invNumBoids : Float
invNumBoids =
    1 / (toFloat cfg.numBoids)


vectorGenerator : Float -> Float -> Random.Generator Vec2
vectorGenerator lower upper =
    Random.pair (Random.float lower upper) (Random.float lower upper)
        |> Random.map V2.fromTuple


boidGenerator : Random.Generator Boid
boidGenerator =
    Random.map2
        (\vector1 vector2 -> { position = vector1, velocity = vector2 })
        (vectorGenerator (-cfg.maxWidth) cfg.maxWidth)
        (vectorGenerator -0.5 0.5)


init : ( Model, Cmd Msg )
init =
    ( { boids = []
      , mouse = v0
      }
    , generate Init <|
        list cfg.numBoids <|
            boidGenerator
    )


{-| Useful in the REPL
-}
testModel : Model
testModel =
    { boids =
        [ { position = V2.fromTuple ( 300, 400 ), velocity = V2.fromTuple ( 0.03, 0.04 ) }
        , { position = V2.fromTuple ( 80, 60 ), velocity = V2.fromTuple ( 0.08, 0.06 ) }
        ]
    , mouse = v0
    }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Mouse.moves MouseMove
        , Time.every cfg.tick (always Tick)
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Init boidList ->
            ( { model
                | boids = boidList
              }
            , Cmd.none
            )

        Tick ->
            ( { model
                | boids = updateBoids model
              }
            , Cmd.none
            )

        MouseMove mousePos ->
            ( { model
                | mouse =
                    V2.fromTuple
                        ( -cfg.maxWidth + toFloat mousePos.x
                        , -cfg.maxWidth + toFloat mousePos.y
                        )
              }
            , Cmd.none
            )


updateBoids : Model -> List Boid
updateBoids model =
    model.boids
        |> List.map advanceTime
        |> List.map bounceOffWalls
        |> alignBoids
        |> avoidCollisionManyToMany
        |> flockCentring
        |> moveFlockTowardsPoint cfg.mouseFactor model.mouse


advanceTime : Boid -> Boid
advanceTime boid =
    { boid
        | position =
            V2.add boid.position <|
                V2.scale cfg.tick boid.velocity
    }


{-| Should be direction-only
-}
flockCentring : List Boid -> List Boid
flockCentring boids =
    let
        avgPosition =
            V2.scale invNumBoids <|
                List.foldl
                    (\b pos -> V2.add b.position pos)
                    v0
                    boids
    in
        moveFlockTowardsPoint cfg.centringFactor avgPosition boids


moveFlockTowardsPoint : Float -> Vec2 -> List Boid -> List Boid
moveFlockTowardsPoint factor point boids =
    List.map
        (\b ->
            { b
                | velocity =
                    V2.sub b.velocity <|
                        V2.scale factor <|
                            V2.sub b.position point
            }
        )
        boids


{-| Should be direction-only
-}
avoidCollisionManyToMany : List Boid -> List Boid
avoidCollisionManyToMany boids =
    List.indexedMap (avoidCollisionManyToOne boids) boids


avoidCollisionManyToOne : List Boid -> Int -> Boid -> Boid
avoidCollisionManyToOne everyboidy myIndex me =
    let
        ( dv, _ ) =
            List.foldl
                (\boid ( deltaV, index ) ->
                    if index == myIndex then
                        ( deltaV, index + 1 )
                    else
                        ( V2.add deltaV (avoidCollisionOneToOne me.position boid.position)
                        , index + 1
                        )
                )
                ( v0, 0 )
                everyboidy
    in
        { me
            | velocity = V2.add me.velocity dv
        }


avoidCollisionOneToOne : Vec2 -> Vec2 -> Vec2
avoidCollisionOneToOne myPos otherPos =
    let
        diff =
            V2.sub myPos otherPos
    in
        if abs (V2.getX diff) < cfg.minDist && abs (V2.getY diff) < cfg.minDist then
            V2.scale cfg.collisionFactor <| V2.sub myPos otherPos
        else
            v0


{-| Direction and speed
-}
alignBoids : List Boid -> List Boid
alignBoids boids =
    let
        avgVelocity =
            V2.scale invNumBoids <|
                List.foldl
                    (\b v -> V2.add b.velocity v)
                    v0
                    boids
    in
        List.map (alignBoid avgVelocity) boids


alignBoid : Vec2 -> Boid -> Boid
alignBoid alignDirection boid =
    { boid
        | velocity =
            V2.add boid.velocity <|
                V2.scale cfg.alignFactor <|
                    (V2.sub alignDirection boid.velocity)
    }


{-| Should be direction-only
-}
bounceOffWalls : Boid -> Boid
bounceOffWalls boid =
    let
        ( x, y ) =
            V2.toTuple boid.position

        ( vx, vy ) =
            V2.toTuple boid.velocity

        ( x_new, vx_new ) =
            bounceOffWallsComponent ( x, vx )

        ( y_new, vy_new ) =
            bounceOffWallsComponent ( y, vy )
    in
        { boid
            | position = V2.fromTuple ( x_new, y_new )
            , velocity = V2.fromTuple ( vx_new, vy_new )
        }


bounceOffWallsComponent : ( Float, Float ) -> ( Float, Float )
bounceOffWallsComponent ( pos, vel ) =
    if pos < -cfg.maxWidth then
        ( -cfg.maxWidth, -vel )
    else if pos > cfg.maxWidth then
        ( cfg.maxWidth, -vel )
    else
        ( pos, vel )
