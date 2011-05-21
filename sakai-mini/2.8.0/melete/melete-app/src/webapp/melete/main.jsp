<%@ page import="org.etudes.tool.melete.MeleteSiteAndUserInfo,java.util.Iterator,javax.faces.application.FacesMessage"%>
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/main.jsp $
 * $Id: main.jsp 56408 2008-12-19 21:16:52Z rashmi@etudes.org $  
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
 **********************************************************************************
-->
<html>
<head>
<title>Melete</title>
</head>
<body>
<%

final javax.faces.context.FacesContext facesContext = javax.faces.context.FacesContext.getCurrentInstance();

final MeleteSiteAndUserInfo meleteSiteAndUserInfo = (MeleteSiteAndUserInfo)facesContext.getApplication().getVariableResolver().resolveVariable(facesContext, "meleteSiteAndUserInfo");
String navpage = meleteSiteAndUserInfo.processNavigate();

String navpageurl = navpage +".jsf";
Iterator it = facesContext.getMessages();

if (it != null)
{

 while (it.hasNext())
  {
   FacesMessage fm = (FacesMessage)it.next();
    request.setAttribute("msg",fm.getDetail());
 }
}
else
{
  
}			
%>
<br />
<jsp:forward page="<%=navpageurl%>"/>
</body>
</html> 
