#include <stdio.h>
int main() {
  long double x, y;

  printf("\n%s", "Enter a long double for x: ");
  scanf("%lf", &x);

  __asm {
	fld x
	fstp y
  }
  printf("\n%s%lf\n\n", "The long double in y is: ", y);
  return 0;
}