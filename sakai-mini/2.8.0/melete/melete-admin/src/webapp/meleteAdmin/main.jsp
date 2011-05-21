<!--
/**********************************************************************************
 *
 * $URL$
 * $Id$
 ***********************************************************************************
 *
 * Copyright (c) 2009 Etudes, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you
 * may not use this file except in compliance with the License. You may
 * obtain a copy of the License at
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
-->
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://sakaiproject.org/jsf/sakai" prefix="sakai" %>

<LINK href="rtbc004.css" type=text/css rel=stylesheet />
<f:view>

<sakai:view_container>
<sakai:view_content>

 <h:form id="MeleteAdminForm">
 	<table>
		<tr>
			<td valign="top"></td>
	    		<td width="1962" valign="top">
	        		<table width="100%"  border="1" cellpadding="3" cellspacing="0" bordercolor="#EAEAEA"  style="border-collapse: collapse">
	          		<tr>
	          		<td width="100%" height="20" bordercolor="#E2E4E8">
				  <div class="meletePortletToolBarMessage"><img src="images/melete_admin.png" align="absmiddle"/>
				  	<h:outputText value="#{msgs.melete_admin_main_pg_msg}" /></div>				
				</td>
				</tr>
				<tr>
				   <td class="maintabledata3">
	          			<h:messages showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
	          			<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#EAEAEA" width="100%" id="AutoNumber1">
				  	<tr>
				        	<td height="20" class="maintabledata5">
				        	<img src="images/sweep.jpg" align="absmiddle" border="0">
				        	<h:outputText id="t1_1" value="#{msgs.melete_cleanup_message_header}" styleClass="tableheader2"/> 
				        	</td>
				        </tr>
					<tr>
					<td>
						<h:outputText id="t1_2" value="#{msgs.melete_cleanup_message}" /> 
					</td></tr>
					<tr>
					  <td height="30" >         									
					       <h:commandLink id="SetButton"  action="#{meleteAdminMain.startCleanUp}">
						<h:outputText id="startaction" value="#{msgs.start_cleanup}" />
				                </h:commandLink>	
					</td>
			              </tr>
	  			 <tr><td  height="20" class="maintabledata5">&nbsp;</td></tr>
				</table>
	
	          		</td></tr></table>
</td></tr></table>
</h:form>

</sakai:view_content>
</sakai:view_container>
</f:view>