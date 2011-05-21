/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/java/org/etudes/tool/melete/RemoteBrowserFile.java $
 *
 ***************************************************************************************
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

package org.etudes.tool.melete;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.faces.component.UIColumn;
import javax.faces.component.html.HtmlCommandButton;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.etudes.api.app.melete.MeleteCHService;
import org.sakaiproject.component.api.ServerConfigurationService;
import org.sakaiproject.content.api.ContentResource;
import org.sakaiproject.entity.api.Entity;
import org.sakaiproject.entity.api.ResourceProperties;
import org.sakaiproject.tool.cover.ToolManager;


/**
 * @author Rashmi Created on Jan 7, 2005 To get the server side files for wysiwyg editor remote browse
 */
class FileExtensionFilter implements FilenameFilter
{
	private String ext = "*";

	private String ext1 = ".gif";

	private String ext2 = ".jpg";

	public FileExtensionFilter(String ext)
	{
		this.ext = ext;
	}

	public boolean accept(File dir, String name)
	{
		if (name.endsWith(ext1) || name.endsWith(ext2)) return true;
		return false;
	}

}

public class RemoteBrowserFile implements Comparable<RemoteBrowserFile>
{
	private String fileName;

	private long size;

	private Date modifiedDate;

	String instr_id = "1";

	String course_id = "0";

	private ServerConfigurationService serverConfigurationService;

	protected Log logger = LogFactory.getLog(RemoteBrowserFile.class);

	private String remoteDirLocation;

	private String commonDirLocation;

	private MeleteCHService meleteCHService;

	private ArrayList<RemoteBrowserFile> remoteFiles = null;

	private ArrayList<RemoteBrowserFile> remoteLinkFiles = null;
	
	private String displayName;
	
	public RemoteBrowserFile()
	{
		this.fileName = null;
		this.size = 0;
		this.modifiedDate = null;
		this.displayName = null;
	}

	public RemoteBrowserFile(String filename, long sz, long mdate)
	{
		this.fileName = filename;
		this.size = sz;
		this.modifiedDate = new Date(mdate);
		this.displayName = filename;
	}

	public RemoteBrowserFile(String filename, long sz)
	{
		this.fileName = filename;
		this.size = sz;
		this.modifiedDate = new Date();
		this.displayName = filename;
	}
	
	public RemoteBrowserFile(String filename, long sz, String displayname)
	{
		this.fileName = filename;
		this.size = sz;
		this.modifiedDate = new Date();
		this.displayName = displayname;
	}

	public int compareTo(RemoteBrowserFile n)
	{
		int res = fileName.compareTo(n.getFileName());
		return res;
	}

	public String getFileName()
	{
		return fileName;
	}

	public long getSize()
	{
		return size;
	}

	public Date getModifiedDate()
	{
		return modifiedDate;
	}

	public void setFileName(String fileName)
	{
		this.fileName = fileName;
	}

	public void setSize(long size)
	{
		this.size = size;
	}

	public void setModifiedDate(Date modifiedDate)
	{
		this.modifiedDate = modifiedDate;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	/**
	 * @return remote directory location
	 */
	public String getRemoteDirLocation()
	{
		if (logger.isDebugEnabled()) logger.debug("###########getRemoteDirLocation" + serverConfigurationService.getServerUrl());
		return serverConfigurationService.getServerUrl() + "/etudes-melete-tool/melete/remotefilebrowser.jsf";
	}

	/**
	 * @return remote server common uploads location
	 */
	public String getCommonDirLocation()
	{
		return serverConfigurationService.getServerUrl() + "/etudes-melete-tool/melete/commonfilebrowser.jsf";
	}

	/*
	 * new method to get files from collection
	 */
	public List<RemoteBrowserFile> getRemoteBrowserFiles()
	{
		if (remoteFiles == null)
		{
			remoteFiles = new ArrayList<RemoteBrowserFile>();
			try
			{
				// 1. get upload collection
				String uploadCollId = getMeleteCHService().getUploadCollectionId();
				// 2. list resources under collection
				List allImgMembers = getMeleteCHService().getListofImagesFromCollection(uploadCollId);
				// 3. add resources info in remoteFiles array as obj of RemoteBrowserFile
				ListIterator allmembers_iter = allImgMembers.listIterator();
				while (allmembers_iter != null && allmembers_iter.hasNext())
				{
					ContentResource cr = (ContentResource) allmembers_iter.next();
					String fileUrl = getMeleteCHService().getResourceUrl(cr.getId());
					fileUrl = fileUrl.substring(fileUrl.lastIndexOf("/")+1);
					String displayName = cr.getProperties().getProperty(ResourceProperties.PROP_DISPLAY_NAME);
					RemoteBrowserFile ob = new RemoteBrowserFile(fileUrl, cr.getContentLength(),displayName);
					//RemoteBrowserFile ob = new RemoteBrowserFile(fileUrl.substring(fileUrl.lastIndexOf("/")+1), cr.getContentLength());
					remoteFiles.add(ob);
				}
				java.util.Collections.sort(remoteFiles);
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return remoteFiles;
	}

	/*
	 * new method to get links from collection
	 */
	public List<RemoteBrowserFile> getRemoteBrowserLinkFiles()
	{
		if (remoteLinkFiles == null)
		{
			remoteLinkFiles = new ArrayList<RemoteBrowserFile>();
			try
			{
				// 1. get upload collection
				String uploadCollId = getMeleteCHService().getUploadCollectionId();
				// 2. list resources under collection
				// List allImgMembers = getMeleteCHService().getListofLinksFromCollection(uploadCollId);
				List allImgMembers = getMeleteCHService().getListofMediaFromCollection(uploadCollId);

				// 3. add resources info in remoteFiles array as obj of RemoteBrowserFile
				ListIterator allmembers_iter = allImgMembers.listIterator();
				while (allmembers_iter != null && allmembers_iter.hasNext())
				{
					ContentResource cr = (ContentResource) allmembers_iter.next();
					String fileUrl = getMeleteCHService().getResourceUrl(cr.getId());
					fileUrl = fileUrl.substring(fileUrl.lastIndexOf("/")+1);
					String displayName = cr.getProperties().getProperty(ResourceProperties.PROP_DISPLAY_NAME);
					RemoteBrowserFile ob = new RemoteBrowserFile(fileUrl, cr.getContentLength(),displayName);
					//RemoteBrowserFile ob = new RemoteBrowserFile(fileUrl.substring(fileUrl.lastIndexOf("/")+1), cr.getContentLength());
					remoteLinkFiles.add(ob);
				}
				java.util.Collections.sort(remoteLinkFiles);
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return remoteLinkFiles;
	}

	/**
	 * @return Returns the serverConfigurationService.
	 */
	public ServerConfigurationService getServerConfigurationService()
	{
		return serverConfigurationService;
	}

	/**
	 * @param serverConfigurationService
	 *        The serverConfigurationService to set.
	 */
	public void setServerConfigurationService(ServerConfigurationService serverConfigurationService)
	{
		this.serverConfigurationService = serverConfigurationService;
	}



	/**
	 * @return Returns the meleteCHService.
	 */
	public MeleteCHService getMeleteCHService()
	{
		return meleteCHService;
	}

	public void setMeleteCHService(MeleteCHService meleteCHService)
	{
		this.meleteCHService = meleteCHService;
	}

	/**
	 * @param remoteFiles
	 *        The remoteFiles to set.
	 */
	public void setRemoteFiles(ArrayList<RemoteBrowserFile> remoteFiles)
	{
		this.remoteFiles = remoteFiles;
	}

	/**
	 * @param remoteLinkFiles
	 *        The remoteLinkFiles to set.
	 */
	public void setRemoteLinkFiles(ArrayList<RemoteBrowserFile> remoteLinkFiles)
	{
		this.remoteLinkFiles = remoteLinkFiles;
	}
}
