-- *********************************************************************
-- $URL$
-- $Id$
-- *********************************************************************
--  Copyright (c) 2008,2009 Etudes, Inc.  
  
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
CREATE TABLE `melete_cc_license` (
  `REQ_ATTR` tinyint(1) NOT NULL default '0',
  `ALLOW_CMRCL` tinyint(1) NOT NULL default '0',
  `ALLOW_MOD` int(11) NOT NULL default '0',
  `URL` varchar(100) NOT NULL default '',
  `NAME` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`REQ_ATTR`,`ALLOW_CMRCL`,`ALLOW_MOD`,`URL`,`NAME`)
);
INSERT INTO melete_cc_license VALUES 
(0,0,0,'http://creativecommons.org/licenses/publicdomain/','Public Domain Dedication'),
(1,0,0,'http://creativecommons.org/licenses/by-nc-nd/2.0/','Attribution-NonCommercial-NoDerivs'),
(1,0,1,'http://creativecommons.org/licenses/by-nc-sa/2.0/','Attribution-NonCommercial-ShareAlike'),
(1,0,2,'http://creativecommons.org/licenses/by-nc/2.0/','Attribution-NonCommercial'),
(1,1,0,'http://creativecommons.org/licenses/by-nd/2.0/','Attribution-NoDerivs'),
(1,1,1,'http://creativecommons.org/licenses/by-sa/2.0/','Attribution-ShareAlike'),
(1,1,2,'http://creativecommons.org/licenses/by/2.0/','Attribution');


CREATE TABLE `melete_license` (
  `CODE` int(11) NOT NULL default '0',
  `DESCRIPTION` varchar(40) default NULL,
  PRIMARY KEY  (`CODE`)
);
INSERT INTO melete_license VALUES 
(0,'---Select---'),
(1,'Copyright of Author'),
(2,'Public Domain'),
(3,'Creative Commons License'),
(4,'Fair Use Exception');
CREATE TABLE `melete_module` (
  `MODULE_ID` int(11) NOT NULL default '0',
  `VERSION` int(11) NOT NULL default '0',
  `TITLE` varchar(255) NOT NULL default '',
  `LEARN_OBJ` text,
  `DESCRIPTION` text,
  `KEYWORDS` varchar(250) NOT NULL default '',
  `CREATED_BY_FNAME` varchar(50) NOT NULL default '',
  `CREATED_BY_LNAME` varchar(50) NOT NULL default '',
  `USER_ID` varchar(99) NOT NULL default '',
  `MODIFIED_BY_FNAME` varchar(50) default NULL,
  `MODIFIED_BY_LNAME` varchar(50) default NULL,
  `INSTITUTE` varchar(50) default NULL,
  `WHATS_NEXT` text,
  `CREATION_DATE` datetime NOT NULL default '0000-00-00 00:00:00',
  `MODIFICATION_DATE` datetime default NULL,
  `SEQ_XML` text,
  PRIMARY KEY  (`MODULE_ID`)
);
CREATE TABLE `melete_course_module` (
  `MODULE_ID` int(11) NOT NULL default '0',
  `COURSE_ID` varchar(99) default NULL,
  `SEQ_NO` int(11) NOT NULL default '0',
  `ARCHV_FLAG` tinyint(1) default '0',
  `DATE_ARCHIVED` datetime default NULL,
  `DELETE_FLAG` tinyint(1) default '0',
  PRIMARY KEY  (`MODULE_ID`),
  CONSTRAINT `FK_CMM_MM` FOREIGN KEY(`MODULE_ID`) REFERENCES `melete_module`(`MODULE_ID`)
);
CREATE INDEX COURSE_ID_IDX ON `melete_course_module` (COURSE_ID); 
CREATE TABLE `melete_module_shdates` (
  `MODULE_ID` int(11) NOT NULL default '0',
  `VERSION` int(11) NOT NULL default '0',
  `START_DATE` datetime default NULL,
  `END_DATE` datetime default NULL,
  `START_EVENT_ID` varchar(99),
  `END_EVENT_ID` varchar(99),
  `ADDTO_SCHEDULE` tinyint(1)),
  PRIMARY KEY  (`MODULE_ID`),
  CONSTRAINT `FK_MMSH_MM` FOREIGN KEY(`MODULE_ID`) REFERENCES `melete_module`(`MODULE_ID`)
);
CREATE TABLE `melete_resource` (
  `RESOURCE_ID` varchar(255) NOT NULL default '',
  `VERSION` int(11) NOT NULL default '0',
  `LICENSE_CODE` int(11) default NULL,
  `CC_LICENSE_URL` varchar(275) default NULL,
  `REQ_ATTR` tinyint(1) default NULL,
  `ALLOW_CMRCL` tinyint(1) default NULL,
  `ALLOW_MOD` int(11) default NULL,
  `COPYRIGHT_OWNER` varchar(255) default NULL,
  `COPYRIGHT_YEAR` varchar(25) default NULL,
  PRIMARY KEY  (`RESOURCE_ID`)
);
CREATE TABLE `melete_section` (
 `SECTION_ID` int(11) NOT NULL default '0',
 `VERSION` int(11) NOT NULL default '0',
 `MODULE_ID` int(11) NOT NULL default '0',
 `TITLE` varchar(255) NOT NULL default '',
 `CREATED_BY_FNAME` varchar(50) NOT NULL default '',
 `CREATED_BY_LNAME` varchar(50) NOT NULL default '',
 `MODIFIED_BY_FNAME` varchar(50) default NULL,
 `MODIFIED_BY_LNAME` varchar(50) default NULL,
 `INSTR` varchar(250) default NULL,
 `CONTENT_TYPE` varchar(10) NOT NULL default '',
 `AUDIO_CONTENT` tinyint(1) default NULL,
 `VIDEO_CONTENT` tinyint(1) default NULL,
 `TEXTUAL_CONTENT` tinyint(1) default NULL,
 `OPEN_WINDOW` tinyint(1) default '1',
 `DELETE_FLAG` tinyint(1) default '0',
 `CREATION_DATE` datetime NOT NULL default '0000-00-00 00:00:00',
 `MODIFICATION_DATE` datetime NOT NULL default '0000-00-00 00:00:00',
 PRIMARY KEY(`SECTION_ID`),
 CONSTRAINT `FK_MS_MM` FOREIGN KEY(`MODULE_ID`) REFERENCES `melete_module`(`MODULE_ID`)
 );
CREATE TABLE `melete_section_resource` (
  `SECTION_ID` int(11) NOT NULL default '0',
  `RESOURCE_ID` varchar(255) default NULL,
  PRIMARY KEY (`SECTION_ID`),
  CONSTRAINT `FK_MSR_MR` FOREIGN KEY(`RESOURCE_ID`) REFERENCES `melete_resource`(`RESOURCE_ID`),
  CONSTRAINT `FK_MSR_MS` FOREIGN KEY(`SECTION_ID`) REFERENCES `melete_section`(`SECTION_ID`)
);
CREATE TABLE `melete_user_preference` (
  `PREF_ID` int(11) NOT NULL default '0',
  `USER_ID` varchar(99) default NULL,
  `EDITOR_CHOICE` varchar(255) default NULL,
  `EXP_CHOICE` tinyint(1) default NULL,
  `LTI_CHOICE` tinyint(1) default NULL,
  `LICENSE_CODE` int(11) default NULL,
  `CC_LICENSE_URL` varchar(275) default NULL,
  `REQ_ATTR` tinyint(1) default NULL,
  `ALLOW_CMRCL` tinyint(1) default NULL,
  `ALLOW_MOD` int(11) default NULL,
  `COPYRIGHT_OWNER` varchar(255) default NULL,
  `COPYRIGHT_YEAR` varchar(25) default NULL,
  PRIMARY KEY  (`PREF_ID`)
);
CREATE INDEX USER_ID_IDX ON melete_user_preference(USER_ID);

CREATE TABLE `melete_site_preference` (
  `PREF_SITE_ID` varchar(99) NOT NULL default '',
  `PRINTABLE` tinyint(1) default NULL,
  `AUTONUMBER` tinyint(1) default '0',
  PRIMARY KEY (`PREF_SITE_ID`)
);
