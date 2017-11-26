BIN_DIR 		:= bin
OBJ_DIR 		:= bin
SERVER_HEADER_DIR	:= include/server

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

#-I$(SERVER_INC_DIR)
