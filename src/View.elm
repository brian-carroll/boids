module View exposing (root)

-- External modules

import Html exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (..)


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


singleBoid : Boid -> Html msg
singleBoid b =
    let
        transformString =
            ("translate("
                ++ (toString b.x)
                ++ ","
                ++ (toString b.y)
                ++ ") rotate("
                ++ toString (-90.0 + (180.0 / pi) * atan2 b.vy b.vx)
                ++ ")"
            )
    in
        g [ transform transformString ]
            [ polygon [ points "7 -7, 0 10, -7 -7" ] []
            ]
