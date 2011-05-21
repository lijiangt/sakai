/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/java/org/etudes/tool/melete/AddModulePage.java $
 * $Id: AddModulePage.java 69815 2010-08-17 21:59:53Z rashmi@etudes.org $  
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
package org.etudes.tool.melete;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Map;
import org.sakaiproject.util.ResourceLoader;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.el.ValueBinding;

import org.sakaiproject.event.cover.EventTrackingService;
import org.sakaiproject.tool.cover.ToolManager;
/**
 * @author Rashmi
 *
 * Rashmi - 10/24/06 - clean up comments and change logger.info to debug
 * Mallika - 2/9/07 - adding code to setmodule
 * Rashmi - 3/6/07 - remove section breadcrumbs
 *  */

public class AddModulePage extends ModulePage implements Serializable{

    public AddModulePage(){
       	this.module = null;
    	setModuleShdates(null);
    	setModuleDateBean(null);
    	setFormName("AddModuleForm");
    }


   	/*
	 * set module to null to fix #19 and #20
	 * Rashmi -12/15
	 * revised Rashmi -12/20 to remove start and end dates
	 */
	public void setModuleNull()
	{
		this.module = null;
		setModuleShdates(null);
		resetModuleValues();
	}

	 /*
     * saves the module into database.
     * Valiation 1- validates user inputs for learning objectives and description.
     * Validation 2- user has agreed to the license.
     *
     * Revision on 11/15: - add code to initiate breadcrumps in add section page
     * 11/22 Rashmi -- get course id from session
     * 12/1  Rashmi -- license agre error message for copyright
     * validation 3 -- start date check Rashmi --12/6
     * validation 1 removed as now there is juxt one field description  Rashmi --12/8
     * revised to add license 4 to check if it has ben agreed upon or not Rashmi - 5/18
     */

    public String save()
	{
    	Date  d = new Date();
     	Date st = getModuleShdates().getStartDate();

        setSuccess(false);
        if(moduleService == null)
        	moduleService = getModuleService();

	     FacesContext context = FacesContext.getCurrentInstance();
	     ResourceLoader bundle = new ResourceLoader("org.etudes.tool.melete.bundle.Messages");

     	 //validation
     	module.setTitle(module.getTitle().trim());
     
     	// validation no 3
       	Date end = getModuleShdates().getEndDate();

 //  validation to limit year to 4 digits
        boolean dateResult = validateDates(context, bundle, st, end);
        if (dateResult == false) return "add_module";

	   	// get course info from sessionmap
	      Map sessionMap = context.getExternalContext().getSessionMap();
	      String courseId = (String)sessionMap.get("courseId");
	      String userId = (String)sessionMap.get("userId");

	     // actual insert
		try{
			if(module.getKeywords() != null)
			{
				module.setKeywords(module.getKeywords().trim());
			}
			if(module.getKeywords() == null || (module.getKeywords().length() == 0) )
				 	{
						module.setKeywords(module.getTitle());
					}

			moduleService.insertProperties(getModule(),getModuleShdates(),userId,courseId);
			// add module to session
			sessionMap.put("currModule",module);
		  //Track the event
		  EventTrackingService.post(EventTrackingService.newEvent("melete.module.new", ToolManager.getCurrentPlacement().getContext(), true));


		}catch(Exception ex)
		{
			//logger.error("mbusiness insert module failed:" + ex.toString());
			String errMsg = bundle.getString("add_module_fail");
			addMessage(context, "Error Message", errMsg, FacesMessage.SEVERITY_ERROR);
			return "add_module";
		}
		setSuccess(true);
		return "confirm_addmodule";
	 }

    /*
     * Called by the jsp page to redirect to add module sections page.
     * Revision -- Rashmi 12/21 resetting section value and setting SecBcPage values
     */
    public String addContentSections()
    {
        FacesContext context = FacesContext.getCurrentInstance();
        ValueBinding binding =Util.getBinding("#{editSectionPage}");
        EditSectionPage editPage = (EditSectionPage) binding.getValue(context);
        editPage.resetSectionValues();
        editPage.setModule(module);
        editPage.addBlankSection();
        
       return "editmodulesections";
    }
 }
