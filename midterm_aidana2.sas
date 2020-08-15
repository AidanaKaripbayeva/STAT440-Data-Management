/* Aidana Karipbayeva */
/* Midterm Submission */

/****************/
*nonstandard data

libname midterm '/folders/myfolders/sasuser.v94';
ods rtf file='/folders/myfolders/sasuser.v94/Midterm_aidana2.rtf' ;

proc format;
	value $chas
		1 = 'border to Charles River'
		0 = 'not a border to Chales River';
run;

proc format;
	value price
		low - < 17 = 'Lower price'
		17 - < 22 = 'Lower Middle price'
		22 - 25 = 'Higher Middle price'
		25 < - 50 = 'Higher price'
		other = 'Missing';
run;




data work.housing work.badhousing;
	infile '/folders/myfolders/sasuser.v94/Boston_damaged.dat' dlm = '09'x dsd firstobs=2 missover ;
	input OBS : TOWN :$30. TOWNvec :$2. TRACT :4. LON :3.6 LAT :3.6 MEDV :2.1 CMEDV :2.1 CRIM :2.5 ZN :2.1
			INDUS :2.2 CHAS :$1. NOX :2.3 RM :2.3 AGE :3.2 DIS :2.4 RAD :2. TAX :3. PTRATIO :3.1 B :3.2 LSTAT :3.2;
	label OBS = 'observation number'
		TOWN = 'a factor with levels given by town names'
		TOWNvec = 'a numeric vector corresponding to TOWN'
		TRACT = 'a numeric vector of tract ID numbers'
		LON = 'a numeric vector of tract point longitudes in decimal degrees'
		LAT = 'a numeric vector of tract point latitudes in decimal degrees'
		MEDV = 'a numeric vector of median values of owner-occupied housing in USD 1000'
		CMEDV = 'a numeric vector of corrected median values of owner-occupied housing in USD 1000'
		CRIM = 'a numeric vector of per capita crime'
		ZN = 'a numeric vector of proportions of residential land zoned for lots over 25000 sq. ft per town (constant for all Boston tracts)'
		INDUS = 'a numeric vector of proportions of non-retail business acres per town (constant for all Boston tracts)'
		CHAS = 'a factor with levels 1 if tract borders Charles River; 0 otherwise'
		NOX = 'a numeric vector of nitric oxides concentration (parts per 10 million) per town'
		RM = 'a numeric vector of average numbers of rooms per dwelling'
		AGE = 'a numeric vector of proportions of owner-occupied units built prior to 1940'
		DIS = 'a numeric vector of weighted distances to five Boston employment centers'
		RAD = 'a numeric vector of an index of accessibility to radial highways per town (constant for all Boston tracts)'
		TAX = 'a numeric vector full-value property-tax rate per USD 10,000 per town (constant for all Boston tracts)'
		PTRATIO = 'a numeric vector of pupil-teacher ratios per town (constant for all Boston tracts)'
		B = 'a numeric vector of 1000*(Bk - 0.63)^2 where Bk is the proportion of blacks'
		LSTAT = 'a numeric vector of percentage values of lower status population';
	format chas $chas.
		   medv price.
		   cmedv price.;
	if _error_=1 then output work.badhousing;
	else output work.housing;
	
run;

/*
proc freq data=work.housing nlevels;
	table OBS TOWN TOWNvec TRACT LON LAT MEDV CMEDV CRIM ZN
			INDUS CHAS NOX RM AGE DIS RAD TAX PTRATIO B LSTAT;

run;
*/

/* TOWN should be changed*/
proc freq data=work.housing;
	table town;
run;

/*cleaning data only for town first because it is important variable*/
data work.righTown;
	set work.housing;
	if town="Somervile" then town = "Somerville";
	else if town = "Welesley" then town = "Wellesley";
	else if town = "Boston Allston-Brighton" then town = "Allston-Brighton";
	else if town = "Boston Back Bay" then town = "Back Bay";
	else if town = "Boston Beacon Hill" then town = "Beacon Hill";
	else if town = "Boston Charlestown" then town = "Charlestown";
	else if town = "Boston Dorchester" then town = "Dorchester";
	else if town = "Boston East Boston" then town = "East Boston";
	else if town = "Boston Forest Hills" then town = "Forest Hills";
	else if town = "Boston Hyde Park" then town = "Hyde Park";
	else if town = "Boston Mattapan" then town = "Mattapan";
	else if town = "Boston North End" then town = "North End";
	else if town = "Boston Roxbury" then town = "Roxbury";
	else if town = "Boston Savin Hill" then town = "Savin Hill";
	else if town = "Boston South Boston" then town = "South Boston";
	else if town = "Boston West Roxbury" then town = "West Roxbury";
run;

/* MEDV & CMEDV: correlation between medv and cmedv is 1*/
proc corr data=work.righTown;
	var medv cmedv;
run;

/* TRACT */
proc freq data=work.righTown;
	table tract;
run;

/* LAT should be changed*/
proc print data = work.righTown;
	var tract town lat;
	where lat > 45;
run;

/* LON should be changed*/
proc print data = work.righTown;
	var tract town lon;
	where lon > -70;
run;

/* CRIM */
proc univariate data = work.righTown;
	var crim;
run;


/* CRIM: 54 high observations per capita crime*/
proc print data = work.righTown;
	var crim;
	where crim > 10;
run;


/* ZN*/
proc means data=work.righTown;
	class town;
	var zn;
run;


/* INDUS*/
proc univariate data=work.righTown;
	var indus;
run;

/* CHAS */
proc freq data=work.righTown;
	table chas;
run;

/* NOX should be changed */
proc print data=work.righTown;
	var tract town nox;
	where nox > 1;
run;

/*RM*/

proc means data=work.righTown;
	class cmedv;
	var rm;
	format cmedv price.;
run;

/* AGE */
proc freq data=work.righTown;
	table age;
run;

/* DIS*/
proc univariate data=work.righTown;
	var dis;
run;

/*RAD*/
proc means data=work.righTown;
	class town;
	var rad;
run;

/*TAX*/
proc means data=work.righTown;
	class town;
	var tax;
run;

/* PTRATIO should be changed */
proc means data=work.righTown;
	class town;
	var ptratio;
run;

proc print data = work.righTown;
	var tract town ptratio;
	where town = 'Hyde Park';
run;

/* LSTAT */
proc print data=work.righTown;
	var tract lstat;
	where lstat > 100 or lstat <0;
run;


/* cleaning the rest of the data*/
data work.clean;
	set work.righTown;
	if tract = 4223 then lat = 42.115;
	else if tract = 4226 then lat = 42.137;
	else if tract = 3421 then lon =	-71.0243;
	else if tract = 3422 then lon = -71.0312;
	else if tract = 3423 then lon = -71.0377;
	else if nox = 9.999 then nox = .;
	else if tract = 1404 then PTRATIO = 20.2;
run;



/* RESULTS SECTION */


/* LAT is changed*/
proc print data = work.clean;
	var tract town lat;
	where lat > 45;
run;

/* LON is changed*/
proc print data = work.clean;
	var tract town lon;
	where lon > -70;
run;


/* NOX is changed */
proc print data=work.clean;
	var tract town nox;
	where nox > 1;
run;

/* PTRATIO is changed */
proc means data=work.clean;
	class town;
	var ptratio;
run;

/* graph */

proc corr data=work.clean plots(maxpoints=none)=matrix(histogram);
	var cmedv crim rm indus lstat;
run;


/* EXERCISES SECTION */

/* 6a */
proc means data=work.clean N;
	class town;
	var tract;
run;

/* 6b */
proc means data=work.clean mean;
	class town;
	var crim;
	output out=toSort(drop=_type_ _freq_) mean=/ autoname;
run;

proc sort data = work.toSort OUT = sorted;
	by descending CRIM_MEAN;
run;

proc print data=work.sorted (obs=5);
run;

proc print data=work.sorted (firstobs=89 obs=93);
run;

/* 6c */

proc univariate data=work.clean;
	var MEDV;
run;




ods rtf close;
title;

