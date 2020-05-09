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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002302201024_1733832700_init();
    work_m_00000000001885659230_0467708899_init();
    work_m_00000000002200649239_0345418465_init();
    work_m_00000000001303762448_4144471541_init();
    work_m_00000000000070899347_3075639595_init();
    work_m_00000000002245524404_1621229167_init();
    work_m_00000000002581521982_1785967555_init();
    work_m_00000000001243314046_1925314211_init();
    work_m_00000000002920396607_0757879789_init();
    work_m_00000000002379352028_1854812841_init();
    work_m_00000000002205256980_0103510313_init();
    work_m_00000000001205063155_3873618783_init();
    work_m_00000000000001682717_0886308060_init();
    work_m_00000000000070801828_4024466370_init();
    work_m_00000000002468228778_2879604271_init();
    work_m_00000000000111036629_2924402094_init();
    work_m_00000000002464907515_2520395732_init();
    work_m_00000000001183339389_1354824867_init();
    work_m_00000000002533912340_2539103599_init();
    work_m_00000000002983658800_1894250474_init();
    work_m_00000000003518429051_3877310806_init();
    work_m_00000000002047498008_0116314407_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002047498008_0116314407");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}