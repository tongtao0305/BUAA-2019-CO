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
    work_m_00000000001603827729_4144471541_init();
    work_m_00000000002245524404_1621229167_init();
    work_m_00000000002581521982_1785967555_init();
    work_m_00000000002448932126_1925314211_init();
    work_m_00000000002920396607_0757879789_init();
    work_m_00000000003750473421_0103510313_init();
    work_m_00000000004216728810_3873618783_init();
    work_m_00000000000001682717_0886308060_init();
    work_m_00000000003138427577_4024466370_init();
    work_m_00000000000190119713_2879604271_init();
    work_m_00000000000111036629_2924402094_init();
    work_m_00000000000777878755_2520395732_init();
    work_m_00000000000224314844_1854812841_init();
    work_m_00000000001183339389_1354824867_init();
    work_m_00000000000541651123_2634845136_init();
    work_m_00000000003246791685_2539103599_init();
    work_m_00000000001007986020_1894250474_init();
    work_m_00000000003576418787_3877310806_init();
    work_m_00000000002047498008_0116314407_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002047498008_0116314407");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
