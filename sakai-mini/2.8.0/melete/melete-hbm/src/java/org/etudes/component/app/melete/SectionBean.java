/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-hbm/src/java/org/etudes/component/app/melete/SectionBean.java $
 * $Id: SectionBean.java 56408 2008-12-19 21:16:52Z rashmi@etudes.org $  
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
package org.etudes.component.app.melete;
import java.io.Serializable;
import org.apache.commons.lang.builder.ToStringBuilder;


/** @author Hibernate CodeGenerator */
public class SectionBean implements Serializable {

    protected boolean selected;
    protected String truncTitle;
    protected String displaySequence;

    /** nullable persistent field */
    protected Section section;


    public boolean isSelected()
    {
    	return selected;
    }

    public void setSelected(boolean selected)
    {
    	this.selected = selected;
    }
    public String getTruncTitle()
    {
    	return truncTitle;
    }

    public void setTruncTitle(String truncTitle)
    {
    	this.truncTitle = truncTitle;
    }
    public String getDisplaySequence()
    {
    	return displaySequence;
    }

    public void setDisplaySequence(String displaySequence)
    {
    	this.displaySequence = displaySequence;
    }

      /** full constructor */
    public SectionBean(Section section) {
        this.section = (Section)section;
    }

    /** default constructor */
    public SectionBean() {
    }


    public Section getSection() {
        return this.section;
    }

    public void setSection(Section section) {
        this.section = (Section)section;
    }


    public String toString() {
        return new ToStringBuilder(this)
            .toString();
    }

}
