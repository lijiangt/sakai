<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/delete_module.jsp $
 * $Id: delete_module.jsp 68182 2010-06-15 20:18:18Z mallika@etudes.org $  
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
<sakai:view title="Modules: Delete Module" toolCssHref="rtbc004.css">
<%@include file="accesscheck.jsp" %>

<script language="javascript1.2">
function showProcessMessage()
{
 document.getElementById("DeleteModuleForm:processmsg").style.visibility="visible";
 document.getElementById("DeleteModuleForm:delButton").style.visibility="hidden"; 
}
</script>
 <h:form id="DeleteModuleForm">
	<f:subview id="top">
		<jsp:include page="topnavbar.jsp"/> 
	</f:subview>
	  <div class="meletePortletToolBarMessage"><img src="images/Warning.gif" alt="" width="16" height="16" align="absbottom" border="0"><h:outputText value="#{msgs.delete_module_module}" rendered="#{deleteModulePage.moduleSelected}"/><h:outputText value="#{msgs.delete_module_section_deletion1}" rendered="#{deleteModulePage.sectionSelected}"/><h:outputText value="#{msgs.delete_module_section_deletion2}" /></div>
      <!-- This Begins the Main Text Area -->
      <h:messages id="deletemoduleerror" layout="table" showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
  <table class="maintableCollapseWithBorder">
  <tr><td width="100%">
      <table class="maintableCollapseWithNoBorder">
      <tr><td width="100%" height="20" class="maintabledata5"></td></tr>
        <tr>
          <td>
            <table class="deleteConfirmTable" border="1">
               <tr class="maintabledata3">
                  <td valign="top"><h:graphicImage id="warngif" value="images/Warning.gif" width="24" height="24" alt="#{msgs.delete_module_deletion_warning}" title="#{msgs.delete_module_deletion_warning}"/></td>
                  <td align="left"><h:outputText value="#{msgs.delete_module_message1}" /><br>
                   <br><h:outputText value="#{msgs.delete_module_module2}" styleClass="bold"  rendered="#{deleteModulePage.moduleSelected}"/>  
		     	   <h:outputText value=": " styleClass="bold"   rendered="#{deleteModulePage.moduleSelected}"/>
				   <h:dataTable id="tablemod"  value="#{deleteModulePage.modules}"  var="module" rendered="#{deleteModulePage.moduleSelected}">
                         <h:column>
		                 <br><h:outputText value="#{module.title}" styleClass="bold"  rendered="#{deleteModulePage.moduleSelected}" />
                         </h:column>
                   </h:dataTable>   
						
                   <h:outputText value="Sections " styleClass="bold"  rendered="#{deleteModulePage.sectionSelected}"/> 
				   <h:outputText value=": " styleClass="bold"   rendered="#{deleteModulePage.sectionSelected}"/> 
				   <h:dataTable id="tablesec" value="#{deleteModulePage.sectionBeans}"  var="secbean" rendered="#{deleteModulePage.sectionSelected}">
                      <h:column>
		                 <br>
						<h:outputText value="#{secbean.section.module.title}" styleClass="bold" rendered="#{deleteModulePage.sectionSelected}" /><h:outputText value=": " styleClass="bold"  rendered="#{deleteModulePage.sectionSelected}" />
						<h:outputText value="#{secbean.section.title}" styleClass="bold"  rendered="#{deleteModulePage.sectionSelected}" />
                      </h:column>
                   </h:dataTable>    
					<h:outputText value="#{msgs.delete_module_long1}" /><B><h:outputText value="#{msgs.delete_module_long2}" /></B> <h:outputText value="#{msgs.delete_module_long3}" /><B><h:outputText value="#{msgs.delete_module_long4}" /></B><h:outputText value="#{msgs.delete_module_long5}" />
					  </td>
                    </tr>
                  </table>
                  <h:outputLabel id="processmsg" value="#{msgs.processMsg}" styleClass="orange" style="visibility:hidden" />
                  </td>
             	 </tr>              
     		 </table>
     		 <div class="actionBar" align="left" id="deleteActionPanel">
                	<h:commandButton id="delButton" action="#{deleteModulePage.deleteAction}"  rendered="#{deleteModulePage.sameModuleSectionSelected == false}" value="#{msgs.im_continue}" accesskey="#{msgs.continue_access}" title="#{msgs.im_continue_text}" styleClass="BottomImgDelete" onclick="showProcessMessage()"/>
					<h:commandButton id="delButton_1" action="#{deleteModulePage.reConfirmedDeleteAction}"  rendered="#{deleteModulePage.sameModuleSectionSelected}" value="#{msgs.im_continue}" accesskey="#{msgs.continue_access}" title="#{msgs.im_continue_text}" styleClass="BottomImgDelete"/>	
					<h:commandButton id="cancelButton" action="#{deleteModulePage.backToModules}" value="#{msgs.im_cancel}" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>       
				  </div>
     	 </td>
        </tr>              
      </table>
	</h:form>
  <!-- This Ends the Main Text Area -->
</sakai:view>
</f:view>

