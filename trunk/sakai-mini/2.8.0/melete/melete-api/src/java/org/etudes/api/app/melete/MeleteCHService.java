/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-api/src/java/org/etudes/api/app/melete/MeleteCHService.java $
 * $Id: MeleteCHService.java 69815 2010-08-17 21:59:53Z rashmi@etudes.org $
 ***********************************************************************************
 *
 * Copyright (c) 2008,2009 Etudes, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

package org.etudes.api.app.melete;
import org.etudes.api.app.melete.exception.MeleteException;
import org.sakaiproject.content.api.ContentResource;
import org.sakaiproject.content.api.ContentCollection;
import org.sakaiproject.entity.api.ResourcePropertiesEdit;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
/*
 * Created on Sep 18, 2006 by rashmi
 *
 *  This is a basic class to do all content hosting service work through melete
 */
public interface MeleteCHService{

	 public static final String MIME_TYPE_EDITOR="text/html";
	 public static final String MIME_TYPE_LINK="text/url";
	 public static final String MIME_TYPE_LTI="ims/basiclti";

	 public String addCollectionToMeleteCollection(String meleteItemColl,String CollName);
	 public String addResourceItem(String name, String res_mime_type,String addCollId, byte[] secContentData, ResourcePropertiesEdit res) throws Exception;

	 public ResourcePropertiesEdit fillInSectionResourceProperties(boolean encodingFlag,String secResourceName, String secResourceDescription);
	 public ResourcePropertiesEdit fillEmbeddedImagesResourceProperties(String name);
	 public void editResourceProperties(String selResourceIdFromList, String secResourceName, String secResourceDescription);

	 public String getCollectionId( String contentType,Integer modId );
	 public String getUploadCollectionId();
	 
	 public String getCollectionId(String courseId,String contentType,Integer modId );
	 public String getUploadCollectionId(String courseId);
	 
     public List getListofImagesFromCollection(String collId);
	 public List getListofLinksFromCollection(String collId);
	 public List getListFromCollection(String collId, String mimeType);
	 public List getListofMediaFromCollection(String collId);
	 public List getListofFilesFromCollection(String collId);
	 public List getMemberNamesCollection(String collId);
	 public String findLocalImagesEmbeddedInEditor(String courseId, ArrayList<String> errs,Map newEmbeddedResources, String contentEditor)throws MeleteException;
	 public ContentResource getResource(String resourceId) throws Exception;
	 public void checkResource(String resourceId) throws Exception;
	 public void editResource(String resourceId, String contentEditor) throws Exception;
	 public List getAllResources(String uploadCollId);
	 public String getResourceUrl(String resourceId);
	 public String copyIntoFolder(String fromColl,String toColl);
	 public ContentCollection getCollection(String toColl);
	 public List<String> findAllEmbeddedImages(String sec_resid) throws Exception;
	 public void removeResource(String delRes_id) throws Exception;
	 public void removeCollection(String delColl_id, String delSubColl_id) throws Exception;
	 public void removeCourseCollection(String delColl_id) throws Exception;
	  public String moveResource(String resourceId, String destinationColl) throws Exception;
	  public String getDisplayName(String resourceId);
	  public String getLinkContent(String resourceId);
	  public String getTypeEditorSectionName(Integer sectionId);
	  public void editResource(String courseId,String resourceId, String contentEditor) throws Exception;
	  public void addToMeleteResource(String sectionId, String resourceId) throws Exception;
	  public ContentResource getResource(String courseId, String resourceId) throws Exception;
	  public String getSectionResource(String sectionId) throws Exception;
}

