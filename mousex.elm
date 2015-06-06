
-- Show an image of Yogi that resizes while maintaining its aspect ratio.

import Graphics.Element exposing (..)
import Mouse


main : Signal Element
main =
  Signal.map2 resizeableYogi Mouse.x Mouse.y


resizeableYogi : Int -> Int -> Element
resizeableYogi n m =
  image n m "/yogi.jpg"


edgeLength : Signal Int
edgeLength =
  Mouse.x
  --Signal.map (\(x,y) ->  x) (Signal.map2 (,) Mouse.x Mouse.y)
  
sideLength : Signal Int
sideLength =
  Mouse.y