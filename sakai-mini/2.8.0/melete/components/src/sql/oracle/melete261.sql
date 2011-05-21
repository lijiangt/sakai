-- *********************************************************************
-- $URL$
-- $Id$
-- *********************************************************************
--  Copyright (c) 2008 Etudes, Inc.  
  
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
CREATE TABLE melete_cc_license (
  REQ_ATTR number(1) default '0' NOT NULL ,
  ALLOW_CMRCL number(1) default '0' NOT NULL,
  ALLOW_MOD number(11) default '0' NOT NULL ,
  URL varchar2(100) default '' NOT NULL ,
  NAME varchar2(50) default '' NOT NULL ,
  PRIMARY KEY  (REQ_ATTR,ALLOW_CMRCL,ALLOW_MOD,URL,NAME)
);
INSERT INTO melete_cc_license VALUES 
(0,0,0,'http://creativecommons.org/licenses/publicdomain/','Public Domain Dedication');
INSERT INTO melete_cc_license VALUES 
(1,0,0,'http://creativecommons.org/licenses/by-nc-nd/2.0/','Attribution-NonCommercial-NoDerivs');
INSERT INTO melete_cc_license VALUES 
(1,0,1,'http://creativecommons.org/licenses/by-nc-sa/2.0/','Attribution-NonCommercial-ShareAlike');
INSERT INTO melete_cc_license VALUES 
(1,0,2,'http://creativecommons.org/licenses/by-nc/2.0/','Attribution-NonCommercial');
INSERT INTO melete_cc_license VALUES 
(1,1,0,'http://creativecommons.org/licenses/by-nd/2.0/','Attribution-NoDerivs');
INSERT INTO melete_cc_license VALUES 
(1,1,1,'http://creativecommons.org/licenses/by-sa/2.0/','Attribution-ShareAlike');
INSERT INTO melete_cc_license VALUES 
(1,1,2,'http://creativecommons.org/licenses/by/2.0/','Attribution');


CREATE TABLE melete_license (
  CODE number(11) default '0' NOT NULL ,
  DESCRIPTION varchar2(40) default NULL,
  PRIMARY KEY  (CODE)
);

INSERT INTO melete_license VALUES 
(0,'---Select---');
INSERT INTO melete_license VALUES 
(1,'Copyright of Author');
INSERT INTO melete_license VALUES 
(2,'Public Domain');
INSERT INTO melete_license VALUES 
(3,'Creative Commons License');
INSERT INTO melete_license VALUES 
(4,'Fair Use Exception');

CREATE TABLE melete_module (
  MODULE_ID number(11) default '0' NOT NULL,
  VERSION number(11) default '0' NOT NULL ,
  TITLE varchar2(255) default '' NOT NULL ,
  LEARN_OBJ CLOB,
  DESCRIPTION CLOB,
  KEYWORDS varchar2(250) default '' NOT NULL ,
  CREATED_BY_FNAME varchar2(50) default '' NOT NULL ,
  CREATED_BY_LNAME varchar2(50) default '' NOT NULL ,
  USER_ID varchar2(99) default '' NOT NULL ,
  MODIFIED_BY_FNAME varchar2(50) default NULL,
  MODIFIED_BY_LNAME varchar2(50) default NULL,
  INSTITUTE varchar2(50) default NULL,
  WHATS_NEXT CLOB,
  CREATION_DATE date default null NOT NULL ,
  MODIFICATION_DATE date default NULL,
  SEQ_XML CLOB,
  PRIMARY KEY  (MODULE_ID)
);
CREATE TABLE melete_course_module (
  MODULE_ID number(11) default '0' NOT NULL ,
  COURSE_ID varchar2(99) default NULL,
  SEQ_NO number(11) default '0' NOT NULL ,
  ARCHV_FLAG number(1) default '0',
  DATE_ARCHIVED date default NULL,
  DELETE_FLAG number(1) default '0',
  PRIMARY KEY  (MODULE_ID),
  CONSTRAINT FK_CMM_MM FOREIGN KEY(MODULE_ID) REFERENCES melete_module(MODULE_ID)
);
CREATE INDEX COURSE_ID_IDX ON melete_course_module (COURSE_ID); 
CREATE TABLE melete_module_shdates (
  MODULE_ID number(11) default '0' NOT NULL ,
  VERSION number(11) default '0' NOT NULL ,
  START_DATE date default NULL,
  END_DATE date default NULL,
  PRIMARY KEY  (MODULE_ID),
  CONSTRAINT FK_MMSH_MM FOREIGN KEY(MODULE_ID) REFERENCES melete_module(MODULE_ID)
);
CREATE TABLE melete_resource (
  RESOURCE_ID varchar2(255) default '' NOT NULL ,
  VERSION number(11) default '0'  NOT NULL ,
  LICENSE_CODE number(11) default NULL,
  CC_LICENSE_URL varchar2(70) default NULL,
  REQ_ATTR number(1) default NULL,
  ALLOW_CMRCL number(1) default NULL,
  ALLOW_MOD number(11) default NULL,
  COPYRIGHT_OWNER varchar2(55) default NULL,
  COPYRIGHT_YEAR varchar2(25) default NULL,
  PRIMARY KEY  (RESOURCE_ID)
);
CREATE TABLE melete_section (
 SECTION_ID number(11) default '0' NOT NULL ,
 VERSION number(11) default '0' NOT NULL ,
 MODULE_ID number(11) default '0' NOT NULL ,
 TITLE varchar2(255) default '' NOT NULL ,
 CREATED_BY_FNAME varchar2(50) default '' NOT NULL,
 CREATED_BY_LNAME varchar2(50) default '' NOT NULL,
 MODIFIED_BY_FNAME varchar2(50) default NULL,
 MODIFIED_BY_LNAME varchar2(50) default NULL,
 INSTR varchar2(250) default NULL,
 CONTENT_TYPE varchar2(10) default '' NOT NULL,
 AUDIO_CONTENT number(1) default NULL,
 VIDEO_CONTENT number(1) default NULL,
 TEXTUAL_CONTENT number(1) default NULL,
 OPEN_WINDOW number(1) default '1',
 DELETE_FLAG number(1) default '0',
 CREATION_DATE date NOT NULL,
 MODIFICATION_DATE date NOT NULL,
 PRIMARY KEY(SECTION_ID),
 CONSTRAINT FK_MS_MM FOREIGN KEY(MODULE_ID) REFERENCES melete_module(MODULE_ID)
 );
CREATE TABLE melete_section_resource (
  SECTION_ID number(11) default '0' NOT NULL ,
  RESOURCE_ID varchar2(255) default NULL,
  PRIMARY KEY (SECTION_ID),
  CONSTRAINT FK_MSR_MR FOREIGN KEY(RESOURCE_ID) REFERENCES melete_resource(RESOURCE_ID),
  CONSTRAINT FK_MSR_MS FOREIGN KEY(SECTION_ID) REFERENCES melete_section(SECTION_ID)
);
CREATE TABLE melete_user_preference (
  PREF_ID number(11) default '0' NOT NULL ,
  USER_ID varchar2(99) default NULL,
  EDITOR_CHOICE varchar2(255) default NULL,
  EXP_CHOICE number(1) default NULL,
  LTI_CHOICE number(1) default NULL,
  LICENSE_CODE number(11) default NULL,
  CC_LICENSE_URL varchar2(70) default NULL,
  REQ_ATTR number(1) default NULL,
  ALLOW_CMRCL number(1) default NULL,
  ALLOW_MOD number(11) default NULL,
  COPYRIGHT_OWNER varchar2(55) default NULL,
  COPYRIGHT_YEAR varchar2(25) default NULL,
  PRIMARY KEY  (PREF_ID)
);
CREATE TABLE melete_migrate_status (START_FLAG number(1),COMPLETE_FLAG number(1));

CREATE TABLE melete_site_preference (
  PREF_SITE_ID varchar2(99) default '' NOT NULL ,
  PRINTABLE number(1) default NULL,
  AUTONUMBER number(1) default '0' NOT NULL,
  PRIMARY KEY (PREF_SITE_ID)
);
