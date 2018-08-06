/*デッドロックでもライブロックでもない*/
#define NumPhils 5;

mtype {FREE, BUSY};
mtype {EATING, THINKING, HUNGRY};
mtype fork[5] = FREE;

proctype philosopher(int id) {
  int n = NumPhils;
  int left = ((id - 1) + n) % n;
  int right = id;
  mtype state = THINKING;
  do
    :: atomic {
          if
            :: id % 2 == 0 && fork[right] != BUSY -> fork[right] = BUSY; fork[left] = BUSY;
            :: id % 2 != 0 && fork[left] != BUSY -> fork[left] = BUSY ; fork[right] = BUSY;
          fi
    }
    state = EATING;
    printf("Philosopher%d is eating.\n",id); progress:
    fork[left] = FREE;
    fork[right] = FREE;
    state = THINKING;
  od
}

init {
   short proc = 0;
   do
     :: proc < NumPhils ->
               run philosopher(proc); proc++
     :: proc >= NumPhils ->
               break
   od
}
