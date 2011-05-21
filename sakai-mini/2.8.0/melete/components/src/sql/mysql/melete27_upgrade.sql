alter table melete_user_preference add column LICENSE_CODE int(11);
alter table melete_user_preference add column CC_LICENSE_URL varchar(275);
alter table melete_user_preference add column REQ_ATTR tinyint(1);
alter table melete_user_preference add column ALLOW_CMRCL tinyint(1);
alter table melete_user_preference add column ALLOW_MOD int(11);
alter table melete_user_preference add column COPYRIGHT_OWNER varchar(255);
alter table melete_user_preference add column COPYRIGHT_YEAR varchar(25);

alter table melete_module_shdates add column START_EVENT_ID varchar(99);
alter table melete_module_shdates add column END_EVENT_ID varchar(99);
alter table melete_module_shdates add column ADDTO_SCHEDULE tinyint(1);

alter table melete_resource modify column CC_LICENSE_URL varchar(275);
alter table melete_resource modify column COPYRIGHT_OWNER varchar(255);

drop table melete_migrate_status;
 