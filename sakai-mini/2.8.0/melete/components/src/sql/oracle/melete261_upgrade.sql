-- *********************************************************************
-- $URL$
-- $Id$
-- *********************************************************************
--  Copyright (c) 2008, 2009 Etudes, Inc.  

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
alter table melete_user_preference add column LICENSE_CODE number(11);
alter table melete_user_preference add column CC_LICENSE_URL varchar2(70);
alter table melete_user_preference add column REQ_ATTR number(1);
alter table melete_user_preference add column ALLOW_CMRCL number(1);
alter table melete_user_preference add column ALLOW_MOD number(11);
alter table melete_user_preference add column COPYRIGHT_OWNER varchar2(55);
alter table melete_user_preference add column COPYRIGHT_YEAR varchar2(25);