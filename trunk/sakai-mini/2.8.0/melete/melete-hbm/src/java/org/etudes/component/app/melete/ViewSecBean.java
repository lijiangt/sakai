/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-hbm/src/java/org/etudes/component/app/melete/ViewSecBean.java $
 * $Id: ViewSecBean.java 59712 2009-04-07 17:05:16Z mallika@etudes.org $  
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
import java.io.Serializable;
import org.apache.commons.lang.builder.ToStringBuilder;


/** @author Hibernate CodeGenerator */
public class ViewSecBean implements Serializable {

    protected boolean selected;
    protected int sectionId;
    protected String contentType;
    protected String displaySequence;
    protected String title;

      

	/**
	 * @param selected
	 * @param sectionId
	 * @param contentType
	 * @param displaySequence
	 * @param title
	 */
	public ViewSecBean(boolean selected, int sectionId, String contentType, String displaySequence, String title)
	{
		super();
		this.selected = selected;
		this.sectionId = sectionId;
		this.contentType = contentType;
		this.displaySequence = displaySequence;
		this.title = title;
	}

	public boolean isSelected()
    {
    	return selected;
    }

    public void setSelected(boolean selected)
    {
    	this.selected = selected;
    }
    
    public String getDisplaySequence()
    {
    	return displaySequence;
    }

    public void setDisplaySequence(String displaySequence)
    {
    	this.displaySequence = displaySequence;
    }

    

    /** default constructor */
    public ViewSecBean() {
    }


   


    public String toString() {
        return new ToStringBuilder(this)
            .toString();
    }

	public String getContentType()
	{
		return this.contentType;
	}

	public void setContentType(String contentType)
	{
		this.contentType = contentType;
	}

	public String getTitle()
	{
		return this.title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public int getSectionId()
	{
		return this.sectionId;
	}

	public void setSectionId(int sectionId)
	{
		this.sectionId = sectionId;
	}

}
