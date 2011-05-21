<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/remotelinkbrowser.jsp $
 * $Id: remotelinkbrowser.jsp 65998 2010-02-04 19:22:14Z rashmi@etudes.org $  
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
<%@ page import="java.util.*,org.etudes.tool.melete.RemoteBrowserFile,javax.faces.application.FacesMessage"%>
<% 
	final javax.faces.context.FacesContext facesContext = javax.faces.context.FacesContext.getCurrentInstance();
	final RemoteBrowserFile rPage = (RemoteBrowserFile)facesContext.getApplication().getVariableResolver().resolveVariable(facesContext, "remoteBrowserFile");
	List<RemoteBrowserFile> files = rPage.getRemoteBrowserLinkFiles();
	%>

<body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0">
<form id="remotelinkform">
	<table>
	<%
	if(files != null)
		for(RemoteBrowserFile robj: files)
		{	
		%>
		<tr><td>
		<input type="submit" name="anyName" value="<%=robj.getFileName()%>" displaylabel="<%=robj.getDisplayName()%>" />
		</td></tr>
		<%
		}
	%>
	</table>
</form>

</body>

