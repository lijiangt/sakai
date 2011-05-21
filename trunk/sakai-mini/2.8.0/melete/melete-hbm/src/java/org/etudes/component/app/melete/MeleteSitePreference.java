/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-hbm/src/java/org/etudes/component/app/melete/MeleteSitePreference.java $
 * $Id: MeleteSitePreference.java 69865 2010-08-23 18:43:11Z rashmi@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008 Etudes, Inc.
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

import org.etudes.api.app.melete.MeleteSitePreferenceService;

/** @author Hibernate CodeGenerator */
public class MeleteSitePreference implements Serializable,MeleteSitePreferenceService{

    /** identifier field */
    private String prefSiteId;

    /** nullable persistent field */
    private Boolean printable;   
    private boolean autonumber;   
   
	/** full constructor
	 * @param userId
	 * @param editorChoice
	 */
	public MeleteSitePreference(String prefSiteId, Boolean printable) {
		this.prefSiteId = prefSiteId;		
		this.printable = printable;
	}
		
	/**
	 *  default
	 */
	public MeleteSitePreference() {
		this.printable = false;
		this.autonumber = false;
	}
		
	/**
	 * @return Returns the userId.
	 */
	public String getPrefSiteId() {
		return prefSiteId;
	}
	/**
	 * @param userId The userId to set.
	 */
	public void setPrefSiteId(String prefSiteId) {
		this.prefSiteId = prefSiteId;
	}
    public String toString() {
        return new ToStringBuilder(this)
            .append("prefSiteId", getPrefSiteId())
            .toString();
    }

	/**
	 * @return the printable
	 */
	public Boolean isPrintable()
	{
		return this.printable;
	}

	/**
	 * @param printable the printable to set
	 */
	public void setPrintable(Boolean printable)
	{
		this.printable = printable;
	}
	/**
	 * @return the autonumber
	 */
	public boolean isAutonumber()
	{
		return this.autonumber;
	}

	/**
	 * @param autonumber the autonumber to set
	 */
	public void setAutonumber(boolean autonumber)
	{
		this.autonumber = autonumber;
	}
}
