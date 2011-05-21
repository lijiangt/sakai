CREATE TABLE `melete_bookmark` (
  `BOOKMARK_ID` int(11) NOT NULL default '0',
  `SECTION_ID` int(11) NOT NULL default '0',
  `USER_ID` varchar(99) default NULL,
  `SITE_ID` varchar(99) default NULL,
  `TITLE` varchar(255) NOT NULL default '',
  `NOTES` text,
  `LAST_VISITED` tinyint(1) default NULL,
  PRIMARY KEY  (`BOOKMARK_ID`),
  CONSTRAINT `FK_MB_MS` FOREIGN KEY(`SECTION_ID`) REFERENCES `melete_section`(`SECTION_ID`)
);

alter table melete_resource modify column COPYRIGHT_YEAR varchar(255);
alter table melete_user_preference modify column COPYRIGHT_YEAR varchar(255);

CREATE TABLE `melete_special_access` (
  `ACCESS_ID` int(11) NOT NULL default '0',
  `MODULE_ID` int(11) NOT NULL default '0',
  `USERS` longtext NOT NULL,
  `START_DATE` datetime default NULL,
  `END_DATE` datetime default NULL,
  PRIMARY KEY  (`ACCESS_ID`),
  CONSTRAINT `FK_MSA_MM` FOREIGN KEY(`MODULE_ID`) REFERENCES `melete_module`(`MODULE_ID`)
); 
