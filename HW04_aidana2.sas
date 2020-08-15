/* <Aidana Karipbayeva> */
/* HW04 Submission */


/****************/

libname hw01 '/folders/myfolders/sasuser.v94';
ods rtf file='/folders/myfolders/sasuser.v94/HW04_aidana2.rtf' ;


/* Exercise 1 */
title 'Exercise 1';

/* a */
proc sort data = '/folders/myfolders/sasuser.v94/inventory.sas7bdat' out=inventory_sorted;
	by Model;
run;

proc sort data = '/folders/myfolders/sasuser.v94/purchase.sas7bdat' out=purchase_sorted;
	by Model;
run;
	
data purchase_price_aidana2;
	merge inventory_sorted (in = inv)
		  purchase_sorted (in = pur);
	if inv and pur;
	TotalCost = Price * Quantity;
run;



/* b */
proc print data = purchase_price_aidana2 noobs;
run;

/* c */
data not_purchased_aidana2 (keep = Model price);
	merge inventory_sorted (in = inv)
		  purchase_sorted (in = pur);
	if not pur;
run;

/* d */
proc print data = not_purchased_aidana2 noobs;	
run;

/* e */
data A B (keep = Model Price);
	merge inventory_sorted (in = inv)
		  purchase_sorted (in = pur);
	if inv and pur then output A;
	if not pur then output B;
run;


/* Exercise 2 */
title 'Exercise 2';

/* a */
proc contents data = '/folders/myfolders/sasuser.v94/fmli141.sas7bdat';
run;

proc contents data = '/folders/myfolders/sasuser.v94/memi141.sas7bdat';
run;

proc contents data = '/folders/myfolders/sasuser.v94/fmli142.sas7bdat';
run;

proc contents data = '/folders/myfolders/sasuser.v94/memi142.sas7bdat';
run;

proc contents data = '/folders/myfolders/sasuser.v94/fmli143.sas7bdat';
run;

proc contents data = '/folders/myfolders/sasuser.v94/memi143.sas7bdat';
run;

proc contents data = '/folders/myfolders/sasuser.v94/fmli144.sas7bdat';
run;

proc contents data = '/folders/myfolders/sasuser.v94/memi144.sas7bdat';
run;

/* b */

data fmli141;
	set '/folders/myfolders/sasuser.v94/fmli141.sas7bdat';
run;

data fmli142;
	set '/folders/myfolders/sasuser.v94/fmli142.sas7bdat';
run;

data fmli143;
	set '/folders/myfolders/sasuser.v94/fmli143.sas7bdat';
run;

data fmli144;
	set '/folders/myfolders/sasuser.v94/fmli144.sas7bdat';
run;

data fmli2014_aidana2;
	set fmli141 fmli142 fmli143 fmli144;
	if 1 <= _N_ <= 1734 then QTR = '1';
	if 1735 <= _N_ <= 1734 + 3319 then QTR = '2';
	if 1734 + 3320 <= _N_ <= 1734 + 3319 + 4879 then QTR = '3';
	if 1734 + 3319 + 4880 <= _N_ <= 1734 + 3319 + 4879 + 6280 then QTR = '4';
run;


/* c */
proc contents data = fmli2014_aidana2;
run;

/* d */
data memi141;
	set '/folders/myfolders/sasuser.v94/memi141.sas7bdat';
run;

data memi142;
	set '/folders/myfolders/sasuser.v94/memi142.sas7bdat';
run;

data memi143;
	set '/folders/myfolders/sasuser.v94/memi143.sas7bdat';
run;

data memi144;
	set '/folders/myfolders/sasuser.v94/memi144.sas7bdat';
run;

data memi2014_aidana2;
	set memi141 memi142 memi143 memi144;
	if 1 <= _N_ <= 4251 then QTR = '1';
	if 4252 <= _N_ <= 4251 + 8252 then QTR = '2';
	if 4251 + 8253 <= _N_ <= 4251 + 8252 + 12032 then QTR = '3';
	if 4251 + 8252 + 12033 <= _N_ <= 4251 + 8252 + 12032 + 15512 then QTR = '4';
run;


/* e */
proc contents data = memi2014_aidana2;
run;


/* f */
proc format;
	value salary_class
		low - < 13000 = 'Impoverished'
		13000 - < 45000 = 'Lower Class'
		45000 - 90000 = 'Middle Class'
		90000 < - < 125000 = 'Upper Middle Class'
		125000 - high = 'Upper Class' 
		other = 'Missing';
run;

proc freq data = memi2014_aidana2;
	table salaryx /nocol norow;
	format salaryx salary_class.;
run;


proc freq data = memi2014_aidana2;
	tables SALARYX*QTR /nocol norow;
	format SALARYX salary_class.;
run;


/* g */

proc sort data = fmli2014_aidana2 out=fmli2014_aidana2_sort;
	by NEWID;
run;

proc sort data = memi2014_aidana2 out = memi2014_aidana2_sort;
	by NEWID;
run;


data ce2014_aidana2;
	merge fmli2014_aidana2_sort memi2014_aidana2_sort;
	by NEWID;
run;

/* h */

proc contents data = ce2014_aidana2;
run;

/* i */

proc sort data = fmli2014_aidana2 out=fmli_id (keep = CUID);
	by CUID;
run;

data fmli_id2;
	set fmli_id;
	ID = put(CUID, 7.);
	drop CUID;
run;

proc contents data= fmli_id2;
run;

data at_least_three_aidana2 (keep=ID) all_four_aidana2 (keep=ID);
	set fmli_id2;
	by ID;
	retain rate 0;
	if First.ID then rate=0;
	rate = rate+1;
	if Last.ID and rate = 4 then output all_four_aidana2;
	if Last.ID and rate = 3 then output at_least_three_aidana2;
run;

/* j */
ods trace on;
proc contents data = at_least_three_aidana2;
	ods select attributes;
run;
	
	
ods trace on;
proc contents data = all_four_aidana2;
	ods select attributes;
run;
	
	


ods rtf close;
title;








