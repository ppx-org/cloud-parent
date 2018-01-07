
/******************* search ****************/
create table search_ext_word
(
	MERCHANT_ID int(11) NOT NULL,
	EXT_WORD 	varchar(32) NOT NULL,
	primary key (MERCHANT_ID, EXT_WORD)
);

create table search_words
(
	PROD_ID		int(11) NOT NULL,
	MERCHANT_ID int(11) NOT NULL,
	WORDS 		varchar(256) NOT NULL,
	primary key (PROD_ID)
);

create table search_version
(
	MERCHANT_ID 	int(11) NOT NULL,
	VERSION_NAME 	varchar(32) NOT NULL,
	CREATE_BEGIN 	datetime,
	CREATE_END		datetime,
	VERSION_STATUS  tinyint(1) NOT NULL DEFAULT 1,
	CREATE_INFO		varchar(1024),
	UPDATED 		datetime,
	primary key (MERCHANT_ID, VERSION_NAME)
);

create table search_hot_word
(
	HOT_ID		int(11) NOT NULL auto_increment,
	STORE_ID 	int(11) NOT NULL,
	HOT_WORD 	varchar(32) NOT NULL,
	HOT_PRIO	int not null,
	CREATED     timestamp not null default CURRENT_TIMESTAMP,
	primary key (HOT_ID)
);













































/******************* import ****************/
create table import_data
(
   MERCHANT_ID   int(11) NOT NULL,
   ROWNUM        int(11) NOT NULL,
   RESULT        int(11) NOT NULL,
   INT_1		 int,
   INT_2         int,
   NUM_1         decimal(7,2),
   NUM_2         decimal(7,2),
   CHAR_1		 varchar(32),
   CHAR_2		 varchar(32),
   primary key (MERCHANT_ID, ROWNUM)
);



