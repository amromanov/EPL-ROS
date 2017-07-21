#include <epl_wrapper/PrioritySetter.h>

void set_pid_priority(int pid);

int set_group_priority(int target)
{
    FILE *settings = fopen("/proc/sys/kernel/pid_max", "r");
    if (settings == NULL)
    {
        ROS_ERROR("Reading pid_max: FAIL");
        return 1;
    }
    unsigned int pid_max;
    fscanf(settings, "%i", &pid_max);
    fclose(settings);
    ROS_INFO("Reading pid_max: OK");

    for (int i = 0; i < pid_max; i++)
    {
        char path[128];
        int length = sprintf(path, "/proc/%i/stat", i);
        path[length] = '\0';
        FILE *f = fopen(path, "r");
        if (f == NULL)
        {
            continue;
        }
        int pid, parent_pid, group_pid;
        char filename[256];
        char state;
        fscanf(f, "%d %s %c %d %d", &pid, filename, &state, &parent_pid, &group_pid);
        if (group_pid == target)
        {
            set_pid_priority(pid);
        }
        fclose(f);
    }
    return 0;
}

void set_pid_priority(int pid)
{
    struct sched_param param;
    param.sched_priority = 20;
    if (sched_setscheduler(pid, SCHED_FIFO, &param) == 0)
    {
        ROS_INFO("Setting priority for PID %i: OK", pid);
    }
    else
    {
        ROS_ERROR("Setting priority for PID %i: FAIL", pid);
    }
}
