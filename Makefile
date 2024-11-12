SHELL 			:= /bin/bash

BIN_NAME 		= csum
SRC_DIR 		= src
SRC_FILES 		= $(SRC_DIR)/entry_point.cr \
            	  $(SRC_DIR)/commands/checksum.cr \
            	  $(SRC_DIR)/commands/help.cr \
            	  $(SRC_DIR)/commands/version.cr \
            	  $(SRC_DIR)/utils/check-file.cr \
            	  $(SRC_DIR)/utils/check-sum-algorithms.cr \
            	  $(SRC_DIR)/utils/colors.cr \
            	  $(SRC_DIR)/utils/display.cr
BUILD_DIR		= build
INSTALL_DIR 	= /usr/local/bin
CRYSTAL 		= crystal
CRYSTAL_FLAGS	= build --release


build: $(BUILD_DIR)/$(BIN_NAME)
$(BUILD_DIR)/$(BIN_NAME): $(SRC_FILES)
	@mkdir -p $(BUILD_DIR)
	$(CRYSTAL) $(CRYSTAL_FLAGS) -o $(BUILD_DIR)/$(BIN_NAME) $(SRC_FILES)
	@echo "Build complete: $(BIN_NAME) created in $(BUILD_DIR)"

install: $(BUILD_DIR)/$(BIN_NAME)
	@echo "Installing $(BIN_NAME) to $(INSTALL_DIR)..."
	sudo cp $(BUILD_DIR)/$(BIN_NAME) $(INSTALL_DIR)
	sudo chmod +x $(INSTALL_DIR)/$(BIN_NAME)
	@echo "$(BIN_NAME) successfully installed!"

clean:
	rm -rf $(BUILD_DIR)
	@echo "Cleaned up build files."

dependency:
	@echo "Checking dependencies..."
	@$(CRYSTAL) -v > /dev/null 2>&1
	@if [ $$? -ne 0 ]; then \
		echo "Error: Crystal is not installed."; \
		exit 1; \
	else \
		echo "Crystal is installed."; \
	fi

help:
	@echo "Available commands:"
	@echo "		make - Compile the project"
	@echo "		make install - Install the binary in the system directory (/usr/local/bin)"
	@echo "		make clean - Clean up the build files"
	@echo "		make run - Run the binary"
	@echo "		make dependency - Check that you have all the necessary dependencies."
	@echo "		make help - Display this help message"


.PHONY: build install clean dependency help