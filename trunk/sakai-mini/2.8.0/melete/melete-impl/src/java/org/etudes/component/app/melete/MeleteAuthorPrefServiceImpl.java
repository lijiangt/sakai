/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-impl/src/java/org/etudes/component/app/melete/MeleteAuthorPrefServiceImpl.java $
 * $Id: MeleteAuthorPrefServiceImpl.java 56408 2008-12-19 21:16:52Z rashmi@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008 Etudes, Inc.
 *
 * Portions completed before September 1, 2008 Copyright (c) 2004, 2005, 2006, 2007, 2008 Foothill College, ETUDES Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
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
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.etudes.api.app.melete.MeleteAuthorPrefService;
import org.etudes.api.app.melete.MeleteSitePreferenceService;
import org.etudes.api.app.melete.MeleteUserPreferenceService;
import org.etudes.api.app.melete.exception.MeleteException;

public class MeleteAuthorPrefServiceImpl implements Serializable, MeleteAuthorPrefService{
private Log logger = LogFactory.getLog(MeleteAuthorPrefServiceImpl.class);
private MeleteUserPreferenceDB userPrefdb;


public void insertUserChoice(MeleteUserPreferenceService mup) throws Exception
	{
		try{
			userPrefdb.setUserPreferences((MeleteUserPreference)mup);
		}catch(Exception e)
			{
			logger.debug("melete user pref business --add editor choice failed");
			 throw new MeleteException("add_editorchoice_fail");

			}
		return;
	}

public MeleteUserPreferenceService getUserChoice(String user_id)
	{
	MeleteUserPreference mup = null;
		try{
			mup = userPrefdb.getUserPreferences(user_id);
		}catch(Exception e)
			{
			logger.debug("melete user pref business --get editor choice failed");
			}
		return mup;
	}

public void insertUserSiteChoice(MeleteSitePreferenceService msp) throws Exception
{
	try{
		userPrefdb.setSitePreferences((MeleteSitePreference)msp);
	}catch(Exception e)
		{
		logger.debug("melete user pref business --add editor choice failed");
		 throw new MeleteException("add_editorchoice_fail");

		}
	return;
}

public MeleteSitePreferenceService getSiteChoice(String site_id)
{
	MeleteSitePreference msp = null;
	try{
		msp = userPrefdb.getSitePreferences(site_id);
	}catch(Exception e)
		{
		logger.debug("melete user pref business --get editor choice failed");
		}
	return msp;
}


	/**
	 * @return Returns the UserPrefdb
	 */
	public MeleteUserPreferenceDB getUserPrefdb() {
		return userPrefdb;
	}
	/**
	 * @param UserPrefdb The UserPrefdb to set.
	 */
	public void setUserPrefdb(MeleteUserPreferenceDB userPrefdb) {
		this.userPrefdb = userPrefdb;
	}

}
