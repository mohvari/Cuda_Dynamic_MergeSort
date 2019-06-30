//IN THE NAME OF ALLAH
#include <stdio.h>
#include <stdlib.h>



void merge(int *, int , int , int);

void merge_sort(int * arr, int right, int left){
    if (left<right){
        int middle = left + (right - left) / 2;
        merge_sort(arr, left, middle);
        merge_sort(arr, middle + 1, right);

        merge(arr, left, middle, right);
    }
}


void merge(int * arr, int left, int middle, int right){
    int i, j, k;
    int n1 = middle - left + 1;
    int n2 = right - middle;
    int left_arr[n1];
    int right_arr[n2];

    for (i = 0; i < n1; i++){
        left_arr[i] = arr[left + i];
    }
    for (j = 0; j < n2; j++){
        right_arr[j] = arr[j + middle + 1];
    }

    i = 0;
    j = 0;
    k = 0;

    while (i < n1 && j < n2) { 
        if (left_arr[i] <= right_arr[j]) { 
            arr[k] = left_arr[i]; 
            i++; 
        } 
        else{ 
            arr[k] = right_arr[j]; 
            j++; 
        } 
        k++; 
    } 

    while (i < n1) { 
        arr[k] = left_arr[i]; 
        i++; 
        k++; 
    } 
    while (j < n2) { 
        arr[k] = right_arr[j]; 
        j++; 
        k++; 
    }
}


void print_array(int * A, int size) { 
    int i; 
    for (i=0; i < size; i++) 
        printf("%d ", A[i]); 
    printf("\n"); 
} 

int main() 
{ 
    int size = 0;
    scanf("%d", & size);
    int i = 0;
    int * arr = (int *) malloc(sizeof(int) * size);

    for (i = 0; i < size; i++){
        scanf("%d", &arr[i]);
    } 
    printf("Given array is: \n"); 
    print_array(arr, size); 
  
    merge_sort(arr, 0, size - 1); 
  
    printf("\nSorted array is: \n"); 
    print_array(arr, size); 
    return 0; 
} 