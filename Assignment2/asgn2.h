#ifndef __asgn2__
#define __asgn2__
#include <stdio.h>
#include <math.h>

/* The two lines above ensure that this header is not included multiple times. */

/* Function Declarations */

/*
Description: Calculate and print the cubes of odd integers less than a given positive integer.
Arguments:
    n - Positive upper limit (exclusive) integer.
Returns: None.
*/
void cubeOfOdd(int n) {
    if (n <= 0) {
        printf("Input should be a positive integer greater than 0.\n");
        return;
    }
    printf("Cubes of odd integers less than %d are:\n", n);

    for (int i = 1; i < n; i += 2) {
        int cube = i * i * i;
        printf("%d^3 = %d\n", i, cube);
    }
}

/*
Description: A helper function used in "introToCs330" to check if an integer is prime or not.
Arguments:
    n2 - Integer to check for primality.
Returns: 1 if it's a prime number, 0 otherwise.
*/
int isPrime(int n2) {
    if (n2 <= 1) {
        return 0;
    }

    for (int i = 2; i < n2; i++) {
        if (n2 % i == 0) {
            return 0;
        }
    }
    return 1;
}

/*
Description: Use an integer to print different strings based on specified conditions.
Arguments:
    n2 - Integer determining the output of different texts.
Returns: None.
*/
void introToCS330(int n2) {
    if (n2 % 3 == 0 && n2 % 7 == 0) {
        printf("UAB CS 330\n");
    } else if (n2 % 7 == 0) {
        printf("UAB\n");
    } else if (n2 % 3 == 0) {
        printf("CS\n");
    } else if (isPrime(n2) && n2 != 3 && n2 != 7) {
        printf("Go Blazers\n");
    } else {
        int cube = pow(n2, 3);
        printf("%d\n", cube);
    }
}

/*
Description: Print numbers from 1 to n3, replacing powers of 2 with 'HELLO' while leaving others as numeric values.
Arguments:
    n3 - Upper limit integer for printing the numbers.
Returns: None.
*/
void printHELLO(int n3) {
    int i;
    for (i = 0; i <= n3; i++) {
        if ((i & (i - 1)) == 0 && i != 0) {
            printf("HELLO");
        } else {
            printf("%d", i);
        }
    }
    printf("\n");
}

/*
Description: Print the number of gallons needed to paint a room with given dimensions.
Arguments:
    length - Length of the room.
    width - Width of the room.
    height - Height of the room.
Returns: None.
*/
void paintGallons(float length, float width, float height) {
    float area_of_wall1 = length * width;
    float area_of_wall2 = width * height;
    float area_of_ceiling = length * width;
    float total_area = (2 * (area_of_wall1)) + (2 * (area_of_wall2) + area_of_ceiling);
    int gallons = (int)ceil(total_area / 400.0);
    printf("You need %d gallons of paint.\n", gallons);
}

/*
Description: Print PASS or FAIL based on the average exam score, average homework score, and attendance.
Arguments:
    avg_exams - Average exam score of the student.
    avg_hw - Average homework score of the student.
    attendance - Average attendance of the student.
Returns: None.
*/
void grader(float avg_exams, float avg_hw, int attendance) {
    if (attendance > 20 && avg_exams > 70 && avg_hw > 70 && (avg_exams > 85 || avg_hw > 85)) {
        printf("PASS\n");
    } else {
        printf("FAIL\n");
    }
}

/*
Description: Print dashes to separate different outputs for better readability.
Arguments: None.
Returns: None.
*/
void printSeparator() {
    printf("--------------------------------------------------\n");
}

#endif
