/*
*
*    This file was generated with EPL ROS generator
*    Generated on: $TIMESTAMP
*    Version: $VERSION
*    License: $LICENSE
*
*/

#ifndef $EXEC_NAME_H
#define $EXEC_NAME_H

#include "ros/ros.h"
#include "std_msgs/String.h"

#include <signal.h>
#include <time.h>
#include <stdio.h>
#include <cstring>

#define SDO_ACTION_LOCK 0
#define SDO_ACTION_READ 1
#define SDO_ACTION_WRITE 2
#define SDO_ACTION_CHECK 3
#define SDO_ACTION_UNLOCK 4

#include <$ROS_PROJECT/PrioritySetter.h>

#include <epl_wrapper/SignalSync.h>
#include <epl_wrapper/SdoTransfer.h>

$ROS_MESSAGES_INCLUDE

#include <$ROS_PROJECT/user_app.h>

$USER_MESSAGES_EXTERN

#endif