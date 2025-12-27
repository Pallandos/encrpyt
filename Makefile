.PHONY: install uninstall

BIN_DIR := ~/.local/bin
SCRIPT := encrypt.sh
TARGET := $(BIN_DIR)/encrypt

install:
	@echo "Installing ENCRYPT..."
	mkdir -p $(BIN_DIR)
	cp $(SCRIPT) $(TARGET)
	@echo "ENCRYPT is installed!"

uninstall:
	@echo "Removing ENCRYPT..."
	rm -f $(TARGET)
	@echo "ENCRYPT has been removed :("