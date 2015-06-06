import Signal
import Time exposing (every, second, fps)
import Date exposing (year, hour, minute, second, fromTime)
import Graphics.Element exposing (show)

main =
  Signal.map currentTime (Time.every Time.second)

currentTime t =
  let date' = fromTime t
      hour' = toString (Date.hour date')
      minute' = toString (Date.minute date')
      second' = toString (Date.second date')
      year' = toString (year date')
      now = "The current time is: " ++ hour' ++ ":" ++ minute' ++ ":" ++ second'
  in 
      show t
