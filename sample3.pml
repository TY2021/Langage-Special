/* 問6.4 */
active proctype star () {
    do
      :: true -> atomic{printf(" **1"); printf(" **2"); printf(" **3\n");}
    od
}
active proctype minus () {
    do
      :: true -> atomic{printf(" --1"); printf(" --2"); printf(" --3\n");}
    od
}
active proctype vertical () {
    do
      :: true -> atomic{printf(" ||1"); printf(" ||2"); printf(" ||3\n");}
    od
}

/*
spin -T sample3.pml
**1 **2 **3
--1 --2 --3
||1 ||2 ||3
||1 ||2 ||3
**1 **2 **3
--1 --2 --3
||1 ||2 ||3
||1 ||2 ||3
--1 --2 --3
**1 **2 **3
**1 **2 **3
--1 --2 --3
**1 **2 **3
*/
