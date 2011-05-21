/**********************************************************************************
*
* $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-hbm/src/java/org/etudes/component/app/melete/SectionResource.java $
*
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
import org.etudes.api.app.melete.SectionResourceService;

/** @author Hibernate CodeGenerator */
public class SectionResource implements Serializable, SectionResourceService {

    /** identifier field */
    private Integer sectionId;

    private org.etudes.component.app.melete.Section section;

    private org.etudes.component.app.melete.MeleteResource resource;
    /** full constructor */
    public SectionResource( org.etudes.component.app.melete.Section section, org.etudes.component.app.melete.MeleteResource resource) {

    	this.section = section;
           this.resource = resource;
    }

    /** default constructor */
    public SectionResource() {
    }
	/**
	 * @return Returns the section.
	 */
	public org.etudes.api.app.melete.SectionObjService getSection() {
		return section;
	}
	/**
	 * @param section The section to set.
	 */
	public void setSection(org.etudes.api.app.melete.SectionObjService section) {
		this.section = (Section)section;
	}

    public String toString() {
        return new ToStringBuilder(this)
            .append("sectionId", getSectionId())
            .toString();
    }

	/**
	 * @return Returns the sectionId.
	 */
	public Integer getSectionId() {
		return sectionId;
	}
	/**
	 * @param sectionId The sectionId to set.
	 */
	public void setSectionId(Integer sectionId) {
		this.sectionId = sectionId;
	}

	/**
	 * @return Returns the resource.
	 */
	public org.etudes.api.app.melete.MeleteResourceService getResource() {
		return resource;
	}
	/**
	 * @param resource The resource to set.
	 */
	public void setResource(
			org.etudes.api.app.melete.MeleteResourceService resource) {
		this.resource = (MeleteResource)resource;
	}
}
