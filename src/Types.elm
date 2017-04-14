module Types exposing (..)

import Math.Vector2 exposing (Vec2)
import Mouse
import Time exposing (Time)


type alias Boid =
    { position : Vec2
    , velocity : Vec2
    }


type alias Model =
    { boids : List Boid
    , mouse : Vec2
    }


type Msg
    = Tick Time
    | MouseMove Mouse.Position
    | Init (List Boid)



-- , avgHeading : Float
-- , avgPosition : Float
