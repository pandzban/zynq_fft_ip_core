/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_11(char*, char *);
extern void execute_13(char*, char *);
extern void execute_14(char*, char *);
extern void execute_16(char*, char *);
extern void execute_111(char*, char *);
extern void execute_112(char*, char *);
extern void execute_113(char*, char *);
extern void execute_114(char*, char *);
extern void execute_23(char*, char *);
extern void execute_25(char*, char *);
extern void execute_101(char*, char *);
extern void execute_104(char*, char *);
extern void vlog_simple_process_execute_1_fast_for_reg(char*, char*, char*);
extern void execute_19(char*, char *);
extern void execute_20(char*, char *);
extern void execute_109(char*, char *);
extern void execute_28(char*, char *);
extern void execute_30(char*, char *);
extern void execute_33(char*, char *);
extern void execute_35(char*, char *);
extern void execute_43(char*, char *);
extern void execute_45(char*, char *);
extern void execute_63(char*, char *);
extern void execute_65(char*, char *);
extern void execute_106(char*, char *);
extern void execute_107(char*, char *);
extern void execute_108(char*, char *);
extern void execute_115(char*, char *);
extern void execute_116(char*, char *);
extern void execute_117(char*, char *);
extern void execute_118(char*, char *);
extern void execute_119(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void vlog_transfunc_eventcallback_2state(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[34] = {(funcp)execute_11, (funcp)execute_13, (funcp)execute_14, (funcp)execute_16, (funcp)execute_111, (funcp)execute_112, (funcp)execute_113, (funcp)execute_114, (funcp)execute_23, (funcp)execute_25, (funcp)execute_101, (funcp)execute_104, (funcp)vlog_simple_process_execute_1_fast_for_reg, (funcp)execute_19, (funcp)execute_20, (funcp)execute_109, (funcp)execute_28, (funcp)execute_30, (funcp)execute_33, (funcp)execute_35, (funcp)execute_43, (funcp)execute_45, (funcp)execute_63, (funcp)execute_65, (funcp)execute_106, (funcp)execute_107, (funcp)execute_108, (funcp)execute_115, (funcp)execute_116, (funcp)execute_117, (funcp)execute_118, (funcp)execute_119, (funcp)vlog_transfunc_eventcallback, (funcp)vlog_transfunc_eventcallback_2state};
const int NumRelocateId= 34;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/butterfly_tb_behav/xsim.reloc",  (void **)funcTab, 34);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/butterfly_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/butterfly_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void iki_initialize_dpi() ; 
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/butterfly_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/butterfly_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/butterfly_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
	iki_initialize_dpi() ; 
    (void) design_handle;
    return iki_simulate_design();
}
