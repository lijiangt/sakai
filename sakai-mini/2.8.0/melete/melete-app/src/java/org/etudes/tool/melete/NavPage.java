/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/java/org/etudes/tool/melete/NavPage.java $
 * $Id: NavPage.java 69255 2010-07-15 23:48:27Z mallika@etudes.org $
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

import java.io.Serializable;
import java.util.Map;

import javax.faces.context.FacesContext;
import javax.faces.application.FacesMessage;
import javax.faces.el.ValueBinding;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.sakaiproject.component.cover.ServerConfigurationService;
import org.sakaiproject.util.ResourceLoader;
import org.etudes.api.app.melete.MeleteSecurityService;

/**
 * @author Faculty
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 * Mallika - 3/30/05 - invoking resetValues to make sure state is not retained
 * Mallika - 4/21/05 - added in code to do a role check in view
 * Mallika - 4/22/05 - Added the association to go to correct view page
 * Rashmi - clean code
 * Rashmi - 12/6/06 - read from sakai.properties to show preferences tab or not
 **/
public class NavPage implements Serializable {

/** Dependency:  The logging service. */
	protected Log logger = LogFactory.getLog(NavPage.class);
	private boolean shouldRenderPreferences=false;
	private boolean shouldRenderAuthor;
	private boolean shouldRenderView;
	private boolean shouldRenderManage;
	private boolean isInstructor;
	/** Dependency: The Melete Security service. */
	protected MeleteSecurityService meleteSecurityService;

	  public NavPage() { }
     public String viewAction()
     {
      	FacesContext ctx = FacesContext.getCurrentInstance();
	  	Map sessionMap = ctx.getExternalContext().getSessionMap();
   	    ValueBinding binding =
          Util.getBinding("#{listModulesPage}");
   	    ListModulesPage lmPage = (ListModulesPage) binding.getValue(ctx);
   	    lmPage.resetValues();
   	    lmPage.setViewModuleBeans(null);
   	    return lmPage.listViewAction();
     }
     public String authAction()
     {
       	FacesContext ctx = FacesContext.getCurrentInstance();
   	    ValueBinding binding =
          Util.getBinding("#{listAuthModulesPage}");
   	    ListAuthModulesPage lamPage = (ListAuthModulesPage) binding.getValue(ctx);
   	    lamPage.resetValues();
     	return "list_auth_modules";
     }
     public String manageAction()
     {
       	FacesContext ctx = FacesContext.getCurrentInstance();
     	  ValueBinding binding =
            Util.getBinding("#{manageModulesPage}");
     	 ManageModulesPage mPage = (ManageModulesPage)
            binding.getValue(ctx);
     	 mPage.resetValues();
     	return "modules_author_manage";
     }
     public String prefAction()
     {
     	return "list_auth_modules";
     }

     public String PreferenceAction()
     {
 		FacesContext ctx = FacesContext.getCurrentInstance();
	  	Map sessionMap = ctx.getExternalContext().getSessionMap();
		if (getIsInstructor())
		{
			 ValueBinding binding =
			       Util.getBinding("#{licensePage}");
			     LicensePage lPage = (LicensePage)
			            binding.getValue(ctx);
			     	 lPage.resetValues();
		      ValueBinding authBinding =
		    	  Util.getBinding("#{authorPreferences}");
		      AuthorPreferencePage aPage = (AuthorPreferencePage)
		      authBinding.getValue(ctx);
		      aPage.setFormName("UserPreferenceForm");
		      aPage.resetValues();
			return "author_preference";
		}
		else return "student_preference";
     }

	/**
	 * @return Returns the shouldRenderPreferences.
	 */
	public boolean isShouldRenderPreferences() {
		FacesContext ctx = FacesContext.getCurrentInstance();
	  	String usrMode = (String)ctx.getExternalContext().getRequestParameterMap().get("myMode");
	  	
	  	shouldRenderPreferences = !("Preferences".equals(usrMode));
		return shouldRenderPreferences;
	}
	/**
	 * @param shouldRenderPreferences The shouldRenderPreferences to set.
	 */
	public void setShouldRenderPreferences(boolean shouldRenderPreferences) {
		this.shouldRenderPreferences = shouldRenderPreferences;
	}

	public boolean isShouldRenderAuthor() {
		FacesContext ctx = FacesContext.getCurrentInstance();
	  	String usrMode = (String)ctx.getExternalContext().getRequestParameterMap().get("myMode");
	  	
	  	shouldRenderAuthor = !("Author".equals(usrMode));
		return shouldRenderAuthor;
	}
	
	public boolean isShouldRenderView() {
		FacesContext ctx = FacesContext.getCurrentInstance();
	  	String usrMode = (String)ctx.getExternalContext().getRequestParameterMap().get("myMode");
	  	
	  	shouldRenderView = !("View".equals(usrMode));
		return shouldRenderView;
	}
	
	public boolean isShouldRenderManage() {
		FacesContext ctx = FacesContext.getCurrentInstance();
	  	String usrMode = (String)ctx.getExternalContext().getRequestParameterMap().get("myMode");
	  	
	  	shouldRenderManage = !("Manage".equals(usrMode));
		return shouldRenderManage;
	}
	/**
	 * @param meleteSecurityService The meleteSecurityService to set.
	 */
	public void setMeleteSecurityService(
			MeleteSecurityService meleteSecurityService) {
		this.meleteSecurityService = meleteSecurityService;
	}

	/**
	 * Check if the current user has permission as author.
	 * @return true if the current user has permission to perform this action, false if not.
	 */
	public boolean getIsInstructor(){
		FacesContext context = FacesContext.getCurrentInstance();
		ResourceLoader bundle = new ResourceLoader("org.etudes.tool.melete.bundle.Messages");
		
		try {
			return meleteSecurityService.allowAuthor();
		} catch (Exception e) {
			String errMsg = bundle.getString("auth_failed");
			context.addMessage (null, new FacesMessage(FacesMessage.SEVERITY_ERROR,"auth_failed",errMsg));
			logger.warn(e.toString());
		}
		return false;
	}

	/**
	 * Check if the current user has permission as student.
	 * @return true if the current user has permission to perform this action, false if not.
	 */
	public boolean isUserStudent(){
		FacesContext context = FacesContext.getCurrentInstance();
		ResourceLoader bundle = new ResourceLoader("org.etudes.tool.melete.bundle.Messages");
		
		try {
			return meleteSecurityService.allowStudent();
		} catch (Exception e) {
			String errMsg = bundle.getString("auth_failed");
			context.addMessage (null, new FacesMessage(FacesMessage.SEVERITY_ERROR,"auth_failed",errMsg));
			logger.warn(e.toString());
		}
		return false;
	}			
}
