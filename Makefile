SRC_DIR = src
BIN_DIR = bin

SRC_FILES = $(wildcard $(SRC_DIR)/*.c)

APPS = $(patsubst %.c,%,$(SRC_FILES))
APPS := $(subst $(SRC_DIR)/,,$(APPS))

all: $(APPS)

$(APPS) : % : $(SRC_DIR)/%.c
	mkdir -p $(BIN_DIR)
	$(CC) $< -o $(BIN_DIR)/$@
	# Run the program
	./$(BIN_DIR)/$@
    
clean:
	rm -rf $(BIN_DIR)

.PHONY: clean all
