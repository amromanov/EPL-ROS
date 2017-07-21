#ifndef MEMORY_API_H
#define MEMORY_API_H

#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <stdio.h>


#define true 1
#define false 0
typedef char bool;


typedef struct IPC_DATA
{
    void *address;
    bool is_initialized;
    char *shm_name;
    int length;
} IPC_DATA;

void init_shared_memory(IPC_DATA *data);

#endif
