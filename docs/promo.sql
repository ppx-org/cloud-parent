
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
   CAT_POLICY           varchar(32) not null,
   primary key (PROG_ID, CAT_ID)
);

/*==============================================================*/
/* Table: program_brand                                         */
/*==============================================================*/
create table program_brand
(
   PROG_ID              int not null,
   BRAND_ID             int not null,
   BRAND_POLICY         varchar(32) not null,
   primary key (PROG_ID, BRAND_ID)
);

/*==============================================================*/
/* Table: program_subject                                       */
/*==============================================================*/
create table program_subject
(
   PROG_ID              int not null,
   SUBJECT_ID           int not null,
   SUBJECT_POLICY       varchar(32) not null,
   primary key (PROG_ID, SUBJECT_ID)
);





/*==============================================================*/
/* Table: program_change                                        */
/*==============================================================*/
create table program_change
(
   PROG_ID              int not null,
   PROD_ID              int not null,
   ENOUGH_PRICE         decimal(7,2) not null,
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
/* Table: program_dependent                                     */
/*==============================================================*/
create table program_dependence
(
   PROG_ID              int not null,
   PROD_ID              int not null,
   DEPENDENT_PRICE      decimal(7,2) not null,
   primary key (PROG_ID, PROD_ID)
);
















