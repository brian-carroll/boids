module Types exposing (..)

import Math.Vector2 exposing (Vec2)


type alias Boid =
    { position : Vec2
    , velocity : Vec2
    }


type alias Model =
    List Boid


type Msg
    = Tick
    | Init (List Boid)



-- , avgHeading : Float
-- , avgPosition : Float
