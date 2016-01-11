#include <stdio.h>
#define ARRAY_SIZE 10000000

static int array[ARRAY_SIZE];

void quickSort(int arr[], int left, int right) {
      int i = left, j = right;
      int tmp;
      int pivot = arr[(left + right) / 2];
 
      /* partition */
      while (i <= j) {
            while (arr[i] < pivot)
                  i++;
            while (arr[j] > pivot)
                  j--;
            if (i <= j) {
                  tmp = arr[i];
                  arr[i] = arr[j];
                  arr[j] = tmp;
                  i++;
                  j--;
            }
      };
 
      /* recursion */
      if (left < j)
            quickSort(arr, left, j);
      if (i < right)
            quickSort(arr, i, right);
}

main(){
  FILE *myFile;
  myFile = fopen("/home/m2iagl/clement/GreenComputing/random", "r");


  int i;

  for ( i = 0 ; i < ARRAY_SIZE ; i++ ){
    fscanf(myFile, "%d", &array[i]);
  }

  quickSort(array, 0, ARRAY_SIZE);
}


