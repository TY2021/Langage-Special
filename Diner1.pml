#define NumPhils 5;

mtype {FREE, BUSY};
mtype {EATING, THINKING, HUNGRY};
mtype fork[5] = FREE;

proctype philosopher(int id) {
  int n = NumPhils
  int left = ((id - 1) + n) % n;
  int right = id;
  mtype state = THINKING;
  do
    :: atomic {
          if
            :: fork[right] == FREE -> fork[right] = BUSY;
          fi
    }
    state = HUNGRY;
    atomic {
          if
            :: fork[left] != BUSY -> fork[left] = BUSY;
            :: else -> fork[right] = FREE;
          fi
    }
    state = EATING;
    printf("Philosopher%d is eating.\n",id);
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
