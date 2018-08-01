public class Diners {
  static final int NUMPHILS = 5;
  static Thread[] phil = new Thread [NUMPHILS];
  static Fork[] fork = new Fork[NUMPHILS];

  public static void main(String arg[]) {
    for (int i = 0; i < NUMPHILS; ++i)
  fork[i] = new Fork(i);
     for (int i = 0; i < NUMPHILS; ++i) {
       phil[i] = new Philosopher2(i, fork[(i - 1 + NUMPHILS) % NUMPHILS], fork[i]);
       phil[i].start();
     }
  }
}

class Fork {
  public boolean taken = false;
  private int id;
  private int turn;
  Fork(int id) {
    this.id = id;
  }
  synchronized void put() { //排他制御
    taken = false;
    notify();
  }
  synchronized void get() throws java.lang.InterruptedException  { //排他制御
       while (taken) wait();
    taken = true;
  }
}
