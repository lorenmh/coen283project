public class NonConcurrent extends Thread{
	public NonConcurrent(int id) {
	}

	//when start() is called on each thread, will print Hello message.
	public void run() {
	}

	public static void main(String[] args) throws InterruptedException {
		for (int i = 0; i < 4; ++i) {
      System.out.println("Hello from iteration " + i);
		}
	}
}
