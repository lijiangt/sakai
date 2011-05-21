alter table melete_user_preference add LICENSE_CODE number(11);
alter table melete_user_preference add CC_LICENSE_URL varchar2(275);
alter table melete_user_preference add REQ_ATTR number(1);
alter table melete_user_preference add ALLOW_CMRCL number(1);
alter table melete_user_preference add ALLOW_MOD number(11);
alter table melete_user_preference add COPYRIGHT_OWNER varchar2(255);
alter table melete_user_preference add COPYRIGHT_YEAR varchar2(25);

alter table melete_module_shdates add START_EVENT_ID varchar2(99);
alter table melete_module_shdates add END_EVENT_ID varchar2(99);
alter table melete_module_shdates add ADDTO_SCHEDULE number(1);

alter table melete_resource modify CC_LICENSE_URL varchar2(275);
alter table melete_resource modify COPYRIGHT_OWNER varchar2(255);

drop table melete_migrate_status;
 
