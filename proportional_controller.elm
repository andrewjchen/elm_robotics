import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse
import Window
import Time
 
main : Signal Element
main =
  Signal.map3 scene Mouse.position anchor Window.dimensions
 
scene : (Int,Int) -> (Int,Int) -> (Int,Int) -> Element
scene (x,y) (z,a) (w,h) =
  let (dx,dy) =
        (toFloat x - toFloat w / 2, toFloat h / 2 - toFloat y)
      (dz,da) =
        (toFloat z - toFloat w / 2, toFloat h / 2 - toFloat a)
  in
      collage w h
        [ ngon 3 100
            |> filled blue
            |> rotate (atan2 -(da - dy) -(dz - dx))
            |> move (dz, da)
        , ngon 6 30
            |> filled orange
            |> move (dx, dy)
        ]
        
timemouseposition = 
  Signal.map2 (,) Mouse.position (Time.fps 20)
 
anchor : Signal (Int, Int)
anchor =
  Signal.foldp
    avera
    (0,0)
    timemouseposition
   
--avera : (Int, Int,) -> (Int, Int) -> (Int, Int)  
avera ((newx, newy), newt)  (oldx, oldy) =
  let (dx, dy) = (newx - oldx,  newy - oldy)
  in
    ( round (toFloat oldx + toFloat dx * 0.1 * newt / 1000.0)
    , round (toFloat oldy + toFloat dy * 0.1 * newt / 1000.0)
    )
