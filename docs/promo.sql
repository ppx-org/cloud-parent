
/*==============================================================*/
/* Table: program                                               */
/*==============================================================*/

CREATE TABLE program (
  PROG_ID int(11) NOT NULL auto_increment,
  MERCHANT_ID int(11) NOT NULL,
  PROG_NAME varchar(32) NOT NULL,
  PROG_PRIO int(11) NOT NULL,
  PROG_BEGIN date NOT NULL,
  PROG_END date NOT NULL,
  POLICY_TYPE varchar(32) NOT NULL,
  POLICY_ARGS varchar(32),
  RECORD_STATUS smallint not null default 1,
  CREATED timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (PROG_ID)
);

/*==============================================================*/
/* Table: program_category                                      */
/*==============================================================*/
create table program_category
(
   PROG_ID              int not null,
   CAT_ID               int not null,
   primary key (PROG_ID, CAT_ID)
);

/*==============================================================*/
/* Table: program_brand                                         */
/*==============================================================*/
create table program_brand
(
   PROG_ID              int not null,
   BRAND_ID             int not null,
   primary key (PROG_ID, BRAND_ID)
);

/*==============================================================*/
/* Table: program_product                                       */
/*==============================================================*/
create table program_product
(
   PROG_ID              int not null,
   PROD_ID           	int not null,
   primary key (PROG_ID, PROD_ID)
);


/*==============================================================*/
/* Table: program_change                                        */
/*==============================================================*/
create table program_change
(
   PROG_ID              int not null,
   PROD_ID              int not null,
   CHANGE_PRICE         decimal(7,2) not null,
   primary key (PROG_ID, PROD_ID)
);

/*==============================================================*/
/* Table: program_special                                       */
/*==============================================================*/
create table program_special
(
   PROG_ID              int not null,
   PROD_ID              int not null,
   SPECIAL_PRICE        decimal(7,2) not null,
   primary key (PROG_ID, PROD_ID)
);



/*==============================================================*/
/* Table: program_dependence                                    */
/*==============================================================*/
create table program_dependence
(
   PROG_ID              int not null,
   PROD_ID              int not null,
   DEPEND_RPOD_ID       int not null,
   DEPEND_PRICE         decimal(7,2) not null,
   primary key (PROD_ID, PROG_ID)
);


create table program_index
(
   MERCHANT_ID 			int not null,
   PROD_ID              int not null,
   PROG_ID              int not null,
   INDEX_BEGIN          date not null,
   INDEX_END            date not null,
   INDEX_PRIO           int not null,
   INDEX_POLICY         varchar(32),
   INDEX_GROUP          varchar(32),
   primary key (MERCHANT_ID, PROD_ID, PROG_ID)
);














