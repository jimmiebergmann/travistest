SERVER_HEADER_DIR := ../../include/server


all:
	mkdir -p ../../obj
	mkdir -p ../../bin
	$(CXX) -c -fprofile-arcs -ftest-coverage -I$(SERVER_HEADER_DIR) ../../source/server/Account.cpp -o ../../obj/Account.o
	$(CXX) -c -fprofile-arcs -ftest-coverage -I$(SERVER_HEADER_DIR) ../../source/server/None.cpp -o ../../obj/None.o
	$(CXX) -c -fprofile-arcs -ftest-coverage -I$(SERVER_HEADER_DIR) ../../test/server/ServerTests.cpp -o ../../obj/ServerTests.o
	$(CXX) -o ../../bin/server_tests ../../obj/Account.o ../../obj/None.o ../../obj/ServerTests.o -lgcov --coverage
