.PHONY: install 

install:
	@echo "Installing ENCRYPT..."
	cp encrypt.sh ~/.local/bin/encrypt
	@echo "ENCRYPT is installed!"

uninstall:
	@echo "Removing ENCRYPT..."
	rm ~/.local/bin/encrypt
	@echo "ENCRYPT has been removed :("