
/* Aidana Karipbayeva */
/* HW06 Submission */

/****************/

libname hw01 '/folders/myfolders/sasuser.v94';
ods rtf file='/folders/myfolders/sasuser.v94/HW06_aidana2.rtf' ;


/* Exercise 1 */
title 'Exercise 1';

/* A */

proc sql;
title "Players with wage more than $2 million";
	select Name, Team, Position, Salary
	from sashelp.baseball
	where salary >= 2000;
quit;


/* B */
proc sql;
title "Number of players in each Position";
	select count(Position) as count, position
	from sashelp.baseball
	group by position
	having count ge 15;
quit;


/* C */
proc sql;
title "Number of players in each unique division";
	select division, league, count(division) as count
	from sashelp.baseball
	group by division, league;
quit;


/* D */
proc sql;
title "National League players";
	select Name, Team, YrMajor, nHome
	from sashelp.baseball
	where league = "National" and YrMajor>=2 and YrMajor<=5 and nHome>=20;
quit;


/* E */
proc sql;
   describe table sashelp.baseball;
quit;



/* Exercise 2 */
title 'Exercise 2';


/* A */
proc sql;
title "Shoes in Singapore";
	select *
	from sashelp.shoes
	where subsidiary = "Singapore";
quit;


/* B */
proc sql;
title "The most total sales in Singapore";
	select sales, product
	from sashelp.shoes
	where sales =
		(select max(sales)
		from sashelp.shoes
		where subsidiary = "Singapore");
quit;

/* C */

proc sql;
title "The most number of stores in Singapore";
	select stores, product
	from sashelp.shoes
	where subsidiary = "Singapore" and stores =
		(select max(stores)
		from sashelp.shoes
		where subsidiary = "Singapore");
quit;

/* D */
proc sql;
title "Statistics for inventory values in Asia";
create table work.asiashoes as 
	select subsidiary, sum(inventory) as Sum, avg(inventory) as Average,
	min(inventory) as Min, max(inventory) as Max
	from sashelp.shoes
	where region = "Asia"
	group by subsidiary;
quit;


proc sql;
	select *
	from work.asiashoes;
quit;

/* E */

proc sql;
title "The largest total (sum) inventory in Asia";
	select subsidiary, Sum
	from work.asiashoes
	where sum = 
		(select max(sum)
		from work.asiashoes);
quit;

/* F */
proc sql;
title "The smallest total (sum) inventory in Asia";
	select subsidiary, Sum
	from work.asiashoes
	where sum = 
		(select min(sum)
		from work.asiashoes);
quit;


/* Exercise 3 */
title 'Exercise 3';

/* A */
proc sql;
	describe table '/folders/myfolders/sasuser.v94/batting.sas7bdat';
quit;

proc sql;
create table batting as
	select *
	from '/folders/myfolders/sasuser.v94/batting.sas7bdat';
quit;



/* B */

proc sql;
title "Players with at least 256 hits";
	select PlayerID, yearID, TeamID, H
	from batting
	where H>= 245
	order by yearID;
quit;

/* C */

proc sql;
title "League with the first and last years";
	select LGID, min(yearID) as StartYear, max(yearID) as EndYear
	from batting
	group by LGID;
quit;
	

/* D */


proc sql;
select PlayerID, hr, yearID
		from batting
		having hr ge 50
		order by yearID;
quit;



ods rtf close;
title;





