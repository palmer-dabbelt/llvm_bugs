#include "test.h"
#include <stdint.h>
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

uint64_t value;
uint64_t lo, hi;

uint64_t calls;

int main()
{
    init();

    calls = 0;

    cat();

    return (calls == 2);
}

extern "C" void array_func(uint64_t *array)
{
    lo = array[0];
    hi = array[1];

    printf("hi: %lu\n", hi);
    printf("lo: %lu\n", lo);

    assert(hi == 1);
    assert(lo == 2);

    calls++;
}
