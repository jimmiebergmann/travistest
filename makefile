BIN_DIR := bin
OBJ_DIR := obj

SERVER_SRC_DIR := source/server
SERVER_INC_DIR := include/server
SERVER_OBJ_DIR := $(OBJ_DIR)/server
SERVER_SRC_FILES := $(wildcard $(SERVER_SRC_DIR)/*.cpp)
SERVER_OBJ_FILES := $(patsubst $(SERVER_SRC_DIR)/%.cpp,$(SERVER_OBJ_DIR)/%.o,$(SERVER_SRC_FILES))

TEST_SRC_DIR := test
TEST_OBJ_DIR := $(OBJ_DIR)/test
TEST_SRC_FILES := $(wildcard $(TEST_SRC_DIR)/*.cpp)
TEST_OBJ_FILES := $(patsubst $(TEST_SRC_DIR)/%.cpp,$(TEST_OBJ_DIR)/%.o,$(TEST_SRC_FILES))
TEST_SERVER_OBJS := $(filter-out $(SERVER_OBJ_DIR)/Main.o, $(SERVER_OBJ_FILES))


all: server test


server: $(SERVER_OBJ_FILES)
	mkdir -p $(BIN_DIR)
	$(CXX) -o $(BIN_DIR)/server $^

$(SERVER_OBJ_DIR)/%.o: $(SERVER_SRC_DIR)/%.cpp
	mkdir -p $(SERVER_OBJ_DIR)
	$(CXX) -c -I$(SERVER_INC_DIR) -ftest-coverage -o $@ $<

test: test_server

test_server: server test_server_build

test_server_build: $(TEST_OBJ_FILES)
	mkdir -p $(BIN_DIR)
	$(CXX) -o $(BIN_DIR)/server_tests $^ $(TEST_SERVER_OBJS)
    
$(TEST_OBJ_DIR)/%.o: $(TEST_SRC_DIR)/%.cpp
	mkdir -p $(TEST_OBJ_DIR)
	$(CXX) -c -I$(SERVER_INC_DIR) -ftest-coverage -o $@ $<
    
.PHONY: clean test

clean:
	$(RM) -rf $(OBJ_DIR)
	$(RM) -rf $(BIN_DIR)
