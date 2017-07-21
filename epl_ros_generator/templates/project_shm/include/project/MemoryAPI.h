#ifndef MEMORY_API_H
#define MEMORY_API_H

#include "ros/ros.h"

#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <string>

using std::string;
using std::list;

template<typename T>
struct IPC_DATA
{
    void* address = (void*)-1;
    bool is_initialized = false;
    bool is_buffers_initialized = false;
    string shm_name = string("");
    T* buffer_a = NULL;
    T* buffer_b = NULL;
    int length = sizeof(T);
};

void* init_shared_memory(const char* name, int length);

template<typename T>
int map_shared_memory(IPC_DATA<T> *ipc_data, int pid)
{
    if (ipc_data->address != (void*)-1)
    {
        ipc_data->buffer_a = (T*)ipc_data->address;
        ipc_data->buffer_b = (T*)((char*)ipc_data->address + sizeof(T));
        if (pid)
        {
            ipc_data->buffer_a->pid = ipc_data->buffer_b->pid = pid;
        }
        ipc_data->is_buffers_initialized = true;
        ROS_INFO("Accessing shared memory for %s: OK", ipc_data->shm_name.c_str());
        return 0;
    }
    else
    {
        ROS_ERROR("Accessing shared memory for %s: FAIL", ipc_data->shm_name.c_str());
        return -1;
    }
}

#endif
