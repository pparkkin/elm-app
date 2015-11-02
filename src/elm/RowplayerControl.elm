module RowplayerControl where

import RowplayerModel exposing ( .. )
import RowplayerView exposing ( .. )

sampledBuf : Signal Action
sampledBuf = Signal.sampleOn evalSignal bufSignal

state : Signal String
state = Signal.foldp (\a s -> case a of Edit str -> str) initialState sampledBuf

