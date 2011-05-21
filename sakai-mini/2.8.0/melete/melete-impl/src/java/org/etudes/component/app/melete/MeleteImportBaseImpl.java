/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-impl/src/java/org/etudes/component/app/melete/MeleteImportBaseImpl.java $
 * $Id: MeleteImportBaseImpl.java 66829 2010-03-24 21:34:32Z mallika@etudes.org $
 ***********************************************************************************
 *
 * Copyright (c) 2009 Etudes, Inc.
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

import java.util.ArrayList;
import java.util.Set;
import java.io.File;
import java.net.URLDecoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.etudes.api.app.melete.MeleteCHService;
import org.sakaiproject.component.cover.ServerConfigurationService;
import org.sakaiproject.content.cover.ContentTypeImageService;
import org.sakaiproject.content.cover.ContentHostingService;
import org.sakaiproject.content.api.ContentResource;
import org.sakaiproject.entity.api.ResourceProperties;
import org.sakaiproject.entity.api.Entity;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.sakaiproject.thread_local.api.ThreadLocalManager;
import org.sakaiproject.tool.cover.ToolManager;
import org.etudes.api.app.melete.exception.MeleteException;
import org.sakaiproject.entity.api.ResourcePropertiesEdit;
import org.sakaiproject.exception.IdUnusedException;

/**
 * MeleteImportServiceImpl is the implementation of MeleteImportService
 * that provides the methods for import export
 *
 * @author Murthy @ Foothill college
 */
abstract public class MeleteImportBaseImpl {
	/*******************************************************************************
	 * Dependencies
	 *******************************************************************************/
	protected SectionDB sectionDB;
	protected ModuleDB moduleDB;
	protected ModuleShdates moduleShdates;
	protected MeleteCHService meleteCHService;
	protected MeleteLicenseDB meleteLicenseDB;
	protected MeleteUserPreferenceDB meleteUserPrefDB;

	protected SubSectionUtilImpl sectionUtil;

	/**default namespace and metadata namespace*/
	protected String DEFAULT_NAMESPACE_URI = "http://www.imsglobal.org/xsd/imscp_v1p1";
	protected String IMSMD_NAMESPACE_URI ="http://www.imsglobal.org/xsd/imsmd_v1p2";

	protected int RESOURCE_LICENSE_CODE = 0; //not determined yet
	protected String RESOURCE_LICENSE_URL = "I have not determined copyright yet"; //No license
	protected int RESOURCE_LICENSE_COPYRIGHT_CODE = 1; //Copyright of author
	protected int RESOURCE_LICENSE_PD_CODE = 2; //		Public Domain
	protected int RESOURCE_LICENSE_CC_CODE = 3; //Creative Commons
	protected int RESOURCE_LICENSE_FAIRUSE_CODE = 4; //FairUse Exception

	protected MeleteUtil meleteUtil = new MeleteUtil();
	static final String REFERENCE_ROOT = Entity.SEPARATOR+"meleteDocs";

	protected ThreadLocalManager threadLocalManager = org.sakaiproject.thread_local.cover.ThreadLocalManager.getInstance();

	/**
	 * Final initialization, once all dependencies are set.
	 */
	public void init(){
		//logger.debug(this +".init()");
	}

	/**
	 * Final cleanup.
	 */
	public void destroy(){
		//logger.debug(this +".destroy()");
	}

	/**
	 * Process embed data found in HTML files
	 */
	abstract protected String uploadSectionDependentFile(String hrefVal, String courseId, String unZippedDirPath);

   /**
	* Abstract method to read data from exported package and read data from content resource for import from site
	*/
	abstract protected byte[] readData(String unZippedDirPath, String hrefVal) throws Exception;

   /**
    * Adds resource item to Content Hosting and also records in MELETE_RESOURCE table.
	*/
	protected String addResource(String filename, String res_mime_type, byte[] melContentData, String courseId) throws Exception
	{
		String uploadCollId = getMeleteCHService().getUploadCollectionId(courseId);
		if(res_mime_type== null)
		{
			res_mime_type = filename.substring(filename.lastIndexOf(".")+1);
			res_mime_type = ContentTypeImageService.getContentType(res_mime_type);
		}
		ResourcePropertiesEdit res = getMeleteCHService().fillEmbeddedImagesResourceProperties(filename);
		String newResourceId = getMeleteCHService().addResourceItem(filename, res_mime_type,uploadCollId,melContentData,res);
		// create melete resource object
		MeleteResource meleteResource = new MeleteResource();
		meleteResource.setResourceId(newResourceId);
		//set default license info to "I have not determined copyright yet" option
		meleteResource.setLicenseCode(0);
		sectionDB.insertResource(meleteResource);
		return getMeleteCHService().getResourceUrl(newResourceId);
	}

   /**
	* Checks if the resource is an LTI Document.
	* Used by IMS import to check if the file is LTI resource or an uploaded file.
	*/
	protected boolean isLTIDocument(String content)
	{
		if ( content == null ) return false;
		if ( ! content.startsWith("<?xml version=\"1.0\" encoding=\"UTF-8\"?>") ) return false;
                if ( content.indexOf("<toolInstance") > 0 && content.indexOf("</toolInstance>") > 0 ) return true;
                if ( content.indexOf("<basic_lti_link") > 0 && content.indexOf("</basic_lti_link>") > 0 ) return true;
		return false;
	}

   /**
	* Gets new url for the Embedded media and replaces it in the new HTML content
	*/
	protected String ReplaceEmbedMediaWithResourceURL(String contentEditor, String imgSrcPath, String imgActualPath, String courseId, String unZippedDirPath, String anchorStr)
	{
		String replacementStr = uploadSectionDependentFile(imgActualPath, courseId, unZippedDirPath);
		// if unable to harvest then leave it as is
		if (replacementStr == null || replacementStr.equals("")) return contentEditor;
		
		// if link has cross-ref and anchors then append anchor to harvested file
		if(anchorStr != null)replacementStr = replacementStr.concat(anchorStr);	
		
		//Upon import, embedded media was getting full url without code below
		if (replacementStr.startsWith(ServerConfigurationService.getServerUrl()))
		{
			replacementStr = replacementStr.replace(ServerConfigurationService.getServerUrl(), "");
		}
		
		// Replace all occurrences of pattern in input
		contentEditor = meleteUtil.replacePath(contentEditor,imgSrcPath, replacementStr);

		return contentEditor;
	}

	/**
	 * deletes the file and its children
	 * @param delfile - file to be deleted
	 */
	public void deleteFiles(File delfile){
      meleteUtil.deleteFiles(delfile);
	}

	/**
	 * @return Returns the meleteCHService.
	 */
	public MeleteCHService getMeleteCHService() {
		return meleteCHService;
	}
	/**
	 * @param meleteCHService The meleteCHService to set.
	 */
	public void setMeleteCHService(MeleteCHService meleteCHService) {
		this.meleteCHService = meleteCHService;
	}

	public void setModuleDB(ModuleDB moduleDB) {
		this.moduleDB = moduleDB;
	}

	/**
	 * @param sectionDB The sectionDB to set.
	 */
	public void setSectionDB(SectionDB sectionDB) {
		this.sectionDB = sectionDB;
	}

	/**
	 * @return Returns the meleteLicenseDB.
	 */
	public MeleteLicenseDB getMeleteLicenseDB() {
		return meleteLicenseDB;
	}
	/**
	 * @param meleteLicenseDB The meleteLicenseDB to set.
	 */
	public void setMeleteLicenseDB(MeleteLicenseDB meleteLicenseDB) {
		this.meleteLicenseDB = meleteLicenseDB;
	}
	/**
	 * @return the meleteUserPrefDB
	 */
	public MeleteUserPreferenceDB getMeleteUserPrefDB()
	{
		return this.meleteUserPrefDB;
	}
	/**
	 * @param meleteUserPrefDB the meleteUserPrefDB to set
	 */
	public void setMeleteUserPrefDB(MeleteUserPreferenceDB meleteUserPrefDB)
	{
		this.meleteUserPrefDB = meleteUserPrefDB;
	}
}
