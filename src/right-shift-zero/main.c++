#include "test.h"
#include <stdint.h>
#include <stdio.h>
#include <assert.h>

uint64_t value_0[256];
uint64_t value_128[256];

int main()
{
    init();

    printf("lo_64_0():       %lu\n", lo_64_0());
    printf("lo_64_128():     %lu\n", lo_64_128());

    printf("rsh_8_0_c0():    %d\n", rsh_8_0_c0());
    printf("rsh_8_128_c0():  %d\n", rsh_8_128_c0());

    printf("rsh_8_0(0):      %d\n", rsh_8_0(0));
    printf("rsh_8_128(0):    %d\n", rsh_8_128(0));

    assert(rsh_8_0(0)   == 1);
    assert(rsh_8_128(0) == 0);

    return 0;
}
