/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-impl/src/java/org/etudes/component/app/melete/ModuleServiceImpl.java $
 * $Id: ModuleServiceImpl.java 70662 2010-10-12 17:02:56Z mallika@etudes.org $
 ***********************************************************************************
 *
 * Copyright (c) 2008, 2009 Etudes, Inc.
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

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.ListIterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


import org.sakaiproject.content.api.ContentResource;
import org.sakaiproject.content.api.ContentCollection;
import org.sakaiproject.content.cover.ContentTypeImageService;

import org.etudes.component.app.melete.MeleteResource;
import org.etudes.component.app.melete.MeleteUtil;
import org.hibernate.HibernateException;

import org.etudes.api.app.melete.CourseModuleService;
import org.etudes.api.app.melete.ModuleDateBeanService;
import org.etudes.api.app.melete.ModuleObjService;
import org.etudes.api.app.melete.ModuleService;
import org.etudes.api.app.melete.ModuleShdatesService;
import org.etudes.api.app.melete.MeleteCHService;
import org.etudes.api.app.melete.SectionObjService;
import org.etudes.api.app.melete.SectionService;
import org.etudes.api.app.melete.MeleteExportService;
import org.sakaiproject.component.cover.ServerConfigurationService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.etudes.api.app.melete.exception.MeleteException;
import org.sakaiproject.exception.IdUnusedException;

import org.sakaiproject.db.cover.SqlService;
import org.sakaiproject.content.api.ContentResourceEdit;
import org.sakaiproject.entity.api.ResourcePropertiesEdit;
import org.sakaiproject.entity.api.Entity;

import org.sakaiproject.util.Validator;



/**
 * @author Rashmi
 *
 * This is the class implementing ModuleService interface.
 */
/*
 * Mallika - 1/17/07 - Adding code to migrate meleteDocs
 * Mallika - 2/21/07 - Adding code to truncate filename
 * Mallika - 5/15/07 - Added code for import from site
 * Mallika - 6/18/07 - fixed the seq issue
 * Mallika - 7/24/07 - Added embed tag processing
 */
public class ModuleServiceImpl implements ModuleService,Serializable {
	/** Dependency:  The logging service. */
	private Log logger = LogFactory.getLog(ModuleServiceImpl.class);

	private ModuleDB moduledb;
	private List moduleDateBeans = null;
	private List viewModuleBeans = null;
	private List modules = null;
	private Module module = null;
	private ModuleDateBean mdBean = null;
	private MeleteUtil meleteUtil= new MeleteUtil();


	//constants
	public final static int NO_CODE = 0;
	public final static int Copyright_CODE = 1;
	public final static int PD_CODE = 2;
	public final static int CC_CODE = 3;
	public final static int FU_CODE = 4;
	private MeleteCHService meleteCHService;
	private SectionService sectionService;
	 /** Dependency: The melete import export service. */
	protected MeleteExportService meleteExportService;


	public void init()
	{
		logger.info(this +".init()");
	}

	public ModuleServiceImpl(){

		if (moduledb== null) moduledb = getModuledb();

		}





	/*
	 * @see org.foothillglobalaccess.melete.ModuleService#insertProperties(org.foothillglobalaccess.melete.Module, org.foothillglobalaccess.melete.ModuleShdates, int, int)
	 * creates the course object and calls methods to actually insert a module.
	 */
	public void insertProperties(ModuleObjService module, ModuleShdatesService moduleshdates,String userId, String courseId) throws Exception
	{

	  // module object and moduleshdates are provided by ui pages

		Module module1 = (Module)module;
		ModuleShdates moduleshdates1 = (ModuleShdates)moduleshdates;

	// insert new module
		moduledb.addModule(module1, moduleshdates1, userId, courseId);

		if (moduleshdates1.getAddtoSchedule() != null)
		{
		  if (moduleshdates1.getAddtoSchedule().booleanValue() == true)
		  {
		    moduledb.updateCalendar(module1, moduleshdates1, courseId);
		  }
	    }

	}


	public void createSubSection(ModuleObjService module, List secBeans) throws MeleteException
	{
		moduledb.createSubSection((Module)module, secBeans);
	}

	public void bringOneLevelUp(ModuleObjService module, List secBeans) throws MeleteException
	{
		moduledb.bringOneLevelUp((Module)module, secBeans);
	}
	public void sortModule(ModuleObjService module,String course_id,String Direction) throws MeleteException
	{
		moduledb.sortModuleItem((Module)module,course_id, Direction);

	}

	public void sortSectionItem(ModuleObjService module, String section_id,String Direction) throws MeleteException
	{
		moduledb.sortSectionItem((Module)module,section_id,Direction);
	}

	public void copyModule(ModuleObjService module,String courseId,String userId) throws MeleteException
	{
		moduledb.copyModule((Module)module, courseId, userId);

	}

	public void moveSections(List sectionBeans,ModuleObjService selectedModule) throws MeleteException
	{
	  try{
		  for (ListIterator<SectionBean> i = sectionBeans.listIterator(); i.hasNext(); )
		  {
			  SectionBean moveSectionBean = (SectionBean)i.next();
			  if(moveSectionBean.getSection().getModuleId() != selectedModule.getModuleId().intValue())
				  moduledb.moveSection(moveSectionBean.getSection(), (Module)selectedModule);
		  }
		}catch (Exception ex)
		{
			throw new MeleteException("move_section_fail");
		}
	}

	public String printModule(ModuleObjService module) throws MeleteException
	{
		try{

		return moduledb.prepareModuleSectionsForPrint((Module)module);
		}catch (Exception ex)
		{
			ex.printStackTrace();
			throw new MeleteException("print_module_fail");
		}
	}

// mallika page stuff
public List getModuleDateBeans(String userId, String courseId) {
  	if (moduledb == null) moduledb = ModuleDB.getModuleDB();

  	try {
  		moduleDateBeans = moduledb.getShownModulesAndDatesForInstructor(userId, courseId);
  	}catch (HibernateException e)
	{
  		//e.printStackTrace();
  		logger.debug(e.toString());
	}
  	return moduleDateBeans;
  }

public List getViewModules(String userId, String courseId) {
  	if (moduledb == null) moduledb = ModuleDB.getModuleDB();

  	try {
  		viewModuleBeans = moduledb.getViewModulesAndDates(userId, courseId);
  	}catch (HibernateException e)
	{
  		//e.printStackTrace();
  		logger.debug(e.toString());
	}
  	return viewModuleBeans;
  }

  public void setModuleDateBeans(List moduleDateBeansList) {
    moduleDateBeans = moduleDateBeansList;
  }

 public ModuleDateBeanService getModuleDateBean(String userId, String courseId,  int moduleId) {
  	if (moduledb == null) moduledb = ModuleDB.getModuleDB();

  	try {
  		mdBean = moduledb.getModuleDateBean(userId, courseId,  moduleId);
  	}catch (HibernateException e)
	{
  		//e.printStackTrace();
  		logger.debug(e.toString());
	}
  	return mdBean;
  }

 public ModuleDateBeanService getModuleDateBeanBySeq(String userId, String courseId,  int seqNo) {
	  	if (moduledb == null) moduledb = ModuleDB.getModuleDB();

	  	try {
	  		mdBean = moduledb.getModuleDateBeanBySeq(userId, courseId,  seqNo);
	  	}catch (HibernateException e)
		{
	  		//e.printStackTrace();
	  		logger.debug(e.toString());
		}
	  	return mdBean;
	  }

  public void setModuleDateBean(ModuleDateBeanService mdBean) {
  	this.mdBean = (ModuleDateBean) mdBean;
  }

  public List getModules(String courseId) {
  	try {
  		modules = moduledb.getModules(courseId);
  	}catch (HibernateException e)
	{
  		//e.printStackTrace();
  		logger.debug(e.toString());
	}
  	return modules;
  }

  public void setModules(List modules) {
    this.modules = modules;
  }


  /*
   * @see org.foothillglobalaccess.melete.ModuleService#updateProperties(org.foothillglobalaccess.melete.ModuleDateBean)
   * updates the moduleDateBean object
   */
 public void updateProperties(List moduleDateBeans, String courseId)  throws MeleteException
  {
    try{
    moduledb.updateModuleDateBeans(moduleDateBeans);
     }
    catch(Exception ex)
	{
		logger.debug("multiple user exception in module business");
	   throw new MeleteException("edit_module_multiple_users");
	}
    for (ListIterator i = moduleDateBeans.listIterator(); i.hasNext(); )
 	{
        ModuleDateBean mdbean = (ModuleDateBean) i.next();
        try
        {
          if (((ModuleShdates)mdbean.getModuleShdate()).getAddtoSchedule() != null)
          {	  
            moduledb.updateCalendar((Module)mdbean.getModule(),(ModuleShdates)mdbean.getModuleShdate(), courseId);
          }  
        }
        catch (Exception ex)
        {
        	logger.debug("Exception thrown while updating calendar tool tables");
        }
 	}
  }


// end - mallika
 public void deleteModules(List delModules, String courseId, String userId) throws Exception
 {
	 List cmodList = null;
	 List<Module> allModules = new ArrayList<Module>(0);

	 moduledb.deleteCalendar(delModules, courseId);
	 try{
		 allModules = moduledb.getActivenArchiveModules(courseId);
		 moduledb.deleteModules(delModules, allModules, courseId, userId);
	 }
	 catch (Exception ex)
	 {
		 throw new MeleteException("delete_module_fail");
	 }


 }

public boolean checkCalendar()
{
	return moduledb.checkCalendar();
}

 /*public void deleteModules(List moduleDateBeans, String courseId, String userId)
  {
	  List cmodList = null;

	  for (ListIterator i = moduleDateBeans.listIterator(); i.hasNext(); )
      {
		ModuleDateBean mdbean = (ModuleDateBean)i.next();
		 try
		  {
		    cmodList = moduledb.getCourseModules(courseId);

	      }
		  catch (HibernateException e)
		  {
			//e.printStackTrace();
			logger.error(e.toString());
		  }
		  for (ListIterator j = cmodList.listIterator(); j.hasNext(); )
	      {
			  CourseModule cmod = (CourseModule) j.next();
			  if (cmod.getModuleId().intValue() == mdbean.getCmod().getModule().getModuleId().intValue())
			  {
				  try
					{
					   moduledb.deleteModule(cmod, userId);
					}
				  	catch (Exception ex)
					{

					}
				  	break;
			  }
	      }

      }
  }*/

 public void archiveModules(List selModBeans, List moduleDateBeans, String courseId) throws Exception
 {
	 List cmodList = null;
	 try
	 {
		 moduledb.archiveModules(selModBeans, moduleDateBeans, courseId);
	 }
	 catch (HibernateException e)
	 {
		 //e.printStackTrace();
		 logger.debug(e.toString());
		 throw new MeleteException("archive_fail");
	 }
	 catch (Exception ex)
	 {
		 throw new MeleteException("archive_fail");
	 }
 }

/*
 * @see org.foothillglobalaccess.melete.ManageModuleService#getArchiveModules(int, int)
 */
public List getArchiveModules(String course_id)
{
	List archModules=null;
	try{
		 archModules = moduledb.getArchivedModules(course_id);
		}catch(Exception ex)
		{
			logger.debug("ManageModulesBusiness --get Archive Modules failed");
		}
		return archModules;
}


public ModuleObjService getModule(int moduleId) {
  	try {
  		module = moduledb.getModule(moduleId);
  	}catch (HibernateException e)
	{
  		//e.printStackTrace();
  		logger.debug(e.toString());
	}
  	return module;
  }

public void setModule(ModuleObjService mod) {
  	module = (Module)mod;
  }


/*
 * @see org.foothillglobalaccess.melete.ManageModuleService#restoreModules(java.util.List, int, int)
 */
public void restoreModules(List modules, String courseId) throws Exception
{

	try{
		 moduledb.restoreModules(modules, courseId);
		}catch(Exception ex)
		{
			if (logger.isDebugEnabled()) {
			logger.debug("ManageModulesBusiness --restore Modules failed");
			ex.printStackTrace();
			}
			throw new MeleteException(ex.toString());
		}
}


	public CourseModuleService getCourseModule(int moduleId,  String courseId)
	throws Exception{
      CourseModule cMod =null;
      try{
        cMod = moduledb.getCourseModule(moduleId,  courseId);
      }catch(Exception ex){
        logger.debug("ManageModulesBusiness --get Archive Modules failed");
       }
     return cMod;
    }



	 public int getNextSeqNo(String userId, String courseId, int currSeqNo)
	  {
	  	int nextseq=0;
	  	nextseq=moduledb.getNextSeqNo(userId, courseId, currSeqNo);
	  	return nextseq;
	  }

	 public int getPrevSeqNo(String userId, String courseId, int currSeqNo)
	  {
	  	int prevseq=0;
        prevseq=moduledb.getPrevSeqNo(userId, courseId, currSeqNo);
	  	return prevseq;
	  }
	 
	public org.w3c.dom.Document getSubSectionW3CDOM(String sectionsSeqXML)
	{
		SubSectionUtilImpl ssuImpl = new SubSectionUtilImpl();
		org.w3c.dom.Document subSectionW3CDOM = ssuImpl.getSubSectionW3CDOM(sectionsSeqXML);
		return subSectionW3CDOM;

	}

	  /*METHODS USED BY UPDATESEQXML BEGIN*/
		//This method generates the XML sequence string from the module's sections
		public boolean updateSeqXml(String courseId) throws Exception
		{
			int modId;
			List  modList = getModules(courseId);
		    	//Iterate through each course, get all modules for the course
		    	if (modList != null)
		    	{
		    		if (logger.isDebugEnabled()) logger.debug("Number of modules is "+modList.size());
		    		List secList;
		    		Module mod = null;
		    		for (ListIterator i = modList.listIterator(); i.hasNext(); ) {
		    			mod = (Module)i.next();
		    		      modId = mod.getModuleId().intValue();
		    		    secList = null;
		    		    try{
		    		        //Get sections for each module;
		    		    	secList = moduledb.getSections(modId);
		    			}catch(Exception ex)
		    			{
		    				logger.debug("ModuleServiceImpl updateSeqXml - get sections failed");
		    				throw ex;
		    			}

	          	    	//Get the meleteDocs content info for each section
		    			if (secList != null)
		    			{
		    			  if (logger.isDebugEnabled()) logger.debug("Number of sections is "+secList.size());
	                      SubSectionUtilImpl ssuImpl = new SubSectionUtilImpl();
	                      for (ListIterator j = secList.listIterator(); j.hasNext(); ) {
	          	    		  Section sec = (Section)j.next();
	          	    		  ssuImpl.addSection(sec.getSectionId().toString());
	   	          		  }//End for seclist loop
	          	          String seqXml = ssuImpl.storeSubSections();

	                      mod.setSeqXml(seqXml);
	                      moduledb.updateModule(mod);
		    	       }//End seclist != null
		    	    }//End modlist for loop
		    	  }//End modlist != null
		    	return true;
		    }
		 /*METHODS USED BY UPDATESEQXML END*/

		// clean up deleted modules
		public int cleanUpDeletedModules() throws Exception
		{
			int noOfDeleted = moduledb.cleanUpDeletedModules();
			return noOfDeleted;
		}

		public int getCourseModuleSize(String courseId)
		{
			return moduledb.getCourseModuleSize(courseId);
		}

		public Date getMinStartDate(String course_id)
		{
			return moduledb.getMinStartDate(course_id);
		}

		public void applyBaseDateTx(String course_id, int days_diff)
		{
			moduledb.applyBaseDateTx(course_id, days_diff);
		}
	/**
	 * @return Returns the moduledb.
	 */
	public ModuleDB getModuledb() {
		return moduledb;
	}
	/**
	 * @param moduledb The moduledb to set.
	 */
	public void setModuledb(ModuleDB moduledb) {
		this.moduledb = moduledb;
	}

	public MeleteCHService getMeleteCHService() {
		return meleteCHService;
	}

    public void setMeleteCHService(MeleteCHService meleteCHService) {
		this.meleteCHService = meleteCHService;
    }

    public SectionService getSectionService() {
        return sectionService;
    }

    public void setSectionService(SectionService sectionService) {
        this.sectionService = sectionService;
    }

	public List getViewModuleBeans()
	{
		return this.viewModuleBeans;
	}

	public void setViewModuleBeans(List viewModuleBeans)
	{
		this.viewModuleBeans = viewModuleBeans;
	}


	/**
	 * @param meleteExportService
	 *
	 */
//	public void setMeleteExportService(
//			MeleteExportService meleteExportService) {
//		this.meleteExportService = meleteExportService;
//	}
}