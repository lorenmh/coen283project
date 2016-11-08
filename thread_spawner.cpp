#include <thread>
#include <iostream>

void hello(int tid) {
	std::cout << "Hello from thread " << tid << std::endl;
}

int main(int argc, char *args[]) {
	std::thread threads[4];

	for (int i = 0; i < 4; i++) {
		threads[i] = std::thread(hello, i);
		threads[i].join();
	}
}
