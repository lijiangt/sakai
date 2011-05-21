/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/java/org/etudes/tool/melete/PrintModulePage.java $
 * $Id: PrintModulePage.java 69869 2010-08-23 22:27:35Z rashmi@etudes.org $
 ***********************************************************************************
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

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.etudes.component.app.melete.*;
import org.etudes.api.app.melete.*;
import org.sakaiproject.util.ResourceLoader;

import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.component.html.*;
import javax.faces.component.*;

import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.*;

import javax.faces.context.FacesContext;
import javax.faces.el.ValueBinding;
import javax.faces.event.AbortProcessingException;
import javax.faces.event.ValueChangeEvent;

import org.etudes.api.app.melete.ModuleService;
import org.etudes.api.app.melete.SectionService;

public class PrintModulePage implements Serializable
{

	/** identifier field */

	private ModuleObjService selectedModule;

	private ModuleService moduleService;

	private String printText;

	/** Dependency:  The logging service. */
	protected Log logger = LogFactory.getLog(PrintModulePage.class);

	public PrintModulePage()
	{

	}


	public void processModule(Integer moduleId)
	{
//		logger.debug("print process called");
		printText = null;
		FacesContext ctx = FacesContext.getCurrentInstance();
		ResourceLoader bundle = new ResourceLoader("org.etudes.tool.melete.bundle.Messages");
		try{
			ModuleObjService printMod = moduleService.getModule(moduleId.intValue());
			printText = moduleService.printModule(printMod);
		}catch(Exception e)
		{
			String msg = bundle.getString("print_module_fail");
			printText= msg;
			ctx.addMessage (null, new FacesMessage(FacesMessage.SEVERITY_ERROR,"print_module_fail",msg));
		}
	}

	public void resetValues()
	{
		selectedModule = null;
		printText = null;
	}


	/**
	 * @return Returns the ModuleService.
	 */
	public ModuleService getModuleService()
	{
		return moduleService;
	}

	/**
	 * @param moduleService The moduleService to set.
	 */
	public void setModuleService(ModuleService moduleService)
	{
		this.moduleService = moduleService;
	}

	/**
	 * @return the printText
	 */
	public String getPrintText()
	{
		return this.printText;
	}
}
