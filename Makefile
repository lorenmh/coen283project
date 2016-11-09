all: concurrent nonconcurrent

concurrent:
	g++ -std=c++11 -stdlib=libc++ -o thread_spawner.bin thread_spawner.cpp

nonconcurrent:
	g++ -std=c++11 -stdlib=libc++ -o non_concurrent.bin non_concurrent.cpp
