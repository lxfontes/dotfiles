all: preinstall stow-all-the-things postinstall

stow-all-the-things:
	echo generic

preinstall:
	./preinstall

postinstall:
	./postinstall

.PHONY: preinstall postinstall stow-all-the-things
