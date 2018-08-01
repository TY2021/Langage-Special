#define SYNCH 0


void put(int msg) {
  while (count == size) {
    wait();
  }
  buf[in] = msg;
  ++count;
  in = (in + 1) % size;

}

int get() {
  while (count == 0) {
    wait();
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
