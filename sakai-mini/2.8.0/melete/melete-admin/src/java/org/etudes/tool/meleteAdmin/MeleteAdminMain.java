/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-admin/src/java/org/etudes/tool/meleteAdmin/MeleteAdminMain.java $
 * $Id: MeleteAdminMain.java 56907 2009-01-14 19:08:25Z rashmi@etudes.org $
 ***********************************************************************************
 *
 * Copyright (c) 2009 Etudes, Inc.
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

package org.etudes.tool.meleteAdmin;

import org.sakaiproject.util.ResourceLoader;

import javax.faces.context.FacesContext;
import javax.faces.application.FacesMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.etudes.api.app.melete.MeleteSecurityService;
import org.etudes.api.app.melete.ModuleService;
import org.etudes.api.app.melete.SectionService;
/**
 * @author Rashmi
 * this is the managed bean to start the clean up process
 **/
public class MeleteAdminMain {

	/*******************************************************************************
	* Dependencies
	*******************************************************************************/
	/** Dependency:  The logging service. */
	protected Log logger = LogFactory.getLog(MeleteAdminMain.class);

    /** Dependency: The Melete Security service. */
    protected MeleteSecurityService meleteSecurityService;

    protected ModuleService moduleService;

	protected SectionService sectionService;

	public MeleteAdminMain() {
	}

	public String startCleanUp()
	{
		 FacesContext context = FacesContext.getCurrentInstance();
		 ResourceLoader bundle = new ResourceLoader("org.etudes.tool.meleteAdmin.bundle.Messages");

		//to add super user check

		try{
			int delCourseCount = moduleService.cleanUpDeletedModules();
			 delCourseCount += sectionService.cleanUpDeletedSections();
			String successMsg = bundle.getString("cleanup_success");
			successMsg = successMsg.concat(new Integer(delCourseCount).toString() + " " + bundle.getString("cleanup_success_2"));
			addMessage(context, "Success Message", successMsg, FacesMessage.SEVERITY_INFO);
			return "#";

		}
		catch(Exception e)
		{
			String errMsg = bundle.getString("cleanup_module_fail");
			addMessage(context, "Error Message", errMsg, FacesMessage.SEVERITY_ERROR);
			return "#";
		}
	}

	private void addMessage(FacesContext context, String msgName, String msgDetail, FacesMessage.Severity severity)
		{
			FacesMessage msg = new FacesMessage(msgName, msgDetail);
			msg.setSeverity(severity);
			context.addMessage(null, msg);
	}


	/*******************************************************************************
	* setter methods
	*******************************************************************************/

	/**
	 * @param logger The logger to set.
	 */
	public void setLogger(Log logger) {
		this.logger = logger;
	}

	/**
	 * @param meleteSecurityService The meleteSecurityService to set.
	 */
	public void setMeleteSecurityService(
			MeleteSecurityService meleteSecurityService) {
		this.meleteSecurityService = meleteSecurityService;
	}

	/**
	 * @param moduleService The moduleService to set.
	 */
	public void setModuleService(ModuleService moduleService) {
		this.moduleService = moduleService;
	}

	/**
		 * @param sectionService The sectionService to set.
		 */
		public void setSectionService(SectionService sectionService) {
			this.sectionService = sectionService;
		}

}
