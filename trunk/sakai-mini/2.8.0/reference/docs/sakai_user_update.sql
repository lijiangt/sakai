update SAKAI_USER set LAST_NAME=FIRST_NAME where LAST_NAME is null;
update SAKAI_USER set FIRST_NAME=null where LAST_NAME=FIRST_NAME;
update SAKAI_USER set LAST_NAME=CONCAT(FIRST_NAME,LAST_NAME);
update SAKAI_USER set FIRST_NAME=null;

select FIRST_NAME,LAST_NAME from SAKAI_USER where FIRST_NAME is not null and FIRST_NAME<>'';