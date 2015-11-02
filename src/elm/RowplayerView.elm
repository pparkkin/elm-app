module RowplayerView where

import RowplayerModel exposing ( .. )

import String
import Html
import Html.Events


makeButton : String -> Signal.Mailbox Action -> Action -> Html.Html
makeButton s m a = Html.button [ Html.Events.onClick m.address a ]
                               [ Html.text s ]

makeButtonAndSignal : String -> Action -> (Html.Html, Signal Action)
makeButtonAndSignal s a =
    let buttonMbox = Signal.mailbox Noop
        button = makeButton s buttonMbox a
    in
        (button, buttonMbox.signal)

makeInput : String -> Signal.Mailbox Action -> (String -> Action) -> Html.Html
makeInput s m af = Html.textarea [ Html.Events.on "input" Html.Events.targetValue (\c -> Signal.message m.address (af c)) ]
                                 [ Html.text s ]

makeInputAndSignal : String -> (String -> Action) -> (Html.Html, Signal Action)
makeInputAndSignal s af =
    let inputMbox = Signal.mailbox Noop
        input = makeInput s inputMbox af
    in
        (input, inputMbox.signal)

(evalButton, evalSignal) = makeButtonAndSignal "Eval" Eval

(bufInput, bufSignal) = makeInputAndSignal "Type here." (\s -> Edit s)

evalOutput : String -> Html.Html
evalOutput out = Html.div [] [ Html.text out ]

view : String -> Html.Html
view buf =
    Html.div [] [
        bufInput
      , evalButton
      , evalOutput buf
      ]

