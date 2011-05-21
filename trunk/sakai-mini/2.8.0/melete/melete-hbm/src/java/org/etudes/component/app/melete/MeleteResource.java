/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-hbm/src/java/org/etudes/component/app/melete/MeleteResource.java $
 * $Id: MeleteResource.java 56408 2008-12-19 21:16:52Z rashmi@etudes.org $  
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
import org.etudes.api.app.melete.MeleteResourceService;

/** @author Hibernate CodeGenerator */
public class MeleteResource implements Serializable, MeleteResourceService {

       /** persistent field */
    private String resourceId;

    /** nullable persistent field */
    private int licenseCode;

    /** nullable persistent field */
    private String ccLicenseUrl;

    /** nullable persistent field */
    private boolean reqAttr;

    /** nullable persistent field */
    private boolean allowCmrcl;

    /** nullable persistent field */
    private int allowMod;

     /** nullable persistent field */
    private int version;

    private String copyrightOwner;
    
    private String copyrightYear;  
    
    
    /** full constructor */
    public MeleteResource( String resourceId, int licenseCode, String ccLicenseUrl, boolean reqAttr, boolean allowCmrcl, int allowMod, int version, org.etudes.component.app.melete.Section section, String copyrightOwner, String copyrightYear) {
        this.resourceId = resourceId;
        this.licenseCode = licenseCode;
        this.ccLicenseUrl = ccLicenseUrl;
        this.reqAttr = reqAttr;
        this.allowCmrcl = allowCmrcl;
        this.allowMod = allowMod;
        this.version = version;
        this.copyrightOwner = copyrightOwner;
        this.copyrightYear = copyrightYear;
       
    }

    /** default constructor */
    public MeleteResource() {
    }

    //copy constructor added by rashmi
    public MeleteResource( MeleteResource s1) {
    //    this.resourceId = s1.resourceId;
        this.licenseCode = s1.licenseCode;
        this.ccLicenseUrl = s1.ccLicenseUrl;
        this.reqAttr = s1.reqAttr;
        this.allowCmrcl = s1.allowCmrcl;
        this.allowMod = s1.allowMod;
        this.copyrightOwner = s1.copyrightOwner;
        this.copyrightYear = s1.copyrightYear;
   
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
	/**
	 * @return Returns the resourceId.
	 */
	public String getResourceId() {
		return resourceId;
	}
	/**
	 * @param resourceId The resourceId to set.
	 */
	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}
	
    public int getLicenseCode() {
        return this.licenseCode;
    }

    public void setLicenseCode(int licenseCode) {
        this.licenseCode = licenseCode;
    }

    public String getCcLicenseUrl() {
        return this.ccLicenseUrl;
    }

    public void setCcLicenseUrl(String ccLicenseUrl) {
        this.ccLicenseUrl = ccLicenseUrl;
    }

    public boolean isReqAttr() {
        return this.reqAttr;
    }

    public void setReqAttr(boolean reqAttr) {
        this.reqAttr = reqAttr;
    }

    public boolean isAllowCmrcl() {
        return this.allowCmrcl;
    }

    public void setAllowCmrcl(boolean allowCmrcl) {
        this.allowCmrcl = allowCmrcl;
    }

    public int getAllowMod() {
        return this.allowMod;
    }

    public void setAllowMod(int allowMod) {
        this.allowMod = allowMod;
    }

    public int getVersion() {
        return this.version;
    }

    public void setVersion(int version) {
        this.version = version;
    }
	
    public String toString() {
        return new ToStringBuilder(this)
            .append("resourceId", getResourceId())
            .toString();
    }

}
