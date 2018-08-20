LINKS = ag ctags git gnupg input nvim psql ruby ssh tmux zsh

OS ?= $(shell uname -s | tr A-Z a-z)

all: preinstall link postinstall

dry-run:
	stow --no-folding -n -v -t $(HOME) $(LINKS)

link:
	stow --no-folding --adopt -v -t $(HOME) $(LINKS)

preinstall:
	./preinstall
	[ -f ./preinstall.$(OS) ] && ./preinstall.$(OS)

postinstall:
	./postinstall
	[ -f ./postinstall.$(OS) ] && ./postinstall.$(OS)

.PHONY: dry-run link preinstall postinstall
