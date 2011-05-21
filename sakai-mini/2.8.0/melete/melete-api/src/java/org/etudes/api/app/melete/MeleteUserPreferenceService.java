/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-api/src/java/org/etudes/api/app/melete/MeleteUserPreferenceService.java $
 *
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
 ***************************************************************************************/
package org.etudes.api.app.melete;

/**
 * @author Faculty
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public interface MeleteUserPreferenceService {
	public abstract String getEditorChoice();
	public abstract void setEditorChoice(String editorChoice);
	public abstract String getUserId();
	public abstract void setUserId(String userId);
	public abstract int getPrefId();
	public abstract void setPrefId(int prefId);
	public abstract Boolean isViewExpChoice();
	public abstract void setViewExpChoice(Boolean viewExpChoice);
	public abstract Boolean isShowLTIChoice();
	public abstract void setShowLTIChoice(Boolean showLTIChoice);
	public abstract Integer getLicenseCode();

	public abstract void setLicenseCode(Integer licenseCode);

	public abstract String getCcLicenseUrl();

	public abstract void setCcLicenseUrl(String ccLicenseUrl);

	public abstract Boolean isReqAttr();

	public abstract void setReqAttr(Boolean reqAttr);

	public abstract Boolean isAllowCmrcl();

	public abstract void setAllowCmrcl(Boolean allowCmrcl);

	public abstract Integer getAllowMod();

	public abstract void setAllowMod(Integer allowMod);
	
	public abstract String getCopyrightOwner();

	
	public abstract void setCopyrightOwner(String copyrightOwner);

	
	public abstract String getCopyrightYear();

	public abstract void setCopyrightYear(String copyrightYear);	
}