#include <stdio.h>
#include <stdlib.h>

/**
 * Sorts an array of integers using the Selection Sort algorithm.
 * This algorithm sorts the array in ascending order by repeatedly
 * selecting the smallest element from the unsorted part of the array
 * and swapping it with the first element of the unsorted part.
 * This process is repeated for the remaining unsorted portion until
 * the entire list is sorted.
 *
 * @param arr Pointer to the first element of the array to be sorted
 * @param size The size of the array
 */
void selectionSort(int* arr, int size) {
    int i, j, minValueIndex, temp;

    // Loop through the array, except for the last element
    for (i = 0; i < size - 1; i++) {
        // Assume the first element of the unsorted part is the minimum
        minValueIndex = i;

        // Iterate through the rest of the unsorted part to find the actual minimum
        for (j = i + 1; j < size; j++) {
            // If an element is smaller than the current minimum, update the minimum index
            if (arr[j] < arr[minValueIndex]) {
                minValueIndex = j;
            }
        }

        // If the minimum is not the initial element, swap the elements
        if (minValueIndex != i) {
            temp = arr[i];
            arr[i] = arr[minValueIndex];
            arr[minValueIndex] = temp;
        }
    }
}

/**
 * Sorts an array of integers using the Insertion Sort algorithm.
 * This algorithm sorts the array in ascending order by repeatedly
 * taking an unsorted element and inserting it in the correct position
 * in the sorted portion of the array.
 *
 * @param arr Pointer to the first element of the array to be sorted
 * @param size The size of the array
 */
void insertionSort(int* arr, int size) {
    int i, j, key;

    // Start from the second element (index 1)
    for (i = 1; i < size; i++) {
        // Set the key to the current element
        key = arr[i];

        // Iterate through the sorted portion of the array, starting from the element before
        for (j = i - 1; j >= 0 && arr[j] > key; j--) {
            // Shift the elements to the right to make room for the key
            arr[j + 1] = arr[j];
        }

        // Insert the key in the correct position
        arr[j + 1] = key;
    }
}

/************************************************************
 * Helper function to print an array                       *
 ************************************************************/

/**
 * Prints the elements of an array of integers.
 *
 * @param arr Pointer to the first element of the array
 * @param size The size of the array
 */
void printArray(int* arr, int size) {
    int i;
    for (i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

/************************************************************
 * Main function                                            *
 ************************************************************/

/**
 * Main function to test the Selection Sort and Insertion Sort
 * functions using an example array.
 *
 * @return 0 on successful execution
 */
int main() {
    int arr[] = {12, 11, 13, 5, 6};
    int size = sizeof(arr) / sizeof(arr[0]);

    printf("Original array: ");
    printArray(arr, size);

    insertionSort(arr, size);
    printf("Sorted array using Insertion Sort: ");
    printArray(arr, size);

    int arr2[] = {12, 11, 13, 5, 6};
    int size2 = sizeof(arr2) / sizeof(arr2[0]);

    selectionSort(arr2, size2);
    printf("Sorted array using Selection Sort: ");
    print