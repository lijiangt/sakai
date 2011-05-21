/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/java/org/etudes/tool/melete/ModuleNextStepsPage.java $
 * $Id: ModuleNextStepsPage.java 70379 2010-09-22 22:35:00Z rashmi@etudes.org $
 ***********************************************************************************
 *
 * Copyright (c) 2008, 2009, 2010 Etudes, Inc.
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
import org.sakaiproject.util.ResourceLoader;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.el.ValueBinding;
import java.util.ArrayList;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.etudes.component.app.melete.ModuleDateBean;
//import org.sakaiproject.jsf.ToolBean;
import org.etudes.api.app.melete.ModuleService;
/*
 * Created on Apr 7, 2005
 * Author Rashmi Maheshwari
 * revised on 5/23/05 to remove add confirmation and redirect back to list auth modules page
 *
 */
public class ModuleNextStepsPage implements Serializable/*,ToolBean*/ {

	 private ModuleDateBean mdBean;
	 private ModuleService moduleService;
	 private String isNull = null;
	 protected Log logger = LogFactory.getLog(ModuleNextStepsPage.class);
	/**
	 * constructor
	 */
	public ModuleNextStepsPage(){}

	/**
	 * @return Returns the mdBean.
	 */
	public ModuleDateBean getMdBean() {
		return mdBean;
	}
	/**
	 * @param mdBean The mdBean to set.
	 */
	public void setMdBean(ModuleDateBean mdBean) {
		this.mdBean = mdBean;
	}

	/**
	 * @return string whose value is null for render comparison on the Jsp page
	 */
	  public String getIsNull()
	  {
	  	return isNull;
	  }


	/**
	 * @return status - success/failure
	 * This method calls module service to update the module and add what's next steps
	 * If next steps are saved properly, return success
	 * In case of error add error message to the context and return failure
	 */
	public String steps()
	{
		FacesContext ctx = FacesContext.getCurrentInstance();
		Map sessionMap = ctx.getExternalContext().getSessionMap();
		ResourceLoader bundle = new ResourceLoader("org.etudes.tool.melete.bundle.Messages");
		try {
			mdBean.setDateFlag(false);
			ArrayList mdbeanList = new ArrayList();
			mdbeanList.add(mdBean);
			moduleService.updateProperties(mdbeanList, (String)sessionMap.get("courseId"));

			return "success";

		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.debug("error in updating what's next"+e.toString());
	  		String errMsg = bundle.getString("add_post_steps_fail");
	  		FacesMessage msg =
		  		new FacesMessage("Error Message", errMsg);
		  	msg.setSeverity(FacesMessage.SEVERITY_ERROR);
	  		ctx.addMessage (null, msg);
			return "failure";
		}
	}


	/**
	 * @return navigation rule
	 * if save is success then go to confirmation page
	 * and if fails, go to the same page and show error message there
	 * revised - to check text before adding
	 */
	public String addPostSteps()
	{
		String stepsText = mdBean.getModule().getWhatsNext().trim();
		FacesContext ctx = FacesContext.getCurrentInstance();
		ResourceLoader bundle = new ResourceLoader("org.etudes.tool.melete.bundle.Messages");

		if(stepsText.length() == 0)
		{
			String errMsg = bundle.getString("add_post_steps_reqd");
	  		FacesMessage msg =
		  		new FacesMessage("Error Message", errMsg);
		  	msg.setSeverity(FacesMessage.SEVERITY_ERROR);
	  		ctx.addMessage ("nextsteps", msg);
	  		mdBean.getModule().setWhatsNext(null);
			return "module_post_steps";
		}

	   if(steps().equals("success"))
		{
		 // return "confirm_modulepoststeps";
	   	String successMsg = bundle.getString("add_post_steps_success");
	   	FacesMessage msg =
	  		new FacesMessage("Info message",successMsg);
	  	msg.setSeverity(FacesMessage.SEVERITY_INFO);
	  	ctx.addMessage(null,msg);

	  	ValueBinding binding = Util.getBinding("#{listAuthModulesPage}");
		ListAuthModulesPage lPage = (ListAuthModulesPage) binding.getValue(ctx);
		lPage.resetValues();
	    return "list_auth_modules";
		}
		else return "module_post_steps";
	}

	/**
	 * @return navigation page as module post steps
	 * If the save is success then add the save message to the page
	 * in case of failure go again to the same page
	 */
	public String savePostSteps()
	{
		FacesContext ctx = FacesContext.getCurrentInstance();

		String stepsText = mdBean.getModule().getWhatsNext().trim();
		if(stepsText.length() == 0)
			mdBean.getModule().setWhatsNext(null);

		if(steps().equals("success"))
		{
			FacesMessage msg =
		  		new FacesMessage("Changes Saved", "Your changes have been saved.");
		  	msg.setSeverity(FacesMessage.SEVERITY_INFO);
		  	ctx.addMessage(null,msg);
		  	ValueBinding binding = Util.getBinding("#{listAuthModulesPage}");
			ListAuthModulesPage lPage = (ListAuthModulesPage) binding.getValue(ctx);
			lPage.resetValues();

		  return "list_auth_modules";
		}
		else return "module_post_steps";
	}

	/**
	 * @return on cancel navigate back to list modules page
	 */
	public String cancelChanges()
	{
		FacesContext ctx = FacesContext.getCurrentInstance();
		ValueBinding binding = Util.getBinding("#{listAuthModulesPage}");
		ListAuthModulesPage lPage = (ListAuthModulesPage) binding.getValue(ctx);
		lPage.resetValues();
		return "list_auth_modules";
	}

	/**
	 * @return navigate back to list modules page
	 */
	public String returnToModules()
	{
		FacesContext ctx = FacesContext.getCurrentInstance();
		ValueBinding binding = Util.getBinding("#{listAuthModulesPage}");
		ListAuthModulesPage lPage = (ListAuthModulesPage) binding.getValue(ctx);
		lPage.resetValues();
		return "list_auth_modules";
	}

	/**
	 * @return Returns the moduleService.
	 */
	public ModuleService getModuleService() {
		return moduleService;
	}
	/**
	 * @param moduleService The moduleService to set.
	 */
	public void setModuleService(ModuleService moduleService) {
		this.moduleService = moduleService;
	}

}
