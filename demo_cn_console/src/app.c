/**
********************************************************************************
\file   app.c

\brief  Demo CN application which implements a digital input/output node

This file contains a demo application for digital input/output data.

\ingroup module_demo_cn_console
*******************************************************************************/

/*------------------------------------------------------------------------------
Copyright (c) 2015, Bernecker+Rainer Industrie-Elektronik Ges.m.b.H. (B&R)
Copyright (c) 2013, SYSTEC electronic GmbH
Copyright (c) 2013, Kalycito Infotech Private Ltd.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the copyright holders nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
------------------------------------------------------------------------------*/

//------------------------------------------------------------------------------
// includes
//------------------------------------------------------------------------------
#include <stddef.h>

#include <oplk/oplk.h>
#include <oplk/debugstr.h>

#include <stdio.h>

#include <eventlog/eventlog.h>

#include <string.h>
#include <signal.h>
#include <stdint.h>

#include "app.h"
#include "memory_api.h"
#include "shm_structs.h"

typedef struct
{
    BYTE digitalIn;
} PI_IN;

typedef struct
{
    BYTE digitalOut;
} PI_OUT;

//============================================================================//
//            G L O B A L   D E F I N I T I O N S                             //
//============================================================================//

//------------------------------------------------------------------------------
// const defines
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// module global vars
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// global function prototypes
//------------------------------------------------------------------------------


//============================================================================//
//            P R I V A T E   D E F I N I T I O N S                           //
//============================================================================//

//------------------------------------------------------------------------------
// const defines
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// local types
//------------------------------------------------------------------------------
/* structure for input process image */

// local vars
//------------------------------------------------------------------------------
/* process image */
static PI_IN*   pProcessImageIn_l;
static PI_OUT*  pProcessImageOut_l;

static IPC_DATA     imageInData;
static PI_IN*       shmImageIn;
static IPC_DATA     imageOutData;
static PI_OUT*      shmImageOut;
static IPC_DATA     sdoData;
static SDO*      sdo;
static IPC_DATA     wrapperInfoData;
static WRAPPER_INFO*      wrapperInfo;

static int wrapper_pid;

//------------------------------------------------------------------------------
// local function prototypes
//------------------------------------------------------------------------------
static tOplkError initProcessImage(void);

//============================================================================//
//            P U B L I C   F U N C T I O N S                                 //
//============================================================================//

//------------------------------------------------------------------------------
/**
\brief  Initialize the synchronous data application

The function initializes the synchronous data application

\return The function returns a tOplkError error code.

\ingroup module_demo_cn_console
*/
//------------------------------------------------------------------------------
tOplkError initApp(void)
{
    tOplkError ret = kErrorOk;

    imageInData.shm_name = "OPLK_PI_IN";
    imageInData.length = sizeof(PI_IN);
    init_shared_memory(&imageInData);
    if (imageInData.is_initialized)
    {
        shmImageIn = (PI_IN*)imageInData.address;
        printf("[SH_MEM]\tAccessing shared memory for %s: OK\n", imageInData.shm_name);
    }
    else
    {
        printf("[SH_MEM]\tAccessing shared memory for %s: FAIL\n", imageInData.shm_name);
        return 1;
    }

    imageOutData.shm_name = "OPLK_PI_OUT";
    imageOutData.length = sizeof(PI_OUT);
    init_shared_memory(&imageOutData);
    if (imageOutData.is_initialized)
    {
        shmImageOut = (PI_OUT*)imageOutData.address;
        printf("[SH_MEM]\tAccessing shared memory for %s: OK\n", imageOutData.shm_name);
    }
    else
    {
        printf("[SH_MEM]\tAccessing shared memory for %s: FAIL\n", imageOutData.shm_name);
        return 1;
    }
    
    sdoData.shm_name = "OPLK_SDO";
    sdoData.length = sizeof(SDO);
    init_shared_memory(&sdoData);
    if (sdoData.is_initialized)
    {
        sdo = sdoData.address;
        printf("[SH_MEM]\tAccessing shared memory for %s: OK\n", sdoData.shm_name);
    }
    else
    {
        printf("[SH_MEM]\tAccessing shared memory for %s: FAIL\n", sdoData.shm_name);
        return 1;
    }
    
    wrapperInfoData.shm_name = "OPLK_WRAPPER_INFO";
    wrapperInfoData.length = sizeof(WRAPPER_INFO);
    init_shared_memory(&wrapperInfoData);
    if (wrapperInfoData.is_initialized)
    {
        wrapperInfo = wrapperInfoData.address;
        printf("[SH_MEM]\tAccessing shared memory for %s: OK\n", wrapperInfoData.shm_name);
    }
    else
    {
        printf("[SH_MEM]\tAccessing shared memory for %s: FAIL\n", wrapperInfoData.shm_name);
        return 1;
    }
    
    wrapper_pid = wrapperInfo->pid;
    printf("Wrapper PID is %i\n", wrapper_pid);

    ret = initProcessImage();

    return ret;
}

//------------------------------------------------------------------------------
/**
\brief  Shutdown the synchronous data application

The function shuts down the synchronous data application

\return The function returns a tOplkError error code.

\ingroup module_demo_cn_console
*/
//------------------------------------------------------------------------------
void shutdownApp(void)
{
    if (imageInData.is_initialized)
    {
        munmap(imageInData.address, imageInData.length * 2);
        shm_unlink(imageInData.shm_name);
        printf("[SH_MEM]\tShared memory unlinking for %s: OK\n", imageInData.shm_name);
    }
    
    if (imageOutData.is_initialized)
    {
        munmap(imageOutData.address, imageOutData.length * 2);
        shm_unlink(imageOutData.shm_name);
        printf("[SH_MEM]\tShared memory unlinking for %s: OK\n", imageOutData.shm_name);
    }

    if (sdoData.is_initialized)
    {
        munmap(sdoData.address, sdoData.length * 2);
        shm_unlink(sdoData.shm_name);
        printf("[SH_MEM]\tShared memory unlinking for %s: OK\n", sdoData.shm_name);
    }
    
    if (wrapperInfoData.is_initialized)
    {
        munmap(wrapperInfoData.address, wrapperInfoData.length * 2);
        shm_unlink(wrapperInfoData.shm_name);
        printf("[SH_MEM]\tShared memory unlinking for %s: OK\n", wrapperInfoData.shm_name);
    }
    
    oplk_freeProcessImage();
}

//------------------------------------------------------------------------------
/**
\brief  Synchronous data handler

The function implements the synchronous data handler.

\return The function returns a tOplkError error code.

\ingroup module_demo_cn_console
*/
//------------------------------------------------------------------------------
tOplkError processSync(void)
{
    tOplkError      ret = kErrorOk;

    if (oplk_waitSyncEvent(100000) != kErrorOk)
        return ret;

    ret = oplk_exchangeProcessImageOut();
    if (ret != kErrorOk)
        return ret;

    memcpy(pProcessImageIn_l, shmImageIn, sizeof(PI_IN));
    memcpy(shmImageOut, pProcessImageOut_l, sizeof(PI_OUT));

    if(kill(wrapper_pid, SIGUSR1))
    {
        kill(0, SIGINT);
    }

    ret = oplk_exchangeProcessImageIn();

    return ret;
}

static tOplkError initProcessImage(void)
{
    tOplkError      ret = kErrorOk;
    UINT            varEntries;
    tObdSize        obdSize;
    /* Allocate process image */

    ret = oplk_allocProcessImage(sizeof(PI_IN), sizeof(PI_OUT));
    if (ret != kErrorOk)
    {
        return ret;
    }

    pProcessImageIn_l = oplk_getProcessImageIn();
    pProcessImageOut_l = oplk_getProcessImageOut();

    
    obdSize = sizeof(pProcessImageIn_l->digitalIn);
    varEntries = 1;
    ret = oplk_linkProcessImageObject(0x6000, 0x01, offsetof(PI_IN, digitalIn),
                                      FALSE, obdSize, &varEntries);
    if (ret != kErrorOk)
    {
        fprintf(stderr, "linking process vars failed with \"%s\" (0x%04x)\n", debugstr_getRetValStr(ret), ret);
        return ret;
    }

    obdSize = sizeof(pProcessImageOut_l->digitalOut);
    varEntries = 1;
    ret = oplk_linkProcessImageObject(0x6200, 0x01, offsetof(PI_OUT, digitalOut),
                                      TRUE, obdSize, &varEntries);
    if (ret != kErrorOk)
    {
        fprintf(stderr, "linking process vars failed with \"%s\" (0x%04x)\n", debugstr_getRetValStr(ret), ret);
        return ret;
    }

    fprintf(stderr, "Linking process vars... ok\n\n");
    
    return kErrorOk;
}

/// \}
