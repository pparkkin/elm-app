SRC=src/elm/Main.elm
OUT=static/index.html

$(OUT):	$(SRC)
	elm-make $(SRC) --output=$(OUT)
