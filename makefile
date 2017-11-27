BIN_DIR 		:= bin
LIB_DIR 		:= lib
OBJ_DIR 		:= obj
SERVER_HEADER_DIR	:= include/server

all: server

server: server_lib server_bin

server_lib:
	@cd source/server; make

server_bin: obj/server.o
	mkdir -p $(BIN_DIR)
	@echo SERVER_BIN
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:./lib/"
	$(CXX) -o $(BIN_DIR)/server $^ -lgcov --coverage -L./lib -lserver

obj/server.o:
	mkdir -p $(OBJ_DIR)
	@echo PARAM 1: $@
	@echo PARAM 2: $<
	$(CXX) -c -fprofile-arcs -ftest-coverage -I$(SERVER_HEADER_DIR) source/Server.cpp -o obj/server.o

test: test_server

test_server:
	@cd test/server; make

.PHONY: clean test

clean:
	$(RM) -rf $(OBJ_DIR)

clean_all: clean
	$(RM) -rf $(LIB_DIR)
	$(RM) -rf $(BIN_DIR)
