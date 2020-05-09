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
static const char *ng0 = "D:/tongt/Desktop/P8/P8_1.0/MDM.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {5, 0};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {2U, 0U};
static int ng6[] = {10, 0};
static unsigned int ng7[] = {3U, 0U};
static unsigned int ng8[] = {5U, 0U};
static unsigned int ng9[] = {6U, 0U};
static int ng10[] = {1, 0};



static void Initial_38_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(38, ng0);

LAB2:    xsi_set_current_line(39, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3048);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(40, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3208);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(41, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3368);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(42, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3528);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(43, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3688);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(44, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3848);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB1:    return;
}

static void Cont_47_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 5016U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6208);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 6080);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_48_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 5264U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6272);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 6096);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_49_3(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;

LAB0:    t1 = (t0 + 5512U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_signed_not_equal(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 6336);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memset(t11, 0, 8);
    t12 = 1U;
    t13 = t12;
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t12 = (t12 & t15);
    t16 = *((unsigned int *)t14);
    t13 = (t13 & t16);
    t17 = (t11 + 4);
    t18 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t18 | t12);
    t19 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t19 | t13);
    xsi_driver_vfirst_trans(t7, 0, 0);
    t20 = (t0 + 6112);
    *((int *)t20) = 1;

LAB1:    return;
}

static void Always_51_4(char *t0)
{
    char t13[8];
    char t35[16];
    char t36[16];
    char t37[16];
    char t38[8];
    char t39[8];
    char t53[8];
    char t61[8];
    char t101[16];
    char t102[16];
    char t103[16];
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
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
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
    unsigned int t50;
    unsigned int t51;
    char *t52;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t65;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    int t85;
    int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    char *t100;
    char *t104;
    char *t105;
    char *t106;
    char *t107;
    char *t108;
    char *t109;

LAB0:    t1 = (t0 + 5760U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 6128);
    *((int *)t2) = 1;
    t3 = (t0 + 5792);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(51, ng0);

LAB5:    xsi_set_current_line(52, ng0);
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

LAB7:    xsi_set_current_line(58, ng0);

LAB10:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:
LAB13:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB22;

LAB23:
LAB24:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 3848);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3688);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    xsi_vlog_signed_equal(t13, 32, t4, 32, t12, 32);
    memset(t38, 0, 8);
    t26 = (t13 + 4);
    t6 = *((unsigned int *)t26);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB111;

LAB112:    if (*((unsigned int *)t26) != 0)
        goto LAB113;

LAB114:    t33 = (t38 + 4);
    t14 = *((unsigned int *)t38);
    t15 = *((unsigned int *)t33);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB115;

LAB116:    memcpy(t61, t38, 8);

LAB117:    t93 = (t61 + 4);
    t62 = *((unsigned int *)t93);
    t63 = (~(t62));
    t64 = *((unsigned int *)t61);
    t68 = (t64 & t63);
    t69 = (t68 != 0);
    if (t69 > 0)
        goto LAB125;

LAB126:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t13, 0, 8);
    xsi_vlog_signed_not_equal(t13, 32, t4, 32, t5, 32);
    t11 = (t13 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB129;

LAB130:
LAB131:
LAB127:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(52, ng0);

LAB9:    xsi_set_current_line(53, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 32, 0LL);
    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(59, ng0);

LAB14:    xsi_set_current_line(60, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t13, 0, 8);
    t11 = (t5 + 4);
    t12 = (t4 + 4);
    t14 = *((unsigned int *)t5);
    t15 = *((unsigned int *)t4);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t11);
    t18 = *((unsigned int *)t12);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t11);
    t22 = *((unsigned int *)t12);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB18;

LAB15:    if (t23 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t13) = 1;

LAB18:    t27 = (t13 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t13);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    t2 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);

LAB21:    xsi_set_current_line(64, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB13;

LAB17:    t26 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB18;

LAB19:    xsi_set_current_line(61, ng0);
    t33 = (t0 + 2008U);
    t34 = *((char **)t33);
    t33 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t33, t34, 0, 0, 32, 0LL);
    goto LAB21;

LAB22:    xsi_set_current_line(67, ng0);

LAB25:    xsi_set_current_line(68, ng0);
    t4 = (t0 + 1848U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t11 = (t5 + 4);
    t12 = (t4 + 4);
    t14 = *((unsigned int *)t5);
    t15 = *((unsigned int *)t4);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t11);
    t18 = *((unsigned int *)t12);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t11);
    t22 = *((unsigned int *)t12);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB29;

LAB26:    if (t23 != 0)
        goto LAB28;

LAB27:    *((unsigned int *)t13) = 1;

LAB29:    t27 = (t13 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t13);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB30;

LAB31:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB37;

LAB34:    if (t18 != 0)
        goto LAB36;

LAB35:    *((unsigned int *)t13) = 1;

LAB37:    t12 = (t13 + 4);
    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB38;

LAB39:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB45;

LAB42:    if (t18 != 0)
        goto LAB44;

LAB43:    *((unsigned int *)t13) = 1;

LAB45:    memset(t38, 0, 8);
    t12 = (t13 + 4);
    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t12) != 0)
        goto LAB48;

LAB49:    t27 = (t38 + 4);
    t28 = *((unsigned int *)t38);
    t29 = *((unsigned int *)t27);
    t30 = (t28 || t29);
    if (t30 > 0)
        goto LAB50;

LAB51:    memcpy(t61, t38, 8);

LAB52:    t93 = (t61 + 4);
    t94 = *((unsigned int *)t93);
    t95 = (~(t94));
    t96 = *((unsigned int *)t61);
    t97 = (t96 & t95);
    t98 = (t97 != 0);
    if (t98 > 0)
        goto LAB64;

LAB65:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng7)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB71;

LAB68:    if (t18 != 0)
        goto LAB70;

LAB69:    *((unsigned int *)t13) = 1;

LAB71:    memset(t38, 0, 8);
    t12 = (t13 + 4);
    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB72;

LAB73:    if (*((unsigned int *)t12) != 0)
        goto LAB74;

LAB75:    t27 = (t38 + 4);
    t28 = *((unsigned int *)t38);
    t29 = *((unsigned int *)t27);
    t30 = (t28 || t29);
    if (t30 > 0)
        goto LAB76;

LAB77:    memcpy(t61, t38, 8);

LAB78:    t93 = (t61 + 4);
    t94 = *((unsigned int *)t93);
    t95 = (~(t94));
    t96 = *((unsigned int *)t61);
    t97 = (t96 & t95);
    t98 = (t97 != 0);
    if (t98 > 0)
        goto LAB90;

LAB91:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng8)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB97;

LAB94:    if (t18 != 0)
        goto LAB96;

LAB95:    *((unsigned int *)t13) = 1;

LAB97:    t12 = (t13 + 4);
    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB98;

LAB99:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng9)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB105;

LAB102:    if (t18 != 0)
        goto LAB104;

LAB103:    *((unsigned int *)t13) = 1;

LAB105:    t12 = (t13 + 4);
    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB106;

LAB107:    xsi_set_current_line(94, ng0);

LAB110:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 3368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3368);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 3528);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3528);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);
    xsi_set_current_line(97, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB108:
LAB100:
LAB92:
LAB66:
LAB40:
LAB32:    goto LAB24;

LAB28:    t26 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB29;

LAB30:    xsi_set_current_line(68, ng0);

LAB33:    xsi_set_current_line(69, ng0);
    t33 = ((char*)((ng3)));
    t34 = (t0 + 3688);
    xsi_vlogvar_assign_value(t34, t33, 0, 0, 32);
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    t2 = (t0 + 2168U);
    t4 = *((char **)t2);
    xsi_vlog_unsigned_multiply(t35, 64, t3, 32, t4, 32);
    t2 = (t0 + 3528);
    xsi_vlogvar_assign_value(t2, t35, 0, 0, 32);
    t5 = (t0 + 3368);
    xsi_vlogvar_assign_value(t5, t35, 32, 0, 32);
    goto LAB32;

LAB36:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB37;

LAB38:    xsi_set_current_line(72, ng0);

LAB41:    xsi_set_current_line(73, ng0);
    t26 = ((char*)((ng3)));
    t27 = (t0 + 3688);
    xsi_vlogvar_assign_value(t27, t26, 0, 0, 32);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    xsi_vlogtype_sign_extend(t35, 64, t3, 32);
    t2 = (t0 + 2168U);
    t4 = *((char **)t2);
    xsi_vlogtype_sign_extend(t36, 64, t4, 32);
    xsi_vlog_signed_multiply(t37, 64, t35, 64, t36, 64);
    t2 = (t0 + 3528);
    xsi_vlogvar_assign_value(t2, t37, 0, 0, 32);
    t5 = (t0 + 3368);
    xsi_vlogvar_assign_value(t5, t37, 32, 0, 32);
    goto LAB40;

LAB44:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB45;

LAB46:    *((unsigned int *)t38) = 1;
    goto LAB49;

LAB48:    t26 = (t38 + 4);
    *((unsigned int *)t38) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB49;

LAB50:    t33 = (t0 + 2168U);
    t34 = *((char **)t33);
    t33 = ((char*)((ng1)));
    memset(t39, 0, 8);
    t40 = (t34 + 4);
    t41 = (t33 + 4);
    t31 = *((unsigned int *)t34);
    t32 = *((unsigned int *)t33);
    t42 = (t31 ^ t32);
    t43 = *((unsigned int *)t40);
    t44 = *((unsigned int *)t41);
    t45 = (t43 ^ t44);
    t46 = (t42 | t45);
    t47 = *((unsigned int *)t40);
    t48 = *((unsigned int *)t41);
    t49 = (t47 | t48);
    t50 = (~(t49));
    t51 = (t46 & t50);
    if (t51 != 0)
        goto LAB54;

LAB53:    if (t49 != 0)
        goto LAB55;

LAB56:    memset(t53, 0, 8);
    t54 = (t39 + 4);
    t55 = *((unsigned int *)t54);
    t56 = (~(t55));
    t57 = *((unsigned int *)t39);
    t58 = (t57 & t56);
    t59 = (t58 & 1U);
    if (t59 != 0)
        goto LAB57;

LAB58:    if (*((unsigned int *)t54) != 0)
        goto LAB59;

LAB60:    t62 = *((unsigned int *)t38);
    t63 = *((unsigned int *)t53);
    t64 = (t62 & t63);
    *((unsigned int *)t61) = t64;
    t65 = (t38 + 4);
    t66 = (t53 + 4);
    t67 = (t61 + 4);
    t68 = *((unsigned int *)t65);
    t69 = *((unsigned int *)t66);
    t70 = (t68 | t69);
    *((unsigned int *)t67) = t70;
    t71 = *((unsigned int *)t67);
    t72 = (t71 != 0);
    if (t72 == 1)
        goto LAB61;

LAB62:
LAB63:    goto LAB52;

LAB54:    *((unsigned int *)t39) = 1;
    goto LAB56;

LAB55:    t52 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t52) = 1;
    goto LAB56;

LAB57:    *((unsigned int *)t53) = 1;
    goto LAB60;

LAB59:    t60 = (t53 + 4);
    *((unsigned int *)t53) = 1;
    *((unsigned int *)t60) = 1;
    goto LAB60;

LAB61:    t73 = *((unsigned int *)t61);
    t74 = *((unsigned int *)t67);
    *((unsigned int *)t61) = (t73 | t74);
    t75 = (t38 + 4);
    t76 = (t53 + 4);
    t77 = *((unsigned int *)t38);
    t78 = (~(t77));
    t79 = *((unsigned int *)t75);
    t80 = (~(t79));
    t81 = *((unsigned int *)t53);
    t82 = (~(t81));
    t83 = *((unsigned int *)t76);
    t84 = (~(t83));
    t85 = (t78 & t80);
    t86 = (t82 & t84);
    t87 = (~(t85));
    t88 = (~(t86));
    t89 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t89 & t87);
    t90 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t90 & t88);
    t91 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t91 & t87);
    t92 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t92 & t88);
    goto LAB63;

LAB64:    xsi_set_current_line(76, ng0);

LAB67:    xsi_set_current_line(77, ng0);
    t99 = ((char*)((ng6)));
    t100 = (t0 + 3688);
    xsi_vlogvar_assign_value(t100, t99, 0, 0, 32);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    t2 = (t0 + 2168U);
    t4 = *((char **)t2);
    memset(t13, 0, 8);
    xsi_vlog_unsigned_mod(t13, 32, t3, 32, t4, 32);
    t2 = (t0 + 3368);
    xsi_vlogvar_assign_value(t2, t13, 0, 0, 32);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    t2 = (t0 + 2168U);
    t4 = *((char **)t2);
    memset(t13, 0, 8);
    xsi_vlog_unsigned_divide(t13, 32, t3, 32, t4, 32);
    t2 = (t0 + 3528);
    xsi_vlogvar_assign_value(t2, t13, 0, 0, 32);
    goto LAB66;

LAB70:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB71;

LAB72:    *((unsigned int *)t38) = 1;
    goto LAB75;

LAB74:    t26 = (t38 + 4);
    *((unsigned int *)t38) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB75;

LAB76:    t33 = (t0 + 2168U);
    t34 = *((char **)t33);
    t33 = ((char*)((ng1)));
    memset(t39, 0, 8);
    t40 = (t34 + 4);
    t41 = (t33 + 4);
    t31 = *((unsigned int *)t34);
    t32 = *((unsigned int *)t33);
    t42 = (t31 ^ t32);
    t43 = *((unsigned int *)t40);
    t44 = *((unsigned int *)t41);
    t45 = (t43 ^ t44);
    t46 = (t42 | t45);
    t47 = *((unsigned int *)t40);
    t48 = *((unsigned int *)t41);
    t49 = (t47 | t48);
    t50 = (~(t49));
    t51 = (t46 & t50);
    if (t51 != 0)
        goto LAB80;

LAB79:    if (t49 != 0)
        goto LAB81;

LAB82:    memset(t53, 0, 8);
    t54 = (t39 + 4);
    t55 = *((unsigned int *)t54);
    t56 = (~(t55));
    t57 = *((unsigned int *)t39);
    t58 = (t57 & t56);
    t59 = (t58 & 1U);
    if (t59 != 0)
        goto LAB83;

LAB84:    if (*((unsigned int *)t54) != 0)
        goto LAB85;

LAB86:    t62 = *((unsigned int *)t38);
    t63 = *((unsigned int *)t53);
    t64 = (t62 & t63);
    *((unsigned int *)t61) = t64;
    t65 = (t38 + 4);
    t66 = (t53 + 4);
    t67 = (t61 + 4);
    t68 = *((unsigned int *)t65);
    t69 = *((unsigned int *)t66);
    t70 = (t68 | t69);
    *((unsigned int *)t67) = t70;
    t71 = *((unsigned int *)t67);
    t72 = (t71 != 0);
    if (t72 == 1)
        goto LAB87;

LAB88:
LAB89:    goto LAB78;

LAB80:    *((unsigned int *)t39) = 1;
    goto LAB82;

LAB81:    t52 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t52) = 1;
    goto LAB82;

LAB83:    *((unsigned int *)t53) = 1;
    goto LAB86;

LAB85:    t60 = (t53 + 4);
    *((unsigned int *)t53) = 1;
    *((unsigned int *)t60) = 1;
    goto LAB86;

LAB87:    t73 = *((unsigned int *)t61);
    t74 = *((unsigned int *)t67);
    *((unsigned int *)t61) = (t73 | t74);
    t75 = (t38 + 4);
    t76 = (t53 + 4);
    t77 = *((unsigned int *)t38);
    t78 = (~(t77));
    t79 = *((unsigned int *)t75);
    t80 = (~(t79));
    t81 = *((unsigned int *)t53);
    t82 = (~(t81));
    t83 = *((unsigned int *)t76);
    t84 = (~(t83));
    t85 = (t78 & t80);
    t86 = (t82 & t84);
    t87 = (~(t85));
    t88 = (~(t86));
    t89 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t89 & t87);
    t90 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t90 & t88);
    t91 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t91 & t87);
    t92 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t92 & t88);
    goto LAB89;

LAB90:    xsi_set_current_line(81, ng0);

LAB93:    xsi_set_current_line(82, ng0);
    t99 = ((char*)((ng6)));
    t100 = (t0 + 3688);
    xsi_vlogvar_assign_value(t100, t99, 0, 0, 32);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    t2 = (t0 + 2168U);
    t4 = *((char **)t2);
    memset(t39, 0, 8);
    xsi_vlog_signed_mod(t39, 32, t3, 32, t4, 32);
    t2 = (t0 + 3368);
    xsi_vlogvar_assign_value(t2, t39, 0, 0, 32);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    t2 = (t0 + 2168U);
    t4 = *((char **)t2);
    memset(t39, 0, 8);
    xsi_vlog_signed_divide(t39, 32, t3, 32, t4, 32);
    t2 = (t0 + 3528);
    xsi_vlogvar_assign_value(t2, t39, 0, 0, 32);
    goto LAB92;

LAB96:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB97;

LAB98:    xsi_set_current_line(86, ng0);

LAB101:    xsi_set_current_line(87, ng0);
    t26 = ((char*)((ng3)));
    t27 = (t0 + 3688);
    xsi_vlogvar_assign_value(t27, t26, 0, 0, 32);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 3528);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3368);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    xsi_vlogtype_concat(t36, 64, 64, 2U, t12, 32, t4, 32);
    t26 = (t0 + 2008U);
    t27 = *((char **)t26);
    xsi_vlogtype_sign_extend(t37, 64, t27, 32);
    t26 = (t0 + 2168U);
    t33 = *((char **)t26);
    xsi_vlogtype_sign_extend(t101, 64, t33, 32);
    xsi_vlog_signed_multiply(t102, 64, t37, 64, t101, 64);
    xsi_vlog_signed_add(t103, 64, t36, 64, t102, 64);
    t26 = (t0 + 3528);
    xsi_vlogvar_assign_value(t26, t103, 0, 0, 32);
    t34 = (t0 + 3368);
    xsi_vlogvar_assign_value(t34, t103, 32, 0, 32);
    goto LAB100;

LAB104:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB105;

LAB106:    xsi_set_current_line(90, ng0);

LAB109:    xsi_set_current_line(91, ng0);
    t26 = ((char*)((ng3)));
    t27 = (t0 + 3688);
    xsi_vlogvar_assign_value(t27, t26, 0, 0, 32);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 3528);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3368);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    xsi_vlogtype_concat(t36, 64, 64, 2U, t12, 32, t4, 32);
    t26 = (t0 + 2008U);
    t27 = *((char **)t26);
    xsi_vlogtype_sign_extend(t37, 64, t27, 32);
    t26 = (t0 + 2168U);
    t33 = *((char **)t26);
    xsi_vlogtype_sign_extend(t101, 64, t33, 32);
    xsi_vlog_signed_multiply(t102, 64, t37, 64, t101, 64);
    xsi_vlog_signed_minus(t103, 64, t36, 64, t102, 64);
    t26 = (t0 + 3528);
    xsi_vlogvar_assign_value(t26, t103, 0, 0, 32);
    t34 = (t0 + 3368);
    xsi_vlogvar_assign_value(t34, t103, 32, 0, 32);
    goto LAB108;

LAB111:    *((unsigned int *)t38) = 1;
    goto LAB114;

LAB113:    t27 = (t38 + 4);
    *((unsigned int *)t38) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB114;

LAB115:    t34 = (t0 + 3688);
    t40 = (t34 + 56U);
    t41 = *((char **)t40);
    t52 = ((char*)((ng1)));
    memset(t39, 0, 8);
    xsi_vlog_signed_not_equal(t39, 32, t41, 32, t52, 32);
    memset(t53, 0, 8);
    t54 = (t39 + 4);
    t17 = *((unsigned int *)t54);
    t18 = (~(t17));
    t19 = *((unsigned int *)t39);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB118;

LAB119:    if (*((unsigned int *)t54) != 0)
        goto LAB120;

LAB121:    t22 = *((unsigned int *)t38);
    t23 = *((unsigned int *)t53);
    t24 = (t22 & t23);
    *((unsigned int *)t61) = t24;
    t65 = (t38 + 4);
    t66 = (t53 + 4);
    t67 = (t61 + 4);
    t25 = *((unsigned int *)t65);
    t28 = *((unsigned int *)t66);
    t29 = (t25 | t28);
    *((unsigned int *)t67) = t29;
    t30 = *((unsigned int *)t67);
    t31 = (t30 != 0);
    if (t31 == 1)
        goto LAB122;

LAB123:
LAB124:    goto LAB117;

LAB118:    *((unsigned int *)t53) = 1;
    goto LAB121;

LAB120:    t60 = (t53 + 4);
    *((unsigned int *)t53) = 1;
    *((unsigned int *)t60) = 1;
    goto LAB121;

LAB122:    t32 = *((unsigned int *)t61);
    t42 = *((unsigned int *)t67);
    *((unsigned int *)t61) = (t32 | t42);
    t75 = (t38 + 4);
    t76 = (t53 + 4);
    t43 = *((unsigned int *)t38);
    t44 = (~(t43));
    t45 = *((unsigned int *)t75);
    t46 = (~(t45));
    t47 = *((unsigned int *)t53);
    t48 = (~(t47));
    t49 = *((unsigned int *)t76);
    t50 = (~(t49));
    t85 = (t44 & t46);
    t86 = (t48 & t50);
    t51 = (~(t85));
    t55 = (~(t86));
    t56 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t56 & t51);
    t57 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t57 & t55);
    t58 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t58 & t51);
    t59 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t59 & t55);
    goto LAB124;

LAB125:    xsi_set_current_line(101, ng0);

LAB128:    xsi_set_current_line(102, ng0);
    t99 = (t0 + 3528);
    t100 = (t99 + 56U);
    t104 = *((char **)t100);
    t105 = (t0 + 3368);
    t106 = (t105 + 56U);
    t107 = *((char **)t106);
    xsi_vlogtype_concat(t35, 64, 64, 2U, t107, 32, t104, 32);
    t108 = (t0 + 3208);
    xsi_vlogvar_assign_value(t108, t35, 0, 0, 32);
    t109 = (t0 + 3048);
    xsi_vlogvar_assign_value(t109, t35, 32, 0, 32);
    xsi_set_current_line(103, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB127;

LAB129:    xsi_set_current_line(107, ng0);
    t12 = (t0 + 3848);
    t26 = (t12 + 56U);
    t27 = *((char **)t26);
    t33 = ((char*)((ng10)));
    memset(t38, 0, 8);
    xsi_vlog_signed_add(t38, 32, t27, 32, t33, 32);
    t34 = (t0 + 3848);
    xsi_vlogvar_assign_value(t34, t38, 0, 0, 32);
    goto LAB131;

}


extern void work_m_00000000001239921358_3866892262_init()
{
	static char *pe[] = {(void *)Initial_38_0,(void *)Cont_47_1,(void *)Cont_48_2,(void *)Cont_49_3,(void *)Always_51_4};
	xsi_register_didat("work_m_00000000001239921358_3866892262", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000001239921358_3866892262.didat");
	xsi_register_executes(pe);
}
