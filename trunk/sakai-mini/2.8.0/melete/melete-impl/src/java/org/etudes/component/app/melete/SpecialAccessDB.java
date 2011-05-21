/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-impl/src/java/org/etudes/component/app/melete/SpecialAccessDB.java $
 * $Id: SpecialAccessDB.java 60573 2009-05-19 20:17:20Z mallika@etudes.org $
 ***********************************************************************************
 *
 * Copyright (c) 2010 Etudes, Inc.
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

import java.util.Iterator;
import java.util.ListIterator;
import java.util.List;
import java.util.ArrayList;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.StaleObjectStateException;
import org.hibernate.Transaction;
import org.etudes.api.app.melete.SpecialAccessObjService;


public class SpecialAccessDB {
	private HibernateUtil hibernateUtil;
	private Log logger = LogFactory.getLog(SpecialAccessDB.class);

	/**
	 * default constructor
	 */
	public SpecialAccessDB() {

	}

	public List getSpecialAccess(int moduleId)
	{
		List saList = new ArrayList();
		try{
		     Session session = getHibernateUtil().currentSession();
		     Query q=session.createQuery("from SpecialAccess sa where sa.moduleId =:moduleId");
			  q.setParameter("moduleId",moduleId);
			  saList = q.list();

		}
	    catch (HibernateException he)
	    {
		  logger.error(he.toString());
	    }
	    finally
		{
	    	try
			  {
		      	hibernateUtil.closeSession();
			  }
		      catch (HibernateException he)
			  {
				  logger.error(he.toString());
			  }
		}
		return saList;

	}
	
	public List getSpecialAccessModuleIds(String courseId)
	{
		List saList = new ArrayList();
		try{
		     Session session = getHibernateUtil().currentSession();
		     Query q=session.createQuery("select sa.moduleId from SpecialAccess sa where sa.module.coursemodule.courseId =:courseId");
			  q.setParameter("courseId",courseId);
			  saList = q.list();

		}
	    catch (HibernateException he)
	    {
		  logger.error(he.toString());
	    }
	    finally
		{
	    	try
			  {
		      	hibernateUtil.closeSession();
			  }
		      catch (HibernateException he)
			  {
				  logger.error(he.toString());
			  }
		}
		return saList;

	}	
	
	 public void deleteSpecialAccess(List saList) throws Exception
     {
       Transaction tx = null;
       SpecialAccess sa = null;
       String delAccessIds = null;
       StringBuffer allAccessIds = new StringBuffer("(");
       for (Iterator saIter = saList.iterator(); saIter.hasNext();)
	   {
    	  Integer accessId = (Integer) saIter.next();
    	   allAccessIds.append(accessId.toString() + ",");
	   }
       if (allAccessIds.lastIndexOf(",") != -1) delAccessIds = allAccessIds.substring(0, allAccessIds.lastIndexOf(",")) + " )";
       String delSpecialAccessStr = "delete SpecialAccess sa where sa.accessId in " + delAccessIds;
      try{
              Session session = getHibernateUtil().currentSession();
              tx = session.beginTransaction();
              int deletedEntities = session.createQuery(delSpecialAccessStr).executeUpdate();
			  tx.commit();
          }
          catch (HibernateException he)
          {
              if (tx!=null) tx.rollback();
              logger.error(he.toString());
              throw he;
          }
          catch (Exception e) {
             if (tx!=null) tx.rollback();
              logger.error(e.toString());
              throw e;
           }
           finally
           {
           	try
   			{
   				hibernateUtil.closeSession();
   			}
   			catch (HibernateException he)
   			{
   				logger.error(he.toString());
   				throw he;
   			}
           }
     }
	

	/*public SpecialAccess getSpecialAccess(String userId, String siteId, int sectionId)
	{
		SpecialAccess mb = null;
		try{
		    Session session = getHibernateUtil().currentSession();
		     Query q=session.createQuery("from SpecialAccess mb where mb.userId =:userId and mb.siteId=:siteId and mb.section.sectionId=:sectionId and mb.section.module.coursemodule.archvFlag = 0");
			  q.setParameter("userId",userId);
			  q.setParameter("siteId", siteId);
			  q.setParameter("sectionId", sectionId);
			  mb = (SpecialAccess)q.uniqueResult();

		}
	    catch (HibernateException he)
	    {
		  logger.error(he.toString());
	    }
	    finally
		{
	    	try
			  {
		      	hibernateUtil.closeSession();
			  }
		      catch (HibernateException he)
			  {
				  logger.error(he.toString());
			  }
		}
		return mb;
	}*/

	
	public void setSpecialAccess(SpecialAccess sa) throws Exception
	{
		Transaction tx = null;
	 	try
		{
	 		 Session session = hibernateUtil.currentSession();
		      tx = session.beginTransaction();

		      Query q=session.createQuery("select sa1 from SpecialAccess as sa1 where sa1.accessId =:accessId");
			  q.setParameter("accessId",sa.getAccessId());
			  SpecialAccess find_sa = (SpecialAccess)q.uniqueResult();

		      if(find_sa == null)
		      {
		    	  session.save(sa);
		      }	  
		      else
		      {
		    	 find_sa.setUsers(sa.getUsers()); 
		    	 find_sa.setStartDate(sa.getStartDate());
		    	 find_sa.setEndDate(sa.getEndDate());
		    	 session.update(find_sa);
		      }


	      tx.commit();

	    }
	 	catch(StaleObjectStateException sose)
	     {
			if(tx !=null) tx.rollback();
			logger.error("stale object exception" + sose.toString());
			throw sose;
	     }
	    catch (HibernateException he)
	    {
		  logger.error(he.toString());
		  he.printStackTrace();
		  throw he;
	    }
	    catch (Exception e) {
	      if (tx!=null) tx.rollback();
	      logger.error(e.toString());
	      throw e;
	    }
	    finally
		{
	    	try
			  {
		      	hibernateUtil.closeSession();
			  }
		      catch (HibernateException he)
			  {
				  logger.error(he.toString());
				  throw he;
			  }
		}   
	}

	/**
	 * @return Returns the hibernateUtil.
	 */
	public HibernateUtil getHibernateUtil() {
		return hibernateUtil;
	}
	/**
	 * @param hibernateUtil The hibernateUtil to set.
	 */
	public void setHibernateUtil(HibernateUtil hibernateUtil) {
		this.hibernateUtil = hibernateUtil;
	}




}
