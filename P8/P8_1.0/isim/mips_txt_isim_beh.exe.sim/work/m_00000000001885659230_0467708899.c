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
static const char *ng0 = "D:/tongt/Desktop/P8/P8_1.0/IM.v";
static const char *ng1 = "code.txt";
static const char *ng2 = "code_handler.txt";
static int ng3[] = {1120, 0};
static int ng4[] = {2047, 0};
static unsigned int ng5[] = {0U, 0U};
static unsigned int ng6[] = {8191U, 0U};



static void Initial_30_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    xsi_set_current_line(30, ng0);

LAB2:    xsi_set_current_line(31, ng0);
    t1 = (t0 + 1608);
    xsi_vlogfile_readmemh(ng1, 0, t1, 0, 0, 0, 0);
    xsi_set_current_line(32, ng0);
    t1 = (t0 + 1608);
    t2 = ((char*)((ng3)));
    t3 = ((char*)((ng4)));
    xsi_vlogfile_readmemh(ng2, 0, t1, 1, *((unsigned int *)t2), 1, *((unsigned int *)t3));

LAB1:    return;
}

static void Cont_36_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t5[8];
    char t15[8];
    char t34[8];
    char t37[8];
    char t71[8];
    char t75[8];
    char t121[8];
    char t128[8];
    char *t1;
    char *t2;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t35;
    char *t36;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    int t61;
    int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    char *t70;
    char *t72;
    char *t73;
    char *t74;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;
    char *t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    int t99;
    int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    char *t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    char *t113;
    char *t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    char *t118;
    char *t119;
    char *t120;
    char *t122;
    char *t123;
    char *t124;
    char *t125;
    char *t126;
    char *t127;
    char *t129;
    char *t130;
    char *t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    char *t142;
    char *t143;
    char *t144;
    char *t145;
    char *t146;
    char *t147;
    char *t148;

LAB0:    t1 = (t0 + 2776U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1048U);
    t6 = *((char **)t2);
    memset(t5, 0, 8);
    t2 = (t5 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 0);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t2) = t11;
    t12 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t12 & 3U);
    t13 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t13 & 3U);
    t14 = ((char*)((ng5)));
    memset(t15, 0, 8);
    t16 = (t5 + 4);
    t17 = (t14 + 4);
    t18 = *((unsigned int *)t5);
    t19 = *((unsigned int *)t14);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t16);
    t22 = *((unsigned int *)t17);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t16);
    t26 = *((unsigned int *)t17);
    t27 = (t25 | t26);
    t28 = (~(t27));
    t29 = (t24 & t28);
    if (t29 != 0)
        goto LAB7;

LAB4:    if (t27 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t15) = 1;

LAB7:    t31 = ((char*)((ng5)));
    t32 = (t0 + 1048U);
    t33 = *((char **)t32);
    memset(t34, 0, 8);
    t32 = (t31 + 4);
    if (*((unsigned int *)t32) != 0)
        goto LAB9;

LAB8:    t35 = (t33 + 4);
    if (*((unsigned int *)t35) != 0)
        goto LAB9;

LAB12:    if (*((unsigned int *)t31) > *((unsigned int *)t33))
        goto LAB11;

LAB10:    *((unsigned int *)t34) = 1;

LAB11:    t38 = *((unsigned int *)t15);
    t39 = *((unsigned int *)t34);
    t40 = (t38 & t39);
    *((unsigned int *)t37) = t40;
    t41 = (t15 + 4);
    t42 = (t34 + 4);
    t43 = (t37 + 4);
    t44 = *((unsigned int *)t41);
    t45 = *((unsigned int *)t42);
    t46 = (t44 | t45);
    *((unsigned int *)t43) = t46;
    t47 = *((unsigned int *)t43);
    t48 = (t47 != 0);
    if (t48 == 1)
        goto LAB13;

LAB14:
LAB15:    t69 = (t0 + 1048U);
    t70 = *((char **)t69);
    t69 = ((char*)((ng6)));
    memset(t71, 0, 8);
    t72 = (t70 + 4);
    if (*((unsigned int *)t72) != 0)
        goto LAB17;

LAB16:    t73 = (t69 + 4);
    if (*((unsigned int *)t73) != 0)
        goto LAB17;

LAB20:    if (*((unsigned int *)t70) > *((unsigned int *)t69))
        goto LAB19;

LAB18:    *((unsigned int *)t71) = 1;

LAB19:    t76 = *((unsigned int *)t37);
    t77 = *((unsigned int *)t71);
    t78 = (t76 & t77);
    *((unsigned int *)t75) = t78;
    t79 = (t37 + 4);
    t80 = (t71 + 4);
    t81 = (t75 + 4);
    t82 = *((unsigned int *)t79);
    t83 = *((unsigned int *)t80);
    t84 = (t82 | t83);
    *((unsigned int *)t81) = t84;
    t85 = *((unsigned int *)t81);
    t86 = (t85 != 0);
    if (t86 == 1)
        goto LAB21;

LAB22:
LAB23:    memset(t4, 0, 8);
    t107 = (t75 + 4);
    t108 = *((unsigned int *)t107);
    t109 = (~(t108));
    t110 = *((unsigned int *)t75);
    t111 = (t110 & t109);
    t112 = (t111 & 1U);
    if (t112 != 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t107) != 0)
        goto LAB26;

LAB27:    t114 = (t4 + 4);
    t115 = *((unsigned int *)t4);
    t116 = *((unsigned int *)t114);
    t117 = (t115 || t116);
    if (t117 > 0)
        goto LAB28;

LAB29:    t138 = *((unsigned int *)t4);
    t139 = (~(t138));
    t140 = *((unsigned int *)t114);
    t141 = (t139 || t140);
    if (t141 > 0)
        goto LAB30;

LAB31:    if (*((unsigned int *)t114) > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t4) > 0)
        goto LAB34;

LAB35:    memcpy(t3, t142, 8);

LAB36:    t143 = (t0 + 3176);
    t144 = (t143 + 56U);
    t145 = *((char **)t144);
    t146 = (t145 + 56U);
    t147 = *((char **)t146);
    memcpy(t147, t3, 8);
    xsi_driver_vfirst_trans(t143, 0, 31);
    t148 = (t0 + 3096);
    *((int *)t148) = 1;

LAB1:    return;
LAB6:    t30 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB7;

LAB9:    t36 = (t34 + 4);
    *((unsigned int *)t34) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB11;

LAB13:    t49 = *((unsigned int *)t37);
    t50 = *((unsigned int *)t43);
    *((unsigned int *)t37) = (t49 | t50);
    t51 = (t15 + 4);
    t52 = (t34 + 4);
    t53 = *((unsigned int *)t15);
    t54 = (~(t53));
    t55 = *((unsigned int *)t51);
    t56 = (~(t55));
    t57 = *((unsigned int *)t34);
    t58 = (~(t57));
    t59 = *((unsigned int *)t52);
    t60 = (~(t59));
    t61 = (t54 & t56);
    t62 = (t58 & t60);
    t63 = (~(t61));
    t64 = (~(t62));
    t65 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t65 & t63);
    t66 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t66 & t64);
    t67 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t67 & t63);
    t68 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t68 & t64);
    goto LAB15;

LAB17:    t74 = (t71 + 4);
    *((unsigned int *)t71) = 1;
    *((unsigned int *)t74) = 1;
    goto LAB19;

LAB21:    t87 = *((unsigned int *)t75);
    t88 = *((unsigned int *)t81);
    *((unsigned int *)t75) = (t87 | t88);
    t89 = (t37 + 4);
    t90 = (t71 + 4);
    t91 = *((unsigned int *)t37);
    t92 = (~(t91));
    t93 = *((unsigned int *)t89);
    t94 = (~(t93));
    t95 = *((unsigned int *)t71);
    t96 = (~(t95));
    t97 = *((unsigned int *)t90);
    t98 = (~(t97));
    t99 = (t92 & t94);
    t100 = (t96 & t98);
    t101 = (~(t99));
    t102 = (~(t100));
    t103 = *((unsigned int *)t81);
    *((unsigned int *)t81) = (t103 & t101);
    t104 = *((unsigned int *)t81);
    *((unsigned int *)t81) = (t104 & t102);
    t105 = *((unsigned int *)t75);
    *((unsigned int *)t75) = (t105 & t101);
    t106 = *((unsigned int *)t75);
    *((unsigned int *)t75) = (t106 & t102);
    goto LAB23;

LAB24:    *((unsigned int *)t4) = 1;
    goto LAB27;

LAB26:    t113 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t113) = 1;
    goto LAB27;

LAB28:    t118 = (t0 + 1608);
    t119 = (t118 + 56U);
    t120 = *((char **)t119);
    t122 = (t0 + 1608);
    t123 = (t122 + 72U);
    t124 = *((char **)t123);
    t125 = (t0 + 1608);
    t126 = (t125 + 64U);
    t127 = *((char **)t126);
    t129 = (t0 + 1048U);
    t130 = *((char **)t129);
    memset(t128, 0, 8);
    t129 = (t128 + 4);
    t131 = (t130 + 4);
    t132 = *((unsigned int *)t130);
    t133 = (t132 >> 2);
    *((unsigned int *)t128) = t133;
    t134 = *((unsigned int *)t131);
    t135 = (t134 >> 2);
    *((unsigned int *)t129) = t135;
    t136 = *((unsigned int *)t128);
    *((unsigned int *)t128) = (t136 & 4095U);
    t137 = *((unsigned int *)t129);
    *((unsigned int *)t129) = (t137 & 4095U);
    xsi_vlog_generic_get_array_select_value(t121, 32, t120, t124, t127, 2, 1, t128, 12, 2);
    goto LAB29;

LAB30:    t142 = ((char*)((ng5)));
    goto LAB31;

LAB32:    xsi_vlog_unsigned_bit_combine(t3, 32, t121, 32, t142, 32);
    goto LAB36;

LAB34:    memcpy(t3, t121, 8);
    goto LAB36;

}


extern void work_m_00000000001885659230_0467708899_init()
{
	static char *pe[] = {(void *)Initial_30_0,(void *)Cont_36_1};
	xsi_register_didat("work_m_00000000001885659230_0467708899", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000001885659230_0467708899.didat");
	xsi_register_executes(pe);
}
