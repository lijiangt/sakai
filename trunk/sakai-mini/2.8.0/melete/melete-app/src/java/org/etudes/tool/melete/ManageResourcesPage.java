/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/java/org/etudes/tool/melete/ManageResourcesPage.java $
 * $Id: ManageResourcesPage.java 61229 2009-06-10 23:13:19Z mallika@etudes.org $
 ***********************************************************************************
 *
 * Copyright (c) 2008, 2009 Etudes, Inc.
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

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import org.sakaiproject.util.ResourceLoader;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIData;
import javax.faces.component.UIViewRoot;
import javax.faces.context.FacesContext;

import javax.faces.el.ValueBinding;
import javax.faces.event.ActionEvent;

import javax.faces.model.SelectItem;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.sakaiproject.component.cover.ServerConfigurationService;
import org.sakaiproject.content.cover.ContentTypeImageService;
import org.sakaiproject.content.api.ContentResource;
import org.sakaiproject.entity.api.ResourceProperties;
import org.etudes.api.app.melete.MeleteCHService;

public class ManageResourcesPage {
  private String fileType;
  private String numberItems;
  /** Dependency:  The logging service. */
	protected Log logger = LogFactory.getLog(ManageResourcesPage.class);
	private MeleteCHService meleteCHService;


  public ManageResourcesPage()
  {
   
  }


public String addItems()
{
	FacesContext ctx = FacesContext.getCurrentInstance();
	ValueBinding binding =
        Util.getBinding("#{addResourcesPage}");
    AddResourcesPage arPage = (AddResourcesPage)binding.getValue(ctx);
    arPage.resetValues();
    arPage.setNumberItems(this.numberItems);
	if (this.fileType.equals("upload"))
	{
		arPage.setFileType("upload");
		return "file_upload_view";
	}
	if (this.fileType.equals("link"))
	{
		arPage.setFileType("link");
		return "link_upload_view";
	}
	return "manage_content";
}

public void resetValues()
{
	this.fileType = "upload";
	this.numberItems = "1";
	FacesContext ctx = FacesContext.getCurrentInstance();
  	ValueBinding binding =Util.getBinding("#{listResourcesPage}");
	ListResourcesPage listResPage = (ListResourcesPage) binding.getValue(ctx);
	listResPage.setFromPage("manage_content");
	listResPage.resetValues();
}

public String cancel()
{
	return "modules_author_manage";
}
public String getFileType()
{
	return this.fileType;
}

public void setFileType(String fileType)
{
	this.fileType = fileType;
}

public String getNumberItems()
{
	return this.numberItems;
}

public void setNumberItems(String numberItems)
{
	this.numberItems = numberItems;
}


public String redirectDeleteLink()
{
	 return "delete_resource";
}



/**
 * @return the meleteCHService
 */
public MeleteCHService getMeleteCHService()
{
	return this.meleteCHService;
}


/**
 * @param meleteCHService the meleteCHService to set
 */
public void setMeleteCHService(MeleteCHService meleteCHService)
{
	this.meleteCHService = meleteCHService;
}



}

