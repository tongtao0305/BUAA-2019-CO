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
static const char *ng0 = "D:/tongt/Desktop/P5/P5_theSecondEdition/NPC.v";
static unsigned int ng1[] = {12288U, 0U};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {14, 0};



static void Initial_33_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(33, ng0);

LAB2:    xsi_set_current_line(34, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2568);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB1:    return;
}

static void Always_37_1(char *t0)
{
    char t6[8];
    char t19[8];
    char t26[8];
    char t66[8];
    char t67[8];
    char t68[8];
    char t78[8];
    char t82[8];
    char t90[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    int t50;
    int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t69;
    char *t70;
    char *t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t79;
    char *t80;
    char *t81;
    char *t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t91;

LAB0:    t1 = (t0 + 3736U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 4056);
    *((int *)t2) = 1;
    t3 = (t0 + 3768);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(37, ng0);

LAB5:    xsi_set_current_line(39, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t5 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB6;

LAB7:    if (*((unsigned int *)t4) != 0)
        goto LAB8;

LAB9:    t13 = (t6 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t13);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB10;

LAB11:    memcpy(t26, t6, 8);

LAB12:    t58 = (t26 + 4);
    t59 = *((unsigned int *)t58);
    t60 = (~(t59));
    t61 = *((unsigned int *)t26);
    t62 = (t61 & t60);
    t63 = (t62 != 0);
    if (t63 > 0)
        goto LAB20;

LAB21:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 1848U);
    t4 = *((char **)t2);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t4);
    t9 = (t7 | t8);
    *((unsigned int *)t6) = t9;
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t12 = (t6 + 4);
    t10 = *((unsigned int *)t2);
    t11 = *((unsigned int *)t5);
    t14 = (t10 | t11);
    *((unsigned int *)t12) = t14;
    t15 = *((unsigned int *)t12);
    t16 = (t15 != 0);
    if (t16 == 1)
        goto LAB23;

LAB24:
LAB25:    t18 = (t6 + 4);
    t37 = *((unsigned int *)t18);
    t38 = (~(t37));
    t39 = *((unsigned int *)t6);
    t42 = (t39 & t38);
    t43 = (t42 != 0);
    if (t43 > 0)
        goto LAB26;

LAB27:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB29;

LAB30:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);

LAB31:
LAB28:
LAB22:    goto LAB2;

LAB6:    *((unsigned int *)t6) = 1;
    goto LAB9;

LAB8:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB9;

LAB10:    t17 = (t0 + 1528U);
    t18 = *((char **)t17);
    memset(t19, 0, 8);
    t17 = (t18 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (~(t20));
    t22 = *((unsigned int *)t18);
    t23 = (t22 & t21);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB13;

LAB14:    if (*((unsigned int *)t17) != 0)
        goto LAB15;

LAB16:    t27 = *((unsigned int *)t6);
    t28 = *((unsigned int *)t19);
    t29 = (t27 & t28);
    *((unsigned int *)t26) = t29;
    t30 = (t6 + 4);
    t31 = (t19 + 4);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t30);
    t34 = *((unsigned int *)t31);
    t35 = (t33 | t34);
    *((unsigned int *)t32) = t35;
    t36 = *((unsigned int *)t32);
    t37 = (t36 != 0);
    if (t37 == 1)
        goto LAB17;

LAB18:
LAB19:    goto LAB12;

LAB13:    *((unsigned int *)t19) = 1;
    goto LAB16;

LAB15:    t25 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB16;

LAB17:    t38 = *((unsigned int *)t26);
    t39 = *((unsigned int *)t32);
    *((unsigned int *)t26) = (t38 | t39);
    t40 = (t6 + 4);
    t41 = (t19 + 4);
    t42 = *((unsigned int *)t6);
    t43 = (~(t42));
    t44 = *((unsigned int *)t40);
    t45 = (~(t44));
    t46 = *((unsigned int *)t19);
    t47 = (~(t46));
    t48 = *((unsigned int *)t41);
    t49 = (~(t48));
    t50 = (t43 & t45);
    t51 = (t47 & t49);
    t52 = (~(t50));
    t53 = (~(t51));
    t54 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t54 & t52);
    t55 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t55 & t53);
    t56 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t56 & t52);
    t57 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t57 & t53);
    goto LAB19;

LAB20:    xsi_set_current_line(40, ng0);
    t64 = (t0 + 1208U);
    t65 = *((char **)t64);
    t64 = ((char*)((ng2)));
    t69 = (t0 + 1048U);
    t70 = *((char **)t69);
    memset(t68, 0, 8);
    t69 = (t68 + 4);
    t71 = (t70 + 4);
    t72 = *((unsigned int *)t70);
    t73 = (t72 >> 0);
    *((unsigned int *)t68) = t73;
    t74 = *((unsigned int *)t71);
    t75 = (t74 >> 0);
    *((unsigned int *)t69) = t75;
    t76 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t76 & 65535U);
    t77 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t77 & 65535U);
    xsi_vlogtype_concat(t67, 16, 16, 1U, t68, 16);
    t79 = ((char*)((ng3)));
    t80 = (t0 + 1048U);
    t81 = *((char **)t80);
    memset(t82, 0, 8);
    t80 = (t82 + 4);
    t83 = (t81 + 4);
    t84 = *((unsigned int *)t81);
    t85 = (t84 >> 15);
    t86 = (t85 & 1);
    *((unsigned int *)t82) = t86;
    t87 = *((unsigned int *)t83);
    t88 = (t87 >> 15);
    t89 = (t88 & 1);
    *((unsigned int *)t80) = t89;
    xsi_vlog_mul_concat(t78, 14, 1, t79, 1U, t82, 1);
    xsi_vlogtype_concat(t66, 32, 32, 3U, t78, 14, t67, 16, t64, 2);
    memset(t90, 0, 8);
    xsi_vlog_unsigned_add(t90, 32, t65, 32, t66, 32);
    t91 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t91, t90, 0, 0, 32, 0LL);
    goto LAB22;

LAB23:    t20 = *((unsigned int *)t6);
    t21 = *((unsigned int *)t12);
    *((unsigned int *)t6) = (t20 | t21);
    t13 = (t3 + 4);
    t17 = (t4 + 4);
    t22 = *((unsigned int *)t13);
    t23 = (~(t22));
    t24 = *((unsigned int *)t3);
    t50 = (t24 & t23);
    t27 = *((unsigned int *)t17);
    t28 = (~(t27));
    t29 = *((unsigned int *)t4);
    t51 = (t29 & t28);
    t33 = (~(t50));
    t34 = (~(t51));
    t35 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t35 & t33);
    t36 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t36 & t34);
    goto LAB25;

LAB26:    xsi_set_current_line(43, ng0);
    t25 = ((char*)((ng2)));
    t30 = (t0 + 1048U);
    t31 = *((char **)t30);
    memset(t66, 0, 8);
    t30 = (t66 + 4);
    t32 = (t31 + 4);
    t44 = *((unsigned int *)t31);
    t45 = (t44 >> 0);
    *((unsigned int *)t66) = t45;
    t46 = *((unsigned int *)t32);
    t47 = (t46 >> 0);
    *((unsigned int *)t30) = t47;
    t48 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t48 & 67108863U);
    t49 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t49 & 67108863U);
    xsi_vlogtype_concat(t26, 26, 26, 1U, t66, 26);
    t40 = (t0 + 1208U);
    t41 = *((char **)t40);
    memset(t68, 0, 8);
    t40 = (t68 + 4);
    t58 = (t41 + 4);
    t52 = *((unsigned int *)t41);
    t53 = (t52 >> 28);
    *((unsigned int *)t68) = t53;
    t54 = *((unsigned int *)t58);
    t55 = (t54 >> 28);
    *((unsigned int *)t40) = t55;
    t56 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t56 & 15U);
    t57 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t57 & 15U);
    xsi_vlogtype_concat(t67, 4, 4, 1U, t68, 4);
    xsi_vlogtype_concat(t19, 32, 32, 3U, t67, 4, t26, 26, t25, 2);
    t64 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t64, t19, 0, 0, 32, 0LL);
    goto LAB28;

LAB29:    xsi_set_current_line(46, ng0);
    t4 = (t0 + 2168U);
    t5 = *((char **)t4);
    t4 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 0LL);
    goto LAB31;

}


extern void work_m_00000000002920396607_0757879789_init()
{
	static char *pe[] = {(void *)Initial_33_0,(void *)Always_37_1};
	xsi_register_didat("work_m_00000000002920396607_0757879789", "isim/test_mips_isim_beh.exe.sim/work/m_00000000002920396607_0757879789.didat");
	xsi_register_executes(pe);
}
