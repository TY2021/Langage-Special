#include <stdio.h>
#include <pthread.h>

#define SYNCH 0
int buf[];
int in = 0;
int out = 0;
int count = 0;
int size;

void put(int msg) {
  if (count == size) {
    pthread_mutex_lock;
  }
  buf[in] = msg;
  ++count;
  in = (in + 1) % size;
}

int get() {
  if (count == 0) {
    pthread_mutex_lock;
  }
  int msg = buf[out];
  buf[out] = 0;
  --count;
  out = (out + 1) % size;
  return msg;
}


void Consumer() {
  int j;
  while (true) {
    j = get();
    printf("-----%d\n",&j);
  }
}

void Producer() {
  int i = 0;
  while (true) {
    put(i);
    ++i;
  }
}

void main() {

}
