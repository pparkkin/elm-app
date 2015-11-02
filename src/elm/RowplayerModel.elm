module RowplayerModel where

type Action = Noop
            | Eval
            | Edit String

initialState = ""

