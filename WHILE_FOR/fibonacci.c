#include <stdio.h>

int fibonacci(int n) {
    int a = 0, b = 1, c, i;
    if (n == 0) {
        return a;
    }
    for (i = 2; i <= n; i++) {
        c = a + b;
        a = b;
        b = c;
    }
    return b;
}

int main() {
    int n;
    printf("digite o numero:\n");
    scanf("%d", &n);
    printf("%d corresponde ao número da sequência Fibonacci %d\n", n, fibonacci(n));
    return 0;
}
