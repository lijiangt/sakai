/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-api/src/java/org/etudes/api/app/melete/SectionObjService.java $
 * $Id: SectionObjService.java 56408 2008-12-19 21:16:52Z rashmi@etudes.org $  
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
package org.etudes.api.app.melete;

import java.util.Date;

public interface SectionObjService {
	public Integer getSectionId();

    public void setSectionId(Integer sectionId);

	public abstract int getModuleId();

	public abstract void setModuleId(int moduleId);

	public abstract String getTitle();

	public abstract void setTitle(String title);

	public abstract String getCreatedByFname();

	public abstract void setCreatedByFname(String createdByFname);

	public abstract String getCreatedByLname();

	public abstract void setCreatedByLname(String createdByLname);

	public abstract String getModifiedByFname();

	public abstract void setModifiedByFname(String modifiedByFname);

	public abstract String getModifiedByLname();

	public abstract void setModifiedByLname(String modifiedByLname);

	public abstract String getInstr();

	public abstract void setInstr(String instr);

	public abstract String getContentType();

	public abstract void setContentType(String contentType);

	public abstract boolean isAudioContent();

	public abstract void setAudioContent(boolean audioContent);

	public abstract boolean isVideoContent();

	public abstract void setVideoContent(boolean videoContent);

	public abstract boolean isTextualContent();

	public abstract void setTextualContent(boolean textualContent);

	public abstract boolean isOpenWindow();

	public abstract void setOpenWindow(boolean openWindow);

	public abstract boolean isDeleteFlag();

	public abstract void setDeleteFlag(boolean deleteFlag);


	public abstract Date getCreationDate();

	public abstract void setCreationDate(Date creationDate);

	public abstract Date getModificationDate();

	public abstract void setModificationDate(Date modificationDate);

	public abstract int getVersion();

	public abstract void setVersion(int version);

	public abstract org.etudes.api.app.melete.ModuleObjService getModule();

	public abstract void setModule(
			org.etudes.api.app.melete.ModuleObjService module);

	public abstract org.etudes.api.app.melete.SectionResourceService getSectionResource();

	 public abstract void setSectionResource(
	 		org.etudes.api.app.melete.SectionResourceService sectionResource) ;

	 public abstract String toString();

	public abstract boolean equals(Object other);

	public abstract int hashCode();
}