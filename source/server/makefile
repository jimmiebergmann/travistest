LIB_DIR	:= ../../lib
OBJ_DIR := ../../obj/server
CPP_DIR := ../../source/server

CCFLAGS := 
CCPATHS	:= ../../include/server
DEP_INC := $(addprefix -I, $(CCPATHS))


all: $(LIB_DIR)/libserver.a

# Library target
SERVER_CPP = $(shell find $(CPP_DIR) -type f -name "*.cpp" )
SERVER_OBJ = $(addprefix $(OBJ_DIR)/, $(patsubst %.cpp, %.o, $(SERVER_CPP)))


$(LIB_DIR)/%.a: $(SERVER_OBJ)
	mkdir -p $(LIB_DIR)
	ar rcs $@ $^

$(OBJ_DIR)/%.o: %.cpp	
	mkdir -p $(dir $@)
	$(CXX) -c $(CCFLAGS) $(DEP_INC) $< -o $@
	@echo Compiling: $<

.PRECIOUS: %.o



