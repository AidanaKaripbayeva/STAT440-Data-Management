/* <Edward Chen and Aidana Karipbayeva> */
/* Data Project */


/****************/

libname project '/folders/myfolders/sasuser.v94';
ods rtf file='/folders/myfolders/sasuser.v94/data_project.rtf' ;



data work.ca;
	infile '/folders/myfolders/sasuser.v94/youtube-new/CAvideos.csv' dlm = ',' dsd firstobs=2 missover ;
	input video_id :$15. trending_date :$8. title :$70. channel_title :$30. category_id :2. publish_time :$23. tags :$100.
		views :10. likes :10. dislikes :10. comment_count :8. thumbnail_link :$50. comments_disabled :$5.
		ratings_disabled :$5. video_error_or_removed :$5. description :$100.;
	country = "Canada";
	influence = (dislikes + likes + comment_count)/views;
	if dislikes NE 0 then ld_ratio = likes/dislikes;
	if views > 1000000; 
	drop video_id trending_date publish_time thumbnail_link;
	format country $15.;
	label video_id = "ID of the video"
		title = "Title of the video"
		channel_title = "Channel name"
		views = "Number of views"
		likes = "Number of likes"
		dislikes = "Number of Dislikes"
		comment_count = "Number of comments";
run;


data work.de;
	infile '/folders/myfolders/sasuser.v94/youtube-new/DEvideos.csv' dlm = ',' dsd firstobs=2 missover ;
	input video_id :$15. trending_date :$8. title :$70. channel_title :$30. category_id :2. publish_time :$23. tags :$100.
		views :10. likes :10. dislikes :10. comment_count :8. thumbnail_link :$50. comments_disabled :$5.
		ratings_disabled :$5. video_error_or_removed :$5. description :$100.;
	country = "Germany";
	influence = (dislikes + likes + comment_count)/views;
	if dislikes NE 0 then ld_ratio = likes/dislikes;
	if views > 1000000; 
	drop video_id trending_date publish_time thumbnail_link;
	format country $15.;
	label video_id = "ID of the video"
		title = "Title of the video"
		channel_title = "Channel name"
		views = "Number of views"
		likes = "Number of likes"
		dislikes = "Number of Dislikes"
		comment_count = "Number of comments";
run;


data work.gb;
	infile '/folders/myfolders/sasuser.v94/youtube-new/GBvideos.csv' dlm = ',' dsd firstobs=2 missover ;
	input video_id :$15. trending_date :$8. title :$70. channel_title :$30. category_id :2. publish_time :$23. tags :$100. 
		views :10. likes :10. dislikes :10. comment_count :8. thumbnail_link :$50. comments_disabled :$5.
		ratings_disabled :$5. video_error_or_removed :$5. description :$100.;
	country = "Great Britain";
	influence = (dislikes + likes + comment_count)/views;
	if dislikes NE 0 then ld_ratio = likes/dislikes;
	if views > 1000000; 
	drop video_id trending_date publish_time thumbnail_link;
	format country $15.;
	label video_id = "ID of the video"
		title = "Title of the video"
		channel_title = "Channel name"
		views = "Number of views"
		likes = "Number of likes"
		dislikes = "Number of Dislikes"
		comment_count = "Number of comments";
run;

data work.in;
	infile '/folders/myfolders/sasuser.v94/youtube-new/INvideos.csv' dlm = ',' dsd firstobs=2 missover ;
	input video_id :$15. trending_date :$8. title :$70. channel_title :$30. category_id :2. publish_time :$23. tags :$100. 
		views :10. likes :10. dislikes :10. comment_count :8. thumbnail_link :$50. comments_disabled :$5.
		ratings_disabled :$5. video_error_or_removed :$5. description :$100.;
	country = "India";
	influence = (dislikes + likes + comment_count)/views;
	if dislikes NE 0 then ld_ratio = likes/dislikes;
	if views > 1000000; 
	drop video_id trending_date publish_time thumbnail_link;
	format country $15.;
	label video_id = "ID of the video"
		title = "Title of the video"
		channel_title = "Channel name"
		views = "Number of views"
		likes = "Number of likes"
		dislikes = "Number of Dislikes"
		comment_count = "Number of comments";
run;

data work.jp;
	infile '/folders/myfolders/sasuser.v94/youtube-new/JPvideos.csv' dlm = ',' dsd firstobs=2 missover ;
	input video_id :$15. trending_date :$8. title :$70. channel_title :$30. category_id :2. publish_time :$23. tags :$100. 
		views :10. likes :10. dislikes :10. comment_count :8. thumbnail_link :$50. comments_disabled :$5.
		ratings_disabled :$5. video_error_or_removed :$5. description :$100.;
	country = "Japan";
	influence = (dislikes + likes + comment_count)/views;
	if dislikes NE 0 then ld_ratio = likes/dislikes;
	if views > 1000000; 
	drop video_id trending_date publish_time thumbnail_link;
	format country $15.;
	label video_id = "ID of the video"
		title = "Title of the video"
		channel_title = "Channel name"
		views = "Number of views"
		likes = "Number of likes"
		dislikes = "Number of Dislikes"
		comment_count = "Number of comments";
run;


data work.kr;
	infile '/folders/myfolders/sasuser.v94/youtube-new/KRvideos.csv' dlm = ',' dsd firstobs=2 missover ;
	input video_id :$15. trending_date :$8. title :$70. channel_title :$30. category_id :2. publish_time :$23. tags :$100. 
		views :10. likes :10. dislikes :10. comment_count :8. thumbnail_link :$50. comments_disabled :$5.
		ratings_disabled :$5. video_error_or_removed :$5. description :$100.;
	country = "South Korea";
	influence = (dislikes + likes + comment_count)/views;
	if dislikes NE 0 then ld_ratio = likes/dislikes;
	if views > 1000000; 
	drop video_id trending_date publish_time thumbnail_link;
	format country $15.;
	label video_id = "ID of the video"
		title = "Title of the video"
		channel_title = "Channel name"
		views = "Number of views"
		likes = "Number of likes"
		dislikes = "Number of Dislikes"
		comment_count = "Number of comments";
run;


data work.mx;
	infile '/folders/myfolders/sasuser.v94/youtube-new/MXvideos.csv' dlm = ',' dsd firstobs=2 missover ;
	input video_id :$15. trending_date :$8. title :$70. channel_title :$30. category_id :2. publish_time :$23. tags :$100. 
		views :10. likes :10. dislikes :10. comment_count :8. thumbnail_link :$50. comments_disabled :$5.
		ratings_disabled :$5. video_error_or_removed :$5. description :$100.;
	country = "Mexico";
	influence = (dislikes + likes + comment_count)/views;
	if dislikes NE 0 then ld_ratio = likes/dislikes;
	if views > 1000000; 
	drop video_id trending_date publish_time thumbnail_link;
	format country $15.;
	label video_id = "ID of the video"
		title = "Title of the video"
		channel_title = "Channel name"
		views = "Number of views"
		likes = "Number of likes"
		dislikes = "Number of Dislikes"
		comment_count = "Number of comments";
run;


data work.ru;
	infile '/folders/myfolders/sasuser.v94/youtube-new/RUvideos.csv' dlm = ',' dsd firstobs=2 missover ;
	input video_id :$15. trending_date :$8. title :$70. channel_title :$30. category_id :2. publish_time :$23. tags :$100. 
		views :10. likes :10. dislikes :10. comment_count :8. thumbnail_link :$50. comments_disabled :$5.
		ratings_disabled :$5. video_error_or_removed :$5. description :$100.;
	country = "Russia";
	influence = (dislikes + likes + comment_count)/views;
	if dislikes NE 0 then ld_ratio = likes/dislikes;
	if views > 1000000; 
	drop video_id trending_date publish_time thumbnail_link;
	format country $15.;
	label video_id = "ID of the video"
		title = "Title of the video"
		channel_title = "Channel name"
		views = "Number of views"
		likes = "Number of likes"
		dislikes = "Number of Dislikes"
		comment_count = "Number of comments";
run;

data work.us;
	infile '/folders/myfolders/sasuser.v94/youtube-new/USvideos.csv' dlm = ',' dsd firstobs=2 missover ;
	input video_id :$15. trending_date :$8. title :$70. channel_title :$30. category_id :2. publish_time :$23. tags :$100. 
		views :10. likes :10. dislikes :10. comment_count :8. thumbnail_link :$50. comments_disabled :$5.
		ratings_disabled :$5. video_error_or_removed :$5. description :$100.;
	country = "USA";
	influence = (dislikes + likes + comment_count)/views;
	if dislikes NE 0 then ld_ratio = likes/dislikes;
	if views > 1000000; 
	drop video_id trending_date publish_time thumbnail_link;
	format country $15.;
	label video_id = "ID of the video"
		title = "Title of the video"
		channel_title = "Channel name"
		views = "Number of views"
		likes = "Number of likes"
		dislikes = "Number of Dislikes"
		comment_count = "Number of comments";
run;


data all_countries;
	length country $15.;
	set work.ca work.de work.gb work.in work.jp work.kr work.mx work.ru work.us;
run;

ods trace on;
proc contents data = all_countries;
	ods select attributes;
run;

/* Determining the label for likes-dislikes ratio */
proc means data = all_countries;
	var ld_ratio;
run;

proc format;
	value ld_ratio
		low - 1 = 'Strongly Disliked'
		1 < - 40 = 'Less Liked'
		40 < - 100 = 'Liked'
		100 < - high = 'Strongly liked';
run;



/* some videos are unavailable, that is why it has 0 likes, dislikes and comments, so we will delete those obs. */
proc print data = all_countries;
	where influence = 0;
run;


data channels;
	infile '/folders/myfolders/sasuser.v94/channels.csv'  DSD missover firstobs=2 ;
	input Cat_ID :2. Cat_Name :$25. ch_id :$30. origin :$50. Followers :12.  Join_Date :mmddyy. Loc :$8. Pic_URL :$50. Pro_URL :$50. channel_title :$30. Trailer_URL :$50. Videos :$10.;
	drop Cat_ID Videos loc;
	label Cat_Name = 'Category Name'
		 Ch_ID = 'Channel ID'
		 Origin = 'Channels Country of Origin'
		 Descr = 'Channel Description'
		 Followers = 'Number of Subscribers'
		 Join_Date = 'Date Channel was Created'
		 Pic_URL = 'Thumbnail URL'
		 Pro_URL = 'Channel URL'
		 channel_title = 'Channel Name';
	format Join_date year.;
run;

/* identifying range for followers */
proc means data = channels;
	var followers;
run;

proc format;
	value followers
		low - 100000 = 'less than 100k'
		100000 < - 500000 = '100k-500k'
		500000 < - 1000000 = '500k-1m'
		1000000 < - 3000000 = '1-3m'
		3000000 < - high = 'more than 3m';
run;


ods trace on;
proc contents data = channels;
	ods select attributes;
run;

/* category variable is fine*/
proc freq 	data = channels;
	table cat_name;
run;

/* sorting two datasets */
proc sort data = all_countries out = all_countries_sorted;
	by channel_title;
run;

proc sort data = channels out = channels_sorted;
	by channel_title;
run;


/* merging */
data merging;
	merge all_countries_sorted (in = all)
			channels_sorted (in =ch);
	by channel_title;
	length country $15.;
	if all and ch;
	if influence = 0 then delete;
	if join_date = '' then delete;
	label ld_ratio = "Likes to Dislikes Ratio";
	format views likes dislikes :comma10.0
		followers followers.
		ld_ratio ld_ratio.;
run;


ods trace on;
proc contents data = merging;
	ods select attributes;
run;
	

/**No Duplicate values**/
proc sort data=merging out=No_Duplicates nodupkey dupout=Duplicate;
	by title;  
run;

/* Dataset with no duplicates and no country variable */
data Global_List;
	set No_Duplicates;
	drop country;
run;


/*ANALYSIS*/
proc freq data = Global_List;
	table Cat_Name/ nocum;
run;


proc freq data = Global_List;
	table origin/ nocum;
run;


/* Category and views */
proc means data = Global_List mean;
title 'Views vs Category';
	var views;
	class Cat_Name;
	output out=CatViews mean=Views;
run;

proc sort data = CatViews out=CatViews_sorted;
	by descending Views;
run;

proc print data = Catviews_sorted;
run;

data CatViews;
	set CatViews;
	rename Views = Average_Views;
	if _TYPE_ = 0 then Cat_Name = "Average";
run;

proc print data = CatViews noobs;
run;

/* Category and influence */
proc means data = Global_List mean;
title 'Views vs Influence';
	var influence;
	class Cat_Name;
	output out=CatInfl mean=influence;
run;

proc sort data = CatInfl;
	by descending influence;
run;

data CatInfl;
	set CatInfl;
	if _TYPE_ = 0 then Cat_Name = "Average";
run;

proc print data = CatInfl noobs;
run;


/* Like to Dislikes ratio and Influence */
proc means data = Global_List;
	var influence;
	class ld_ratio;
run;


/* Influence vs Followers */

proc means data = Global_List;
title 'Followers vs Influence';
	var influence;
	class followers;
run;

/*Join year vs number of followers */
proc freq data = Global_list;
	tables join_date*followers /norow nopercent nocol;
run;


/* plot */


proc corr data=Global_List plots(maxpoints=none)=matrix(histogram);
	var likes comment_count followers views;
run;


/*Music dataset */
data music_2015 (keep = channel_title Trailer_URL followers) ;
	set Global_List;
	if year(join_date) <= 2015 and year(join_date) >= 2013 then do;
		if cat_name = 'Music' and views > 3000000 and ld_ratio > 45 ;
		output music_2015;
	end;
run;

proc print data = music_2015;
run;

/* NLP task */
data nlp_task (keep=cat_name description tags channel_title title);
	set Global_List;
	if followers > 3000000 and origin = 'United States' then output nlp_task;
run;

proc print data = nlp_task;
run;



ods rtf close;
title;


