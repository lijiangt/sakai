<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="org.etudes.tool.melete.PrintModulePage,javax.faces.application.FacesMessage, java.util.ResourceBundle"%>
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/print_module.jsp $
 * $Id: print_module.jsp 69896 2010-08-24 21:42:50Z rashmi@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008,2009,2010 Etudes, Inc.
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
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://sakaiproject.org/jsf/sakai" prefix="sakai" %>

<f:view>
<sakai:view title="Modules: Print Module" toolCssHref="rtbc004.css">
<%@include file="meleterightscheck.jsp" %>
<form id="printModuleForm" >
     <table class="maintableCollapseWithBorder">
          <tr>
            <td width="100%" height="20" >	
            	<%
				final javax.faces.context.FacesContext facesContext = javax.faces.context.FacesContext.getCurrentInstance();
				final org.sakaiproject.util.ResourceLoader msg = (org.sakaiproject.util.ResourceLoader)facesContext.getApplication().getVariableResolver().resolveVariable(facesContext, "msgs");
				String printMsg = msg.getString("print_module_msg");
				String closeMsg = msg.getString("print_module_close_msg");
				
%>			
				<div class="noprint">
				 <a href="#" onclick="javascript:window.print()">
				 <img src="images/printer.png" alt="" width="16" height="16" border="0" align="absmiddle">
				 <%=printMsg%></a>
				 | <a value="" href="" onClick="window.close();" ><%=closeMsg%>	</a>				 
				</div>
		</td></tr>

		<tr><td colspan="2" height="20" class="maintabledata5">&nbsp;</td></tr>	
		  <tr><td>
			<%
final PrintModulePage printModulePage = (PrintModulePage)facesContext.getApplication().getVariableResolver().resolveVariable(facesContext, "printModulePage");
String selected_module_id = (String)request.getParameter("printModuleId");

if(selected_module_id != null)
	{
	printModulePage.processModule(new Integer(selected_module_id));
	out.println(printModulePage.getPrintText());	
	}	
%> 
		</td></tr>		 
	</table>
</form>
</sakai:view>
</f:view>