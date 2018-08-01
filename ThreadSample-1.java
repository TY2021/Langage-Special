class ThreadSample {
  public static void main(String[] args) {
    ThreadA t1 = new ThreadA(100);
    ThreadA t2 = new ThreadA(200);
    ThreadA t3 = new ThreadA(300);
    t1.start();
    t2.start();
    t3.start();
  }
}

class ThreadA extends Thread {
  static int n = 0;
  ThreadA (int x) {
    n = n + x;
  }
  public void run() {
    System.out.println(getName()+" : n= " + n);
  }
}

/*
問8.1
java ThreadSample
Thread-1 : n= 600
Thread-0 : n= 600
Thread-2 : n= 600

java ThreadSample
Thread-0 : n= 600
Thread-2 : n= 600
Thread-1 : n= 600

java ThreadSample
Thread-0 : n= 600
Thread-2 : n= 600
Thread-1 : n= 600
*/
