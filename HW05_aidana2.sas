/* <Aidana Karipbayeva> */
/* HW05 Submission */


/****************/

libname hw01 '/folders/myfolders/sasuser.v94';
ods rtf file='/folders/myfolders/sasuser.v94/HW05_aidana2.rtf' ;


/* Exercise 1 */
title 'Exercise 1';

/* a */

proc sort data = '/folders/myfolders/sasuser.v94/orders.sas7bdat' out=orders;
	by customer_ID order_type;
run;

data orders_ch;
	set orders;
	cust_ID = put(customer_ID, 3.);
	order_type_ch = put(order_type, 1.);
	drop customer_ID order_type;
run;


data discount_ret (keep = cust_ID customer_name TotSales) discount_cat (keep = cust_ID customer_name TotSales customer_gender) 
discount_int (keep = cust_ID customer_name TotSales customer_birthdate)
top_buyers_aidana2(keep = cust_ID customer_name TotSales sum_cust);
	set orders_ch;
	by cust_ID order_type_ch;
	retain TotSales 0;
	retain sum_cust 0;
	if first.order_type_ch then  TotSales = 0;
	TotSales = TotSales + Total_Retail_Price;
	if last.order_type_ch and order_type_ch = '1' and TotSales >= 400 then output discount_ret;
	if last.order_type_ch and order_type_ch = '2' and TotSales >= 100 then output discount_cat;
	if last.order_type_ch and order_type_ch = '3' and TotSales >= 400 then output discount_int;
	if first.cust_ID then sum_cust = 0;
	sum_cust = sum_cust + Total_Retail_Price;
	if last.cust_ID and sum_cust >= 600 then output top_buyers_aidana2;
run;
	
	
/* b */ 	
proc format;
	value $order_type
	'1' = 'Retail'
	'2' = 'Catalog'
	'3' = 'Internet';
run;

proc format;
	value $gender
	'F' = 'female'
	'M' = 'male';
run;
	
title "Customers who spent $400 or more on catalog purchases";
proc print data = discount_cat noobs;
	format customer_gender $gender.;
run;
title;

title "Customers who spent $400 or more on internet purchases";
proc print data = discount_int noobs;
run;
title;

title "Customers who spent $400 or more on retail purchases";
proc print data = discount_ret noobs;
run;
title;

title "Customers who spent $600 or more in total across all three platforms (retail, catalog, internet)";
proc print data = top_buyers_aidana2 noobs;
run;
title;




/* Exercise 2 */
title 'Exercise 2';

/* a */

data trade_aidana2;
	infile '/folders/myfolders/sasuser.v94/importexport87-15.dat' dlm = '09'x;
	input date :mmddyy. exports :8.2 imports :8.2 @@;
	balance = exports - imports;
	label date = "The date marking the beginning of a month’s worth of data"
		  exports = "The total value of exports from the U.S. in millions of dollars"
		  imports = "The total value of imports to the U.S. in millions of dollars"
		  balance = "The difference between Exports and Imports";
	format date year.;
		  
run;

/* b */

proc print data = trade_aidana2;
	var date exports imports balance;
	where date between '01JAN2011'd and '31DEC2011'd;
run;

/* c */

data trade_year;
	set trade_aidana2;
	year = year(Date);
run;

proc sort data=trade_year out = trade_year_sorted;
	by year;
run;


data yearlyimports_aidana2 (drop = date exports imports balance) ;
	set trade_year_sorted;
	by year;
	retain YearTotal 0;
	if First.year then YearTotal = 0;
	YearTotal = YearTotal+imports;
	if Last.year then do;
		YearAvg = YearTotal/12;
		output yearlyimports_aidana2;
	end;
run;

/* d */

proc contents data=yearlyimports_aidana2;
run;

/* e */

proc print data = yearlyimports_aidana2;
	where year between 2000 and 2004;
run;

/* f */

proc format;
	value decade
		1980 - 1989 = "80's"
		1990 - 1999 = "90's"
		2000 - 2009 = "00's"
		2010 - 2019 = "10's";
run;


data decade_aidana2;
	set yearlyimports_aidana2;
	format year decade.;
run;


proc means data= decade_aidana2;
	class year;
	var YearTotal;
run;
		
	



ods rtf close;
title;

