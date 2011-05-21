<%--
 ***********************************************************************************
 *
 * Copyright (c) 2008,2009,2010 Etudes, Inc.
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
--%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://sakaiproject.org/jsf/sakai" prefix="sakai" %>

<f:view>
<sakai:view title="Modules: Select Resource Item" toolCssHref="rtbc004.css">
<%@include file="accesscheck.jsp" %>

<script language="javascript1.2">
function contentChangeSubmit()
{
           document.getElementById("EditLtiServerViewForm:contentChange").value = "true";
}
</script>

<h:form id="EditLtiServerViewForm" enctype="multipart/form-data">	
<!-- top nav bar -->
    <f:subview id="top">
      <jsp:include page="topnavbar.jsp"/> 
    </f:subview>
	<div class="meletePortletToolBarMessage"><img src="images/replace2.gif" alt="" width="16" height="16" align="absmiddle"><h:outputText value="#{msgs.editcontentlinkserverview_selecting}"/></div>

<!-- This Begins the Main Text Area -->
	<h:messages showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
	<p><h:outputText id="Stext_2" value="#{msgs.editcontentlinkserverview_msg1}"/></p>
	<table class="maintableCollapseWithBorder">
			<tr><td height="20" colspan="2"> <h:outputText id="Stext_add" value="#{msgs.editcontentltiserverview_replace}" styleClass="bold"/> </td></tr>									 
						  
<!--replace with new link part Begin -->
					<table class="maintableCollapseWithNoBorder"  >
					<tr> <td class="col1"><h:outputText id="format_text" value="#{msgs.editcontentltiserverview_format}"/>
					</td>
                    <td class="col2">
                            <h:inputHidden id="contentChange" value=""/>
                            <h:selectOneMenu id="LTIDisplay" value="#{editSectionPage.LTIDisplay}" 
                                    valueChangeListener="#{editSectionPage.toggleLTIDisplay}" 
                                    onchange="contentChangeSubmit();this.form.submit();"
                                    immediate="true" >
                            <f:selectItem itemValue="Basic" itemLabel="#{msgs.addmodulesections_basic_lti}"/>
                            <f:selectItem itemValue="Advanced" itemLabel="#{msgs.addmodulesections_advanced_lti}"/>
                            </h:selectOneMenu>
					</td></tr> 
					<tr><td colspan="2"> 
                                                <f:subview id="LTIBasic" rendered="#{editSectionPage.shouldLTIDisplayBasic}">
                                                        <jsp:include page="lti_basic_edit.jsp"/>
                                                </f:subview>
                                                <f:subview id="LTIAdvanced" rendered="#{editSectionPage.shouldLTIDisplayAdvanced}">
                                                        <jsp:include page="lti_advanced_edit.jsp"/>
                                                </f:subview>
                        </td></tr>                        
					 	<tr><td colspan="2"> 
							<h:selectBooleanCheckbox id="windowopen" title="openWindow" value="#{editSectionPage.section.openWindow}" />												
							<h:outputText id="editLTIText_8" value="#{msgs.editcontentlinkserverview_openwindow}" />	
					</td></tr>	
					</table> </td></tr>       
					<tr><td>
						<div class="actionBar" align="left">
							 <h:commandButton id="addButton_1" action="#{editSectionPage.setServerLTI}" value="#{msgs.im_continue}" tabindex="" accesskey="#{msgs.continue_access}" title="#{msgs.im_continue_text}" styleClass="BottomImgContinue"/>
					     	<h:commandButton id="cancelButton_1" immediate="true" action="#{editSectionPage.cancelServerFile}" value="#{msgs.im_cancel}" tabindex="" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>		
						</div></td></tr>
	<!-- new link end -->				            		
						<!-- start main -->
				            <tr><td width="100%" valign="top">
						
									<f:subview id="ResourceListingForm" >
										<jsp:include page="list_resources.jsp"/> 
									</f:subview>	
									<div class="actionBar" align="left">
						 			 	<h:commandButton id="addButton" action="#{editSectionPage.setServerLTI}" value="#{msgs.im_continue}" tabindex="" accesskey="#{msgs.continue_access}" title="#{msgs.im_continue_text}" styleClass="BottomImgContinue"/>
					    				 <h:commandButton id="cancelButton" immediate="true" action="#{editSectionPage.cancelServerFile}" value="#{msgs.im_cancel}" tabindex="" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>
					     			</div>	
					     </td></tr>
					    </table>					
	<!--end  main -->	
			
	<!-- This Ends the Main Text Area -->
     	</h:form>
</sakai:view>
</f:view>

