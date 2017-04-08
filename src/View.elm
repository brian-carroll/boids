module View exposing (root)

-- External modules

import Html exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (..)
import Math.Vector2 exposing (getX, getY, toTuple)


root : Model -> Html Msg
root model =
    Html.div []
        [ svg
            [ width "1000"
            , height "1000"
            , viewBox "-500 -500 1000 1000"
            , Svg.Attributes.style "background: lightgray"
            ]
            (List.map singleBoid model)
        ]


boidHeadingDegrees : Boid -> Float
boidHeadingDegrees b =
    -90.0 + (180.0 / pi) * atan2 (getY b.velocity) (getX b.velocity)


singleBoid : Boid -> Html msg
singleBoid b =
    let
        transformString =
            ("translate"
                ++ (toString <| toTuple b.position)
                ++ " rotate("
                ++ toString (boidHeadingDegrees b)
                ++ ")"
            )
    in
        g [ transform transformString ]
            [ polygon [ points "3 -3, 0 5, -3 -3" ] []
            ]
