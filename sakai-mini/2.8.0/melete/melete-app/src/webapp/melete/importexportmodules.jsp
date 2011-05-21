<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/importexportmodules.jsp $
 * $Id: importexportmodules.jsp 68182 2010-06-15 20:18:18Z mallika@etudes.org $  
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
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://javascript4jsf.dev.java.net/" prefix="j4j" %>
<%@ taglib uri="http://sakaiproject.org/jsf/sakai" prefix="sakai" %>

<f:view>
<sakai:view title="Modules: Import/Export Modules" toolCssHref="rtbc004.css">
<%@include file="accesscheck.jsp" %>
<%@ page import="javax.faces.application.FacesMessage, java.util.ResourceBundle"%>

<% 
	String status = (String)request.getAttribute("upload.status");
		if( status != null && !status.equalsIgnoreCase("ok"))
		{
			final javax.faces.context.FacesContext facesContext = javax.faces.context.FacesContext.getCurrentInstance();
			ResourceBundle bundle = ResourceBundle.getBundle("org.etudes.tool.melete.bundle.Messages", facesContext.getViewRoot().getLocale());
			String infoMsg = bundle.getString("error_importing_large");
			FacesMessage msg = new FacesMessage(null, infoMsg);
			msg.setSeverity(FacesMessage.SEVERITY_ERROR);
			facesContext.addMessage(null, msg);			
		}
%>
<script language="javascript1.2">
function showprocessMsg()
{
 document.getElementById("importexportform:processmsg").style.visibility="visible";
}
</script>

<h:form id="importexportform" enctype="multipart/form-data">
<j4j:param name="upload.max" value="#{exportMeleteModules.uploadmax}" method="get" />
	<f:subview id="top">
			<jsp:include page="topnavbar.jsp"/> 
	</f:subview>
	<div class="meletePortletToolBarMessage"><img src="images/import1.gif" alt="" width="16" height="16" align="absmiddle"><h:outputText value="#{msgs.importexportmodules_importing_or_exporting}" /></div>
<!-- This Begins the Main Text Area -->
	
                <table class="maintableCollapseWithBorder">
          					
				<tr>
					<td class="maintabledata3" valign="top">
						<!-- main page contents -->
						<h:messages showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/></br>
						<table class="maintableCollapseWithNoBorder" id="AutoNumber1">
						<tr>
			  					<th class="leftheader maintabledata5 style4" colspan="2" height="20"><h:outputText value="#{msgs.importexportmodules_import_ims}" /></th>
			  				</tr>
                  			<tr>
                    			<td colspan="2" class="maintabledata3"><h:outputText value="#{msgs.importexportmodules_message2}" /></td>
                  			</tr>
                  			<tr>
                    			<td colspan="2" class="maintabledata3">
                    				<h:outputText value="#{msgs.importexportmodules_upload_ims}" />
                    				<input type="file" name="impfile" class="formtext">
                    			</td>
                  			</tr>
                  			<tr>
                  				<td colspan="2" class="maintabledata3">&nbsp;</td>
                  			</tr>
                  			<tr>
                    			<td colspan="2" class="maintabledata7">
	                    			<div class="actionBar" align="left">
                						 <h:commandButton id="importButton" action="#{exportMeleteModules.importModules}" value="#{msgs.im_import}" onclick="showprocessMsg()" accesskey="#{msgs.import_access}" title="#{msgs.im_import_text}" styleClass="BottomImgImport"/>
                                         <h:commandButton id="cancelButton" immediate="true" action="#{manageModulesPage.cancel}" value="#{msgs.im_cancel}" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>			                
                					</div>	
                					<h:outputLabel id="processmsg" value="#{msgs.processMsg}" styleClass="orange" style="visibility:hidden" /> 	     						                					
								</td>
              				</tr>
			  				
		  					<tr>
		  						<th class="leftheader maintabledata5 style4" colspan="2" height="20"><h:outputText value="#{msgs.importexportmodules_export_modules}" /></th>
		  					</tr>
                  			<tr>
                   				<td colspan="2" class="maintabledata3">
                   				<table border="0" width="100%">
                   				<tr><td>
                   				<h:outputText value="#{msgs.importexportmodules_export_message}" /></td>
                  				</tr>
                  				<tr>
                  				<td>
                  				    <h:selectOneRadio id="select_export_format" value="#{exportMeleteModules.selectFormat}" layout="pageDirection" rendered="#{!exportMeleteModules.noFlag}">
                  				    	<f:selectItem itemValue="IMS" itemLabel="#{msgs.importexportmodules_exportims_modules}" />
                  				    	<f:selectItem itemValue="SCORM" itemLabel="#{msgs.importexportmodules_exportscorm_modules}" />
                  				    </h:selectOneRadio>
                  				</td>
                  				</tr>
                  				</table></td></tr>
                  			<tr>
                    			<td colspan="2" class="maintabledata3">
                    			<table border="0" width="100%">
                    				<tr><td>
                    				 <h:outputText value="#{msgs.importexportmodules_export_one_more_msg}" />
                    			</td></tr>
                  				<tr><td>
										<h:selectManyListbox id="oneormoremodules" value="#{exportMeleteModules.selectedModules}" disabled="#{exportMeleteModules.noFlag}" size="8" style="width:420px">
											<f:selectItems value="#{exportMeleteModules.availableModules}" />
										</h:selectManyListbox>
								</td></tr>
                  				<tr><td>		
										<h:outputText value="#{msgs.importexportmodules_export_one_more_select_msg}" />
                      			</td></tr>
                  			</table></td></tr>                  			
           				</table>
						<div class="actionBar" align="left">
            				<h:commandButton id="exportButton" action="#{exportMeleteModules.exportModules}" value="#{msgs.im_export}" accesskey="#{msgs.export_access}" title="#{msgs.im_export_text}" styleClass="BottomImgExport"/>
                            <h:commandButton id="cancelButton" immediate="true" action="#{manageModulesPage.cancel}" value="#{msgs.im_cancel}" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>			                
  						</div>            
		  			</td>
		  		</tr>
		  	</table> 
	
</h:form>
<!-- This Ends the Main Text Area -->
</sakai:view>
</f:view>
  
