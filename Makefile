LINKS = ag ctags git gnupg input nvim psql ruby ssh tmux zsh alacritty

all: preinstall link postinstall

dry-run:
	stow --no-folding --adopt -n -v -t $(HOME) $(LINKS)

link:
	stow --no-folding --adopt -v -t $(HOME) $(LINKS)

preinstall:
	./preinstall

postinstall:
	./postinstall

.PHONY: dry-run link preinstall postinstall
