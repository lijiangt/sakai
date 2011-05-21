/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-api/src/java/org/etudes/api/app/melete/SpecialAccessObjService.java $
 *
 ***********************************************************************************
 * Copyright (c) 2010 Etudes, Inc.
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
 ****************************************************************************************/
package org.etudes.api.app.melete;
import java.util.Date;

public interface SpecialAccessObjService {

	/**
	 * @return the accessId
	 */
	public abstract int getAccessId();

	/**
	 * @param accessId the accessId to set
	 */
	public abstract void setAccessId(int accessId);

	public abstract int getModuleId();
	
	public abstract void setModuleId(int moduleId);
	
	/**
	 * @return the module
	 */
	public abstract org.etudes.api.app.melete.ModuleObjService getModule();

	/**
	 * @param section the module to set
	 */
	public abstract void setModule(org.etudes.api.app.melete.ModuleObjService module);
	
	/* 
	 * @return the users
	 */	
	public abstract String getUsers();
	 
	/* 
	* @param users the users to set
	*/
	public abstract void setUsers(String users);
	
	public abstract String getUserNames();
	
	public abstract void setUserNames(String userNames);

	public abstract Date getStartDate();

	public abstract void setStartDate(Date startDate);

	public abstract Date getEndDate();

	public abstract void setEndDate(Date endDate);

}