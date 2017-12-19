
/******************* search ****************/
create table search_words
(
	PROD_ID		int(11) NOT NULL,
	MERCHANT_ID int(11) NOT NULL,
	WORDS 	varchar(256) NOT NULL,
	primary key (PROD_ID)
)


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



