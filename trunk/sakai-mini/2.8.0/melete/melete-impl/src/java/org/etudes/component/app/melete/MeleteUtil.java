/**********************************************************************************
 *
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-impl/src/java/org/etudes/component/app/melete/MeleteUtil.java $
 * $Id: MeleteUtil.java 69815 2010-08-17 21:59:53Z rashmi@etudes.org $
 ***********************************************************************************
 *
 * Copyright (c) 2008,2009 Etudes, Inc.
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
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.sakaiproject.entity.api.Reference;
import org.sakaiproject.entity.cover.EntityManager;

public class MeleteUtil {
	/** Dependency:  The logging service. */
	protected Log logger = LogFactory.getLog(MeleteUtil.class);
	static final String changeforXmlParser = "[ ] %";

	public MeleteUtil(){

	}
	public String replace(String s, String one, String another) {
		// In a string replace one substring with another
		if (s.equals(""))
			return "";
		if ((one == null)||(one.length() == 0))
		{
			return s;
		}
		String res = "";
		int i = s.indexOf(one, 0);
		int lastpos = 0;
		while (i != -1) {
			res += s.substring(lastpos, i) + another;
			lastpos = i + one.length();
			i = s.indexOf(one, lastpos);
		}
		res += s.substring(lastpos); // the rest
		return res;
}
	
	public byte[] readFromFile(File contentfile) throws Exception{

		FileInputStream fis = null;
		try{
			fis = new FileInputStream(contentfile);

			byte buf[] = new byte[(int)contentfile.length()];
			fis.read(buf);
			return buf;
	  	}catch(Exception ex){
	  		throw ex;
	  		}finally{
	  		if (fis != null)
	  			fis.close();
	  		}
	}

	 public boolean checkFileExists(String filePath)
	 {
	 boolean success = false;
	 try {
	        File file = new File(filePath);

	        // Create file if it does not exist
	        success = file.exists();
	        if (success) {

	        } else {
 //	        	 File did not exist and was created
	        	logger.debug("File "+filePath+" does not exist");
	        }
	    } catch (Exception e) {
	    	logger.error("error in checkFileExists"+ e.toString());
	  		e.printStackTrace();
	    }

	    return success;
	 }

	 public ArrayList findEmbedItemPattern(String checkforimgs)
	 {
		 ArrayList returnData = new ArrayList();
		 // a and link uses href, applet uses archive, object uses data
		 Pattern p1 = Pattern.compile("<[iI][mM][gG]\\s|<[aA]\\s|<[eE][mM][bB][eE][dD]\\s|<[sS][cC][rR][iI][pP][tT]\\s|<[lL][iI][nN][kK]\\s|<[aA][pP][pP][lL][eE][tT]\\s|<[oO][bB][jJ][eE][cC][tT]\\s");
		 Pattern pi = Pattern.compile(">|\\s[sS][rR][cC]\\s*=");
		 Pattern pa = Pattern.compile(">|\\s[hH][rR][eE][fF]\\s*=");
		 Pattern pa1 = Pattern.compile(">|\\s[aA][rR][cC][hH][iI][vV][eE]\\s*=");
		 Pattern pd = Pattern.compile(">|\\s[dD][aA][tT][aA]\\s*=");
		 Pattern ps = Pattern.compile("\\S");
		 Pattern pe = Pattern.compile("\\s|>");
		 
		 int startSrc = 0;
		 int endSrc = 0;
		 String foundPattern = null;
		 while(checkforimgs !=null) {
			 foundPattern = null;
			 // look for <img or <a
			 Matcher m = p1.matcher(checkforimgs);
			 if (!m.find()) // found anything?
				 break;
			 checkforimgs = checkforimgs.substring(m.start());
			 // look for src= or href=
			 if (checkforimgs.startsWith("<i") ||
					 checkforimgs.startsWith("<I") ||
					 checkforimgs.startsWith("<e") ||
					 checkforimgs.startsWith("<E") ||
					 checkforimgs.startsWith("<s") ||
					 checkforimgs.startsWith("<S"))
				 m = pi.matcher(checkforimgs);
			 else if (checkforimgs.startsWith("<applet")|| checkforimgs.startsWith("<Applet") ||
					 checkforimgs.startsWith("<APPLET"))
				 m = pa1.matcher(checkforimgs);
			 else if (checkforimgs.startsWith("<o")|| checkforimgs.startsWith("<O"))
				 m = pd.matcher(checkforimgs);
			 else
				 m = pa.matcher(checkforimgs);

			 if(m.pattern().pattern().equals(pa.pattern())){
				 if(checkforimgs.startsWith("<a") ||
				 checkforimgs.startsWith("<A"))foundPattern = "link";}
			 // end = start+1 means that we found a >
			 // i.e. the attribute we're looking for isn't there
			 if (!m.find() || (m.end() == m.start() + 1)) {
				 // prevent infinite loop by consuming the <
				 checkforimgs = checkforimgs.substring(1);
				 continue;
			 }

			 checkforimgs = checkforimgs.substring(m.end());

			 // look for start of arg, a non-whitespace
			 m = ps.matcher(checkforimgs);
			 if (!m.find()) // found anything?
				 break;

			 checkforimgs = checkforimgs.substring(m.start());

			 startSrc = 0;
			 endSrc = 0;

			 // handle either quoted or nonquoted arg
			 if (checkforimgs.startsWith("\"") ||
					 checkforimgs.startsWith("\'")) {
				 String quotestr = checkforimgs.substring(0,1);
				 startSrc = 1;
				 endSrc = checkforimgs.indexOf(quotestr, startSrc);
				 break;
			 } else {
				 startSrc = 0;
				 // ends with whitespace or >
				 m = pe.matcher(checkforimgs);
				 if (!m.find()) // found anything?
					 continue;
				 endSrc = m.start();
			 }
		 } //while end

		 if(foundPattern != null && foundPattern.equals("link"))
		 {
			 String anchorStr = checkforimgs.substring(startSrc,endSrc);
			 anchorStr = anchorStr.trim();
			 if (anchorStr != null && (anchorStr.startsWith("#")|| anchorStr.startsWith("mailto:")))
			 {
				 checkforimgs = checkforimgs.substring(endSrc);
				 if(checkforimgs != null)
				 {
					 ArrayList r = findEmbedItemPattern(checkforimgs);
					 checkforimgs = (String)r.get(0);
					 if (r.size() > 1 && ((Integer)r.get(2)).intValue() > 0)
					 {
						 startSrc = ((Integer)r.get(1)).intValue();
						 endSrc = ((Integer)r.get(2)).intValue();
						 foundPattern = (String)r.get(3);
					 }
					 else
					 {
						 startSrc = 0; endSrc = 0;
					 }
				 }
			 }
		 }

		 returnData.add(checkforimgs);
		 if (endSrc != 0) {
			  returnData.add(new Integer(startSrc)); returnData.add(new Integer(endSrc)); returnData.add(foundPattern);}

		 return returnData;
	 }

		/*
		 *  remove form tag if found in the composed content as IE chokes on nested forms
		 */
		public String findFormPattern(String checkforimgs)
		{
			ArrayList returnData = new ArrayList();
			Pattern pi = Pattern.compile("<\\s*<[fF][oO][rR][mM]");

			// look for <table tr td form
			Matcher m = pi.matcher(checkforimgs);
			if (!m.find())
			{
				int formIdx = -1;
				int endFormIdx = -1;
				if((formIdx = checkforimgs.indexOf("<form")) != -1 || (formIdx = checkforimgs.indexOf("<FORM")) != -1)
				{
					logger.debug("formIdx and m.end() " + formIdx );

						//replace and add table tag
						String afterForm = checkforimgs.substring(formIdx + 6);
						afterForm = afterForm.substring(afterForm.indexOf(">")+1);
						checkforimgs = checkforimgs.substring(0, formIdx) + afterForm;
						//now look for end of form

						if((endFormIdx = checkforimgs.indexOf("</form>")) != -1 || (endFormIdx = checkforimgs.indexOf("</FORM>")) != -1)
							checkforimgs = checkforimgs.substring(0, endFormIdx) +  checkforimgs.substring(endFormIdx + 8);
				}
			}
			return checkforimgs;

		}

		public ArrayList<String> findResourceSource(String Data, String oldCourseId, String toSiteId, boolean newId)
		{
			try
			{
			ArrayList<String> rData = new ArrayList<String>();
			String findEntity = Data.substring(Data.indexOf("/access")+7);
			Reference ref = EntityManager.newReference(findEntity);
			String ref_id = ref.getId();
			String checkReferenceId=null;
			if(ref.getType().equals("sakai:meleteDocs"))
			{
				ref_id = ref_id.substring(ref_id.indexOf("/content")+ 8);
				if(newId) checkReferenceId = ref_id.replace(oldCourseId, toSiteId);
			}
			else if (ref.getType().equals("sakai:content") && ref.getId().startsWith("/group"))
			{
				//for site resources item
				if(newId)
				{
					checkReferenceId = ref_id.replace(oldCourseId, toSiteId+"/uploads");
					checkReferenceId = checkReferenceId.replace("/group/", "/private/meleteDocs/");
				}
			}
			else return null;
			rData.add(ref_id);
			if(newId) rData.add(checkReferenceId);
			return rData;
			}
			catch (Exception e)
			{
				logger.debug("melete util : check reference" + e.toString());
				return null;
			}
		}

		public String findParentReference(String ref_id)
		{
			String parentStr = ref_id.substring(0,ref_id.lastIndexOf("/")+1);
			if (parentStr != null)
			{
				if (parentStr.startsWith("/private/meleteDocs")) parentStr = "/access/meleteDocs/content" + parentStr;
				else if (parentStr.startsWith("/group"))parentStr = "/access/content" + parentStr;
				else parentStr = null;
			}
			return parentStr;
		}

		public String escapeFileforExportPackage(String filename)
		{
			String[] change = changeforXmlParser.split("\\s");
			for (int x=0; x < change.length; x++)
			{
				filename = filename.replace(change[x], "_");
			}
			return filename;
		}

		/*
		 *  translating the src and a href paths to the new ones.
		 *  The format can be anything src="" or src='' or src=
		 *  Didn't use regex patterns, as we would have to escape regex meta-characters like $ [ ^ etc which can be our filenames
		 */
		public String replacePath(String s, String one, String another)
		{
			if (s.equals("")) return "";
			if ((one == null)||(one.length() == 0)) return s;
			String checkOne = "=\""+one+"\"";
			another = "=\""+another+"\"";

			if(s.indexOf(checkOne) != -1)
			{
				s=s.replace(checkOne, another);
				return s;
			}
			checkOne = "='"+one+"'";
			if(s.indexOf(checkOne) != -1)
			{
				s=s.replace(checkOne, another);
				return s;
			}
			checkOne = "="+one;
			if(s.indexOf(checkOne) != -1)
			{
				s=s.replace(checkOne, another);
				return s;
			}

			return s;
		}
		
	public String replaceaPath(String s, String one, String another)
		{
			if (s.equals("")) return "";
			if ((one == null)||(one.length() == 0)) return s;
			String checkOne = "=\""+one+"\"";
			another = "=\""+another+"\"";

			if(s.indexOf(checkOne) != -1)
			{
				s=replace(s,checkOne, another);
				return s;
			}
			checkOne = "='"+one+"'";
			if(s.indexOf(checkOne) != -1)
			{
				s=replace(s,checkOne, another);
				return s;
			}
			checkOne = "="+one;
			if(s.indexOf(checkOne) != -1)
			{
				s=replace(s,checkOne, another);
				return s;
			}

			return s;
		}
		
		public void deleteFiles(File delfile){

			if (delfile.isDirectory()){
				File files[] = delfile.listFiles();
				int i = files.length;
				while (i > 0)
					deleteFiles(files[--i]);

				delfile.delete();
			}else
				delfile.delete();

		}
		
		/**
		 * creates file from input path to output path
		 * @param inputpath - input path for file
		 * @param outputpath - output path for file
		 * @throws Exception
		 */
		public void createFileFromContent(byte[] content, String outputurl)throws Exception{
			FileOutputStream fout = new FileOutputStream(new File(outputurl));
			try {
				fout.write(content);
				fout.flush();
			} catch (IOException e) {
				throw e;
			} catch (Exception e) {
				throw e;
			} finally {
				if (fout != null)
					fout.close();
			}
		}		
}
