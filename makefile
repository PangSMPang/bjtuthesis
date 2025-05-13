.DEFAULT_GOALS := bjtuthesis

.PHONY: bjtuthesis

all: bjtuthesis clean view

bjtuthesis:
	latexmk bjtuthesis.tex

clean:
	latexmk -C

view:
	xdg-open bjtuthesis.pdf  # Linux