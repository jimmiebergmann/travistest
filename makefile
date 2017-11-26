BIN_DIR := bin
OBJ_DIR := obj
SERVER_SRC_DIR := source/server
SERVER_INC_DIR := source/server
SERVER_OBJ_DIR := $(OBJ_DIR)/server
SERVER_SRC_FILES := $(wildcard $(SERVER_SRC_DIR)/*.cpp)
SERVER_OBJ_FILES := $(patsubst $(SERVER_SRC_DIR)/%.cpp,$(SERVER_OBJ_DIR)/%.o,$(SERVER_SRC_FILES))


all: server

server: $(SERVER_OBJ_FILES)
	mkdir -p $(BIN_DIR)
	$(CXX) $(LDFLAGS) -o $(BIN_DIR)/server $^

$(SERVER_OBJ_DIR)/%.o: $(SERVER_SRC_DIR)/%.cpp
	mkdir -p $(SERVER_OBJ_DIR)
	$(CXX) -c -I$(SERVER_INC_DIR) -o $@ $<

.PHONY: clean

clean:
	$(RM) -rf $(OBJ_DIR)
	$(RM) -rf $(BIN_DIR)
