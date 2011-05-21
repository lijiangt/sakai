/**********************************************************************************
 *
 * $URL$
 * $Id$
 ***********************************************************************************
 *
 * Copyright (c) 2009 Etudes, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you
 * may not use this file except in compliance with the License. You may
 * obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * permissions and limitations under the License.
 *
 **********************************************************************************/

MELETE ADMIN TOOL SETUP INSTRUCTIONS

Prior to version 2.5, Melete left behind deleted data (deleted modules and sections and their associated resources). If you have used previous Melete versions, you might consider running this admin tool. Melete Admin is an administrative tool which lets admin users to clean up old deleted modules and sections and clean up their resources from database and the file System. There are few queries (provided further down in this document) you can run to find out the numbers and make the decision. 

To work with Melete Admin source, you need the same development environment as Sakai, essentially Java 1.4 and Maven 1.0.2.

NOTE : IT IS RECOMMENDED TO CREATE BACKUPS OF DATABASE AND THE FILE SYSTEM WHERE CONTENT RESIDES BEFORE RUNNING THIS TOOL.

-----------------------------------------------------
SETUP INSTRUCTIONS

1. Add tool to Admin Workspace	

	1.1. Log on as Sakai admin. Add sakai.meleteAdmin in the Administrative Workspace.
	
	1.2 To add Tool, go to Sites, select !admin and then click on Pages. Add a new Page and provide the title for this new tool (i.e. 'Melete Admin'). Then, select sakai.meleteAdmin and save your changes. 		
	
	We recommend to turn INFO log ON for org.etudes.component.app.melete to see the process completion information.
	
HOW TO FIND DELETED MELETE DATA (THAT WEREN'T DEEP DELETED):

To find deleted modules:

SELECT GROUP_CONCAT(cmod.module_id),count(cmod.module_id),cmod.course_id, s.title from melete_course_module cmod,SAKAI_SITE s where cmod.delete_flag = 1 and cmod.course_id = s.site_id GROUP BY cmod.course_id order by s.title;

To find deleted sections from active modules:

SELECT GROUP_CONCAT(sec.section_id),count(sec.section_id),GROUP_CONCAT(sec.module_id),cmod.course_id, s.title
FROM melete_section sec,melete_course_module cmod, SAKAI_SITE s
where sec.delete_flag = 1 AND sec.module_id = cmod.module_id AND
cmod.course_id NOT IN (select c1.course_id from melete_course_module c1 where c1.delete_flag =1)
AND cmod.delete_flag = 0 AND cmod.course_id = s.site_id GROUP BY cmod.course_id order by s.title;

Melete Admin Deep Delete tool has been tested with Etudes production data. We had 17513 deleted modules and 4853 deleted sections from active modules and in all, affecting 3005 sites. It took around 3 hrs to cleanup the old deleted data.