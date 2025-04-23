//Anderson Pham - Section 3
//884815002

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <string>
#include <iostream>

extern "C" long manager();

int main()
{
  long name;
  printf("Welcome to getqwords test program developed by Anderson Pham\n");
  name = manager();
  printf("The driver recieved %ld\n", name);
  printf("A zero will be sent to the OS. Bye.");
  return 0;
}