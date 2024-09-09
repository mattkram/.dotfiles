install:
	mkdir -p ~/.config
	rm -rf ~/.config/nvim
	ln -s  $(shell pwd)/nvim ~/.config/nvim
