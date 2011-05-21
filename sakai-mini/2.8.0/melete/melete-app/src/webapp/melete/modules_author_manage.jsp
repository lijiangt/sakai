<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/modules_author_manage.jsp $
 * $Id: modules_author_manage.jsp 68182 2010-06-15 20:18:18Z mallika@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008,2009, 2010 Etudes, Inc.
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
<%@ taglib uri="http://sakaiproject.org/jsf/sakai" prefix="sakai" %>

<f:view>
<sakai:view title="Modules: Manage View" toolCssHref="rtbc004.css">

<%@include file="accesscheck.jsp" %>
<h:form id="ManageModuleForm">
<!-- top nav bar --> 
	<f:subview id="top">
		<jsp:include page="topnavbar.jsp?myMode=Manage"/> 
	</f:subview>
	<div class="meletePortletToolBarMessage"><img src="images/folder_document.gif" alt="" width="16" height="16" align="absmiddle"><h:outputText value="#{msgs.modules_author_manage_managing_options}" /></div>
<!-- This Begins the Main Text Area -->	

        		<table class="maintableCollapseWithBorder">
					<tr>
						<td>
							<!-- start main -->
					<h:messages showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
							<table class="maintableCollapseWithBorder" id="AutoNumber1">
							  	<tr><td colspan="2" class="maintabledata5">&nbsp;
							  		</td></tr>
					            <tr>
						              <td width="100%" valign="top">
											<table class="maintableCollapseWithWhiteBorder" >
											<tr rowspan="5" valign="top">
							                    	<td class="menu left">
								                    	<h:commandLink id="contentgoto" action="#{manageModulesPage.goToManageContent}">
															<h:graphicImage id="image0"
									   							alt=""
									   							url="images/manage_content.png"
									   							 styleClass="AuthImgClass"/>
									   							<h:outputText id="co" value="#{msgs.modules_author_manage_content}" />
														</h:commandLink>
							                    	</td>
							                    	<td  align="left"><h:outputText value="#{msgs.modules_author_manage_content_text}" /></td>
							                  	</tr>
							                  	<tr rowspan="5" valign="top">
							                    	<td  class="menu left">
								                    	<h:commandLink id="restoregoto" action="#{manageModulesPage.goToRestoreModules}">
															<h:graphicImage id="image"
									   							alt=""
									   							url="images/folder_into.gif"
									   							 styleClass="AuthImgClass"/>
									   							<h:outputText id="re" value="#{msgs.modules_author_manage_archive_title}" />
														</h:commandLink>
							                    	</td>
							                    	<td  align="left"><h:outputText value="#{msgs.modules_author_manage_archive_delete_list}" /></td>
							                  	</tr>
							                   	<tr rowspan="5" valign="top">
							                    	<td class="menu left">
								                    	<h:commandLink id="goto_impexp" action="#{manageModulesPage.importExportModules}">
															<h:graphicImage id="image_impexp"
									   							alt=""
									   							url="images/import1.gif"
									   							styleClass="AuthImgClass"/>
									   							<h:outputText id="import" value="#{msgs.modules_author_manage_import_export}" />
														</h:commandLink>
							                    	</td>
							                    	<td  align="left"><h:outputText value="#{msgs.modules_author_manage_import_export_modules}" /></td>
							                  	</tr>							                  	

						              		</table>
									  </td>
					            </tr>
					            <tr>
					              	<td  colspan="2" class="maintabledata5">&nbsp;</td>
					            </tr>
					     	</table>
					
							<!--end  main -->
			  			</td>
			  		</tr>
			  	</table> 
			
	<!-- This Ends the Main Text Area -->
	     	</h:form>
</sakai:view>
</f:view>

