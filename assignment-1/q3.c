#include <stdio.h>
#include <stdlib.h>

// function that checks whether a given number is prime or not
// returns the value of flag
// returns 1 if the given number is prime
// returns 0 if the given number is not prime
// returns 0 if the number is less than 2
extern int checkPrime(long long n);

int main()
{
    // initializing the input to be taken from user
    // input here is n
    long long n;

    // asking for input from the user
    scanf("%lld", &n);

    // ans stores the value returned by the function 'checkPrime'
    // passing n as argument to the function call
    int ans = checkPrime(n);

    // if ans is 1 it means that the number was prime
    if (ans == 1)
        // printing that the given number n is a prime number
        printf("TRUE\n");

    // if ans is not one,it means it is zero
    // hence the number is not a prime number
    else
        // printing that the given number n is not a prime number
        printf("FALSE\n");

    return 0;
}