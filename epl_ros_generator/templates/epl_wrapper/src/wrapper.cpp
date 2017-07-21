/*
*
*    This file was generated with EPL ROS generator
*    Generated on: $TIMESTAMP
*    Version: $VERSION
*    License: $LICENSE
*
*/

#include "ros/ros.h"
#include "std_msgs/String.h"

#include <signal.h>
#include <time.h>
#include <stdio.h>
#include <inttypes.h>

#include <epl_wrapper/MemoryAPI.h>
#include <epl_wrapper/PrioritySetter.h>

#include <epl_wrapper/SignalSync.h>
#include <epl_wrapper/SdoTransfer.h>

#include <epl_wrapper/generated_wrapper.h>

int init_signal_hooks();
void send_sig(int sig);

void shutdown_handler(int sig);
void oplk_handler(int sig);
bool signal_sync_handler(epl_wrapper::SignalSync::Request &req, epl_wrapper::SignalSync::Response &res);
bool sdo_transfer_handler(epl_wrapper::SdoTransfer::Request &req, epl_wrapper::SdoTransfer::Response &res);

$MESSAGES_CALLBACKS_DECLARATIONS

int pid = getpid();
bool tick;
bool last_tick;
bool can_run_cycle;
bool ready;
list<int> pids;
int sdo_client_pid;
bool sdo_is_busy;

int main(int argc, char **argv)
{
    ROS_INFO("-------------------------");
    ROS_INFO("Starting EPL wrapper");

    if (init_signal_hooks())
    {
        return 1;
    }

    if (init_oplk_memory())
    {
        return 1;
    }

    oplk_wrapper_info->pid = pid;

    if (init_ros_memory(pid))
    {
        return 1;
    }

    ready = true;

    ROS_INFO("-------------------------");
    ROS_INFO("Initializing ROS framework");
    ros::init(argc, argv, "epl_wrapper", ros::init_options::NoSigintHandler);

    ros::NodeHandle node;

$PUBLISHERS

$SUBSCRIBERS

    ros::ServiceServer signal_sync_service = node.advertiseService("signalSync", signal_sync_handler);
    ros::ServiceServer sdo_service = node.advertiseService("sdoTransfer", sdo_transfer_handler);

    // set_group_priority(getpgrp());

$MESSAGES

    ROS_INFO("-------------------------");
    ROS_INFO("Entering ROS loop");

    while (ros::ok())
    {
        if ((tick == last_tick) || (!can_run_cycle))
        {
            continue;
        }
        can_run_cycle = false;

$ROS_LOOP
        ros::spinOnce();
    }
    
    return 0;
}

void shutdown_handler(int sig)
{
    ROS_INFO("Terminating EPL wrapper");
    unlink_memory();
    ros::shutdown();
}

bool signal_sync_handler(epl_wrapper::SignalSync::Request &req, epl_wrapper::SignalSync::Response &res)
{
    if (req.do_add)
    {
        if (std::find(pids.begin(), pids.end(), req.pid) == pids.end())
        {
           ROS_INFO("Adding PID %i to subscribers list", req.pid);
           pids.push_back(req.pid);
        }
    }
    else
    {
        if (std::find(pids.begin(), pids.end(), req.pid) != pids.end())
        {
           ROS_INFO("Removing PID %i from subscribers list", req.pid);
           pids.remove(req.pid);
        }
    }
    res.success = true;
    return true;
}

bool sdo_transfer_handler(epl_wrapper::SdoTransfer::Request &req, epl_wrapper::SdoTransfer::Response &res)
{
    res.error = 0;
    switch (req.action)
    {
        case SDO_ACTION_LOCK:
        {
            if (!sdo_client_pid)
            {
                sdo_client_pid = req.pid;
                sdo_is_busy = false;
            }
            else
            {
                res.error = 1;
            }
            break;
        }

        case SDO_ACTION_READ:
        case SDO_ACTION_WRITE:
        {
            if (sdo_is_busy)
            {
                res.error = 1;
                break;
            }
            sdo_is_busy = true;
            oplk_sdo->node = req.node;
            oplk_sdo->index = req.index;
            oplk_sdo->subindex = req.subindex;
            oplk_sdo->is_output = req.action == SDO_ACTION_WRITE;
            oplk_sdo->data = req.data;
            oplk_sdo->size = req.size;
            oplk_sdo->is_ready = false;
            oplk_sdo->do_transfer = true;
            break;
        }

        case SDO_ACTION_CHECK:
        {
            res.is_ready = oplk_sdo->is_ready;
            sdo_is_busy = !res.is_ready;
            res.error = oplk_sdo->error;
            res.data = oplk_sdo->data;
            break;
        }

        case SDO_ACTION_UNLOCK:
        {
            if (sdo_is_busy)
            {
                res.error = 1;
                break;
            }
            sdo_client_pid = 0;
        }
    }

    return true;
}

void oplk_handler(int sig)
{
    if (!ready)
    {
        return;
    }
    last_tick = tick;
    tick = !tick;
    can_run_cycle = true;

    if (tick)
    {
$TICK_A
        send_sig(SIGUSR1);
    }
    else
    {
$TICK_B
        send_sig(SIGUSR2);
    }
}

void send_sig(int sig)
{
    for (auto iterator = pids.begin(), end = pids.end(); iterator != end; ++iterator)
    {
        if (killpg(*iterator, sig))
        {
            ROS_WARN("PID %i is no longer alive, removing from subscribers list", *iterator);
            if (*iterator == sdo_client_pid)
            {
                ROS_WARN("SDO channel will be unlocked because of %i death", sdo_client_pid);
                sdo_client_pid = 0;
                sdo_is_busy = false;
            }
            iterator = pids.erase(iterator);
        }
    }
}

int init_signal_hooks()
{
    if (signal(SIGINT, shutdown_handler) == SIG_ERR)
    {
        ROS_ERROR("Setting SIGINT hook: FAIL");
        return 1;
    }
    else
    {
        ROS_INFO("Setting SIGINT hook: OK");
    }
    if (signal(SIGTERM, shutdown_handler) == SIG_ERR)
    {
        ROS_ERROR("Setting SIGTERM hook: FAIL");
        return 1;
    }
    else
    {
        ROS_INFO("Setting SIGTERM hook: OK");
    }
    if (signal(SIGUSR1, oplk_handler) == SIG_ERR)
    {
        ROS_ERROR("Setting USR1 hook: FAIL");
        return 1;
    }
    else
    {
        ROS_INFO("Setting USR1 hook: OK");
    }
    return 0;
}

$MESSAGES_CALLBACKS