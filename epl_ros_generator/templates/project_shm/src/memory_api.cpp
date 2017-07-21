#include <$ROS_PROJECT/MemoryAPI.h>

void* init_shared_memory(const char* name, int length)
{
    int shm = shm_open(name, O_CREAT | O_RDWR, 0777);
    if (shm == -1)
    {
        ROS_ERROR("Shared memory creating for %s: FAIL", name);
        return (void*)-1;
    }
    ROS_INFO("Shared memory creating for %s: OK", name);
    int truncate = ftruncate(shm, length * 2);
    if (truncate < 0)
    {
        ROS_ERROR("Shared memory truncating for %s: FAIL", name);
        shm_unlink(name);
        return (void*)-1;
    }
    ROS_INFO("Shared memory truncating for %s: OK", name);
    void* addr = mmap(0, length * 2, PROT_WRITE | PROT_READ, MAP_SHARED, shm, 0);
    if (addr == (void*)-1)
    {
        ROS_ERROR("Shared memory mapping for %s: FAIL", name);
        shm_unlink(name);
        return (void*)-1;
    }
    else
    {
        ROS_INFO("Shared memory mapping for %s: OK", name);
    }
    return addr;
}
