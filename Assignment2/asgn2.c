#include <stdio.h>
#include "asgn2.h"

void getInput(const char *prompt, int *value) {
    printf("Enter a positive integer for %s: ", prompt);
    scanf("%d", value);
}

void getFloatInput(const char *prompt, float *value) {
    printf("Enter %s: ", prompt);
    scanf("%f", value);
}

int main() {
    int n, n2, n3, attendance;
    float length, width, height, avg_exams, avg_hw;

    getInput("cubeOfOdd", &n);
    getInput("CS330", &n2);
    getInput("n", &n3);

    getFloatInput("length of the room", &length);
    getFloatInput("width of the room", &width);
    getFloatInput("height of the room", &height);

    getFloatInput("average exam score", &avg_exams);
    getFloatInput("average homework", &avg_hw);

    printf("Enter the attendance: ");
    scanf("%d", &attendance);

    cubeOfOdd(n);
    printSeparator();
    introToCS330(n2);
    printSeparator();
    printHELLO(n3);
    printSeparator();
    paintGallons(length, width, height);
    printSeparator();
    grader(avg_exams, avg_hw, attendance);

    return 0;
}
