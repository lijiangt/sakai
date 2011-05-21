CREATE TABLE melete_special_access (
  ACCESS_ID number(11) default '0',
  MODULE_ID number(11) default '0',
  USERS CLOB NOT NULL,
  START_DATE timestamp default NULL,
  END_DATE timestamp default NULL,
  PRIMARY KEY (ACCESS_ID),
  CONSTRAINT FK_MSA_MM FOREIGN KEY(MODULE_ID) REFERENCES melete_module(MODULE_ID)
); 
