#include <stdio.h>
#include <stdlib.h>

// function to calculate the largest prime factor that takes the number n as an argument
// returns the largest prime factor of the number n
long long largest_prime(long long n);

int main()
{
    // initializing the input to be taken from user
    // input here is n
    long long n;

    // asking for input from the user
    scanf("%lld", &n);

    // ans stores the value returned by the function 'largest_prime'
    // passing n as argument to the function call
    long long ans = largest_prime(n);

    // printing the largest prime factor of the number n which is stored in ans
    printf("%lld\n", ans);

    return 0;
}