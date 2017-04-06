module Types exposing (..)


type alias Boid =
    { x : Float
    , y : Float
    , vx : Float
    , vy : Float
    }


type alias Model =
    List Boid


type Msg
    = Tick



-- , avgHeading : Float
-- , avgPosition : Float
