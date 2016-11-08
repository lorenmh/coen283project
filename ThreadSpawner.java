
public class ThreadSpawner extends Thread{

	private int threadID;

	public ThreadSpawner(int id) {
		threadID = id;
	}

	//when start() is called on each thread, will print Hello message.
	public void run() {
		System.out.println("Hello from thread " + threadID);
	}

	public static void main(String[] args) throws InterruptedException {
		//create array of the ThreadSpawner class
		ThreadSpawner[] threads = new ThreadSpawner[4];
		//for each element, create the thread, start it, and join it. 
		for (int i = 0; i < 4; ++i) {
			threads[i] = new ThreadSpawner(i);
			threads[i].start();
			threads[i].join();
		}
	}
}
