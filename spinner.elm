import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Signal
import Time exposing (every, second, fps, millisecond)
import Date exposing (year, hour, minute, second, fromTime, millisecond)

import Mouse
import Window

main2 : Int -> Int -> Float -> (Int, Int) -> Element
main2 x y t (w, h) =
  let (dx,dy) =
        (toFloat x - toFloat w / 2, toFloat h / 2 - toFloat y)
      date = fromTime t
      second = (toFloat (Date.millisecond date)) / (999.0 / 360.0)
  in
    collage w h
      [ move (0,0) (filled clearGrey (ngon 4 100))
      , move (dx, dy) (rotate (degrees second) (filled clearGrey (ngon 4 50)))
      , filled clearGrey (ngon 5 50)
      ]


clearGrey : Color
clearGrey =
  rgba 111 111 111 0.6



main : Signal Element
main =
  Signal.map4 main2 Mouse.x Mouse.y (Time.every Time.millisecond) Window.dimensions