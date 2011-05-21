/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-hbm/src/java/org/etudes/component/app/melete/MeleteUserPreference.java $
 * $Id: MeleteUserPreference.java 60573 2009-05-19 20:17:20Z mallika@etudes.org $  
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

import org.etudes.api.app.melete.MeleteUserPreferenceService;

/** @author Hibernate CodeGenerator */
public class MeleteUserPreference implements Serializable,MeleteUserPreferenceService {

    /** identifier field */
    private String userId;

    /** nullable persistent field */
    private String editorChoice;
    
    private Boolean viewExpChoice;   
    
    private int prefId;
   
    private Boolean showLTIChoice;
    
    /** nullable persistent field */
    private Integer licenseCode;

    /** nullable persistent field */
    private String ccLicenseUrl;

    /** nullable persistent field */
    private Boolean reqAttr;

    /** nullable persistent field */
    private Boolean allowCmrcl;

    /** nullable persistent field */
    private Integer allowMod;
    
    private String copyrightOwner;
    
    private String copyrightYear;  
    
    
	/** full constructor
	 * @param userId
	 * @param editorChoice
	 */
	public MeleteUserPreference(String userId, String editorChoice, Boolean viewExpChoice, Boolean showLTIChoice, Integer licenseCode, String ccLicenseUrl, Boolean reqAttr, Boolean allowCmrcl, Integer allowMod, int version, org.etudes.component.app.melete.Section section, String copyrightOwner, String copyrightYear) {
		this.userId = userId;
		this.editorChoice = editorChoice;
		this.viewExpChoice = viewExpChoice;	
		this.showLTIChoice = showLTIChoice;
		this.licenseCode = licenseCode;
        this.ccLicenseUrl = ccLicenseUrl;
        this.reqAttr = reqAttr;
        this.allowCmrcl = allowCmrcl;
        this.allowMod = allowMod;
        this.copyrightOwner = copyrightOwner;
        this.copyrightYear = copyrightYear;
	}
		
	/**
	 *  default
	 */
	public MeleteUserPreference() {
		this.viewExpChoice = true;
		this.showLTIChoice = false;
		this.licenseCode = 0;
	}
		
	/**
	 * @return Returns the editorChoice.
	 */
	public String getEditorChoice() {
		return editorChoice;
	}
	/**
	 * @param editorChoice The editorChoice to set.
	 */
	public void setEditorChoice(String editorChoice) {
		this.editorChoice = editorChoice;
	}
	/**
	 * @return Returns the userId.
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * @param userId The userId to set.
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
    public String toString() {
        return new ToStringBuilder(this)
            .append("prefId", getPrefId())
            .toString();
    }

	/**
	 * @return Returns the prefId.
	 */
	public int getPrefId() {
		return prefId;
	}
	/**
	 * @param prefId The prefId to set.
	 */
	public void setPrefId(int prefId) {
		this.prefId = prefId;
	}

	public Boolean isViewExpChoice() {
		return viewExpChoice;
	}

	public void setViewExpChoice(Boolean viewExpChoice) {
		this.viewExpChoice = viewExpChoice;
	}
	
	public Boolean isShowLTIChoice(){
		return showLTIChoice;
	}

	public void setShowLTIChoice(Boolean showLTIChoice) {
		this.showLTIChoice = showLTIChoice;
	}
	   public Integer getLicenseCode() {
	        return this.licenseCode;
	    }

	    public void setLicenseCode(Integer licenseCode) {
	        this.licenseCode = licenseCode;
	    }

	    public String getCcLicenseUrl() {
	        return this.ccLicenseUrl;
	    }

	    public void setCcLicenseUrl(String ccLicenseUrl) {
	        this.ccLicenseUrl = ccLicenseUrl;
	    }

	    public Boolean isReqAttr() {
	        return this.reqAttr;
	    }

	    public void setReqAttr(Boolean reqAttr) {
	        this.reqAttr = reqAttr;
	    }

	    public Boolean isAllowCmrcl() {
	        return this.allowCmrcl;
	    }

	    public void setAllowCmrcl(Boolean allowCmrcl) {
	        this.allowCmrcl = allowCmrcl;
	    }

	    public Integer getAllowMod() {
	        return this.allowMod;
	    }

	    public void setAllowMod(Integer allowMod) {
	        this.allowMod = allowMod;
	    }
	
	/**
	 * @return Returns the copyrightOwner.
	 */
	public String getCopyrightOwner() {
		return copyrightOwner;
	}
	/**
	 * @param copyrightOwner The copyrightOwner to set.
	 */
	public void setCopyrightOwner(String copyrightOwner) {
		this.copyrightOwner = copyrightOwner;
	}
	/**
	 * @return Returns the copyrightYear.
	 */
	public String getCopyrightYear() {
		return copyrightYear;
	}
	/**
	 * @param copyrightYear The copyrightYear to set.
	 */
	public void setCopyrightYear(String copyrightYear) {
		this.copyrightYear = copyrightYear;
	}	
}
