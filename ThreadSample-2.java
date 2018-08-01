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
  int n = 0;
  ThreadA (int x) {
    n = n + x;
  }
  public void run() {
    System.out.println(getName()); System.out.println(" : n= " + n);
  }
}

/*
問8.2
java ThreadSample
Thread-0
Thread-1
Thread-2
 : n= 300
 : n= 200
 : n= 100

java ThreadSample
Thread-0
Thread-2
Thread-1
 : n= 300
 : n= 100
 : n= 200
 
java ThreadSample
Thread-0
Thread-1
Thread-2
 : n= 200
 : n= 300
 : n= 100
*/
