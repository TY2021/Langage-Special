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
            :: id % 2 != 0 -> fork[right] = BUSY; 
            :: else -> fork[left] = BUSY;
          fi
    }
    state = HUNGRY;
    atomic {
          if
            :: fork[left] != BUSY -> if
                                       :: id % 2 != 0 -> fork[left] = BUSY; state = EATING; printf("Philosopher%d is eating.\n",id); fork[right] = FREE; fork[left] = FREE; state = THINKING;
                                       :: else -> fork[right] = FREE;
                                     fi
          fi
          if
            :: fork[right] != BUSY -> if
                                        :: id % 2 == 0 -> fork[right] = BUSY; state = EATING; printf("Philosopher%d is eating.\n",id); fork[right] = FREE; fork[left] = FREE; state = THINKING;
                                        :: else -> fork[left] = FREE;
                                      fi
          fi
    }
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
