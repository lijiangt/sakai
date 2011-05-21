-- *********************************************************************
-- $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/components/src/sql/mysql/melete24mig.sql $
-- $Id: melete24mig.sql 56413 2008-12-19 22:20:19Z rashmi@etudes.org $
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
CREATE TABLE `melete_migrate_status` (START_FLAG tinyint(1),COMPLETE_FLAG tinyint(1));
INSERT INTO `melete_migrate_status`(START_FLAG,COMPLETE_FLAG) values(1,1);
CREATE INDEX COURSE_ID_IDX ON `melete_course_module` (COURSE_ID);                               