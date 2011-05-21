<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/commonfilebrowser.jsp $
 * $Id: commonfilebrowser.jsp 63702 2009-09-30 21:29:05Z mallika@etudes.org $  
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
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@include file="accesscheck.jsp" %>

<%@ page import="org.etudes.tool.melete.MeleteSiteAndUserInfo"%>
<%
final javax.faces.context.FacesContext facesContext = javax.faces.context.FacesContext.getCurrentInstance();

final MeleteSiteAndUserInfo meleteSiteAndUserInfo = (MeleteSiteAndUserInfo)facesContext.getApplication().getVariableResolver().resolveVariable(facesContext, "meleteSiteAndUserInfo");
String browseloca = meleteSiteAndUserInfo.getRemoteBrowseLocation() ;
%>
<body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0">

<f:view>
<h:form id="commonform">
<table border="0" width="100%">
<tr bgcolor="#CCCCCC">
<td>	<h:outputText id="cc2" value="#{msgs.commonfilebrowser_common_files}"></h:outputText> &raquo; 
	<a href="<%=browseloca%>">
				<h:outputText id="cc" value="#{msgs.commonfilebrowser_uploaded_files}"></h:outputText>
	</a>
</td>
</tr>
<tr><td>
	<h:dataTable id="table1"  value="#{remoteBrowserFile.remoteCommonFiles}" var="rbf" width="100%">
		<h:column>
            <h:commandButton id="head1" value="#{rbf.fileName}" ></h:commandButton>
		</h:column>
		<h:column>
           <h:outputText id="head2" value="#{rbf.size}" ></h:outputText>
		</h:column>
		<h:column>
           <h:outputText id="head3" value="#{rbf.modifiedDate}" ></h:outputText>
		</h:column>
	</h:dataTable>
	</td></tr>
</table>	
</h:form>
</f:view>
