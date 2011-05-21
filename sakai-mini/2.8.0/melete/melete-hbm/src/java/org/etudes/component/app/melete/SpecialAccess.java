/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-hbm/src/java/org/etudes/component/app/melete/SpecialAccess.java $
 * $Id: SpecialAccess.java 60573 2009-05-19 20:17:20Z mallika@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2010 Etudes, Inc.
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

import java.io.Serializable;
import org.apache.commons.lang.builder.ToStringBuilder;
import java.util.Date;
import org.etudes.api.app.melete.SpecialAccessObjService;

/** @author Hibernate CodeGenerator */
public class SpecialAccess implements Serializable, SpecialAccessObjService {

	private int accessId;
	
	/** nullable persistent field */
    private int moduleId;
    
    private org.etudes.component.app.melete.Module module;
    
    private String users;
    
    private String userNames;

    /** nullable persistent field */
    private Date startDate;

    /** nullable persistent field */
    private Date endDate;
    
    protected boolean selected;
    
    public SpecialAccess()
    {
    	this.moduleId = 0;
    	this.module = null;
    	this.users = null;
    	this.startDate = null;
    	this.endDate = null;
    }

	/* (non-Javadoc)
	 * @see org.etudes.component.app.melete.SpecialAccessObjService#getSpecialAccessId()
	 */
	public int getAccessId() {
		return accessId;
	}

	/* (non-Javadoc)
	 * @see org.etudes.component.app.melete.SpecialAccessObjService#setSpecialAccessId(int)
	 */
	public void setAccessId(int accessId) {
		this.accessId = accessId;
	}

	/* (non-Javadoc)
	 * @see org.etudes.component.app.melete.SpecialAccessObjService#getModuleId()
	 */
	public int getModuleId() {
	     return this.moduleId;
	}

	/* (non-Javadoc)
	 * @see org.etudes.component.app.melete.SpecialAccessObjService#setModuleId(int)
	 */
	public void setModuleId(int moduleId) {
	     this.moduleId = moduleId;
	}
	    
	/**
	 * @return Returns the module.
	 */
	public org.etudes.api.app.melete.ModuleObjService getModule() {
		return module;
	}
	/**
	 * @param module The module to set.
	 */
	public void setModule(
			org.etudes.api.app.melete.ModuleObjService module) {
		this.module = (Module)module;
	}	
	
	
	/* (non-Javadoc)
	 * @see org.etudes.component.app.melete.SpecialAccessObjService#getUsers()
	 */
	public String getUsers() {
		return users;
	}

	/* (non-Javadoc)
	 * @see org.etudes.component.app.melete.SpecialAccessObjService#setUsers(java.lang.String)
	 */
	public void setUsers(String users) {
		this.users = users;
	}

	public String getUserNames() {
		return this.userNames;
	}
	
	public void setUserNames(String userNames) {
		this.userNames = userNames;
	}
	
	public Date getStartDate() {
	    return this.startDate;
	}

	public void setStartDate(Date startDate) {
	    this.startDate = startDate;
	}

	public Date getEndDate() {
	    return this.endDate;
	}

	public void setEndDate(Date endDate) {
	    this.endDate = endDate;
	}	
	
	 public boolean isSelected()
	 {
	   	return selected;
	 }

     public void setSelected(boolean selected)
	 {
	   	this.selected = selected;
	 }	
	
}
