CREATE TABLE `melete_special_access` (
  `ACCESS_ID` int(11) NOT NULL default '0',
  `MODULE_ID` int(11) NOT NULL default '0',
  `USERS` longtext NOT NULL,
  `START_DATE` datetime default NULL,
  `END_DATE` datetime default NULL,
  PRIMARY KEY  (`ACCESS_ID`),
  CONSTRAINT `FK_MSA_MM` FOREIGN KEY(`MODULE_ID`) REFERENCES `melete_module`(`MODULE_ID`)
); 
