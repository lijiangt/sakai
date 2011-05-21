/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-hbm/src/java/org/etudes/component/app/melete/CcLicense.java $
 * $Id: CcLicense.java 56408 2008-12-19 21:16:52Z rashmi@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008 Etudes, Inc.
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
package org.etudes.component.app.melete;

import java.io.Serializable;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

import org.etudes.api.app.melete.CcLicenseService;


/** @author Hibernate CodeGenerator */
public class CcLicense implements Serializable,CcLicenseService {

    /** identifier field */
    private boolean reqAttr;

    /** identifier field */
    private boolean allowCmrcl;

    /** identifier field */
    private int allowMod;

    /** identifier field */
    private String url;

    /** identifier field */
    private String name;

    /** full constructor */
    public CcLicense(boolean reqAttr, boolean allowCmrcl, int allowMod, String url, String name) {
        this.reqAttr = reqAttr;
        this.allowCmrcl = allowCmrcl;
        this.allowMod = allowMod;
        this.url = url;
        this.name = name;
    }

    /** default constructor */
    public CcLicense() {
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

    public String getUrl() {
        return this.url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String toString() {
        return new ToStringBuilder(this)
            .append("reqAttr", isReqAttr())
            .append("allowCmrcl", isAllowCmrcl())
            .append("allowMod", getAllowMod())
            .append("url", getUrl())
            .append("name", getName())
            .toString();
    }

    public boolean equals(Object other) {
        if ( (this == other ) ) return true;
        if ( !(other instanceof CcLicense) ) return false;
        CcLicense castOther = (CcLicense) other;
        return new EqualsBuilder()
            .append(this.isReqAttr(), castOther.isReqAttr())
            .append(this.isAllowCmrcl(), castOther.isAllowCmrcl())
            .append(this.getAllowMod(), castOther.getAllowMod())
            .append(this.getUrl(), castOther.getUrl())
            .append(this.getName(), castOther.getName())
            .isEquals();
    }

    public int hashCode() {
        return new HashCodeBuilder()
            .append(isReqAttr())
            .append(isAllowCmrcl())
            .append(getAllowMod())
            .append(getUrl())
            .append(getName())
            .toHashCode();
    }

}
