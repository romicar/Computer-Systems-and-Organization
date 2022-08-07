#include <stdio.h>
#include <stdlib.h>

// function to calculate the sum of squares of integers from 1 to n that takes the number n as an argument
// returns the sum of squares of integers from 1 to n
// returns -1 for invalid input that is if n<0
long long sum_square(long long n);

int main()
{
    // initializing the input to be taken from user
    // input here is n
    long long n;

    // asking for input from the user
    scanf("%lld", &n);

    // ans stores the value returned by the function 'sum_square'
    // passing n as argument to the function call
    long long ans = sum_square(n);

    // printing the square of the sum of integers from 1 to n which is stored in ans
    printf("%lld\n", ans);

    return 0;
}
