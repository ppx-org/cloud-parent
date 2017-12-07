
/**************** 单 机  ****************/

CREATE TABLE merchant_account (
  ACCOUNT_ID int(11) NOT NULL auto_increment,
  MERCHANT_ID int(11) NOT NULL,
  LOGIN_ACCOUNT varchar(32) NOT NULL,
  LOGIN_PASSWORD varchar(32) NOT NULL,
  RECORD_STATUS tinyint(1) NOT NULL DEFAULT '1',
  CREATED timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ACCOUNT_ID)
);

/** MERCHANT_ID继承merchant_account.ACCOUNT_ID */
CREATE TABLE merchant (
  MERCHANT_ID int(11) NOT NULL,
  MERCHANT_NAME varchar(32) NOT NULL,
  RECORD_STATUS tinyint(1) NOT NULL DEFAULT '1',
  CREATED timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (MERCHANT_ID)
);

/** index */
create index idx_merchant_account_mer_id on merchant_account(MERCHANT_ID);
create unique index idx_merchant_account_acc on merchant_account(LOGIN_ACCOUNT);
create unique index idx_merchant_name on merchant(MERCHANT_NAME);


CREATE TABLE test (
  TEST_ID int(11) NOT NULL AUTO_INCREMENT,
  TEST_NAME varchar(32) NOT NULL,
  TEST_TIME timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  TEST_DATE date DEFAULT NULL,
  PRIMARY KEY (TEST_ID)
);
create unique index idx_test_name on test(TEST_NAME);





/**************** 分布式  ****************/
create table test_user (
	USER_ID int not null auto_increment primary key,
	USER_ACCOUNT varchar(32) not null,
	USER_PASSWORD varchar(32) not null,
	USER_NAME varchar(32) not null
);

create unique index idx_test_user_account on test_user(USER_ACCOUNT);
create unique index idx_test_user_a_p on test_user(USER_ACCOUNT, USER_PASSWORD);

create table test_role (
	ROLE_ID int not null auto_increment primary key,
    ROLE_NAME varchar(32) not null
);

create table test_user_in_role (
	USER_ID int not null,
    ROLE_ID int not null,
    primary key(USER_ID, ROLE_ID)
);

insert into test_user(USER_ID, USER_ACCOUNT, USER_PASSWORD, USER_NAME) values(1, 'admin', md5('123PASS'), 'admin');
insert into test_user(USER_ID, USER_ACCOUNT, USER_PASSWORD, USER_NAME) values(2, 'test', md5('123PASS'), 'test');
insert into test_role(ROLE_ID, ROLE_NAME) values(1, 'testRoleName');
insert into test_user_in_role(USER_ID, ROLE_ID) values(2, 1);




/**************** 电商  ****************/

/*==============================================================*/
/* Table: category                                              */
/*==============================================================*/
create table category
(
   CAT_ID               int not null auto_increment,
   MERCHANT_ID          int not null,
   PARENT_ID            int not null,
   CAT_NAME             varchar(32) not null,
   CAT_PRIO             int not null,
   CREATED              timestamp not null default CURRENT_TIMESTAMP,
   RECORD_STATUS        smallint not null default 1,
   primary key (CAT_ID)
);

create table repository
(
   REPO_ID              int not null auto_increment,
   MERCHANT_ID          int not null,
   REPO_NAME            varchar(32) not null,
   REPO_ADDRESS         varchar(128) not null,
   CREATED              timestamp not null default CURRENT_TIMESTAMP,
   RECORD_STATUS        smallint not null default 1,
   primary key (REPO_ID)
);

create table store
(
   STORE_ID             int not null,
   MERCHANT_ID          int not null,
   STORE_NAME           varchar(32) not null,
   STORE_NO             varchar(32) not null,
   CREATED              timestamp not null default CURRENT_TIMESTAMP,
   RECORD_STATUS        smallint not null default 1,
   primary key (STORE_ID)
);

/*==============================================================*/
/* Table: store_map_repo                                        */
/*==============================================================*/
create table store_map_repo
(
   REPO_ID              int not null,
   STORE_ID             int not null,
   primary key (REPO_ID, STORE_ID)
);







/*==============================================================*/
/* Table: brand                                                 */
/*==============================================================*/
create table brand
(
   BRAND_ID             int not null auto_increment,
   MERCHANT_ID          int not null,
   BRAND_NAME           varchar(32) not null,
   BRAND_PRIO           int not null,
   CREATED              timestamp not null default CURRENT_TIMESTAMP,
   RECORD_STATUS        smallint not null default 1,
   primary key (BRAND_ID)
);

/*==============================================================*/
/* Table: subject                                               */
/*==============================================================*/
create table subject
(
   SUBJECT_ID           int not null auto_increment,
   MERCHANT_ID          int,
   SUBJECT_NAME         varchar(32) not null,
   SUBJECT_PRIO         int not null,
   CREATED              timestamp not null default CURRENT_TIMESTAMP,
   RECORD_STATUS        smallint not null default 1,
   primary key (SUBJECT_ID)
);


/*==============================================================*/
/* Table: subject_map_prod                                      */
/*==============================================================*/
create table subject_map_prod
(
   PROD_ID              int not null,
   SUBJECT_ID           int not null,
   primary key (PROD_ID, SUBJECT_ID)
);



























/******************************          release      ****************************/
/*==============================================================*/
/* Table: sku                                                   */
/*==============================================================*/
create table sku
(
   SKU_ID               int not null auto_increment,
   PROD_ID              int not null,
   STOCK_NUM            numeric(3,0) not null,
   SKU_PRIO             int not null,
   PRICE                decimal(7,2) not null,
   SKU_NAME				varchar(32),
   primary key (SKU_ID)
);

create table product
(
   PROD_ID              int not null,
   CAT_ID               int not null,
   REPO_ID              int not null,
   PROD_TITLE           varchar(32),
   primary key (PROD_ID)
);

create table sku_img
(
   SKU_IMG_ID           int not null auto_increment,
   SKU_ID               int not null,
   SKU_IMG_PRIO         int not null,
   SKU_IMG_SRC          varchar(128) not null,
   primary key (SKU_IMG_ID)
);





