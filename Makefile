APPS = ag ctags git gnupg input nvim psql ruby ssh tmux zsh alacritty

all: preinstall link postinstall

dry-run:
	stow -v -n -t $(HOME) $(APPS)

link:
	stow -v -t $(HOME) $(APPS)

preinstall:
	./preinstall

postinstall:
	./postinstall

.PHONY: preinstall postinstall link dry-run
