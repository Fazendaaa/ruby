#include <limits.h>
#include <stdio.h>

int main () {
    long long int large_factor=0, i=2;
    long long int number=600851475143;

    printf("long long int max : %lld\n",LLONG_MAX);

    while (number!=1) {
        if (number%i==0) {
            while (number%i==0)
                number/=i;
            large_factor=i;
        }
        i++;
     }

    printf ("\n\nThe largest prime factor is : %lld\n\n", large_factor);

    return 0;
}
