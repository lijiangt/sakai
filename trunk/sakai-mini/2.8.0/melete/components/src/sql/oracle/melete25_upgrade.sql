-- *********************************************************************
-- $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/components/src/sql/oracle/melete25_upgrade.sql $
-- $Id: melete25_upgrade.sql 56413 2008-12-19 22:20:19Z rashmi@etudes.org $
-- *********************************************************************
--  Copyright (c) 2008 Etudes, Inc.  
  
--   Portions completed before September 1, 2008 Copyright (c) 2004, 2005, 2006, 2007, 2008 Foothill College, ETUDES Project  
  
--   Licensed under the Apache License, Version 2.0 (the "License"); you  
--   may not use this file except in compliance with the License. You may  
--   obtain a copy of the License at  
  
--   http://www.apache.org/licenses/LICENSE-2.0  
--
--  Unless required by applicable law or agreed to in writing, software  
--  distributed under the License is distributed on an "AS IS" BASIS,  
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or  
--  implied. See the License for the specific language governing  
--  permissions and limitations under the License. 
-- ********************************************************************* 
alter table melete_module_shdates drop column hide_flag;

alter table melete_module modify title varchar2(255); 
alter table melete_section modify title varchar2(255);
alter table melete_section add OPEN_WINDOW number(1);
update melete_section set OPEN_WINDOW=1;
drop table melete_module_student_privs;
CREATE TABLE melete_site_preference (
  PREF_SITE_ID varchar2(99) default '' NOT NULL,
  PRINTABLE number(1) default NULL,
  AUTONUMBER number(1) default '0' NOT NULL,
  PRIMARY KEY (PREF_SITE_ID)
  );
CREATE INDEX USER_ID_IDX ON melete_user_preference(USER_ID);
