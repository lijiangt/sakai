/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-api/src/java/org/etudes/api/app/melete/ModuleShdatesService.java $
 * $Id: ModuleShdatesService.java 67721 2010-05-19 21:17:12Z mallika@etudes.org $  
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
package org.etudes.api.app.melete;

import java.util.Date;

/**
 * Filename:
 * Description:
 * Author:
 * Date:
 * Copyright 2004, Foothill College
 */
public interface ModuleShdatesService {

	public abstract Date getStartDate();

	public abstract void setStartDate(Date startDate);

	public abstract Date getEndDate();

	public abstract void setEndDate(Date endDate);

	public abstract int getVersion();

	public abstract void setVersion(int version);

	public abstract void setAddtoSchedule(Boolean addtoSchedule);
	
	public abstract Boolean getAddtoSchedule();
	
	public abstract String getStartEventId();

	public abstract void setStartEventId(String startEventId);
	
	public abstract String getEndEventId();

	public abstract void setEndEventId(String endEventId);

	public abstract org.etudes.api.app.melete.ModuleObjService getModule();

	public abstract void setModule(
			org.etudes.api.app.melete.ModuleObjService module);

	public boolean isVisibleFlag();

	public abstract String toString();

	public abstract boolean equals(Object other);

	public abstract int hashCode();
}