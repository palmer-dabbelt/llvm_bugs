#ifndef TEST_H
#define TEST_H

#include <stdint.h>

extern "C" {
    void init(void);

    uint64_t lo_64_0(void);
    uint64_t lo_64_128(void);

    uint8_t rsh_8_0_c0(void);
    uint8_t rsh_8_128_c0(void);

    uint8_t rsh_8_0(int offset);
    uint8_t rsh_8_128(int offset);
}

#endif
