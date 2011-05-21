/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-hbm/src/java/org/etudes/component/app/melete/ModuleDateBean.java $
 * $Id: ModuleDateBean.java 70642 2010-10-08 19:59:01Z mallika@etudes.org $  
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
import java.util.List;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.etudes.api.app.melete.*;

/** @author Hibernate CodeGenerator */
/* Mallika - 3/22/05 - changed to implement moduledatebeanservice
 *
 */
public class ModuleDateBean implements Serializable, ModuleDateBeanService {

    /** identifier field */
    protected int moduleId;

    protected boolean selected;

    protected boolean dateFlag;

    protected boolean visibleFlag;
    
    protected boolean saFlag;

    protected String truncTitle;

    protected String rowClasses;

    /** nullable persistent field */
    protected Module module;

    /** nullable persistent field */
    protected ModuleShdates moduleShdate;

    protected CourseModule cmod;

    private List sectionBeans;


    public boolean isSelected()
    {
    	return selected;
    }

    public void setSelected(boolean selected)
    {
    	this.selected = selected;
    }
    public boolean isDateFlag()
    {
    	return dateFlag;
    }

    public void setDateFlag(boolean dateFlag)
    {
    	this.dateFlag = dateFlag;
    }

    public boolean isVisibleFlag()
    {
    	return visibleFlag;
    }

    public void setVisibleFlag(boolean visibleFlag)
    {
    	this.visibleFlag = visibleFlag;
    }

    public boolean isSaFlag()
    {
    	return saFlag;
    }

    public void setSaFlag(boolean saFlag)
    {
    	this.saFlag = saFlag;
    }    

    public String getTruncTitle()
    {
    	return truncTitle;
    }

    public void setTruncTitle(String truncTitle)
    {
    	this.truncTitle = truncTitle;
    }

    /** full constructor */
    public ModuleDateBean(int moduleId, Module module, ModuleShdates moduleShdate,CourseModule cmod, List sectionBeans) {
        this.moduleId = moduleId;
        this.module = module;
        this.moduleShdate = moduleShdate;
        this.cmod = cmod;
        this.sectionBeans = sectionBeans;
    }

    /** default constructor */
    public ModuleDateBean() {
    }

    public int getModuleId() {
        return this.moduleId;
    }

    public void setModuleId(int moduleId) {
        this.moduleId = moduleId;
    }
    public org.etudes.api.app.melete.ModuleObjService getModule() {
        return this.module;
    }

    public void setModule(org.etudes.api.app.melete.ModuleObjService module) {
        this.module = (Module) module;
    }
    public org.etudes.api.app.melete.ModuleShdatesService getModuleShdate() {
        return this.moduleShdate;
    }

    public void setModuleShdate(org.etudes.api.app.melete.ModuleShdatesService moduleShdate) {
        this.moduleShdate = (ModuleShdates) moduleShdate;
    }
    public org.etudes.api.app.melete.CourseModuleService getCmod() {
        return this.cmod;
    }

    public void setCmod(org.etudes.api.app.melete.CourseModuleService cmod) {
        this.cmod = (CourseModule) cmod;
    }
    public List getSectionBeans() {
        return this.sectionBeans;
    }

    public void setSectionBeans(List sectionBeans) {
        this.sectionBeans = sectionBeans;
    }

    public void setRowClasses(String rowClasses) {
      this.rowClasses = rowClasses;
    }

    public String getRowClasses() {
    	return this.rowClasses;
    }

    public String toString() {
        return new ToStringBuilder(this)
            .append("moduleId", getModuleId())
            .toString();
    }

}
