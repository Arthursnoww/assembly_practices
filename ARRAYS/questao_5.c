#include <stdio.h>

int main() {
    // Definindo os arrays de inteiros
    int array1[20];
    int array2[20];

    // Preenchendo o primeiro array com alguns valores (pode ser alterado conforme necessário)
    printf("Insira 20 valores inteiros para o primeiro array:\n");
    for (int i = 0; i < 20; i++) {
        scanf("%d", &array1[i]);
    }

    // Transferindo o conteúdo do primeiro array para o segundo array
    for (int i = 0; i < 20; i++) {
        array2[i] = array1[i];
    }

    // Exibindo o conteúdo do segundo array
    printf("Conteúdo do segundo array:\n");
    for (int i = 0; i < 20; i++) {
        printf("%d ", array2[i]);
    }
    printf("\n");

    return 0;
}

