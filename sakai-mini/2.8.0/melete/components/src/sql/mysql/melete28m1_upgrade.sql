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