#include<stdio.h>
#include<stdlib.h>

typedef long long int ll;
ll count(ll n, ll diff);

int main()
{
    ll n;
    scanf("%lld",&n);
    printf("%lld\n",count(n,0));

    return 0;
}