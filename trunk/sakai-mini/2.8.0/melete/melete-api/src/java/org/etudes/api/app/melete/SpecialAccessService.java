/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-api/src/java/org/etudes/api/app/melete/SpecialAccessService.java $
 *
 ***********************************************************************************
 * Copyright (c) 2010 Etudes, Inc.
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

import java.util.List;
import java.io.File;

/**
 * @author Faculty
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public interface SpecialAccessService {
	public void insertSpecialAccess(List saList, SpecialAccessObjService mb, ModuleObjService mod) throws Exception;
	public List getSpecialAccess(int moduleId);
	//public SpecialAccessObjService getSpecialAccess(String userId, int moduleId);
	public void deleteSpecialAccess(List saList) throws Exception;
}