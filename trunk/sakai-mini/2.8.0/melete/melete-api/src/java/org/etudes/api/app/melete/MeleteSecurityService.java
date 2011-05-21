/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-api/src/java/org/etudes/api/app/melete/MeleteSecurityService.java $
 * $Id: MeleteSecurityService.java 69897 2010-08-24 22:44:41Z mallika@etudes.org $  
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

import java.util.Set;

/**
 * <p>MeleteSecurityService provides the access permissions to the melete</p>
 *
 * @author Foot hill college
 * @version $Revision: 69897 $
 */
public interface MeleteSecurityService{

	/** Security function name for author. */
	public static final String SECURE_AUTHOR = "melete.author";

	/** Security function name for student. */
	public static final String SECURE_STUDENT = "melete.student";

    /**
	 * The type string for this application: should not change over time as it may be stored in various parts of persistent
	 * entities.
	 */
	public static final String APPLICATION_ID = "sakai:meleteDocs";


	/** This string starts the references to resources in this service. */
	public static final String REFERENCE_ROOT = "/meleteDocs/";

	/**
	 * Check if the current user has permission as author.
	 * @return true if the current user has permission to perform this action, false if not.
	 */
	boolean allowAuthor()throws Exception;


	/**
	 * Check if the current user has permission as student.
	 * @return true if the current user has permission to perform this action, false if not.
	 */
	boolean allowStudent()throws Exception;
	
	boolean allowAuthor(String reference)throws Exception;
	
	boolean allowStudent(String reference)throws Exception;

	public boolean isSuperUser(String userId);
	
	public Set<String> getUsersIsAllowed(String context);

	public void pushAdvisor();

	public void popAdvisor();


}
