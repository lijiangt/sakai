CREATE TABLE melete_cc_license (
  REQ_ATTR number(1) default '0' NOT NULL,
  ALLOW_CMRCL number(1) default '0' NOT NULL,
  ALLOW_MOD number(11) default '0' NOT NULL,
  URL varchar2(100) default ' ' NOT NULL,
  NAME varchar2(50) default ' ' NOT NULL,
  constraint pk_melete_cc_license PRIMARY KEY  (REQ_ATTR,ALLOW_CMRCL,ALLOW_MOD,URL,NAME)
);
INSERT INTO melete_cc_license VALUES (0,0,0,'http://creativecommons.org/licenses/publicdomain/','Public Domain Dedication');
INSERT INTO melete_cc_license VALUES (1,0,0,'http://creativecommons.org/licenses/by-nc-nd/2.0/','Attribution-NonCommercial-NoDerivs');
INSERT INTO melete_cc_license VALUES (1,0,1,'http://creativecommons.org/licenses/by-nc-sa/2.0/','Attribution-NonCommercial-ShareAlike');
INSERT INTO melete_cc_license VALUES (1,0,2,'http://creativecommons.org/licenses/by-nc/2.0/','Attribution-NonCommercial');
INSERT INTO melete_cc_license VALUES (1,1,0,'http://creativecommons.org/licenses/by-nd/2.0/','Attribution-NoDerivs');
INSERT INTO melete_cc_license VALUES (1,1,1,'http://creativecommons.org/licenses/by-sa/2.0/','Attribution-ShareAlike');
INSERT INTO melete_cc_license VALUES (1,1,2,'http://creativecommons.org/licenses/by/2.0/','Attribution');

CREATE TABLE melete_license (
  CODE number(11) default '0' NOT NULL,
  DESCRIPTION varchar2(40),
  constraint pk_melete_license PRIMARY KEY  (CODE)
);
INSERT INTO melete_license VALUES (0,'---Select---');
INSERT INTO melete_license VALUES (1,'Copyright of Author');
INSERT INTO melete_license VALUES (2,'Public Domain');
INSERT INTO melete_license VALUES (3,'Creative Commons License');
INSERT INTO melete_license VALUES (4,'Fair Use Exception');

CREATE TABLE melete_module (
  MODULE_ID number(11) default '0' NOT NULL,
  VERSION number(11) default '0' NOT NULL,
  TITLE varchar2(255) default ' ' NOT NULL,
  LEARN_OBJ CLOB,
  DESCRIPTION CLOB,
  KEYWORDS varchar2(250) default ' ' NOT NULL,
  CREATED_BY_FNAME varchar2(50) default ' ' NOT NULL,
  CREATED_BY_LNAME varchar2(50) default ' ' NOT NULL,
  USER_ID varchar2(99) default ' ' NOT NULL,
  MODIFIED_BY_FNAME varchar2(50) default NULL,
  MODIFIED_BY_LNAME varchar2(50) default NULL,
  INSTITUTE varchar2(50),
  WHATS_NEXT CLOB,
  CREATION_DATE date NOT NULL,
  MODIFICATION_DATE date,
  SEQ_XML CLOB,
  constraint pk_melete_module PRIMARY KEY  (MODULE_ID)
);
CREATE TABLE melete_course_module (
  MODULE_ID number(11) default '0' NOT NULL,
  COURSE_ID varchar2(99),
  SEQ_NO number(11) default '0' NOT NULL,
  ARCHV_FLAG number(1) default '0',
  DATE_ARCHIVED date,
  DELETE_FLAG number(1) default '0',
  constraint pk_melete_cm PRIMARY KEY  (MODULE_ID),
  CONSTRAINT FK_CMM_MM FOREIGN KEY(MODULE_ID) REFERENCES melete_module(MODULE_ID)
);
CREATE INDEX COURSE_ID_IDX ON melete_course_module (COURSE_ID); 
CREATE TABLE melete_module_shdates (
  MODULE_ID number(11) default '0' NOT NULL,
  VERSION number(11) default '0' NOT NULL,
  START_DATE date,
  END_DATE date,
  START_EVENT_ID varchar2(99),
  END_EVENT_ID varchar2(99),
  ADDTO_SCHEDULE number(1),
  constraint pk_melete_msh PRIMARY KEY  (MODULE_ID),
  CONSTRAINT FK_MMSH_MM FOREIGN KEY(MODULE_ID) REFERENCES melete_module(MODULE_ID)
);
CREATE TABLE melete_resource (
  RESOURCE_ID varchar2(255) default ' ' NOT NULL,
  VERSION number(11) default '0' NOT NULL,
  LICENSE_CODE number(11),
  CC_LICENSE_URL varchar2(275),
  REQ_ATTR number(1),
  ALLOW_CMRCL number(1),
  ALLOW_MOD number(11),
  COPYRIGHT_OWNER varchar2(255),
  COPYRIGHT_YEAR varchar2(25),
  constraint pk_melete_resource PRIMARY KEY  (RESOURCE_ID)
);
CREATE TABLE melete_section (
 SECTION_ID number(11) default '0' NOT NULL,
 VERSION number(11) default '0' NOT NULL,
 MODULE_ID number(11) default '0' NOT NULL,
 TITLE varchar2(255) default ' ' NOT NULL,
 CREATED_BY_FNAME varchar2(50) default ' ' NOT NULL,
 CREATED_BY_LNAME varchar2(50) default ' ' NOT NULL,
 MODIFIED_BY_FNAME varchar2(50),
 MODIFIED_BY_LNAME varchar2(50),
 INSTR varchar2(250),
 CONTENT_TYPE varchar2(10) default ' ' NOT NULL,
 AUDIO_CONTENT number(1),
 VIDEO_CONTENT number(1),
 TEXTUAL_CONTENT number(1),
 OPEN_WINDOW number(1) default '1',
 DELETE_FLAG number(1) default '0',
 CREATION_DATE date NOT NULL,
 MODIFICATION_DATE date,
 constraint pk_melete_section PRIMARY KEY(SECTION_ID),
 CONSTRAINT FK_MS_MM FOREIGN KEY(MODULE_ID) REFERENCES melete_module(MODULE_ID)
 );
CREATE TABLE melete_section_resource (
  SECTION_ID number(11) default '0' NOT NULL,
  RESOURCE_ID varchar2(255),
  constraint pk_melete_section_resource PRIMARY KEY (SECTION_ID),
  CONSTRAINT FK_MSR_MR FOREIGN KEY(RESOURCE_ID) REFERENCES melete_resource(RESOURCE_ID),
  CONSTRAINT FK_MSR_MS FOREIGN KEY(SECTION_ID) REFERENCES melete_section(SECTION_ID)
);
CREATE TABLE melete_user_preference (
  PREF_ID number(11) default '0' NOT NULL,
  USER_ID varchar2(99),
  EDITOR_CHOICE varchar2(255),
  EXP_CHOICE number(1),
  LTI_CHOICE number(1),
  LICENSE_CODE number(11),
  CC_LICENSE_URL varchar2(275),
  REQ_ATTR number(1),
  ALLOW_CMRCL number(1),
  ALLOW_MOD number(11),
  COPYRIGHT_OWNER varchar2(255),
  COPYRIGHT_YEAR varchar2(25),
  constraint pk_melete_up PRIMARY KEY  (PREF_ID)
);
CREATE INDEX USER_ID_IDX ON melete_user_preference(USER_ID);

CREATE TABLE melete_site_preference (
  PREF_SITE_ID varchar2(99) default ' ' NOT NULL,
  PRINTABLE number(1),
  AUTONUMBER number(1) default '0',
  constraint pk_melete_sp PRIMARY KEY (PREF_SITE_ID)
);