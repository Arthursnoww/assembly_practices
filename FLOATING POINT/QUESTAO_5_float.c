#include <stdio.h>
int main() {
  float x, y;

  printf("\n%s", "Enter a float for x: ");
  scanf("%f", &x);

  __asm {
	fld x
	fstp y
  }
  printf("\n%s%lf\n\n", "The float in y is: ", y);
  return 0;
}
