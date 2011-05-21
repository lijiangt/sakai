-- *********************************************************************
-- $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/components/src/sql/mysql/melete24_upgrade.sql $
-- $Id: melete24_upgrade.sql 56413 2008-12-19 22:20:19Z rashmi@etudes.org $
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
CREATE TABLE `melete_module_bkup` as SELECT * FROM `melete_module` WHERE module_id in (SELECT module_id FROM `melete_course_module` where delete_flag=0);
CREATE TABLE `melete_section_bkup` as SELECT * FROM `melete_section` where delete_flag=0;
CREATE TABLE `melete_migrate_status` (START_FLAG tinyint(1),COMPLETE_FLAG tinyint(1));
CREATE TABLE `melete_license` (
 `CODE` int(11) NOT NULL default '0',
 `DESCRIPTION` varchar(40) default NULL,
 PRIMARY KEY  (`CODE`)
 );
CREATE TABLE `melete_resource` (
  `RESOURCE_ID` varchar(255) NOT NULL default '',
  `VERSION` int(11) NOT NULL default '0',
  `LICENSE_CODE` int(11) default NULL,
  `CC_LICENSE_URL` varchar(70) default NULL,
  `REQ_ATTR` tinyint(1) default NULL,
  `ALLOW_CMRCL` tinyint(1) default NULL,
  `ALLOW_MOD` int(11) default NULL,
  `COPYRIGHT_OWNER` varchar(55) default NULL,
  `COPYRIGHT_YEAR` varchar(25) default NULL,
  PRIMARY KEY  (`RESOURCE_ID`)
);
CREATE TABLE `melete_section_resource` (
  `SECTION_ID` int(11) NOT NULL default '0',
  `RESOURCE_ID` varchar(255) default NULL,
  PRIMARY KEY  (`SECTION_ID`)
);


ALTER TABLE melete_section_resource ADD (FOREIGN KEY (RESOURCE_ID) REFERENCES melete_resource(RESOURCE_ID));
ALTER TABLE melete_section_resource ADD (FOREIGN KEY (SECTION_ID) REFERENCES melete_section(SECTION_ID));

ALTER TABLE melete_module ADD COLUMN SEQ_XML TEXT;
ALTER TABLE melete_module MODIFY COLUMN CREATED_BY_FNAME varchar(50);
ALTER TABLE melete_module MODIFY COLUMN CREATED_BY_LNAME varchar(50);
ALTER TABLE melete_module MODIFY COLUMN MODIFIED_BY_FNAME varchar(50);
ALTER TABLE melete_module MODIFY COLUMN MODIFIED_BY_LNAME varchar(50);
ALTER TABLE melete_module DROP COLUMN CC_LICENSE_URL;
ALTER TABLE melete_module DROP COLUMN REQ_ATTR;
ALTER TABLE melete_module DROP COLUMN ALLOW_CMRCL;
ALTER TABLE melete_module DROP COLUMN ALLOW_MOD;

CREATE INDEX COURSE_ID_IDX ON `melete_course_module` (COURSE_ID); 

ALTER TABLE melete_section MODIFY COLUMN CREATED_BY_FNAME varchar(50);
ALTER TABLE melete_section MODIFY COLUMN CREATED_BY_LNAME varchar(50);
ALTER TABLE melete_section MODIFY COLUMN MODIFIED_BY_FNAME varchar(50);
ALTER TABLE melete_section MODIFY COLUMN MODIFIED_BY_LNAME varchar(50);
ALTER TABLE melete_section DROP COLUMN SEQ_NO;
ALTER TABLE melete_section DROP COLUMN CONTENT_PATH;
ALTER TABLE melete_section DROP COLUMN UPLOAD_PATH;
ALTER TABLE melete_section DROP COLUMN LINK;


ALTER TABLE melete_user_preference ADD COLUMN EXP_CHOICE tinyint(1);
UPDATE melete_user_preference SET EXP_CHOICE=1;