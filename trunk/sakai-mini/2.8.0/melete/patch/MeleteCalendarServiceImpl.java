/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-impl/src/java/org/etudes/component/app/melete/MeleteCalendarServiceImpl.java $
 * $Id: MeleteCalendarServiceImpl.java 64978 2009-12-01 22:28:31Z mallika@etudes.org $
 ***********************************************************************************
 *
 * Copyright (c) 2009 Etudes, Inc.
 *
 * Portions completed before September 1, 2008 Copyright (c) 2004, 2005, 2006, 2007, 2008 Foothill College, ETUDES Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
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

package org.etudes.component.app.melete;

import org.sakaiproject.site.cover.SiteService;
import org.sakaiproject.site.api.Site;
import org.sakaiproject.tool.cover.ToolManager;
import java.io.Serializable;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import java.util.Date;
import org.sakaiproject.time.cover.TimeService;
import org.sakaiproject.entity.cover.EntityManager;
import org.sakaiproject.exception.PermissionException;
import java.util.List;
import java.util.ListIterator;
import org.etudes.api.app.melete.MeleteCalendarService;
import org.etudes.api.app.melete.ModuleObjService;
import org.etudes.api.app.melete.ModuleShdatesService;

/* Please use this implementation when the calendar tool is NOT deployed
 */

public class MeleteCalendarServiceImpl implements MeleteCalendarService,Serializable {

   private ModuleDB moduleDB;

	/** Dependency:  The logging service. */
	private Log logger = LogFactory.getLog(MeleteCalendarServiceImpl.class);

	/**
	 *
	 */
	public MeleteCalendarServiceImpl()
	{

	}

	/**
	 * @return Returns the moduledb.
	 */
	public ModuleDB getModuleDB() {
		return moduleDB;
	}
	/**
	 * @param moduledb The moduledb to set.
	 */
	public void setModuleDB(ModuleDB moduleDB) {
		this.moduleDB = moduleDB;
	}


	public boolean checkCalendar()
	{
		return false;
	}


	public void updateCalendar(ModuleObjService modServ, ModuleShdatesService moduleshdatesServ, String courseId) throws Exception
	{

	}


	public void deleteCalendar(List delModules, String courseId)
	 {

	 }


}

