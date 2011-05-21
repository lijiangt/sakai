/**********************************************************************************
 * 
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-impl/src/java/org/etudes/component/app/melete/HibernateUtil.java $
 * $Id: HibernateUtil.java 60842 2009-05-29 18:43:00Z mallika@etudes.org $  
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

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import java.util.Iterator;
import java.util.Map;

public class HibernateUtil implements Serializable{

    public SessionFactory sessionFactory;

	  public ThreadLocal session = new ThreadLocal();

    public Session currentSession() throws HibernateException {

    	try{
    	Session s = (Session) session.get();
    	  // Open a new Session, if this Thread has none yet
        if (s == null) {
            s = sessionFactory.openSession();
            session.set(s);
        }
    	
    	
        return s;
    	}
    	finally{}
    }

	    public void closeSession() throws HibernateException {
	        Session s = (Session) session.get();
	        session.set(null);
	        if (s != null)
	            s.close();
	    }
	    
		public void ensureModuleHasNonNulls(Module mod)
		{
			Map sections = mod.getSections(); 
			if (sections != null && sections.size() > 0)
			{
				Iterator iter = sections.keySet().iterator(); 
				
				while (iter.hasNext())
				{
					Object key; 
					Section cur;  
					
					key = iter.next(); 
					cur = (Section) sections.get(key); 
					ensureSectionHasNonNull(cur);
				}
			}
			if (null == mod.getCreatedByFname())
			{
				mod.setCreatedByFname("");
			}
			if (null == mod.getCreatedByFname())
			{
				mod.setCreatedByFname("");
			}

		}
		
		public void ensureSectionHasNonNull(Section sec)
		{
			if (null == sec.getCreatedByFname() )
			{
				sec.setCreatedByFname("");
			}

			if (null == sec.getCreatedByLname() )
			{
				sec.setCreatedByLname("");
			}
		}	    
	    
		/**
		 * @return Returns the sessionFactory.
		 */
		public SessionFactory getSessionFactory() {
			return sessionFactory;
		}
		/**
		 * @param sessionFactory The sessionFactory to set.
		 */
		public void setSessionFactory(SessionFactory sessionFactory) {
			this.sessionFactory = sessionFactory;
		}
}		