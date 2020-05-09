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
static const char *ng0 = "D:/tongt/Desktop/P8/P8_4.0/ALU.v";
static int ng1[] = {12, 0};
static int ng2[] = {0, 0};
static int ng3[] = {4, 0};
static int ng4[] = {5, 0};
static unsigned int ng5[] = {0U, 0U};
static unsigned int ng6[] = {1U, 0U};
static unsigned int ng7[] = {2U, 0U};
static unsigned int ng8[] = {3U, 0U};
static unsigned int ng9[] = {4U, 0U};
static unsigned int ng10[] = {5U, 0U};
static unsigned int ng11[] = {6U, 0U};
static unsigned int ng12[] = {7U, 0U};
static unsigned int ng13[] = {8U, 0U};
static unsigned int ng14[] = {9U, 0U};
static unsigned int ng15[] = {10U, 0U};
static unsigned int ng16[] = {11U, 0U};
static unsigned int ng17[] = {12U, 0U};
static unsigned int ng18[] = {13U, 0U};



static void Cont_36_0(char *t0)
{
    char t3[16];
    char t6[8];
    char t14[16];
    char t18[8];
    char t26[16];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t15;
    char *t16;
    char *t17;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;

LAB0:    t1 = (t0 + 4128U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1048U);
    t4 = *((char **)t2);
    t2 = (t0 + 1048U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 31);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 31);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    xsi_vlogtype_concat(t3, 33, 33, 2U, t6, 1, t4, 32);
    t15 = (t0 + 1208U);
    t16 = *((char **)t15);
    t15 = (t0 + 1208U);
    t17 = *((char **)t15);
    memset(t18, 0, 8);
    t15 = (t18 + 4);
    t19 = (t17 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 31);
    t22 = (t21 & 1);
    *((unsigned int *)t18) = t22;
    t23 = *((unsigned int *)t19);
    t24 = (t23 >> 31);
    t25 = (t24 & 1);
    *((unsigned int *)t15) = t25;
    xsi_vlogtype_concat(t14, 33, 33, 2U, t18, 1, t16, 32);
    xsi_vlog_unsigned_add(t26, 33, t3, 33, t14, 33);
    t27 = (t0 + 5320);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    xsi_vlog_bit_copy(t31, 0, t26, 0, 33);
    xsi_driver_vfirst_trans(t27, 0, 32);
    t32 = (t0 + 5192);
    *((int *)t32) = 1;

LAB1:    return;
}

static void Cont_37_1(char *t0)
{
    char t3[16];
    char t6[8];
    char t14[16];
    char t18[8];
    char t26[16];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t15;
    char *t16;
    char *t17;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;

LAB0:    t1 = (t0 + 4376U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1048U);
    t4 = *((char **)t2);
    t2 = (t0 + 1048U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 31);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 31);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    xsi_vlogtype_concat(t3, 33, 33, 2U, t6, 1, t4, 32);
    t15 = (t0 + 1208U);
    t16 = *((char **)t15);
    t15 = (t0 + 1208U);
    t17 = *((char **)t15);
    memset(t18, 0, 8);
    t15 = (t18 + 4);
    t19 = (t17 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 31);
    t22 = (t21 & 1);
    *((unsigned int *)t18) = t22;
    t23 = *((unsigned int *)t19);
    t24 = (t23 >> 31);
    t25 = (t24 & 1);
    *((unsigned int *)t15) = t25;
    xsi_vlogtype_concat(t14, 33, 33, 2U, t18, 1, t16, 32);
    xsi_vlog_unsigned_minus(t26, 33, t3, 33, t14, 33);
    t27 = (t0 + 5384);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    xsi_vlog_bit_copy(t31, 0, t26, 0, 33);
    xsi_driver_vfirst_trans(t27, 0, 32);
    t32 = (t0 + 5208);
    *((int *)t32) = 1;

LAB1:    return;
}

static void Cont_38_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t7[8];
    char t36[8];
    char t47[8];
    char t55[8];
    char t71[8];
    char t106[8];
    char t117[8];
    char t125[8];
    char t141[8];
    char t173[8];
    char t217[8];
    char t218[8];
    char t221[8];
    char t227[8];
    char t238[8];
    char t246[8];
    char t262[8];
    char t310[8];
    char t311[8];
    char t314[8];
    char t320[8];
    char t331[8];
    char t339[8];
    char t355[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t56;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    char *t76;
    char *t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    char *t85;
    char *t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    int t95;
    int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    char *t104;
    char *t105;
    char *t107;
    char *t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    char *t115;
    char *t116;
    char *t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    char *t126;
    char *t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    char *t140;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    char *t146;
    char *t147;
    unsigned int t148;
    unsigned int t149;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    unsigned int t154;
    char *t155;
    char *t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    unsigned int t160;
    unsigned int t161;
    unsigned int t162;
    unsigned int t163;
    unsigned int t164;
    int t165;
    int t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t174;
    unsigned int t175;
    unsigned int t176;
    char *t177;
    char *t178;
    char *t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    unsigned int t183;
    unsigned int t184;
    unsigned int t185;
    unsigned int t186;
    char *t187;
    char *t188;
    unsigned int t189;
    unsigned int t190;
    unsigned int t191;
    int t192;
    unsigned int t193;
    unsigned int t194;
    unsigned int t195;
    int t196;
    unsigned int t197;
    unsigned int t198;
    unsigned int t199;
    unsigned int t200;
    char *t201;
    unsigned int t202;
    unsigned int t203;
    unsigned int t204;
    unsigned int t205;
    unsigned int t206;
    char *t207;
    char *t208;
    unsigned int t209;
    unsigned int t210;
    unsigned int t211;
    char *t212;
    unsigned int t213;
    unsigned int t214;
    unsigned int t215;
    unsigned int t216;
    char *t219;
    char *t220;
    char *t222;
    char *t223;
    char *t224;
    char *t225;
    char *t226;
    char *t228;
    char *t229;
    unsigned int t230;
    unsigned int t231;
    unsigned int t232;
    unsigned int t233;
    unsigned int t234;
    unsigned int t235;
    char *t236;
    char *t237;
    char *t239;
    unsigned int t240;
    unsigned int t241;
    unsigned int t242;
    unsigned int t243;
    unsigned int t244;
    unsigned int t245;
    char *t247;
    char *t248;
    unsigned int t249;
    unsigned int t250;
    unsigned int t251;
    unsigned int t252;
    unsigned int t253;
    unsigned int t254;
    unsigned int t255;
    unsigned int t256;
    unsigned int t257;
    unsigned int t258;
    unsigned int t259;
    unsigned int t260;
    char *t261;
    unsigned int t263;
    unsigned int t264;
    unsigned int t265;
    char *t266;
    char *t267;
    char *t268;
    unsigned int t269;
    unsigned int t270;
    unsigned int t271;
    unsigned int t272;
    unsigned int t273;
    unsigned int t274;
    unsigned int t275;
    char *t276;
    char *t277;
    unsigned int t278;
    unsigned int t279;
    unsigned int t280;
    unsigned int t281;
    unsigned int t282;
    unsigned int t283;
    unsigned int t284;
    unsigned int t285;
    int t286;
    int t287;
    unsigned int t288;
    unsigned int t289;
    unsigned int t290;
    unsigned int t291;
    unsigned int t292;
    unsigned int t293;
    char *t294;
    unsigned int t295;
    unsigned int t296;
    unsigned int t297;
    unsigned int t298;
    unsigned int t299;
    char *t300;
    char *t301;
    unsigned int t302;
    unsigned int t303;
    unsigned int t304;
    char *t305;
    unsigned int t306;
    unsigned int t307;
    unsigned int t308;
    unsigned int t309;
    char *t312;
    char *t313;
    char *t315;
    char *t316;
    char *t317;
    char *t318;
    char *t319;
    char *t321;
    char *t322;
    unsigned int t323;
    unsigned int t324;
    unsigned int t325;
    unsigned int t326;
    unsigned int t327;
    unsigned int t328;
    char *t329;
    char *t330;
    char *t332;
    unsigned int t333;
    unsigned int t334;
    unsigned int t335;
    unsigned int t336;
    unsigned int t337;
    unsigned int t338;
    char *t340;
    char *t341;
    unsigned int t342;
    unsigned int t343;
    unsigned int t344;
    unsigned int t345;
    unsigned int t346;
    unsigned int t347;
    unsigned int t348;
    unsigned int t349;
    unsigned int t350;
    unsigned int t351;
    unsigned int t352;
    unsigned int t353;
    char *t354;
    unsigned int t356;
    unsigned int t357;
    unsigned int t358;
    char *t359;
    char *t360;
    char *t361;
    unsigned int t362;
    unsigned int t363;
    unsigned int t364;
    unsigned int t365;
    unsigned int t366;
    unsigned int t367;
    unsigned int t368;
    char *t369;
    char *t370;
    unsigned int t371;
    unsigned int t372;
    unsigned int t373;
    unsigned int t374;
    unsigned int t375;
    unsigned int t376;
    unsigned int t377;
    unsigned int t378;
    int t379;
    int t380;
    unsigned int t381;
    unsigned int t382;
    unsigned int t383;
    unsigned int t384;
    unsigned int t385;
    unsigned int t386;
    char *t387;
    unsigned int t388;
    unsigned int t389;
    unsigned int t390;
    unsigned int t391;
    unsigned int t392;
    char *t393;
    char *t394;
    unsigned int t395;
    unsigned int t396;
    unsigned int t397;
    char *t398;
    unsigned int t399;
    unsigned int t400;
    unsigned int t401;
    unsigned int t402;
    char *t403;
    char *t404;
    char *t405;
    char *t406;
    char *t407;
    char *t408;
    unsigned int t409;
    unsigned int t410;
    char *t411;
    unsigned int t412;
    unsigned int t413;
    char *t414;
    unsigned int t415;
    unsigned int t416;
    char *t417;

LAB0:    t1 = (t0 + 4624U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1848U);
    t5 = *((char **)t2);
    t2 = (t0 + 2008U);
    t6 = *((char **)t2);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t6);
    t10 = (t8 | t9);
    *((unsigned int *)t7) = t10;
    t2 = (t5 + 4);
    t11 = (t6 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t2);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB4;

LAB5:
LAB6:    t34 = (t0 + 2648U);
    t35 = *((char **)t34);
    memset(t36, 0, 8);
    t34 = (t36 + 4);
    t37 = (t35 + 8);
    t38 = (t35 + 12);
    t39 = *((unsigned int *)t37);
    t40 = (t39 >> 0);
    t41 = (t40 & 1);
    *((unsigned int *)t36) = t41;
    t42 = *((unsigned int *)t38);
    t43 = (t42 >> 0);
    t44 = (t43 & 1);
    *((unsigned int *)t34) = t44;
    t45 = (t0 + 2648U);
    t46 = *((char **)t45);
    memset(t47, 0, 8);
    t45 = (t47 + 4);
    t48 = (t46 + 4);
    t49 = *((unsigned int *)t46);
    t50 = (t49 >> 31);
    t51 = (t50 & 1);
    *((unsigned int *)t47) = t51;
    t52 = *((unsigned int *)t48);
    t53 = (t52 >> 31);
    t54 = (t53 & 1);
    *((unsigned int *)t45) = t54;
    memset(t55, 0, 8);
    t56 = (t36 + 4);
    t57 = (t47 + 4);
    t58 = *((unsigned int *)t36);
    t59 = *((unsigned int *)t47);
    t60 = (t58 ^ t59);
    t61 = *((unsigned int *)t56);
    t62 = *((unsigned int *)t57);
    t63 = (t61 ^ t62);
    t64 = (t60 | t63);
    t65 = *((unsigned int *)t56);
    t66 = *((unsigned int *)t57);
    t67 = (t65 | t66);
    t68 = (~(t67));
    t69 = (t64 & t68);
    if (t69 != 0)
        goto LAB8;

LAB7:    if (t67 != 0)
        goto LAB9;

LAB10:    t72 = *((unsigned int *)t7);
    t73 = *((unsigned int *)t55);
    t74 = (t72 & t73);
    *((unsigned int *)t71) = t74;
    t75 = (t7 + 4);
    t76 = (t55 + 4);
    t77 = (t71 + 4);
    t78 = *((unsigned int *)t75);
    t79 = *((unsigned int *)t76);
    t80 = (t78 | t79);
    *((unsigned int *)t77) = t80;
    t81 = *((unsigned int *)t77);
    t82 = (t81 != 0);
    if (t82 == 1)
        goto LAB11;

LAB12:
LAB13:    t103 = (t0 + 2168U);
    t104 = *((char **)t103);
    t103 = (t0 + 2808U);
    t105 = *((char **)t103);
    memset(t106, 0, 8);
    t103 = (t106 + 4);
    t107 = (t105 + 8);
    t108 = (t105 + 12);
    t109 = *((unsigned int *)t107);
    t110 = (t109 >> 0);
    t111 = (t110 & 1);
    *((unsigned int *)t106) = t111;
    t112 = *((unsigned int *)t108);
    t113 = (t112 >> 0);
    t114 = (t113 & 1);
    *((unsigned int *)t103) = t114;
    t115 = (t0 + 2808U);
    t116 = *((char **)t115);
    memset(t117, 0, 8);
    t115 = (t117 + 4);
    t118 = (t116 + 4);
    t119 = *((unsigned int *)t116);
    t120 = (t119 >> 31);
    t121 = (t120 & 1);
    *((unsigned int *)t117) = t121;
    t122 = *((unsigned int *)t118);
    t123 = (t122 >> 31);
    t124 = (t123 & 1);
    *((unsigned int *)t115) = t124;
    memset(t125, 0, 8);
    t126 = (t106 + 4);
    t127 = (t117 + 4);
    t128 = *((unsigned int *)t106);
    t129 = *((unsigned int *)t117);
    t130 = (t128 ^ t129);
    t131 = *((unsigned int *)t126);
    t132 = *((unsigned int *)t127);
    t133 = (t131 ^ t132);
    t134 = (t130 | t133);
    t135 = *((unsigned int *)t126);
    t136 = *((unsigned int *)t127);
    t137 = (t135 | t136);
    t138 = (~(t137));
    t139 = (t134 & t138);
    if (t139 != 0)
        goto LAB15;

LAB14:    if (t137 != 0)
        goto LAB16;

LAB17:    t142 = *((unsigned int *)t104);
    t143 = *((unsigned int *)t125);
    t144 = (t142 & t143);
    *((unsigned int *)t141) = t144;
    t145 = (t104 + 4);
    t146 = (t125 + 4);
    t147 = (t141 + 4);
    t148 = *((unsigned int *)t145);
    t149 = *((unsigned int *)t146);
    t150 = (t148 | t149);
    *((unsigned int *)t147) = t150;
    t151 = *((unsigned int *)t147);
    t152 = (t151 != 0);
    if (t152 == 1)
        goto LAB18;

LAB19:
LAB20:    t174 = *((unsigned int *)t71);
    t175 = *((unsigned int *)t141);
    t176 = (t174 | t175);
    *((unsigned int *)t173) = t176;
    t177 = (t71 + 4);
    t178 = (t141 + 4);
    t179 = (t173 + 4);
    t180 = *((unsigned int *)t177);
    t181 = *((unsigned int *)t178);
    t182 = (t180 | t181);
    *((unsigned int *)t179) = t182;
    t183 = *((unsigned int *)t179);
    t184 = (t183 != 0);
    if (t184 == 1)
        goto LAB21;

LAB22:
LAB23:    memset(t4, 0, 8);
    t201 = (t173 + 4);
    t202 = *((unsigned int *)t201);
    t203 = (~(t202));
    t204 = *((unsigned int *)t173);
    t205 = (t204 & t203);
    t206 = (t205 & 1U);
    if (t206 != 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t201) != 0)
        goto LAB26;

LAB27:    t208 = (t4 + 4);
    t209 = *((unsigned int *)t4);
    t210 = *((unsigned int *)t208);
    t211 = (t209 || t210);
    if (t211 > 0)
        goto LAB28;

LAB29:    t213 = *((unsigned int *)t4);
    t214 = (~(t213));
    t215 = *((unsigned int *)t208);
    t216 = (t214 || t215);
    if (t216 > 0)
        goto LAB30;

LAB31:    if (*((unsigned int *)t208) > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t4) > 0)
        goto LAB34;

LAB35:    memcpy(t3, t217, 8);

LAB36:    t404 = (t0 + 5448);
    t405 = (t404 + 56U);
    t406 = *((char **)t405);
    t407 = (t406 + 56U);
    t408 = *((char **)t407);
    memset(t408, 0, 8);
    t409 = 31U;
    t410 = t409;
    t411 = (t3 + 4);
    t412 = *((unsigned int *)t3);
    t409 = (t409 & t412);
    t413 = *((unsigned int *)t411);
    t410 = (t410 & t413);
    t414 = (t408 + 4);
    t415 = *((unsigned int *)t408);
    *((unsigned int *)t408) = (t415 | t409);
    t416 = *((unsigned int *)t414);
    *((unsigned int *)t414) = (t416 | t410);
    xsi_driver_vfirst_trans(t404, 0, 4);
    t417 = (t0 + 5224);
    *((int *)t417) = 1;

LAB1:    return;
LAB4:    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t7) = (t18 | t19);
    t20 = (t5 + 4);
    t21 = (t6 + 4);
    t22 = *((unsigned int *)t20);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = *((unsigned int *)t21);
    t27 = (~(t26));
    t28 = *((unsigned int *)t6);
    t29 = (t28 & t27);
    t30 = (~(t25));
    t31 = (~(t29));
    t32 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t32 & t30);
    t33 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t33 & t31);
    goto LAB6;

LAB8:    *((unsigned int *)t55) = 1;
    goto LAB10;

LAB9:    t70 = (t55 + 4);
    *((unsigned int *)t55) = 1;
    *((unsigned int *)t70) = 1;
    goto LAB10;

LAB11:    t83 = *((unsigned int *)t71);
    t84 = *((unsigned int *)t77);
    *((unsigned int *)t71) = (t83 | t84);
    t85 = (t7 + 4);
    t86 = (t55 + 4);
    t87 = *((unsigned int *)t7);
    t88 = (~(t87));
    t89 = *((unsigned int *)t85);
    t90 = (~(t89));
    t91 = *((unsigned int *)t55);
    t92 = (~(t91));
    t93 = *((unsigned int *)t86);
    t94 = (~(t93));
    t95 = (t88 & t90);
    t96 = (t92 & t94);
    t97 = (~(t95));
    t98 = (~(t96));
    t99 = *((unsigned int *)t77);
    *((unsigned int *)t77) = (t99 & t97);
    t100 = *((unsigned int *)t77);
    *((unsigned int *)t77) = (t100 & t98);
    t101 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t101 & t97);
    t102 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t102 & t98);
    goto LAB13;

LAB15:    *((unsigned int *)t125) = 1;
    goto LAB17;

LAB16:    t140 = (t125 + 4);
    *((unsigned int *)t125) = 1;
    *((unsigned int *)t140) = 1;
    goto LAB17;

LAB18:    t153 = *((unsigned int *)t141);
    t154 = *((unsigned int *)t147);
    *((unsigned int *)t141) = (t153 | t154);
    t155 = (t104 + 4);
    t156 = (t125 + 4);
    t157 = *((unsigned int *)t104);
    t158 = (~(t157));
    t159 = *((unsigned int *)t155);
    t160 = (~(t159));
    t161 = *((unsigned int *)t125);
    t162 = (~(t161));
    t163 = *((unsigned int *)t156);
    t164 = (~(t163));
    t165 = (t158 & t160);
    t166 = (t162 & t164);
    t167 = (~(t165));
    t168 = (~(t166));
    t169 = *((unsigned int *)t147);
    *((unsigned int *)t147) = (t169 & t167);
    t170 = *((unsigned int *)t147);
    *((unsigned int *)t147) = (t170 & t168);
    t171 = *((unsigned int *)t141);
    *((unsigned int *)t141) = (t171 & t167);
    t172 = *((unsigned int *)t141);
    *((unsigned int *)t141) = (t172 & t168);
    goto LAB20;

LAB21:    t185 = *((unsigned int *)t173);
    t186 = *((unsigned int *)t179);
    *((unsigned int *)t173) = (t185 | t186);
    t187 = (t71 + 4);
    t188 = (t141 + 4);
    t189 = *((unsigned int *)t187);
    t190 = (~(t189));
    t191 = *((unsigned int *)t71);
    t192 = (t191 & t190);
    t193 = *((unsigned int *)t188);
    t194 = (~(t193));
    t195 = *((unsigned int *)t141);
    t196 = (t195 & t194);
    t197 = (~(t192));
    t198 = (~(t196));
    t199 = *((unsigned int *)t179);
    *((unsigned int *)t179) = (t199 & t197);
    t200 = *((unsigned int *)t179);
    *((unsigned int *)t179) = (t200 & t198);
    goto LAB23;

LAB24:    *((unsigned int *)t4) = 1;
    goto LAB27;

LAB26:    t207 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t207) = 1;
    goto LAB27;

LAB28:    t212 = ((char*)((ng1)));
    goto LAB29;

LAB30:    t219 = (t0 + 2328U);
    t220 = *((char **)t219);
    t219 = ((char*)((ng2)));
    memset(t221, 0, 8);
    t222 = (t220 + 4);
    if (*((unsigned int *)t222) != 0)
        goto LAB38;

LAB37:    t223 = (t219 + 4);
    if (*((unsigned int *)t223) != 0)
        goto LAB38;

LAB41:    if (*((unsigned int *)t220) > *((unsigned int *)t219))
        goto LAB39;

LAB40:    t225 = (t0 + 2648U);
    t226 = *((char **)t225);
    memset(t227, 0, 8);
    t225 = (t227 + 4);
    t228 = (t226 + 8);
    t229 = (t226 + 12);
    t230 = *((unsigned int *)t228);
    t231 = (t230 >> 0);
    t232 = (t231 & 1);
    *((unsigned int *)t227) = t232;
    t233 = *((unsigned int *)t229);
    t234 = (t233 >> 0);
    t235 = (t234 & 1);
    *((unsigned int *)t225) = t235;
    t236 = (t0 + 2648U);
    t237 = *((char **)t236);
    memset(t238, 0, 8);
    t236 = (t238 + 4);
    t239 = (t237 + 4);
    t240 = *((unsigned int *)t237);
    t241 = (t240 >> 31);
    t242 = (t241 & 1);
    *((unsigned int *)t238) = t242;
    t243 = *((unsigned int *)t239);
    t244 = (t243 >> 31);
    t245 = (t244 & 1);
    *((unsigned int *)t236) = t245;
    memset(t246, 0, 8);
    t247 = (t227 + 4);
    t248 = (t238 + 4);
    t249 = *((unsigned int *)t227);
    t250 = *((unsigned int *)t238);
    t251 = (t249 ^ t250);
    t252 = *((unsigned int *)t247);
    t253 = *((unsigned int *)t248);
    t254 = (t252 ^ t253);
    t255 = (t251 | t254);
    t256 = *((unsigned int *)t247);
    t257 = *((unsigned int *)t248);
    t258 = (t256 | t257);
    t259 = (~(t258));
    t260 = (t255 & t259);
    if (t260 != 0)
        goto LAB43;

LAB42:    if (t258 != 0)
        goto LAB44;

LAB45:    t263 = *((unsigned int *)t221);
    t264 = *((unsigned int *)t246);
    t265 = (t263 & t264);
    *((unsigned int *)t262) = t265;
    t266 = (t221 + 4);
    t267 = (t246 + 4);
    t268 = (t262 + 4);
    t269 = *((unsigned int *)t266);
    t270 = *((unsigned int *)t267);
    t271 = (t269 | t270);
    *((unsigned int *)t268) = t271;
    t272 = *((unsigned int *)t268);
    t273 = (t272 != 0);
    if (t273 == 1)
        goto LAB46;

LAB47:
LAB48:    memset(t218, 0, 8);
    t294 = (t262 + 4);
    t295 = *((unsigned int *)t294);
    t296 = (~(t295));
    t297 = *((unsigned int *)t262);
    t298 = (t297 & t296);
    t299 = (t298 & 1U);
    if (t299 != 0)
        goto LAB49;

LAB50:    if (*((unsigned int *)t294) != 0)
        goto LAB51;

LAB52:    t301 = (t218 + 4);
    t302 = *((unsigned int *)t218);
    t303 = *((unsigned int *)t301);
    t304 = (t302 || t303);
    if (t304 > 0)
        goto LAB53;

LAB54:    t306 = *((unsigned int *)t218);
    t307 = (~(t306));
    t308 = *((unsigned int *)t301);
    t309 = (t307 || t308);
    if (t309 > 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t301) > 0)
        goto LAB57;

LAB58:    if (*((unsigned int *)t218) > 0)
        goto LAB59;

LAB60:    memcpy(t217, t310, 8);

LAB61:    goto LAB31;

LAB32:    xsi_vlog_unsigned_bit_combine(t3, 32, t212, 32, t217, 32);
    goto LAB36;

LAB34:    memcpy(t3, t212, 8);
    goto LAB36;

LAB38:    t224 = (t221 + 4);
    *((unsigned int *)t221) = 1;
    *((unsigned int *)t224) = 1;
    goto LAB40;

LAB39:    *((unsigned int *)t221) = 1;
    goto LAB40;

LAB43:    *((unsigned int *)t246) = 1;
    goto LAB45;

LAB44:    t261 = (t246 + 4);
    *((unsigned int *)t246) = 1;
    *((unsigned int *)t261) = 1;
    goto LAB45;

LAB46:    t274 = *((unsigned int *)t262);
    t275 = *((unsigned int *)t268);
    *((unsigned int *)t262) = (t274 | t275);
    t276 = (t221 + 4);
    t277 = (t246 + 4);
    t278 = *((unsigned int *)t221);
    t279 = (~(t278));
    t280 = *((unsigned int *)t276);
    t281 = (~(t280));
    t282 = *((unsigned int *)t246);
    t283 = (~(t282));
    t284 = *((unsigned int *)t277);
    t285 = (~(t284));
    t286 = (t279 & t281);
    t287 = (t283 & t285);
    t288 = (~(t286));
    t289 = (~(t287));
    t290 = *((unsigned int *)t268);
    *((unsigned int *)t268) = (t290 & t288);
    t291 = *((unsigned int *)t268);
    *((unsigned int *)t268) = (t291 & t289);
    t292 = *((unsigned int *)t262);
    *((unsigned int *)t262) = (t292 & t288);
    t293 = *((unsigned int *)t262);
    *((unsigned int *)t262) = (t293 & t289);
    goto LAB48;

LAB49:    *((unsigned int *)t218) = 1;
    goto LAB52;

LAB51:    t300 = (t218 + 4);
    *((unsigned int *)t218) = 1;
    *((unsigned int *)t300) = 1;
    goto LAB52;

LAB53:    t305 = ((char*)((ng3)));
    goto LAB54;

LAB55:    t312 = (t0 + 2488U);
    t313 = *((char **)t312);
    t312 = ((char*)((ng2)));
    memset(t314, 0, 8);
    t315 = (t313 + 4);
    if (*((unsigned int *)t315) != 0)
        goto LAB63;

LAB62:    t316 = (t312 + 4);
    if (*((unsigned int *)t316) != 0)
        goto LAB63;

LAB66:    if (*((unsigned int *)t313) > *((unsigned int *)t312))
        goto LAB64;

LAB65:    t318 = (t0 + 2648U);
    t319 = *((char **)t318);
    memset(t320, 0, 8);
    t318 = (t320 + 4);
    t321 = (t319 + 8);
    t322 = (t319 + 12);
    t323 = *((unsigned int *)t321);
    t324 = (t323 >> 0);
    t325 = (t324 & 1);
    *((unsigned int *)t320) = t325;
    t326 = *((unsigned int *)t322);
    t327 = (t326 >> 0);
    t328 = (t327 & 1);
    *((unsigned int *)t318) = t328;
    t329 = (t0 + 2648U);
    t330 = *((char **)t329);
    memset(t331, 0, 8);
    t329 = (t331 + 4);
    t332 = (t330 + 4);
    t333 = *((unsigned int *)t330);
    t334 = (t333 >> 31);
    t335 = (t334 & 1);
    *((unsigned int *)t331) = t335;
    t336 = *((unsigned int *)t332);
    t337 = (t336 >> 31);
    t338 = (t337 & 1);
    *((unsigned int *)t329) = t338;
    memset(t339, 0, 8);
    t340 = (t320 + 4);
    t341 = (t331 + 4);
    t342 = *((unsigned int *)t320);
    t343 = *((unsigned int *)t331);
    t344 = (t342 ^ t343);
    t345 = *((unsigned int *)t340);
    t346 = *((unsigned int *)t341);
    t347 = (t345 ^ t346);
    t348 = (t344 | t347);
    t349 = *((unsigned int *)t340);
    t350 = *((unsigned int *)t341);
    t351 = (t349 | t350);
    t352 = (~(t351));
    t353 = (t348 & t352);
    if (t353 != 0)
        goto LAB68;

LAB67:    if (t351 != 0)
        goto LAB69;

LAB70:    t356 = *((unsigned int *)t314);
    t357 = *((unsigned int *)t339);
    t358 = (t356 & t357);
    *((unsigned int *)t355) = t358;
    t359 = (t314 + 4);
    t360 = (t339 + 4);
    t361 = (t355 + 4);
    t362 = *((unsigned int *)t359);
    t363 = *((unsigned int *)t360);
    t364 = (t362 | t363);
    *((unsigned int *)t361) = t364;
    t365 = *((unsigned int *)t361);
    t366 = (t365 != 0);
    if (t366 == 1)
        goto LAB71;

LAB72:
LAB73:    memset(t311, 0, 8);
    t387 = (t355 + 4);
    t388 = *((unsigned int *)t387);
    t389 = (~(t388));
    t390 = *((unsigned int *)t355);
    t391 = (t390 & t389);
    t392 = (t391 & 1U);
    if (t392 != 0)
        goto LAB74;

LAB75:    if (*((unsigned int *)t387) != 0)
        goto LAB76;

LAB77:    t394 = (t311 + 4);
    t395 = *((unsigned int *)t311);
    t396 = *((unsigned int *)t394);
    t397 = (t395 || t396);
    if (t397 > 0)
        goto LAB78;

LAB79:    t399 = *((unsigned int *)t311);
    t400 = (~(t399));
    t401 = *((unsigned int *)t394);
    t402 = (t400 || t401);
    if (t402 > 0)
        goto LAB80;

LAB81:    if (*((unsigned int *)t394) > 0)
        goto LAB82;

LAB83:    if (*((unsigned int *)t311) > 0)
        goto LAB84;

LAB85:    memcpy(t310, t403, 8);

LAB86:    goto LAB56;

LAB57:    xsi_vlog_unsigned_bit_combine(t217, 32, t305, 32, t310, 32);
    goto LAB61;

LAB59:    memcpy(t217, t305, 8);
    goto LAB61;

LAB63:    t317 = (t314 + 4);
    *((unsigned int *)t314) = 1;
    *((unsigned int *)t317) = 1;
    goto LAB65;

LAB64:    *((unsigned int *)t314) = 1;
    goto LAB65;

LAB68:    *((unsigned int *)t339) = 1;
    goto LAB70;

LAB69:    t354 = (t339 + 4);
    *((unsigned int *)t339) = 1;
    *((unsigned int *)t354) = 1;
    goto LAB70;

LAB71:    t367 = *((unsigned int *)t355);
    t368 = *((unsigned int *)t361);
    *((unsigned int *)t355) = (t367 | t368);
    t369 = (t314 + 4);
    t370 = (t339 + 4);
    t371 = *((unsigned int *)t314);
    t372 = (~(t371));
    t373 = *((unsigned int *)t369);
    t374 = (~(t373));
    t375 = *((unsigned int *)t339);
    t376 = (~(t375));
    t377 = *((unsigned int *)t370);
    t378 = (~(t377));
    t379 = (t372 & t374);
    t380 = (t376 & t378);
    t381 = (~(t379));
    t382 = (~(t380));
    t383 = *((unsigned int *)t361);
    *((unsigned int *)t361) = (t383 & t381);
    t384 = *((unsigned int *)t361);
    *((unsigned int *)t361) = (t384 & t382);
    t385 = *((unsigned int *)t355);
    *((unsigned int *)t355) = (t385 & t381);
    t386 = *((unsigned int *)t355);
    *((unsigned int *)t355) = (t386 & t382);
    goto LAB73;

LAB74:    *((unsigned int *)t311) = 1;
    goto LAB77;

LAB76:    t393 = (t311 + 4);
    *((unsigned int *)t311) = 1;
    *((unsigned int *)t393) = 1;
    goto LAB77;

LAB78:    t398 = ((char*)((ng4)));
    goto LAB79;

LAB80:    t403 = ((char*)((ng2)));
    goto LAB81;

LAB82:    xsi_vlog_unsigned_bit_combine(t310, 32, t398, 32, t403, 32);
    goto LAB86;

LAB84:    memcpy(t310, t398, 8);
    goto LAB86;

}

static void Always_42_3(char *t0)
{
    char t10[8];
    char t40[8];
    char t41[8];
    char t64[8];
    char t95[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
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
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    int t87;
    int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    char *t100;
    char *t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    char *t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    char *t123;

LAB0:    t1 = (t0 + 4872U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 5240);
    *((int *)t2) = 1;
    t3 = (t0 + 4904);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(42, ng0);

LAB5:    xsi_set_current_line(43, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t4, 4);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng16)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng17)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng18)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB33;

LAB34:
LAB36:
LAB35:    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB37:    goto LAB2;

LAB7:    xsi_set_current_line(44, ng0);
    t7 = (t0 + 1048U);
    t8 = *((char **)t7);
    t7 = (t0 + 1208U);
    t9 = *((char **)t7);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_add(t10, 32, t8, 32, t9, 32);
    t7 = (t0 + 3208);
    xsi_vlogvar_assign_value(t7, t10, 0, 0, 32);
    goto LAB37;

LAB9:    xsi_set_current_line(45, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_minus(t10, 32, t4, 32, t7, 32);
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t10, 0, 0, 32);
    goto LAB37;

LAB11:    xsi_set_current_line(46, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t7);
    t13 = (t11 & t12);
    *((unsigned int *)t10) = t13;
    t3 = (t4 + 4);
    t8 = (t7 + 4);
    t9 = (t10 + 4);
    t14 = *((unsigned int *)t3);
    t15 = *((unsigned int *)t8);
    t16 = (t14 | t15);
    *((unsigned int *)t9) = t16;
    t17 = *((unsigned int *)t9);
    t18 = (t17 != 0);
    if (t18 == 1)
        goto LAB38;

LAB39:
LAB40:    t39 = (t0 + 3208);
    xsi_vlogvar_assign_value(t39, t10, 0, 0, 32);
    goto LAB37;

LAB13:    xsi_set_current_line(47, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t7);
    t13 = (t11 | t12);
    *((unsigned int *)t10) = t13;
    t3 = (t4 + 4);
    t8 = (t7 + 4);
    t9 = (t10 + 4);
    t14 = *((unsigned int *)t3);
    t15 = *((unsigned int *)t8);
    t16 = (t14 | t15);
    *((unsigned int *)t9) = t16;
    t17 = *((unsigned int *)t9);
    t18 = (t17 != 0);
    if (t18 == 1)
        goto LAB41;

LAB42:
LAB43:    t39 = (t0 + 3208);
    xsi_vlogvar_assign_value(t39, t10, 0, 0, 32);
    goto LAB37;

LAB15:    xsi_set_current_line(48, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 1368U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_lshift(t10, 32, t4, 32, t7, 5);
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t10, 0, 0, 32);
    goto LAB37;

LAB17:    xsi_set_current_line(49, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 1368U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_rshift(t10, 32, t4, 32, t7, 5);
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t10, 0, 0, 32);
    goto LAB37;

LAB19:    xsi_set_current_line(50, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 1368U);
    t7 = *((char **)t3);
    memset(t40, 0, 8);
    xsi_vlog_signed_arith_rshift(t40, 32, t4, 32, t7, 5);
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t40, 0, 0, 32);
    goto LAB37;

LAB21:    xsi_set_current_line(51, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 1048U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t10 + 4);
    t8 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t10) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 0);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t15 & 31U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 31U);
    memset(t40, 0, 8);
    xsi_vlog_unsigned_lshift(t40, 32, t4, 32, t10, 5);
    t9 = (t0 + 3208);
    xsi_vlogvar_assign_value(t9, t40, 0, 0, 32);
    goto LAB37;

LAB23:    xsi_set_current_line(52, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 1048U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t10 + 4);
    t8 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t10) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 0);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t15 & 31U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 31U);
    memset(t40, 0, 8);
    xsi_vlog_unsigned_rshift(t40, 32, t4, 32, t10, 5);
    t9 = (t0 + 3208);
    xsi_vlogvar_assign_value(t9, t40, 0, 0, 32);
    goto LAB37;

LAB25:    xsi_set_current_line(53, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 1048U);
    t7 = *((char **)t3);
    memset(t40, 0, 8);
    t3 = (t40 + 4);
    t8 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t40) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 0);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t15 & 31U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 31U);
    memset(t41, 0, 8);
    xsi_vlog_signed_arith_rshift(t41, 32, t4, 32, t40, 5);
    t9 = (t0 + 3208);
    xsi_vlogvar_assign_value(t9, t41, 0, 0, 32);
    goto LAB37;

LAB27:    xsi_set_current_line(54, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t10 + 4);
    t8 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (~(t11));
    *((unsigned int *)t10) = t12;
    *((unsigned int *)t3) = 0;
    if (*((unsigned int *)t8) != 0)
        goto LAB45;

LAB44:    t17 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t17 & 4294967295U);
    t18 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t18 & 4294967295U);
    t19 = *((unsigned int *)t4);
    t20 = *((unsigned int *)t10);
    t23 = (t19 & t20);
    *((unsigned int *)t40) = t23;
    t9 = (t4 + 4);
    t21 = (t10 + 4);
    t22 = (t40 + 4);
    t24 = *((unsigned int *)t9);
    t25 = *((unsigned int *)t21);
    t26 = (t24 | t25);
    *((unsigned int *)t22) = t26;
    t27 = *((unsigned int *)t22);
    t28 = (t27 != 0);
    if (t28 == 1)
        goto LAB46;

LAB47:
LAB48:    t51 = (t0 + 1048U);
    t52 = *((char **)t51);
    memset(t41, 0, 8);
    t51 = (t41 + 4);
    t53 = (t52 + 4);
    t54 = *((unsigned int *)t52);
    t55 = (~(t54));
    *((unsigned int *)t41) = t55;
    *((unsigned int *)t51) = 0;
    if (*((unsigned int *)t53) != 0)
        goto LAB50;

LAB49:    t60 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t60 & 4294967295U);
    t61 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t61 & 4294967295U);
    t62 = (t0 + 1208U);
    t63 = *((char **)t62);
    t65 = *((unsigned int *)t41);
    t66 = *((unsigned int *)t63);
    t67 = (t65 & t66);
    *((unsigned int *)t64) = t67;
    t62 = (t41 + 4);
    t68 = (t63 + 4);
    t69 = (t64 + 4);
    t70 = *((unsigned int *)t62);
    t71 = *((unsigned int *)t68);
    t72 = (t70 | t71);
    *((unsigned int *)t69) = t72;
    t73 = *((unsigned int *)t69);
    t74 = (t73 != 0);
    if (t74 == 1)
        goto LAB51;

LAB52:
LAB53:    t96 = *((unsigned int *)t40);
    t97 = *((unsigned int *)t64);
    t98 = (t96 | t97);
    *((unsigned int *)t95) = t98;
    t99 = (t40 + 4);
    t100 = (t64 + 4);
    t101 = (t95 + 4);
    t102 = *((unsigned int *)t99);
    t103 = *((unsigned int *)t100);
    t104 = (t102 | t103);
    *((unsigned int *)t101) = t104;
    t105 = *((unsigned int *)t101);
    t106 = (t105 != 0);
    if (t106 == 1)
        goto LAB54;

LAB55:
LAB56:    t123 = (t0 + 3208);
    xsi_vlogvar_assign_value(t123, t95, 0, 0, 32);
    goto LAB37;

LAB29:    xsi_set_current_line(55, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t7);
    t13 = (t11 | t12);
    *((unsigned int *)t40) = t13;
    t3 = (t4 + 4);
    t8 = (t7 + 4);
    t9 = (t40 + 4);
    t14 = *((unsigned int *)t3);
    t15 = *((unsigned int *)t8);
    t16 = (t14 | t15);
    *((unsigned int *)t9) = t16;
    t17 = *((unsigned int *)t9);
    t18 = (t17 != 0);
    if (t18 == 1)
        goto LAB57;

LAB58:
LAB59:    memset(t10, 0, 8);
    t39 = (t10 + 4);
    t42 = (t40 + 4);
    t35 = *((unsigned int *)t40);
    t36 = (~(t35));
    *((unsigned int *)t10) = t36;
    *((unsigned int *)t39) = 0;
    if (*((unsigned int *)t42) != 0)
        goto LAB61;

LAB60:    t45 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t45 & 4294967295U);
    t46 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t46 & 4294967295U);
    t51 = (t0 + 3208);
    xsi_vlogvar_assign_value(t51, t10, 0, 0, 32);
    goto LAB37;

LAB31:    xsi_set_current_line(56, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    memset(t41, 0, 8);
    xsi_vlog_signed_less(t41, 32, t4, 32, t7, 32);
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t41, 0, 0, 32);
    goto LAB37;

LAB33:    xsi_set_current_line(57, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t4 + 4);
    if (*((unsigned int *)t3) != 0)
        goto LAB63;

LAB62:    t8 = (t7 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB63;

LAB66:    if (*((unsigned int *)t4) < *((unsigned int *)t7))
        goto LAB64;

LAB65:    t21 = (t0 + 3208);
    xsi_vlogvar_assign_value(t21, t10, 0, 0, 32);
    goto LAB37;

LAB38:    t19 = *((unsigned int *)t10);
    t20 = *((unsigned int *)t9);
    *((unsigned int *)t10) = (t19 | t20);
    t21 = (t4 + 4);
    t22 = (t7 + 4);
    t23 = *((unsigned int *)t4);
    t24 = (~(t23));
    t25 = *((unsigned int *)t21);
    t26 = (~(t25));
    t27 = *((unsigned int *)t7);
    t28 = (~(t27));
    t29 = *((unsigned int *)t22);
    t30 = (~(t29));
    t31 = (t24 & t26);
    t32 = (t28 & t30);
    t33 = (~(t31));
    t34 = (~(t32));
    t35 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t35 & t33);
    t36 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t36 & t34);
    t37 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t37 & t33);
    t38 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t38 & t34);
    goto LAB40;

LAB41:    t19 = *((unsigned int *)t10);
    t20 = *((unsigned int *)t9);
    *((unsigned int *)t10) = (t19 | t20);
    t21 = (t4 + 4);
    t22 = (t7 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t31 = (t25 & t24);
    t26 = *((unsigned int *)t22);
    t27 = (~(t26));
    t28 = *((unsigned int *)t7);
    t32 = (t28 & t27);
    t29 = (~(t31));
    t30 = (~(t32));
    t33 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t33 & t29);
    t34 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t34 & t30);
    goto LAB43;

LAB45:    t13 = *((unsigned int *)t10);
    t14 = *((unsigned int *)t8);
    *((unsigned int *)t10) = (t13 | t14);
    t15 = *((unsigned int *)t3);
    t16 = *((unsigned int *)t8);
    *((unsigned int *)t3) = (t15 | t16);
    goto LAB44;

LAB46:    t29 = *((unsigned int *)t40);
    t30 = *((unsigned int *)t22);
    *((unsigned int *)t40) = (t29 | t30);
    t39 = (t4 + 4);
    t42 = (t10 + 4);
    t33 = *((unsigned int *)t4);
    t34 = (~(t33));
    t35 = *((unsigned int *)t39);
    t36 = (~(t35));
    t37 = *((unsigned int *)t10);
    t38 = (~(t37));
    t43 = *((unsigned int *)t42);
    t44 = (~(t43));
    t31 = (t34 & t36);
    t32 = (t38 & t44);
    t45 = (~(t31));
    t46 = (~(t32));
    t47 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t47 & t45);
    t48 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t48 & t46);
    t49 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t49 & t45);
    t50 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t50 & t46);
    goto LAB48;

LAB50:    t56 = *((unsigned int *)t41);
    t57 = *((unsigned int *)t53);
    *((unsigned int *)t41) = (t56 | t57);
    t58 = *((unsigned int *)t51);
    t59 = *((unsigned int *)t53);
    *((unsigned int *)t51) = (t58 | t59);
    goto LAB49;

LAB51:    t75 = *((unsigned int *)t64);
    t76 = *((unsigned int *)t69);
    *((unsigned int *)t64) = (t75 | t76);
    t77 = (t41 + 4);
    t78 = (t63 + 4);
    t79 = *((unsigned int *)t41);
    t80 = (~(t79));
    t81 = *((unsigned int *)t77);
    t82 = (~(t81));
    t83 = *((unsigned int *)t63);
    t84 = (~(t83));
    t85 = *((unsigned int *)t78);
    t86 = (~(t85));
    t87 = (t80 & t82);
    t88 = (t84 & t86);
    t89 = (~(t87));
    t90 = (~(t88));
    t91 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t91 & t89);
    t92 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t92 & t90);
    t93 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t93 & t89);
    t94 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t94 & t90);
    goto LAB53;

LAB54:    t107 = *((unsigned int *)t95);
    t108 = *((unsigned int *)t101);
    *((unsigned int *)t95) = (t107 | t108);
    t109 = (t40 + 4);
    t110 = (t64 + 4);
    t111 = *((unsigned int *)t109);
    t112 = (~(t111));
    t113 = *((unsigned int *)t40);
    t114 = (t113 & t112);
    t115 = *((unsigned int *)t110);
    t116 = (~(t115));
    t117 = *((unsigned int *)t64);
    t118 = (t117 & t116);
    t119 = (~(t114));
    t120 = (~(t118));
    t121 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t121 & t119);
    t122 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t122 & t120);
    goto LAB56;

LAB57:    t19 = *((unsigned int *)t40);
    t20 = *((unsigned int *)t9);
    *((unsigned int *)t40) = (t19 | t20);
    t21 = (t4 + 4);
    t22 = (t7 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t31 = (t25 & t24);
    t26 = *((unsigned int *)t22);
    t27 = (~(t26));
    t28 = *((unsigned int *)t7);
    t32 = (t28 & t27);
    t29 = (~(t31));
    t30 = (~(t32));
    t33 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t33 & t29);
    t34 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t34 & t30);
    goto LAB59;

LAB61:    t37 = *((unsigned int *)t10);
    t38 = *((unsigned int *)t42);
    *((unsigned int *)t10) = (t37 | t38);
    t43 = *((unsigned int *)t39);
    t44 = *((unsigned int *)t42);
    *((unsigned int *)t39) = (t43 | t44);
    goto LAB60;

LAB63:    t9 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB65;

LAB64:    *((unsigned int *)t10) = 1;
    goto LAB65;

}


extern void work_m_00000000000204827430_0886308060_init()
{
	static char *pe[] = {(void *)Cont_36_0,(void *)Cont_37_1,(void *)Cont_38_2,(void *)Always_42_3};
	xsi_register_didat("work_m_00000000000204827430_0886308060", "isim/mips_isim_beh.exe.sim/work/m_00000000000204827430_0886308060.didat");
	xsi_register_executes(pe);
}
