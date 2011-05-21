<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/restore_modules.jsp $
 * $Id: restore_modules.jsp 68182 2010-06-15 20:18:18Z mallika@etudes.org $  
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
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://sakaiproject.org/jsf/sakai" prefix="sakai" %>

<f:view>
<sakai:view title="Modules: Restore Inactive Modules" toolCssHref="rtbc004.css">
<%@include file="accesscheck.jsp" %>

<script type="text/javascript" language="javascript">
function selectAll()
{
  var listSizeStr = "RestoreModuleForm:listSize";
  var listSizeVal = document.getElementById(listSizeStr).value;
  if (document.getElementById("RestoreModuleForm:table1:allmodcheck") != null)
  {	  
    if (document.getElementById("RestoreModuleForm:table1:allmodcheck").checked == true)
    {	
      for (i=0;i<parseInt(listSizeVal);i++)
      {
	  var modchStr = "RestoreModuleForm:table1:"+i+":modCheck";
	  if (document.getElementById(modchStr).checked == false)
	  {	  
	    document.getElementById(modchStr).checked=true;
	  }  	  
      } 
    }
    else
    {	
      for (i=0;i<parseInt(listSizeVal);i++)
      {
      var modchStr = "RestoreModuleForm:table1:"+i+":modCheck";
      if (document.getElementById(modchStr).checked == true)
      {	  
    	    document.getElementById(modchStr).checked=false;
      }  	  
      } 
     }
  }          	  
  
}
function resetCheck()
{
      if (document.getElementById("RestoreModuleForm:table1:allmodcheck") != null)
      {
	document.getElementById("RestoreModuleForm:table1:allmodcheck").checked=false;
      }	
}
</script>

<h:form id="RestoreModuleForm">
	<!-- top nav bar -->
	<f:subview id="top">
			<jsp:include page="topnavbar.jsp"/> 
	</f:subview>
	<div class="meletePortletToolBarMessage"><img src="images/folder_into.gif" alt="" width="16" height="16" align="absmiddle"><h:outputText value="#{msgs.restore_modules_restoring_inactive}" /></div>
	<!-- This Begins the Main Text Area -->			
        	<table class="maintableCollapseWithBorder">
          		<tr>
					<td class="maintabledata6" valign="top">
						<!-- main page contents -->
						<h:messages id="restorerror" showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
			            <table class="maintableCollapseWithNoBorder" id="AutoNumber1">
						<tr>
              					<td colspan="2" width="100%" valign="top">
			  						<h:dataTable id="table1"  value="#{manageModulesPage.archiveModulesList}" var="aml" width="100%"  headerClass="tableheader2" columnClasses="ListTitleClass,ListDateClass" summary="#{msgs.restore_modules_summary}">
			  							<h:column>
			  							<f:facet name="header">
			  							<h:panelGroup>
			  							 <h:selectBooleanCheckbox id="allmodcheck" value="" onclick="selectAll()" rendered="#{(manageModulesPage.shouldRenderEmptyList == manageModulesPage.falseBool)}"/>   
			  							 <h:outputText id="t1" value="#{msgs.restore_modules_select_modules}" />
			  							 </h:panelGroup>         
										 </f:facet>
											<h:selectBooleanCheckbox id="modCheck" onclick="resetCheck()" value="" valueChangeListener="#{manageModulesPage.selectedRestoreModule}"/>
					 						<h:outputText id="modname" value="#{aml.module.title}"/>
										</h:column>
										<h:column>
										<f:facet name="header">
																   <h:outputText id="t2" value="#{msgs.restore_modules_date_deactivated}" />          
										 </f:facet>
											<h:outputText id="deactivateDate" value="#{aml.dateArchived}"><f:convertDateTime pattern="yyyy-MMM-d hh:mm a"/></h:outputText>
										</h:column>			
			 						</h:dataTable>
			 						 <h:inputHidden id="listSize" value="#{manageModulesPage.listSize}"/>
			  						<h:outputText value="#{msgs.restore_modules_no_archive_modules}" rendered="#{manageModulesPage.shouldRenderEmptyList}" />
			  					</td>
            				</tr>            										
          				</table>
          				<div class="actionBar" align="left">
	    					<h:commandButton action="#{manageModulesPage.restoreModules}" value="#{msgs.im_restore}" accesskey="#{msgs.restore_access}" title="#{msgs.im_restore_text}" styleClass="BottomImgRestore" rendered="#{(manageModulesPage.shouldRenderEmptyList == manageModulesPage.falseBool)}"/>
				            <h:commandButton action="#{manageModulesPage.deleteModules}" value="#{msgs.im_delete}" accesskey="#{msgs.delete_access}" title="#{msgs.im_delete_text}" styleClass="BottomImgDelete" rendered="#{(manageModulesPage.shouldRenderEmptyList == manageModulesPage.falseBool)}"/>
	                        <h:commandButton id="cancelButton" action="#{manageModulesPage.cancelRestoreModules}" value="#{msgs.im_cancel}" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>
		  				</div>
		  			</td>
		  		</tr>
		  	</table> 		 
</h:form>
<!-- This Ends the Main Text Area -->

</sakai:view>
</f:view>