BIN_DIR := bin
OBJ_DIR := obj

SERVER_SRC_DIR := source/server
SERVER_INC_DIR := include/server
SERVER_OBJ_DIR := $(OBJ_DIR)/server
SERVER_SRC_FILES := $(wildcard $(SERVER_SRC_DIR)/*.cpp)
SERVER_OBJ_FILES := $(patsubst $(SERVER_SRC_DIR)/%.cpp,$(SERVER_OBJ_DIR)/%.o,$(SERVER_SRC_FILES))

TEST_SRC_DIR := test
TEST_OBJ_DIR := $(OBJ_DIR)/test

all: server test

server: $(SERVER_OBJ_FILES)
	mkdir -p $(BIN_DIR)
	$(CXX) -o $(BIN_DIR)/server $^

$(SERVER_OBJ_DIR)/%.o: $(SERVER_SRC_DIR)/%.cpp
	mkdir -p $(SERVER_OBJ_DIR)
	$(CXX) -c -I$(SERVER_INC_DIR) -o $@ $<

test: $(TEST_OBJ_FILES)
	mkdir -p $(BIN_DIR)
	$(CXX) -o $(BIN_DIR)/server_test $^
    
$(TEST_OBJ_DIR)/%.o: $(TEST_SRC_DIR)/%.cpp
	mkdir -p $(TEST_OBJ_DIR)
	$(CXX) -c -ftest-coverage -o $@ $<
    
.PHONY: clean

clean:
	$(RM) -rf $(OBJ_DIR)
	$(RM) -rf $(BIN_DIR)
