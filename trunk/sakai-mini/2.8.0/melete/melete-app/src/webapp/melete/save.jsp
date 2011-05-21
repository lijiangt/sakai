<%@ page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItem"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.faces.context.FacesContext,  org.etudes.tool.melete.AddResourcesPage"%>
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/save.jsp $
 * $Id: save.jsp 71641 2010-12-07 19:33:05Z rashmi@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008, 2009, 2010 Etudes, Inc.
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
 **********************************************************************************
-->
<%
			final javax.faces.context.FacesContext facesContext = javax.faces.context.FacesContext.getCurrentInstance();
			final AddResourcesPage aResourcePage = (AddResourcesPage)facesContext.getApplication().getVariableResolver().resolveVariable(facesContext, "addResourcesPage");
				
			String status = (String)request.getAttribute("upload.status");
		
			if( status != null && status.equalsIgnoreCase("ok"))
			{	
			String collId = aResourcePage.getCollectionId(request.getParameter("courseId"));
			Map newEmbeddedResources = new HashMap();
			
			for (Enumeration e = request.getAttributeNames(); e.hasMoreElements();)
				{
					String oneKey = (String) e.nextElement();
			
					if(oneKey.startsWith("sferyx"))
					{
							// store the image at uploads directory
						try {
							org.apache.commons.fileupload.disk.DiskFileItem item = (org.apache.commons.fileupload.disk.DiskFileItem)request.getAttribute(oneKey);
							String fileName = item.getName();
							
							//no processing on selecting remote files
							if (!fileName.startsWith("file:")) continue;
							
							int lastSlash = fileName.lastIndexOf("/");
							fileName = fileName.substring(lastSlash + 1);
							
							// for word paste files
							lastSlash = fileName.lastIndexOf("\\");
							if(lastSlash != -1)
								fileName = fileName.substring(lastSlash + 1);
																			
							InputStream in = item.getInputStream();
							byte[] buf = new byte[(int)item.getSize()];
							in.read(buf);
							
							String embed_ResId = aResourcePage.addItem(fileName,(String)item.getContentType(),collId , buf);
							in.close();
							aResourcePage.addtoMeleteResource(null,embed_ResId);
								
							newEmbeddedResources.put(fileName, embed_ResId);
							
						}  catch (Exception ex) {
							// do nothing
						}
					} // if end
				} // for end	
		
		try
		{
			if(request.getParameter("html_content") != null)
			{			
				aResourcePage.saveSectionHtmlItem(collId, request.getParameter("courseId"), request.getParameter("resourceId"), request.getParameter("mId"), request.getParameter("sId"), request.getParameter("uId"),newEmbeddedResources, request.getParameter("html_content") );
			}				
		}  catch (Exception ex) {
			String exKey = request.getParameter("sId") + "-"+ request.getParameter("uId"); 
			aResourcePage.addToHm_Msgs(exKey,"add_section_fail");
			}
		}	
		
%>