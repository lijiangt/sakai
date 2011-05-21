/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-api/src/java/org/etudes/api/app/melete/BookmarkObjService.java $
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

public interface BookmarkObjService {

	/**
	 * @return the bookmarkId
	 */
	public abstract int getBookmarkId();

	/**
	 * @param bookmarkId the bookmarkId to set
	 */
	public abstract void setBookmarkId(int bookmarkId);

	public abstract int getSectionId();
	
	public abstract void setSectionId(int sectionId);
	/**
	 * @return the userId
	 */
	public abstract String getUserId();

	/**
	 * @param userId the userId to set
	 */
	public abstract void setUserId(String userId);

	/**
	 * @return the siteId
	 */
	public abstract String getSiteId();

	/**
	 * @param siteId the siteId to set
	 */
	public abstract void setSiteId(String siteId);

	/**
	 * @return the section
	 */
	public abstract org.etudes.api.app.melete.SectionObjService getSection();

	/**
	 * @param section the section to set
	 */
	public abstract void setSection(org.etudes.api.app.melete.SectionObjService section);
	
	/* 
	 * @return the title
	 */	
	 public abstract String getTitle();
	 
	 /* 
		 * @param title the title to set
		 */
	 public abstract void setTitle(String title);

	/**
	 * @return the notes
	 */
	public abstract String getNotes();

	/**
	 * @param notes the notes to set
	 */
	public abstract void setNotes(String notes);

	/**
	 * @return the lastVisited
	 */
	public abstract Boolean getLastVisited();

	/**
	 * @param lastVisited the lastVisited to set
	 */
	public abstract void setLastVisited(Boolean lastVisited);
	
	public abstract boolean isSectionVisibleFlag();
	
	public abstract void setSectionVisibleFlag(boolean sectionVisibleFlag);

}