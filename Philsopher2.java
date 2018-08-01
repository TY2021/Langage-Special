public class Philosopher2 extends Thread {
  public static final int THINKING = 0;
  public static final int EATING = 1;
  private Fork left;
  private Fork right;
  private int id;
  private int state;

  public Philosopher2(int id, Fork l, Fork r) {
    this.left = l;
    this.right = r;
    this.id = id;
    state = THINKING; //最初は思索
    printState(id, state);
  }
  public void run() {
    try {
      while (true) {
        if (id % 2 != 0) {
          right.get();
        } else {
          left.get();
        }
        if (id % 2 != 0) {
          left.get();
        } else {
          right.get();
        }
        state = EATING;
        printState(id, state);
        left.put();
        right.put();
        state = THINKING;
        printState(id, state);
      }
    } catch (java.lang.InterruptedException e) {}
    }
    void printState(int id, int s) {
      switch(s) {
        case 0 : System.out.println("Philsopher"+id+" is ?@? thinking.\n"); break;
        case 1 : System.out.println("Philsopher"+id+" is ?@? eating.\n"); break;
        default : break;
      }
    }
  }
