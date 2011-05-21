/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-api/src/java/org/etudes/api/app/melete/MeleteExportService.java $
 * $Id: MeleteExportService.java 59948 2009-04-21 23:33:27Z mallika@etudes.org $  
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
package org.etudes.api.app.melete;

import java.io.File;
import java.net.MalformedURLException;
import java.net.UnknownHostException;
import org.etudes.api.app.melete.exception.MeleteException;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;

/**
 * <p>MeleteImportExportService provides the methods for import export</p>
 * @author Foothill College
 *
 */
public interface MeleteExportService{
	
	public void initValues();
	
		/**
	 * creates document root element "manifest" and adds the namespaces
	 *
	 * @return returns the manifest element
	 * @throws  Exception
	 */
	public Element createManifest() throws Exception;

	/**
	 * creates document root element "manifest" from the default manifest file
	 * and adds the namespaces
	 * @param xmlFile - Default manifest file
	 * @return returns the manifest element
	 * @throws  Exception
	 */
	public Element getManifest(File xmlFile) throws Exception;

	/**
	 * create manifest metadata element with schema and schemaversion elements
	 *
	 * @return - returns metadata element
	 */
	public Element createManifestMetadata();

	/**
	 * creates the default namespace element
	 * @param elename - element name
	 * @param qname - qualified name
	 * @return - returns the default namespace element
	 */
	public Element createDefaultNSElement(String elename, String qname);

	/**
	 * creates the LOM metadata element
	 * @param elename - element name
	 * @param qname - qualified name
	 * @return - returns the metadata element
	 */
	public Element createLOMElement(String elename, String qname);

	/**
	 * creates metadata title element
	 * @param title - title
	 * @return - returns the title element
	 */
	public Element createMetadataTitle(String title);

	/**
	 * creates metadata description element
	 * @param description - description
	 * @return - returns the metadata description element
	 */
	public Element createMetadataDescription(String description);

	/**
	 * adds organization and resource items tomanifest
	 * @param modDateBeans - module date beans
	 * @param packagedir - package directory
	 * @return - returns the list of manifest elements
	 * @throws Exception
	 */
	public List generateOrganizationResourceItems(List modDateBeans, boolean allFlag,
			File packagedir, String title, String courseId) throws Exception;
	
	
	/**
	 * creates file from input path to output path
	 * @param inputpath - input path for file
	 * @param outputpath - output path for file
	 * @throws Exception
	 */
	public void createFile(String inputpath, String outputpath) throws Exception;

	/**
	 * deletes the file and its children
	 * @param delfile - file to be deleted
	 */
	public void deleteFiles(File delfile);		
	
}