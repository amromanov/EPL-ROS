#ifndef SHM_STRUCTS_H
#define SHM_STRUCTS_H

typedef struct SDO
{
    bool do_transfer;
    bool is_ready;
    bool is_output;
    uint8_t node;
    uint16_t index;
    uint16_t subindex;
    uint64_t data;
    uint32_t size;
    uint16_t error;
} SDO;

typedef struct WRAPPER_INFO
{
    uint16_t pid;
    uint64_t relative_time;
} WRAPPER_INFO;

#endif