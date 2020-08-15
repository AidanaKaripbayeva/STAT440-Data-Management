/* <Aidana Karipbayeva> */
/* HW03 Submission */


/****************/

libname hw01 '/folders/myfolders/sasuser.v94';
ods rtf file='/folders/myfolders/sasuser.v94/HW03_aidana2.rtf' ;


/* Exercise 1 */
title 'Exercise 1';

/* a */
	
proc format;
	value $gender
		F = "Female"
		M = "Male";
run;


proc format;
	value $trans
		hs = 'male homosexual or bisexual contact'
		hsid = 'as hs and also intravenous drug user'
		id = 'female or heterosexual male intravenous drug user'
		het = 'heterosexual contact'
		haem = 'haemophilia or coagulation disorder'
		blood = 'receipt of blood, blood components or tissue'
		mother = 'mother with or at risk of HIV infection'
		other = 'other or unknown';
run;

proc format;
	value $origin
		NSW = 'New South Wales (and Australian Capital Territory)'
		VIC = 'Victoria'
		QLD = 'Queensland'
		WA = 'Western Australia'
		SA = 'South Australia'
		TAS = 'Tasmania'
		NT = 'Northern Territory';
run;

proc format;
	value $status
		D = "dead"
		A = "alive";
run;

/* b */

data work.AUaids_aidana2;
	infile '/folders/myfolders/sasuser.v94/AUaids.dat' dlm = " ";
	input obs $ origin $ sex $ startDate $ endDate $ status $ category $ age;
	label startDate = 'Date of diagnosis'
		endDate = 'Date of death or end of observation'
		status = 'Status at the end of observation' 
		category = 'Reported transmission category';
	format category $trans.
		origin $origin.
		sex $gender.
		status $status.
		enddate mmddyy.;
run;


/* c */

proc freq data = work.AUaids_aidana2;
	tables category;
run;


/* d */


data work.aids;
	infile '/folders/myfolders/sasuser.v94/AUaids.dat' dlm = " ";
	input obs $ origin $ sex $ startDate $ endDate $ status $ category $ age;
	if age <= 24 and 
		(category = 'hs' or category = 'hsid' or category = 'het');
run;


/* e */
proc freq data = work.aids;
	tables category*origin;
run;



/* Exercise 2 */
title 'Exercise 2';



/* a */
data work.rushing_aidana2;
	infile '/folders/myfolders/sasuser.v94/nflrush.dat' dlm = ' '  firstobs=2;
	input @3 Season year4. 
		@13 Player $25. 
		Team :$3. Gms :$ Att : Yds :$ Avg :5. YPG :6. Lg :3. TD :3. FD;
	drop Gms Att Yds;
	label Avg = 'Average rushing yards per attempt, rounded to nearest 0.01'
		YPG = 'Average rushing yards per game, rounded to nearest 0.1'
		Lg = 'Longest rushing attempt'
		TD = 'Number of rushing touchdowns (i.e., scores, goals)'
		FD = 'Rushing first-downs';	
	run;
	
/* b */

proc contents data = work.rushing_aidana2;
run;

/* c */ 
		

proc sort data = work.rushing_aidana2 OUT = sorted;
	where 2013<=season<=2015;
	by descending TD;
run;

proc print data = sorted (obs=10);
	var  Player TD season;
run;

/* d */
data localnfl_aidana2;
	infile '/folders/myfolders/sasuser.v94/nflrush_quotes.dat' dlm = ' ' firstobs=2;
	input @1 Season year4. @11 Player $25. 
		Team :$3. Gms :$ Att : Yds :$ Avg :5. YPG :6. Lg :3. TD :3. FD;
	drop Gms Att YPG;
	if Team = 'Stl' or Team = 'Chi' or Team = 'Ind' or Team = 'GB';
	label Avg = 'Average rushing yards per attempt, rounded to nearest 0.01'
		Yds = 'Number of rushing yards'
		Lg = 'Longest rushing attempt'
		TD = 'Number of rushing touchdowns (i.e., scores, goals)'
		FD = 'Rushing first-downs';	
	run;

/* e */
proc contents data=localnfl_aidana2;
run;

/* f */
proc sort data = localnfl_aidana2 OUT = sorted_f;
	by descending Yds;
run;

proc print data = sorted_f (obs=10);
	var  Player Team Yds season;
run;

/* Exercise 3 */
title 'Exercise 3';


/* a */


data low_earners4_aidana2;
	infile '/folders/myfolders/sasuser.v94/employee_roster4.dat' dlm='**' missover;
	input ID :6. Name :$25. Country :$3.;
	input Company :$20. Department :$20. Section :$20. Organization :$20. Job :$20. Gender :$1.;
	input Salary :dollar13. BirthD  HireD TerminationD;
	if Department = "Sales" and Salary < 24000;
	label BirthD = 'Birth Date' 
		  HireD = 'Hire Date'
		  TerminationD = 'Termination Date'
		  Job = 'Job Title';
	format BirthD HireD TerminationD ddmmyy.;
run;



/* b */
proc contents data = low_earners4_aidana2;
run;


/* c */
proc print data = low_earners4_aidana2;
	var Name Gender Department Job Salary;
run;

ods rtf close;
title;








	