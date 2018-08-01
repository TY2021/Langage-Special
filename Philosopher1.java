public class Philosopher1 extends Thread {
  public static final int THINKING = 0;
  public static final int EATING = 1;
  private Fork left;
  private Fork right;
  private int id;
  private int state;

  public Philosopher1(int id, Fork l, Fork r) {
    this.left = l;
    this.right = r;
    this.id = id;
    state = THINKING; //最初は思索
    printState(id, state);
  }
  public void run() {
    try {
      while (true) {
        right.get();  //右のフォークを手にしてから
        if (!left.taken) {
          left.get();              //左のフォークを手にする
          state = EATING;          //食事
          printState(id, state);
          left.put();              //左のフォークを戻す
          right.put();             //右のフォークを戻す
        } else {                   //手にできなかったら
          right.put();             //右のフォークを元に戻す
        }
        state = THINKING;          //思索
        printState(id, state);
      }
    } catch (java.lang.InterruptedException e) {}
    }
    void printState(int id, int s) {
      switch(s) {
        case 0 : System.out.println("Philsopher"+id+" is ?@? thinking.\n"); break;
        case 1 : System.out.println("Philsopher"+id+" is >@ eating.\n"); break;
        default : break;
      }
    }
  }
