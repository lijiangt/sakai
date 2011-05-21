<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-app/src/webapp/melete/AddErrorMessage.jsp $
 * $Id: fileNameCheck.jsp 60201 2009-05-05 18:18:29Z mallika@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2010 Etudes, Inc.
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
<%@ page import="org.etudes.tool.melete.AddResourcesPage"%>
<% 
	final javax.faces.context.FacesContext facesContext = javax.faces.context.FacesContext.getCurrentInstance();
	final AddResourcesPage addPage = (AddResourcesPage)facesContext.getApplication().getVariableResolver().resolveVariable(facesContext, "addResourcesPage");
	String msg= request.getParameter("msg");
	
   	String m  = addPage.getMessageText(msg);  	
   	response.getWriter().write(m);	
%>