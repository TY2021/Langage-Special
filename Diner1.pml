#define NumPhils 5;

mtype {FREE, BUSY};
mtype {EATING, THINKING, HUNGRY};
mtype fork[5] = FREE;

proctype philosopher(int id) {
  int n = NumPhils
  int left = ((id - 1) + n) % n;
  int right = id;
  int fork_flag = 0;
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
            :: fork[left] == BUSY -> fork[right] = FREE;
            :: else -> fork[left] = BUSY; fork_flag = 1;
          fi
    }
    :: fork_flag == 1 -> progress: state = EATING; printf("Philosopher%d is eating.\n",id); fork[left] = FREE; fork[right] = FREE; state = THINKING; fork_flag = 0;
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
