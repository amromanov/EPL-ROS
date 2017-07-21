/*
*
*    This file was generated with EPL ROS generator
*    Generated on: $TIMESTAMP
*    Version: $VERSION
*    License: $LICENSE
*
*/

#include <$ROS_PROJECT/$EXEC_NAME.h>

$MESSAGES_CALLBACKS_DECLARATIONS

int init_signal_hooks();
void user_signal_handler(int sig);


$USER_MESSAGES

bool ready;
bool tick;
bool last_tick;
bool can_run_cycle;

int main(int argc, char **argv)
{
    ROS_INFO("-------------------------");
    ROS_INFO("Starting $EXEC_NAME");

    if (init_signal_hooks())
    {
        return 1;
    }

    ros::init(argc, argv, "$EXEC_NAME");

    ros::NodeHandle node;

$PUBLISHERS

$SUBSCRIBERS

    ros::ServiceClient syncClient = node.serviceClient<epl_wrapper::SignalSync>("signalSync");
    ros::ServiceClient sdoClient = node.serviceClient<epl_wrapper::SdoTransfer>("sdoTransfer");

    epl_wrapper::SignalSync sync;
    sync.request.do_add = true;
    sync.request.pid = getpgrp();

    if ((syncClient.call(sync)) && (sync.response.success))
    {
        ROS_INFO("Signal service request: OK");
    }
    else
    {
        ROS_ERROR("Signal service request: FAIL");
        return 1;
    }

    bool sdo_ready = false;
    epl_wrapper::SdoTransfer sdo;
    sdo.request.action = SDO_ACTION_LOCK;
    sdo.request.pid = getpgrp();

    while (!sdo_ready)
    {
        ros::Duration(0.5).sleep();
        switch (sdo.request.action)
        {
            case SDO_ACTION_LOCK:
            {
                if ((sdoClient.call(sdo)) && (!sdo.response.error))
                {
                    ROS_INFO("Locking SDO channel: OK");
                    sdo.request.action = SDO_ACTION_WRITE;
                }
                else
                {
                    ROS_ERROR("Locking SDO channel: FAIL");
                    break;
                }
                break;
            }

            case SDO_ACTION_WRITE:
            {
                sdo.request.node = 240;
                sdo.request.index = 0x1006;
                sdo.request.subindex = 0;
                sdo.request.data = 50000;
                sdo.request.size = 4;

                if ((sdoClient.call(sdo)) && (!sdo.response.error))
                {
                    ROS_INFO("Starting SDO read: OK");
                    sdo.request.action = SDO_ACTION_CHECK;
                }
                else
                {
                    ROS_ERROR("Starting SDO read: FAIL");
                    break;
                }
                break;
            }

            case SDO_ACTION_CHECK:
            {
                if (sdoClient.call(sdo))
                {
                    ROS_INFO("SDO check: OK");
                }
                else
                {
                    ROS_ERROR("SDO check: FAIL");
                    break;
                }
                bool valid = true;
                if (!sdo.response.is_ready)
                {
                    ROS_ERROR("SDO check: NOT_READY");
                    valid = false;
                }
                if (sdo.response.error)
                {
                    ROS_ERROR("SDO check: ERROR %i", sdo.response.error);
                    sdo.request.action = SDO_ACTION_UNLOCK;
                    valid = false;
                }
                if (!valid)
                {
                    break;
                }
                ROS_INFO("SDO answer: %i", sdo.response.data);
                sdo.request.action = SDO_ACTION_UNLOCK;
                break;
            }

            case SDO_ACTION_UNLOCK:
            {
                if ((sdoClient.call(sdo)) && (!sdo.response.error))
                {
                    ROS_INFO("Unlocking SDO channel: OK");
                    sdo_ready = true;
                }
                else
                {
                    ROS_ERROR("Unlocking SDO channel: FAIL");
                }
                break;
            }
        }
    }

    init();

    ready = true;

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
        cycle();
        ros::spinOnce();
    }

    terminate();

    return 0;
}

int init_signal_hooks()
{
    if (signal(SIGUSR1, user_signal_handler) == SIG_ERR)
    {
        ROS_ERROR("Setting USR1 hook: FAIL");
    }
    else
    {
        ROS_INFO("Setting USR1 hook: OK");
    }
    if (signal(SIGUSR2, user_signal_handler) == SIG_ERR)
    {
        ROS_ERROR("Setting USR2 hook: FAIL");
    }
    else
    {
        ROS_INFO("Setting USR2 hook: OK");
    }
    return 0;
}

void user_signal_handler(int sig)
{
    if (!ready)
    {
        return;
    }
    last_tick = tick;
    tick = !tick;
    can_run_cycle = true;

}

$MESSAGES_CALLBACKS