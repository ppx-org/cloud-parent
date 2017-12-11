


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