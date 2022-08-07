#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<assert.h>

typedef long long int ll;

void nextGreatest(ll n,ll *a,ll *b);

int main()
{

ll n;
scanf("%lld",&n);
ll arr[n];
ll brr[n];

for(ll i=0;i<n;i++){
scanf("%lld",&arr[i]);
}
nextGreatest(n,arr,brr);

for(ll i=0;i<n;i++)
{
  printf("%lld ",brr[i]);
}

return 0;
}