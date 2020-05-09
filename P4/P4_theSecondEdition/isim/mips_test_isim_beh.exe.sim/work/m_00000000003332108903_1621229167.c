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
static const char *ng0 = "D:/tongt/Desktop/P4/P4_theSecondEdition/GRF.v";
static int ng1[] = {0, 0};
static int ng2[] = {31, 0};
static int ng3[] = {1, 0};
static int ng4[] = {24, 0};
static int ng5[] = {8, 0};
static const char *ng6 = "@%h: $%d <= %h";
static unsigned int ng7[] = {0U, 0U};



static void Initial_38_0(char *t0)
{
    char t5[8];
    char t14[8];
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    int t27;
    char *t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    int t34;
    int t35;

LAB0:    xsi_set_current_line(38, ng0);

LAB2:    xsi_set_current_line(39, ng0);
    xsi_set_current_line(39, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3368);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB3:    t1 = (t0 + 3368);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng2)));
    memset(t5, 0, 8);
    xsi_vlog_signed_leq(t5, 32, t3, 32, t4, 32);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB4;

LAB5:
LAB1:    return;
LAB4:    xsi_set_current_line(39, ng0);

LAB6:    xsi_set_current_line(40, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 3208);
    t16 = (t0 + 3208);
    t17 = (t16 + 72U);
    t18 = *((char **)t17);
    t19 = (t0 + 3208);
    t20 = (t19 + 64U);
    t21 = *((char **)t20);
    t22 = (t0 + 3368);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    xsi_vlog_generic_convert_array_indices(t14, t15, t18, t21, 2, 1, t24, 32, 1);
    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t15 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    t31 = (t27 && t30);
    if (t31 == 1)
        goto LAB7;

LAB8:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 3368);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng3)));
    memset(t5, 0, 8);
    xsi_vlog_signed_add(t5, 32, t3, 32, t4, 32);
    t6 = (t0 + 3368);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 32);
    goto LAB3;

LAB7:    t32 = *((unsigned int *)t14);
    t33 = *((unsigned int *)t15);
    t34 = (t32 - t33);
    t35 = (t34 + 1);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, *((unsigned int *)t15), t35, 0LL);
    goto LAB8;

}

static void Always_44_1(char *t0)
{
    char t13[8];
    char t15[8];
    char t16[8];
    char t61[8];
    char t62[8];
    char t64[8];
    char t74[8];
    char t84[8];
    char t85[8];
    char t86[8];
    char t89[8];
    char t99[8];
    char t100[8];
    char t101[8];
    char t102[8];
    char t104[8];
    char t105[8];
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
    char *t14;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    int t28;
    char *t29;
    unsigned int t30;
    int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    int t35;
    int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
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
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t63;
    char *t65;
    char *t66;
    char *t67;
    char *t68;
    char *t69;
    char *t70;
    char *t71;
    char *t72;
    char *t73;
    char *t75;
    char *t76;
    char *t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t87;
    char *t88;
    char *t90;
    char *t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t103;
    char *t106;
    char *t107;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    unsigned int t114;
    char *t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;

LAB0:    t1 = (t0 + 4536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 5352);
    *((int *)t2) = 1;
    t3 = (t0 + 4568);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(44, ng0);

LAB5:    xsi_set_current_line(45, ng0);
    t4 = (t0 + 2488U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(50, ng0);

LAB16:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB17;

LAB18:
LAB19:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(45, ng0);

LAB9:    xsi_set_current_line(46, ng0);
    xsi_set_current_line(46, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3368);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);

LAB10:    t2 = (t0 + 3368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_signed_leq(t13, 32, t4, 32, t5, 32);
    t11 = (t13 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:    goto LAB8;

LAB11:    xsi_set_current_line(46, ng0);

LAB13:    xsi_set_current_line(47, ng0);
    t12 = ((char*)((ng1)));
    t14 = (t0 + 3208);
    t17 = (t0 + 3208);
    t18 = (t17 + 72U);
    t19 = *((char **)t18);
    t20 = (t0 + 3208);
    t21 = (t20 + 64U);
    t22 = *((char **)t21);
    t23 = (t0 + 3368);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    xsi_vlog_generic_convert_array_indices(t15, t16, t19, t22, 2, 1, t25, 32, 1);
    t26 = (t15 + 4);
    t27 = *((unsigned int *)t26);
    t28 = (!(t27));
    t29 = (t16 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (!(t30));
    t32 = (t28 && t31);
    if (t32 == 1)
        goto LAB14;

LAB15:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 3368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_signed_add(t13, 32, t4, 32, t5, 32);
    t11 = (t0 + 3368);
    xsi_vlogvar_assign_value(t11, t13, 0, 0, 32);
    goto LAB10;

LAB14:    t33 = *((unsigned int *)t15);
    t34 = *((unsigned int *)t16);
    t35 = (t33 - t34);
    t36 = (t35 + 1);
    xsi_vlogvar_wait_assign_value(t14, t12, 0, *((unsigned int *)t16), t36, 0LL);
    goto LAB15;

LAB17:    xsi_set_current_line(51, ng0);

LAB20:    xsi_set_current_line(52, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t13, 0, 8);
    t11 = (t5 + 4);
    t12 = (t4 + 4);
    t27 = *((unsigned int *)t5);
    t30 = *((unsigned int *)t4);
    t33 = (t27 ^ t30);
    t34 = *((unsigned int *)t11);
    t37 = *((unsigned int *)t12);
    t38 = (t34 ^ t37);
    t39 = (t33 | t38);
    t40 = *((unsigned int *)t11);
    t41 = *((unsigned int *)t12);
    t42 = (t40 | t41);
    t43 = (~(t42));
    t44 = (t39 & t43);
    if (t44 != 0)
        goto LAB22;

LAB21:    if (t42 != 0)
        goto LAB23;

LAB24:    t17 = (t13 + 4);
    t45 = *((unsigned int *)t17);
    t46 = (~(t45));
    t47 = *((unsigned int *)t13);
    t48 = (t47 & t46);
    t49 = (t48 != 0);
    if (t49 > 0)
        goto LAB25;

LAB26:
LAB27:    goto LAB19;

LAB22:    *((unsigned int *)t13) = 1;
    goto LAB24;

LAB23:    t14 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB24;

LAB25:    xsi_set_current_line(52, ng0);

LAB28:    xsi_set_current_line(53, ng0);
    t18 = (t0 + 2648U);
    t19 = *((char **)t18);
    t18 = (t19 + 4);
    t50 = *((unsigned int *)t18);
    t51 = (~(t50));
    t52 = *((unsigned int *)t19);
    t53 = (t52 & t51);
    t54 = (t53 != 0);
    if (t54 > 0)
        goto LAB29;

LAB30:    xsi_set_current_line(57, ng0);

LAB35:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    t2 = (t0 + 3208);
    t4 = (t0 + 3208);
    t5 = (t4 + 72U);
    t11 = *((char **)t5);
    t12 = (t0 + 3208);
    t14 = (t12 + 64U);
    t17 = *((char **)t14);
    t18 = (t0 + 1528U);
    t19 = *((char **)t18);
    xsi_vlog_generic_convert_array_indices(t13, t15, t11, t17, 2, 1, t19, 5, 2);
    t18 = (t13 + 4);
    t6 = *((unsigned int *)t18);
    t28 = (!(t6));
    t20 = (t15 + 4);
    t7 = *((unsigned int *)t20);
    t31 = (!(t7));
    t32 = (t28 && t31);
    if (t32 == 1)
        goto LAB36;

LAB37:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 1528U);
    t4 = *((char **)t2);
    t2 = (t0 + 2008U);
    t5 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng6, 4, t0, (char)118, t3, 32, (char)118, t4, 5, (char)118, t5, 32);

LAB31:    goto LAB27;

LAB29:    xsi_set_current_line(53, ng0);

LAB32:    xsi_set_current_line(54, ng0);
    t20 = (t0 + 2008U);
    t21 = *((char **)t20);
    t20 = ((char*)((ng4)));
    t22 = ((char*)((ng5)));
    t23 = (t0 + 2808U);
    t24 = *((char **)t23);
    memset(t15, 0, 8);
    t23 = (t15 + 4);
    t25 = (t24 + 4);
    t55 = *((unsigned int *)t24);
    t56 = (t55 >> 0);
    *((unsigned int *)t15) = t56;
    t57 = *((unsigned int *)t25);
    t58 = (t57 >> 0);
    *((unsigned int *)t23) = t58;
    t59 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t59 & 3U);
    t60 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t60 & 3U);
    memset(t16, 0, 8);
    xsi_vlog_unsigned_multiply(t16, 32, t22, 32, t15, 32);
    memset(t61, 0, 8);
    xsi_vlog_unsigned_minus(t61, 32, t20, 32, t16, 32);
    memset(t62, 0, 8);
    xsi_vlog_unsigned_lshift(t62, 32, t21, 32, t61, 32);
    t26 = (t0 + 3208);
    t29 = (t26 + 56U);
    t63 = *((char **)t29);
    t65 = (t0 + 3208);
    t66 = (t65 + 72U);
    t67 = *((char **)t66);
    t68 = (t0 + 3208);
    t69 = (t68 + 64U);
    t70 = *((char **)t69);
    t71 = (t0 + 1528U);
    t72 = *((char **)t71);
    xsi_vlog_generic_get_array_select_value(t64, 32, t63, t67, t70, 2, 1, t72, 5, 2);
    t71 = ((char*)((ng5)));
    t73 = ((char*)((ng5)));
    t75 = (t0 + 2808U);
    t76 = *((char **)t75);
    memset(t74, 0, 8);
    t75 = (t74 + 4);
    t77 = (t76 + 4);
    t78 = *((unsigned int *)t76);
    t79 = (t78 >> 0);
    *((unsigned int *)t74) = t79;
    t80 = *((unsigned int *)t77);
    t81 = (t80 >> 0);
    *((unsigned int *)t75) = t81;
    t82 = *((unsigned int *)t74);
    *((unsigned int *)t74) = (t82 & 3U);
    t83 = *((unsigned int *)t75);
    *((unsigned int *)t75) = (t83 & 3U);
    memset(t84, 0, 8);
    xsi_vlog_unsigned_multiply(t84, 32, t73, 32, t74, 32);
    memset(t85, 0, 8);
    xsi_vlog_unsigned_add(t85, 32, t71, 32, t84, 32);
    memset(t86, 0, 8);
    xsi_vlog_unsigned_lshift(t86, 32, t64, 32, t85, 32);
    t87 = ((char*)((ng5)));
    t88 = ((char*)((ng5)));
    t90 = (t0 + 2808U);
    t91 = *((char **)t90);
    memset(t89, 0, 8);
    t90 = (t89 + 4);
    t92 = (t91 + 4);
    t93 = *((unsigned int *)t91);
    t94 = (t93 >> 0);
    *((unsigned int *)t89) = t94;
    t95 = *((unsigned int *)t92);
    t96 = (t95 >> 0);
    *((unsigned int *)t90) = t96;
    t97 = *((unsigned int *)t89);
    *((unsigned int *)t89) = (t97 & 3U);
    t98 = *((unsigned int *)t90);
    *((unsigned int *)t90) = (t98 & 3U);
    memset(t99, 0, 8);
    xsi_vlog_unsigned_multiply(t99, 32, t88, 32, t89, 32);
    memset(t100, 0, 8);
    xsi_vlog_unsigned_add(t100, 32, t87, 32, t99, 32);
    memset(t101, 0, 8);
    xsi_vlog_unsigned_rshift(t101, 32, t86, 32, t100, 32);
    memset(t102, 0, 8);
    xsi_vlog_unsigned_add(t102, 32, t62, 32, t101, 32);
    t103 = (t0 + 3208);
    t106 = (t0 + 3208);
    t107 = (t106 + 72U);
    t108 = *((char **)t107);
    t109 = (t0 + 3208);
    t110 = (t109 + 64U);
    t111 = *((char **)t110);
    t112 = (t0 + 1528U);
    t113 = *((char **)t112);
    xsi_vlog_generic_convert_array_indices(t104, t105, t108, t111, 2, 1, t113, 5, 2);
    t112 = (t104 + 4);
    t114 = *((unsigned int *)t112);
    t28 = (!(t114));
    t115 = (t105 + 4);
    t116 = *((unsigned int *)t115);
    t31 = (!(t116));
    t32 = (t28 && t31);
    if (t32 == 1)
        goto LAB33;

LAB34:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 1528U);
    t4 = *((char **)t2);
    t2 = (t0 + 2008U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng4)));
    t11 = ((char*)((ng5)));
    t12 = (t0 + 2808U);
    t14 = *((char **)t12);
    memset(t13, 0, 8);
    t12 = (t13 + 4);
    t17 = (t14 + 4);
    t6 = *((unsigned int *)t14);
    t7 = (t6 >> 0);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t17);
    t9 = (t8 >> 0);
    *((unsigned int *)t12) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 3U);
    t27 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t27 & 3U);
    memset(t15, 0, 8);
    xsi_vlog_unsigned_multiply(t15, 32, t11, 32, t13, 32);
    memset(t16, 0, 8);
    xsi_vlog_unsigned_minus(t16, 32, t2, 32, t15, 32);
    memset(t61, 0, 8);
    xsi_vlog_unsigned_lshift(t61, 32, t5, 32, t16, 32);
    t18 = (t0 + 3208);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t0 + 3208);
    t22 = (t21 + 72U);
    t23 = *((char **)t22);
    t24 = (t0 + 3208);
    t25 = (t24 + 64U);
    t26 = *((char **)t25);
    t29 = (t0 + 1528U);
    t63 = *((char **)t29);
    xsi_vlog_generic_get_array_select_value(t62, 32, t20, t23, t26, 2, 1, t63, 5, 2);
    t29 = ((char*)((ng5)));
    t65 = ((char*)((ng5)));
    t66 = (t0 + 2808U);
    t67 = *((char **)t66);
    memset(t64, 0, 8);
    t66 = (t64 + 4);
    t68 = (t67 + 4);
    t30 = *((unsigned int *)t67);
    t33 = (t30 >> 0);
    *((unsigned int *)t64) = t33;
    t34 = *((unsigned int *)t68);
    t37 = (t34 >> 0);
    *((unsigned int *)t66) = t37;
    t38 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t38 & 3U);
    t39 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t39 & 3U);
    memset(t74, 0, 8);
    xsi_vlog_unsigned_multiply(t74, 32, t65, 32, t64, 32);
    memset(t84, 0, 8);
    xsi_vlog_unsigned_add(t84, 32, t29, 32, t74, 32);
    memset(t85, 0, 8);
    xsi_vlog_unsigned_lshift(t85, 32, t62, 32, t84, 32);
    t69 = ((char*)((ng5)));
    t70 = ((char*)((ng5)));
    t71 = (t0 + 2808U);
    t72 = *((char **)t71);
    memset(t86, 0, 8);
    t71 = (t86 + 4);
    t73 = (t72 + 4);
    t40 = *((unsigned int *)t72);
    t41 = (t40 >> 0);
    *((unsigned int *)t86) = t41;
    t42 = *((unsigned int *)t73);
    t43 = (t42 >> 0);
    *((unsigned int *)t71) = t43;
    t44 = *((unsigned int *)t86);
    *((unsigned int *)t86) = (t44 & 3U);
    t45 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t45 & 3U);
    memset(t89, 0, 8);
    xsi_vlog_unsigned_multiply(t89, 32, t70, 32, t86, 32);
    memset(t99, 0, 8);
    xsi_vlog_unsigned_add(t99, 32, t69, 32, t89, 32);
    memset(t100, 0, 8);
    xsi_vlog_unsigned_rshift(t100, 32, t85, 32, t99, 32);
    memset(t101, 0, 8);
    xsi_vlog_unsigned_add(t101, 32, t61, 32, t100, 32);
    xsi_vlogfile_write(1, 0, 0, ng6, 4, t0, (char)118, t3, 32, (char)118, t4, 5, (char)118, t101, 32);
    goto LAB31;

LAB33:    t117 = *((unsigned int *)t104);
    t118 = *((unsigned int *)t105);
    t35 = (t117 - t118);
    t36 = (t35 + 1);
    xsi_vlogvar_wait_assign_value(t103, t102, 0, *((unsigned int *)t105), t36, 0LL);
    goto LAB34;

LAB36:    t8 = *((unsigned int *)t13);
    t9 = *((unsigned int *)t15);
    t35 = (t8 - t9);
    t36 = (t35 + 1);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, *((unsigned int *)t15), t36, 0LL);
    goto LAB37;

}

static void Cont_66_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t41[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;

LAB0:    t1 = (t0 + 4784U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 1208U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t41, 8);

LAB20:    t48 = (t0 + 5464);
    t50 = (t48 + 56U);
    t51 = *((char **)t50);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    memcpy(t53, t3, 8);
    xsi_driver_vfirst_trans(t48, 0, 31);
    t54 = (t0 + 5368);
    *((int *)t54) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = ((char*)((ng7)));
    goto LAB13;

LAB14:    t38 = (t0 + 3208);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t42 = (t0 + 3208);
    t43 = (t42 + 72U);
    t44 = *((char **)t43);
    t45 = (t0 + 3208);
    t46 = (t45 + 64U);
    t47 = *((char **)t46);
    t48 = (t0 + 1208U);
    t49 = *((char **)t48);
    xsi_vlog_generic_get_array_select_value(t41, 32, t40, t44, t47, 2, 1, t49, 5, 2);
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t33, 32, t41, 32);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

}

static void Cont_67_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t41[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;

LAB0:    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1368U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t41, 8);

LAB20:    t48 = (t0 + 5528);
    t50 = (t48 + 56U);
    t51 = *((char **)t50);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    memcpy(t53, t3, 8);
    xsi_driver_vfirst_trans(t48, 0, 31);
    t54 = (t0 + 5384);
    *((int *)t54) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = ((char*)((ng7)));
    goto LAB13;

LAB14:    t38 = (t0 + 3208);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t42 = (t0 + 3208);
    t43 = (t42 + 72U);
    t44 = *((char **)t43);
    t45 = (t0 + 3208);
    t46 = (t45 + 64U);
    t47 = *((char **)t46);
    t48 = (t0 + 1368U);
    t49 = *((char **)t48);
    xsi_vlog_generic_get_array_select_value(t41, 32, t40, t44, t47, 2, 1, t49, 5, 2);
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t33, 32, t41, 32);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

}


extern void work_m_00000000003332108903_1621229167_init()
{
	static char *pe[] = {(void *)Initial_38_0,(void *)Always_44_1,(void *)Cont_66_2,(void *)Cont_67_3};
	xsi_register_didat("work_m_00000000003332108903_1621229167", "isim/mips_test_isim_beh.exe.sim/work/m_00000000003332108903_1621229167.didat");
	xsi_register_executes(pe);
}
