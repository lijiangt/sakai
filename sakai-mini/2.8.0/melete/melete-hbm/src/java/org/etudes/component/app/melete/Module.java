/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-hbm/src/java/org/etudes/component/app/melete/Module.java $
 * $Id: Module.java 56408 2008-12-19 21:16:52Z rashmi@etudes.org $  
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
import java.util.Date;
import java.util.Map;
import java.util.Set;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import org.etudes.api.app.melete.ModuleObjService;


/** @author Hibernate CodeGenerator */
public class Module implements Serializable,ModuleObjService {

    /** identifier field */
    private Integer moduleId;

    /** persistent field */
    private String title;

    /** nullable persistent field */
    private String learnObj;

    /** nullable persistent field */
    private String description;

    /** persistent field */
    private String keywords;

    /** persistent field */
    private String createdByFname;

    /** persistent field */
    private String createdByLname;

    /** persistent field */
    private String userId;

    /** nullable persistent field */
    private String modifiedByFname;

    /** nullable persistent field */
    private String modifiedByLname;

    /** nullable persistent field */
    private String institute;

    /** nullable persistent field */
    private String whatsNext;

    /** persistent field */
    private Date creationDate;

    /** nullable persistent field */
    private Date modificationDate;

    /** nullable persistent field */
    private String seqXml;

    /** nullable persistent field */
    private int version;

    /** nullable persistent field */
    private org.etudes.component.app.melete.ModuleShdates moduleshdate;

    /** nullable persistent field */
    private org.etudes.component.app.melete.CourseModule coursemodule;

    /** persistent field */
    private Map sections;

    private Map deletedSections;



    /** full constructor */
    public Module(String title, String learnObj, String description, String keywords, String createdByFname, String createdByLname, String userId, String modifiedByFname, String modifiedByLname, String institute, String whatsNext, Date creationDate, Date modificationDate, String seqXml, int version, org.etudes.component.app.melete.ModuleShdates moduleshdate, org.etudes.component.app.melete.CourseModule coursemodule, Map sections, Map deletedSections) {
        this.title = title;
        this.learnObj = learnObj;
        this.description = description;
        this.keywords = keywords;
        this.createdByFname = createdByFname;
        this.createdByLname = createdByLname;
        this.userId = userId;
        this.modifiedByFname = modifiedByFname;
        this.modifiedByLname = modifiedByLname;
        this.institute = institute;
        this.whatsNext = whatsNext;
        this.creationDate = creationDate;
        this.modificationDate = modificationDate;
        this.seqXml = seqXml;
        this.version = version;
        this.moduleshdate = moduleshdate;
        this.coursemodule = coursemodule;
        this.sections = sections;
        this.deletedSections = deletedSections;
    }

    /*Custom constructor*/
    public Module(String title, String learnObj, String description, String keywords, String createdByFname, String createdByLname, String userId, String modifiedByFname, String modifiedByLname, String institute, String whatsNext, Date creationDate, Date modificationDate, String seqXml) {
        this.title = title;
        this.learnObj = learnObj;
        this.description = description;
        this.keywords = keywords;
        this.createdByFname = createdByFname;
        this.createdByLname = createdByLname;
        this.userId = userId;
        this.modifiedByFname = modifiedByFname;
        this.modifiedByLname = modifiedByLname;
        this.institute = institute;
        this.whatsNext = whatsNext;
        this.creationDate = creationDate;
        this.modificationDate = modificationDate;
        this.seqXml = seqXml;

    }
    /** default constructor */
    public Module() {
    }

    /** minimal constructor */
    public Module(String title, String keywords, String createdByFname, String createdByLname, String userId, Date creationDate, Map sections, Map deletedSections) {
        this.title = title;
        this.keywords = keywords;
        this.createdByFname = createdByFname;
        this.createdByLname = createdByLname;
        this.userId = userId;
        this.creationDate = creationDate;
        this.sections = sections;
        this.deletedSections = deletedSections;
    }

    /** Copy constructor*/
    public Module(Module oldModule)
    {
    	this.title = oldModule.getTitle();
    	 this.learnObj = oldModule.getLearnObj();
         this.description = oldModule.getDescription();
         this.keywords = oldModule.getKeywords();
         this.institute = oldModule.getInstitute();
         this.whatsNext = oldModule.getWhatsNext();
         this.seqXml = null;
         this.moduleshdate = null;
         this.coursemodule = null;
         this.sections = null;
         this.deletedSections = null;
    }

    public Integer getModuleId() {
        return this.moduleId;
    }

    public void setModuleId(Integer moduleId) {
        this.moduleId = moduleId;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLearnObj() {
        return this.learnObj;
    }

    public void setLearnObj(String learnObj) {
        this.learnObj = learnObj;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getKeywords() {
        return this.keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getCreatedByFname() {
        return this.createdByFname;
    }

    public void setCreatedByFname(String createdByFname) {
        this.createdByFname = createdByFname;
    }

    public String getCreatedByLname() {
        return this.createdByLname;
    }

    public void setCreatedByLname(String createdByLname) {
        this.createdByLname = createdByLname;
    }

    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getModifiedByFname() {
        return this.modifiedByFname;
    }

    public void setModifiedByFname(String modifiedByFname) {
        this.modifiedByFname = modifiedByFname;
    }

    public String getModifiedByLname() {
        return this.modifiedByLname;
    }

    public void setModifiedByLname(String modifiedByLname) {
        this.modifiedByLname = modifiedByLname;
    }

    public String getInstitute() {
        return this.institute;
    }

    public void setInstitute(String institute) {
        this.institute = institute;
    }

    public String getWhatsNext() {
        return this.whatsNext;
    }

    public void setWhatsNext(String whatsNext) {
        this.whatsNext = whatsNext;
    }

    public Date getCreationDate() {
        return this.creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Date getModificationDate() {
        return this.modificationDate;
    }

    public void setModificationDate(Date modificationDate) {
        this.modificationDate = modificationDate;
    }
    public String getSeqXml() {
        return this.seqXml;
    }

    public void setSeqXml(String seqXml) {
        this.seqXml = seqXml;
    }
    public int getVersion() {
        return this.version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public org.etudes.api.app.melete.ModuleShdatesService getModuleshdate() {
        return this.moduleshdate;
    }

    public void setModuleshdate(org.etudes.api.app.melete.ModuleShdatesService moduleshdate) {
        this.moduleshdate = (ModuleShdates) moduleshdate;
    }

    public org.etudes.api.app.melete.CourseModuleService getCoursemodule() {
        return this.coursemodule;
    }

    public void setCoursemodule(org.etudes.api.app.melete.CourseModuleService coursemodule) {
        this.coursemodule = (CourseModule) coursemodule;
    }

    public Map getSections() {
        return this.sections;
    }

    public void setSections(Map sections) {
        this.sections = sections;
    }

    public Map getDeletedSections() {
        return this.deletedSections;
    }

    public void setDeletedSections(Map deletedSections) {
        this.deletedSections = deletedSections;
    }


    public String toString() {
        return new ToStringBuilder(this)
            .append("moduleId", getModuleId())
            .toString();
    }

    public boolean equals(Object other) {
        if ( (this == other ) ) return true;
        if ( !(other instanceof Module) ) return false;
        Module castOther = (Module) other;
        return new EqualsBuilder()
            .append(this.getModuleId(), castOther.getModuleId())
            .isEquals();
    }

    public int hashCode() {
        return new HashCodeBuilder()
            .append(getModuleId())
            .toHashCode();
    }

}
