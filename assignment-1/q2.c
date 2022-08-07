#include <stdio.h>

// function to calculate the greatest common divisor that takes a and b as two arguments
// returns the gcd of a/b
/*
takes absolute value of a and b
*/
long long gcd(long long a, long long b);

int main()
{
    // initializing the inputs to be taken from user
    // inputs are m and n
    long long m, n;

    // asking for inputs from the user
    scanf("%lld %lld", &m, &n);

    // ans stores the value of GCD returned by the function 'gcd'
    // passing m and n as arguments to the function call
    long long ans = gcd(m, n);

    // printing the gcd of the two numbers m and n which is stored in ans
    printf("%lld\n", ans);

    return 0;
}