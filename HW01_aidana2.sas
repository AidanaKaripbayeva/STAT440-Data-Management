
/* Aidana Karipbayeva */
/* HW01 Submission */

/****************/

libname hw01 '/folders/myfolders/sasuser.v94';
ods rtf file='/folders/myfolders/sasuser.v94/HW01_aidana2.rtf' ;


/* Exercise 1 */
title 'Exercise 1';

/* A */
proc contents data = sashelp.shoes;
run;

/* B */
proc print data = sashelp.shoes;
	var product subsidiary stores sales;
	where subsidiary="Singapore";
run; 

/* C */
proc means data = sashelp.shoes sum mean min max ;
	var inventory; 
	class subsidiary ; 
	where region= "Asia";

run;


/* Exercise 2 */
title 'Exercise 2';

/* A */
proc contents data = sashelp.baseball;
run;

/* B */

proc print data=sashelp.baseball;
	var name team position salary;
	where salary>2000;
run;

/* C */
proc freq data=sashelp.baseball;
	tables position;
run;

/* D */

proc freq data=sashelp.baseball;
	tables division*league;
run;

/* E */

proc print data=sashelp.baseball;
	var name team YrMajor CrHome;
	where league="National" and YrMajor>=2 and YrMajor<=5;
run;

ods rtf close;
title;


