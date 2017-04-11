module Types exposing (..)

import Math.Vector2 exposing (Vec2)
import Mouse


type alias Boid =
    { position : Vec2
    , velocity : Vec2
    }


type alias Model =
    { boids : List Boid
    , mouse : Vec2
    }


type Msg
    = Tick
    | MouseMove Mouse.Position
    | Init (List Boid)



-- , avgHeading : Float
-- , avgPosition : Float
