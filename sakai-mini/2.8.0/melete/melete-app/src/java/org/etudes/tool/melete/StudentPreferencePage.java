/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/java/org/etudes/tool/melete/StudentPreferencePage.java $
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
 **************************************************************************/
package org.etudes.tool.melete;

import java.util.ArrayList;
import java.util.Map;
import org.sakaiproject.util.ResourceLoader;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.etudes.component.app.melete.MeleteUserPreference;
import org.etudes.api.app.melete.MeleteAuthorPrefService;
import org.sakaiproject.component.cover.ServerConfigurationService;

public class StudentPreferencePage {

  private String userView;

  private MeleteAuthorPrefService authorPref;
  private MeleteUserPreference mup;
  /** Dependency:  The logging service. */
	protected Log logger = LogFactory.getLog(StudentPreferencePage.class);

  public StudentPreferencePage()
  {
  }

  private void getUserChoice()
  {
   		FacesContext context = FacesContext.getCurrentInstance();
  		Map sessionMap = context.getExternalContext().getSessionMap();

  		mup = (MeleteUserPreference) getAuthorPref().getUserChoice((String)sessionMap.get("userId"));

  		if (mup==null)
  		{
  			userView = "true";
  		}
  		else
  		{
  			if (mup.isViewExpChoice() == true)
  			{
  			  userView = "true";
  			}
  			else
  			{
  				userView = "false";
  			}
  		}
  	return;
  	}




public String getUserView() {
	getUserChoice();
	return userView;
}
/**
 * @param userView The userView to set.
 */
public void setUserView(String userView) {
	this.userView = userView;
}
public String setUserChoice()
{
		FacesContext context = FacesContext.getCurrentInstance();
		Map sessionMap = context.getExternalContext().getSessionMap();
		ResourceLoader bundle = new ResourceLoader("org.etudes.tool.melete.bundle.Messages");
        if (mup == null)
        {
        	mup = new MeleteUserPreference();
        }
		try
		{
			if (userView.equals("true"))
			{
				mup.setViewExpChoice(true);
			}
			else
			{
				mup.setViewExpChoice(false);
			}
		mup.setUserId((String)sessionMap.get("userId"));
		authorPref.insertUserChoice(mup);
		}
		catch(Exception e)
		{
			String errMsg = bundle.getString("Set_prefs_fail");
			context.addMessage (null, new FacesMessage(FacesMessage.SEVERITY_ERROR,"Set_prefs_fail",errMsg));
			return "student_preference";
		}

	String successMsg = bundle.getString("Set_prefs_success");
	context.addMessage (null, new FacesMessage(FacesMessage.SEVERITY_INFO,"Set_prefs_success",successMsg));

	return "student_preference";
}

public String backToPrefsPage()
{
	return "student_preference";
}

/**
 * @return Returns the authorPref.
 */
public MeleteAuthorPrefService getAuthorPref() {
	return authorPref;
}
/**
 * @param authorPref The authorPref to set.
 */
public void setAuthorPref(MeleteAuthorPrefService authorPref) {
	this.authorPref = authorPref;
}




public MeleteUserPreference getMup() {
	return mup;
}

public void setMup(MeleteUserPreference mup) {
	this.mup = mup;
}
}
