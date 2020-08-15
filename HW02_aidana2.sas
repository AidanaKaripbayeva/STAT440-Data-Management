
/* <Aidana Karipbayeva> */
/* HW02 Submission */


/****************/

libname hw01 '/folders/myfolders/sasuser.v94';
ods rtf file='/folders/myfolders/sasuser.v94/aidana2.rtf' ;


/* Exercise 1 */
title 'Exercise 1';

/* a */
proc contents data = '/folders/myfolders/sasuser.v94/fmli143.sas7bdat';
run;

proc contents data = '/folders/myfolders/sasuser.v94/memi143.sas7bdat';
run;

/* b  format for state*/
proc format;
	value $urban_rural
		1 = 'Urban'
		2 = 'Rural';
run;

proc format;
	value $educa 
		 00 = 'Never attended school'
		 10 = 'First through eighth grade'
		 11 = 'Ninth through twelfth grade (no H.S. diploma)'
		 12 = 'High school graduate'
		 13 = 'Some college, less than college graduate'
		 14 = 'Associate’s degree (occupational/vocational or academic)'
		 15 = 'Bachelor’s degree'
		 16 = 'Master’s degree, (professional/Doctorate degree)*';
run;
				
proc format;
	value $marital_status
		 1 = 'Married'
		 2 = 'Widowed'
		 3 = 'Divorced'
		 4 = 'Separated'
		 5 = 'Never married';
run;

proc format;
	value $race
		 1 = 'White'
		 2 = 'Black'
		 3 = 'Native American'
		 4 = 'Asian'
		 5 = 'Pacific Islander'
		 6 = 'Multi-race';
run;

proc format;
	value $reg
		 1 = 'Northeast'
		 2 = 'Midwest'
		 3 = 'South'
		 4 = 'West';
run;

proc format;
	value $gender
		 1 = 'Male'
		 2 = 'Female';	
run;

proc format;
	value $income_before_tax
		 01 = 'Less than $5,000'
		 02 = '$5,000 to $9,999'
		 03 = '$10,000 to $14,999'
		 04 = '$15,000 to $19,999'
		 05 = '$20,000 to $29,999'
		 06 = '$30,000 to $39,999'
		 07 = '$40,000 to $49,999'
		 08 = '$50,000 to $69,999'
		 09 = '$70,000 and over';
run;


proc format;
	value $income_two
		 1 = 'Less than 0.1667'
		 2 = '0.1667 – 0.3333'
		 3 = '0.3334 – 0.4999'
		 4 = '0.5000 – 0.6666'
		 5 = '0.6667 – 0.8333'
		 6 = '0.8334 – 1.0000';
run;

proc format;
	value $relationship
		 1 = 'Reference person'
		 2 = 'Spouse'
		 3 = 'Child or adopted child'
		 4 = 'Grandchild'
		 5 = 'In-law'
		 6 = 'Brother or sister'
		 7 = 'Mother or father'
		 8 = 'Other related person'
		 9 = 'Unrelated person'
		 0 = 'Unmarried Partner';
run;

proc format;
	value $highest_degree
		 1 = 'No schooling completed, or less than 1 year'
		 2 = 'Nursery, kindergarten, and elementary (grades 1-8)'
		 3 = 'High school (grades 9-12, no degree)'
		 4 = 'High school graduate – high school diploma or the equivalent (GED)'
		 5 = 'Some college but no degree'
		 6 = 'Associate’s degree in college'
		 7 = 'Bachelor’s degree (BA, AB, BS, etc.)'
		 8 = 'Master’s professional, or doctorate degree (MA, MS, MBA, MD, JD, PhD, etc.)';
run;

proc format;
	value $state	
		01 = 'Alabama'
		02 = 'Alaska'
		04 = 'Arizona'
		05 = 'Arkansas'
		06 = 'California'
		08 = 'Colorado' 
		09 = 'Connecticut' 
		10 = 'Delaware' 
		11 = 'District of Columbia'
		12 = 'Florida' 
		13 = 'Georgia'
		15 = 'Hawaii' 
		16 = 'Idaho' 
		17 = 'Illinois' 
		18 = 'Indiana' 
		20 = 'Kansas' 
		21 = 'Kentucky' 
		22 = 'Louisiana' 
		23 = 'Maine' 
		24 = 'Maryland' 
		25 = 'Massachuse'
		29 = 'Missouri'
		31 = 'Nebraska'
		32 = 'Nevada'
		33 = 'New Hampshire'
		34 = 'New Jersey'
		36 = 'New York'
		37 = 'North Carolina'
		39 = 'Ohio'
		40 = 'Oklahoma'
		41 = 'Oregon'
		42 = 'Pennsylvania'
		44 = 'Rhode Island'
		45 = 'South Carolina'
		46 = 'South Dakota'
		47 = 'Tennessee'
		48 = 'Texas'
		49 = 'Utah'
		51 = 'Virginia'
		53 = 'Washington';
run;


data work.fmli143_aidana2;
	set '/folders/myfolders/sasuser.v94/fmli143.sas7bdat';
	label HH_CU_Q='Count of CUs in household'	
		NEWID = 'CU identification number '
		AGE_REF = 'Age of reference person'
		AGE2 = 'Age of spouse'
		BATHRMQ = 'How many complete bathrooms are there in this unit?'
		BEDROOMQ = 'How many bedrooms are there in this unit?'
		EDUC_REF = 'Education of reference person'	
		EDUCA2 = 'Education of spouse'
		FAM_SIZE = 'Number of members in CU'
		FINCATAX = 'Amount of CU income after taxes in the past 12 months' 
		FINCBTAX = 'Amount of CU income before taxes in past 12 months'
		HLFBATHQ = 'How many half bathrooms are there in this unit?'
		MARITAL1 = 'Marital status of reference person'
		NO_EARNR = 'Number of earners'
		NUM_AUTO = 'Number of owned automobiles'
		PRINEARN = 'Member number (MEMBNO in the MEMB file)of the principal earner'
		QINTRVMO = 'Interview month'
		QINTRVYR = 'Interview year'
		RACE2 = 'Race of spouse'
		REF_RACE = 'Race of reference person'
		SEX_REF = 'Sex of reference person'
		SEX2 = 'Sex of spouse'
		HHID = 'Identifier of household with more than one CU. Household with only one CU will be set to missing.'
		INCLASS = 'Income class of CU based on income before taxes.' 
		CUID = 'Consumer unit identifying variable, constructed using the first seven digits of NEWID'
		INTERI = 'Interview number'  
		INCLASS2 = 'Income class based on INC_RANK';
 	format BLS_URBN $urban_rural. 
          MARITAL1 $marital_status.
          EDUC_REF $educa.
          EDUCA2 $educa.
          RACE2 $race.
          REF_RACE $race.
          REGION $reg.
          SEX_REF $gender.
          SEX2 $gender.
          INCLASS2 $income_two.
          INCLASS $income_before_tax.
          STATE $state.;
run;


data work.memi143_aidana2;
	set '/folders/myfolders/sasuser.v94/memi143.sas7bdat';
	label CU_CODE = 'What is the members relationship to (reference person)? '
		NEWID = 'CU identification number '
		EDUCA = 'What is the highest level of school the member has completed or the highest degree the member has received?'
		MARITAL = 'Is the member now . . . ?'
		SALARYX = 'During the past 12 months, what was the amount of wages or salary income received, before any deductions?'
		MEMBRACE = 'Race of Member'
		MEMBNO = 'Person line number';
	format CU_CODE $relationship.
 		EDUCA $highest_degree.
 		SEX $gender.
 		MEMBRACE $race.;
 
run;


proc contents data = work.fmli143_aidana2;
run;

proc contents data = work.memi143_aidana2;
run;

/* c */


proc print data = work.fmli143_aidana2 (obs=10);
	var  NEWID CUID AGE_REF BLS_URBN MARITAL1 FINCATAX;
run;

proc print data = work.memi143_aidana2 (obs=10);
	var  NEWID CU_CODE MARITAL SALARYX;
run;


/* d */
proc format;
	value salary_class
		low - < 13000 = 'Impoverished'
		13000 - < 45000 = 'Lower Class'
		45000 - 90000 = 'Middle Class'
		90000 < - < 125000 = 'Upper Middle Class'
		125000 - high = 'Upper Class' 
		other = 'Missing';
run;

/* e */
proc datasets library = work;
	MODIFY memi143_aidana2;
		format SALARYX salary_class.;
run;




/* f */ 

PROC CORR DATA = work.fmli143_aidana2;
VAR fam_size bedroomq ;
run;

PROC CORR DATA = work.fmli143_aidana2;
VAR fam_size bathrmq ;
run;


/* g */

proc means data = work.memi143_aidana2 alpha=0.05 clm mean Q1 Median Q3 ;
	class EDUCA;
	var SALARYX;
run;

/* h */

proc format;
	value age
		low - 9 = 'child'
		10 - 19 = 'teens'
		20 - 29 = 'twenties'
		30 - 39 = 'thirties'
		40 - 49 = 'forties'
		50 - 59 = 'fifties'
		60 - 69 = 'sixties'
		70 - high = 'old'
		other = 'missing';
run;

proc means data = work.memi143_aidana2 alpha=0.05 clm mean Q1 Median Q3;
	class AGE;
	var SALARYX;
	format age age.;
run;
		
ods rtf close;
title;


