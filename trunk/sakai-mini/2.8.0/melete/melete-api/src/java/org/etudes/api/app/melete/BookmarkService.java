/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-api/src/java/org/etudes/api/app/melete/BookmarkService.java $
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
 ***************************************************************************************/
package org.etudes.api.app.melete;

import java.util.List;
import java.io.File;

/**
 * @author Faculty
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public interface BookmarkService {
	public void insertBookmark(BookmarkObjService mb) throws Exception;
	public BookmarkObjService getBookmark(String userId, String siteId, int sectionId);
	public List getBookmarks(String userId, String siteId);
	 public int getLastVisitSectionId(boolean isAuthor, String userId, String siteId);
	public void deleteBookmark(int bookmarkId) throws Exception;
	public void deleteFiles(File delfile);
	public void createFile(List bmList, String fileName) throws Exception;
}