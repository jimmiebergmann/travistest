BIN_DIR	:= 		../../bin
LIB_DIR	:= 		../../lib
OBJ_DIR	:= 		../../obj/test/server
SERVER_CPP_DIR := 	../../source/server
TEST_CPP_DIR := 	../../test/server

CCFLAGS := -fprofile-arcs -ftest-coverage
CCPATHS	:= ../../include/server
DEP_INC := $(addprefix -I, $(CCPATHS))



SERVER_CPP = $(shell find $(SERVER_CPP_DIR) -type f -name "*.cpp" )
SERVER_TEST_CPP = $(shell find $(TEST_CPP_DIR) -type f -name "*.cpp" )
SERVER_OBJ = $(addprefix $(OBJ_DIR)/, $(patsubst %.cpp, %.o, $(SERVER_CPP)))
TEST_SERVER_OBJ = $(addprefix $(OBJ_DIR)/, $(patsubst %.cpp, %.o, $(SERVER_TEST_CPP)))
ALL_OBJ = $(SERVER_OBJ) $(TEST_SERVER_OBJ)
CLEAN_OBJ = $(addprefix $(OBJ_DIR)/, $(notdir $(ALL_OBJ)))

all: $(BIN_DIR)/server_tests

$(BIN_DIR)/server_tests: $(ALL_OBJ)
	mkdir -p $(BIN_DIR)
	$(CXX) -o $@ $(CLEAN_OBJ) -lgcov --coverage

$(OBJ_DIR)/%.o: %.cpp	
	mkdir -p $(OBJ_DIR)
	$(CXX) -c $(CCFLAGS) $(DEP_INC) $< -o $(OBJ_DIR)/$(notdir $@)

