/* 問6.1 */
active proctype sample2 (int x) {
      int y = 1;
      do
        :: y == 1 -> printf("***\n"); y = 2;
        :: y == 2 -> printf("---\n"); y = 3;
        :: y == 3 -> printf("|||\n"); y = 1;
      od
}

/*
spin sample2.pml
***
---
|||
***
---
|||
***
---
|||
***
---
|||
***
---
|||
***
---
|||
*/
