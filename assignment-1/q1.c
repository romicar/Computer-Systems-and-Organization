/*

for negative numbers (m or n) outputs -1

*/
/*
if m == 0 then q=r=0
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// function to calculate the remainder that takes a and b as two arguments
// returns the remainder of a/b
long long rem(long long m, long long n);

// function to calculate the quotient that takes a and b as two arguments
// returns the quotient of a/b
long long int quotient(long long int M, long long int N);

int main()
{
    // initializing the inputs to be taken from user
    // inputs are m and n
    long long m, n;

    // asking for inputs from the user
    scanf("%lld %lld", &m, &n);

    // q stores the value of quotient returned by the function 'quotient'
    // passing m and n as arguments to the function call
    long long q = quotient(m, n);

    // printing the quotient stored in q
    printf("%lld ", q);

    // if quotient is not -1 not only print remainder
    if (q != -1)
    {
        // r stores the value of remainder returned by the function 'rem'
        // passing m and n as arguments to the function call
        long long r = rem(m, n);

        // printing the quotient stored in q
        printf("%lld\n", r);
    }
    return 0;
}