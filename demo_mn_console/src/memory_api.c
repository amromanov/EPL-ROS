#include <memory_api.h>

void init_shared_memory(IPC_DATA *data)
{
    char *name = data->shm_name;
    int length = data->length;
    int shm = shm_open(name, O_CREAT | O_RDWR, 0777);
    if (shm == -1)
    {
        printf("[SH_MEM]\tShared memory creating for %s: FAIL\n", name);
        return;
    }
    printf("[SH_MEM]\tShared memory creating for %s: OK\n", name);
    int truncate = ftruncate(shm, length * 2);
    if (truncate < 0)
    {
        printf("[SH_MEM]\tShared memory truncating for %s: FAIL\n", name);
        shm_unlink(name);
        return;
    }
    printf("[SH_MEM]\tShared memory truncating for %s: OK\n", name);
    void* addr = mmap(0, length * 2, PROT_WRITE | PROT_READ, MAP_SHARED, shm, 0);
    if (addr == (void*)-1)
    {
        printf("[SH_MEM]\tShared memory mapping for %s: FAIL\n", name);
        shm_unlink(name);
        return;
    }
    else
    {
        printf("[SH_MEM]\tShared memory mapping for %s: OK\n", name);
    }
    data->address = addr;
    data->is_initialized = true;
}
