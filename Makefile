all: concurrent nonconcurrent

concurrent:
	g++ -std=c++11 -lpthread -o thread_spawner.bin thread_spawner.cpp

nonconcurrent:
	g++ -std=c++11 -o non_concurrent.bin non_concurrent.cpp
