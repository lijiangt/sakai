/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-api/src/java/org/etudes/api/app/melete/ModuleService.java $
 * $Id: ModuleService.java 70662 2010-10-12 17:02:56Z mallika@etudes.org $
 ***********************************************************************************
 *
 * Copyright (c) 2008, 2009 Etudes, Inc.
 *
 * Portions completed before September 1, 2008 Copyright (c) 2004, 2005, 2006, 2007, 2008 Foothill College, ETUDES Project
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

package org.etudes.api.app.melete;

import java.util.*;

import org.etudes.api.app.melete.exception.MeleteException;

/* Mallika - 3/22/05 - Added methods for moduledatebeanservice
 * Mallika - 3/28/05 - Catching exception in updateProperties
 * Mallika - 4/18/05 - Added method to delete module
 * Rashmi - 4/21-22 add methods for sort modules
 * Rashmi - 07/07/07 - removed season and yr from method signature of insert properties
 * Mallika - 8/1/06 - adding code to delete modules
 * Rashmi - 1/3/07 - remove license methods
 * Mallika - 11/6/07 - adding methods to get prev and next seq no
 */

public interface ModuleService{

	public void insertProperties(ModuleObjService module, ModuleShdatesService moduleshdates,String userId, String courseId) throws Exception;

	public List getViewModules(String userId, String courseId);

	public List getModuleDateBeans(String userId, String courseId);

	public void setModuleDateBeans(List moduleDateBeansList);

	public ModuleDateBeanService getModuleDateBean(String userId, String courseId,  int moduleId);

	public ModuleDateBeanService getModuleDateBeanBySeq(String userId, String courseId,  int seqNo);

	public void setModuleDateBean(ModuleDateBeanService mdBean);

	public List getModules(String courseId);

	public void setModules(List modules) ;

	public void updateProperties(List moduleDateBeans, String courseId)  throws Exception;

	public void archiveModules(List selModBeans, List moduleDateBeans, String courseId) throws Exception;

	public ModuleObjService getModule(int moduleId);

	public void setModule(ModuleObjService mod);

	public List getArchiveModules(String course_id);

	public void restoreModules(List modules, String courseId) throws Exception;

	public CourseModuleService getCourseModule(int moduleId,  String courseId) throws Exception;

	public void deleteModules(List delModules, String courseId, String userId) throws Exception;
	public boolean checkCalendar();
	public int getNextSeqNo(String userId, String courseId, int currSeqNo);
	public int getPrevSeqNo(String userId, String courseId, int currSeqNo);

	public org.w3c.dom.Document getSubSectionW3CDOM(String sectionsSeqXML);

	public boolean updateSeqXml(String courseId) throws Exception;

	public void createSubSection(ModuleObjService module, List secBeans) throws MeleteException;

	public void bringOneLevelUp(ModuleObjService module, List secBeans) throws MeleteException;

	public void sortModule(ModuleObjService module,String course_id,String Direction) throws MeleteException;

	public void sortSectionItem(ModuleObjService module,String section_id,String Direction) throws MeleteException;

	public void copyModule(ModuleObjService module,String courseId,String userId) throws MeleteException;

	public void moveSections(List sectionBeans,ModuleObjService selectedModule) throws MeleteException;

	public String printModule(ModuleObjService module) throws MeleteException;

	public int cleanUpDeletedModules() throws Exception;
	
	public int getCourseModuleSize(String courseId);
	
	/**
	 * Gets the earliest start date(if defined) of all the modules 
	 * @param course_id		Course id
	 * @return If start date exists for the modules gets the earliest start date of all modules else returns null
	 */
	public Date getMinStartDate(String course_id);
	
	/**
	 * Apply base date to all module start and end dates
	 * @param course_id		Course id
	 * @param days_diff		Time difference in days
	 */	
	public void applyBaseDateTx(String course_id, int days_diff);
}