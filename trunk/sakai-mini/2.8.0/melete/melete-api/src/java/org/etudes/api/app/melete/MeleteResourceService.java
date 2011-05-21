/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-api/src/java/org/etudes/api/app/melete/MeleteResourceService.java $
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
 * Unless required by applicable law or agreed to in writing, software 
 * distributed under the License is distributed on an "AS IS" BASIS, 
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or 
 * implied. See the License for the specific language governing 
 * permissions and limitations under the License. 
 ********************************************************************************/
package org.etudes.api.app.melete;

/**
 * @author Faculty
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public interface MeleteResourceService {
	/**
	 * @return Returns the copyrightOwner.
	 */
	public abstract String getCopyrightOwner();

	/**
	 * @param copyrightOwner The copyrightOwner to set.
	 */
	public abstract void setCopyrightOwner(String copyrightOwner);

	/**
	 * @return Returns the copyrightYear.
	 */
	public abstract String getCopyrightYear();

	/**
	 * @param copyrightYear The copyrightYear to set.
	 */
	public abstract void setCopyrightYear(String copyrightYear);

	/**
	 * @return Returns the resourceId.
	 */
	public abstract String getResourceId();

	/**
	 * @param resourceId The resourceId to set.
	 */
	public abstract void setResourceId(String resourceId);

	public abstract int getLicenseCode();

	public abstract void setLicenseCode(int licenseCode);

	public abstract String getCcLicenseUrl();

	public abstract void setCcLicenseUrl(String ccLicenseUrl);

	public abstract boolean isReqAttr();

	public abstract void setReqAttr(boolean reqAttr);

	public abstract boolean isAllowCmrcl();

	public abstract void setAllowCmrcl(boolean allowCmrcl);

	public abstract int getAllowMod();

	public abstract void setAllowMod(int allowMod);

	public abstract int getVersion();

	public abstract void setVersion(int version);

	public abstract String toString();
}