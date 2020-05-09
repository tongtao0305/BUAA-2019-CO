/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/tongt/Desktop/P8/P8_5.0/LED.v";
static unsigned int ng1[] = {0U, 0U};



static void Always_29_0(char *t0)
{
    char t11[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;

LAB0:    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 3168);
    *((int *)t2) = 1;
    t3 = (t0 + 2880);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(29, ng0);

LAB5:    xsi_set_current_line(30, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB12;

LAB13:
LAB14:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(30, ng0);

LAB9:    xsi_set_current_line(31, ng0);
    t12 = ((char*)((ng1)));
    memset(t11, 0, 8);
    t13 = (t11 + 4);
    t14 = (t12 + 4);
    t15 = *((unsigned int *)t12);
    t16 = (~(t15));
    *((unsigned int *)t11) = t16;
    *((unsigned int *)t13) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB11;

LAB10:    t21 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t21 & 4294967295U);
    t22 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t22 & 4294967295U);
    t23 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t23, t11, 0, 0, 32, 0LL);
    goto LAB8;

LAB11:    t17 = *((unsigned int *)t11);
    t18 = *((unsigned int *)t14);
    *((unsigned int *)t11) = (t17 | t18);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t19 | t20);
    goto LAB10;

LAB12:    xsi_set_current_line(33, ng0);

LAB15:    xsi_set_current_line(34, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    memset(t11, 0, 8);
    t4 = (t11 + 4);
    t12 = (t5 + 4);
    t15 = *((unsigned int *)t5);
    t16 = (~(t15));
    *((unsigned int *)t11) = t16;
    *((unsigned int *)t4) = 0;
    if (*((unsigned int *)t12) != 0)
        goto LAB17;

LAB16:    t21 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t21 & 4294967295U);
    t22 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t22 & 4294967295U);
    t13 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t13, t11, 0, 0, 32, 0LL);
    goto LAB14;

LAB17:    t17 = *((unsigned int *)t11);
    t18 = *((unsigned int *)t12);
    *((unsigned int *)t11) = (t17 | t18);
    t19 = *((unsigned int *)t4);
    t20 = *((unsigned int *)t12);
    *((unsigned int *)t4) = (t19 | t20);
    goto LAB16;

}


extern void work_m_00000000002102948386_2272916532_init()
{
	static char *pe[] = {(void *)Always_29_0};
	xsi_register_didat("work_m_00000000002102948386_2272916532", "isim/mips_test_isim_beh.exe.sim/work/m_00000000002102948386_2272916532.didat");
	xsi_register_executes(pe);
}
