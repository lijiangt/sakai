<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/editContentUploadServerView.jsp $
 * $Id: editContentUploadServerView.jsp 69815 2010-08-17 21:59:53Z rashmi@etudes.org $  
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
<%@ taglib uri="http://sakaiproject.org/jsf/sakai" prefix="sakai" %>

<f:view>
<sakai:view title="Modules: Select Resource Item" toolCssHref="rtbc004.css">
<%@include file="accesscheck.jsp" %>

<%@ page import="javax.faces.application.FacesMessage, java.util.ResourceBundle"%>

<% 
	String status = (String)request.getAttribute("upload.status");
		if( status != null && !status.equalsIgnoreCase("ok"))
		{
			final javax.faces.context.FacesContext facesContext = javax.faces.context.FacesContext.getCurrentInstance();
			ResourceBundle bundle = ResourceBundle.getBundle("org.etudes.tool.melete.bundle.Messages", facesContext.getViewRoot().getLocale());
			String infoMsg = bundle.getString("file_too_large");
			FacesMessage msg = new FacesMessage(null, infoMsg);
			msg.setSeverity(FacesMessage.SEVERITY_ERROR);
			facesContext.addMessage(null, msg);				
	   }
%>

<script language="javascript1.2">
function fillupload()
{
	if(document.getElementById("file1") != undefined)
	{
		var k = document.getElementById("file1").value;
		document.getElementById("EditUploadServerViewForm:filename").value=k;
	}
}

</script>

<h:form id="EditUploadServerViewForm" enctype="multipart/form-data">	
<!-- top nav bar -->
    <f:subview id="top">
      <jsp:include page="topnavbar.jsp"/> 
    </f:subview>
	<div class="meletePortletToolBarMessage"><img src="images/replace2.gif" alt="" width="16" height="16" align="absmiddle"><h:outputText value="#{msgs.editcontentuploadserverview_selecting}" /></div>
<!-- This Begins the Main Text Area -->
			<h:messages showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
			<p><h:outputText id="Stext_2" value="#{msgs.editcontentuploadserverview_msg1}"/></p>
    		<table class="maintableCollapseWithBorder">
				<tr><td>  					 
<!--replace with local part Begin -->
					<table class="maintableCollapseWithNoBorder" >
						<tr><td height="20" colspan="2" class="maintabledata8"> <h:outputText id="Stext_add" value="#{msgs.editcontentuploadserverview_replace}" styleClass="bold"/> 									 
						 <tr><td height="20" colspan="2"> <h:outputText id="Stext3" value="#{msgs.editcontentuploadserverview_upload}"/> 				
																			<INPUT TYPE="FILE" id="file1" NAME="file1" style="visibility:visible" onChange="javascript:fillupload()"/>
						</td></tr>	
						<tr><td  colspan="2"> 
							<h:outputText id="note" value="#{msgs.editcontentuploadserverview_note} #{editSectionPage.maxUploadSize}MB."  styleClass="comment red"/>				
							<h:inputHidden id="filename" value="#{editSectionPage.hiddenUpload}" />
							<h:outputText id="brval" value="<BR>" escape="false"/>
							<h:outputText id="somespaces1" value=" " styleClass="MediumPaddingClass" />
							<h:selectBooleanCheckbox id="windowopen" title="openWindow" value="#{editSectionPage.section.openWindow}" rendered="#{editSectionPage.shouldRenderUpload}">
	                        </h:selectBooleanCheckbox>
		                    <h:outputText id="editlinkText_8" value="#{msgs.editcontentlinkserverview_openwindow}" rendered="#{editSectionPage.shouldRenderUpload}"/>
													
					</td></tr>	
					</table>
			       	<div class="actionBar" align="left">
		          		<h:commandButton id="addButton" action="#{editSectionPage.setServerFile}" value="#{msgs.im_continue}" tabindex="" accesskey="#{msgs.continue_access}" title="#{msgs.im_continue_text}" styleClass="BottomImgContinue"/>
		          	 	<h:commandButton id="cancelButton" immediate="true" action="#{editSectionPage.cancelServerFile}" value="#{msgs.im_cancel}" tabindex="" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>
        			 </div>
					 </td></tr>        
		   
		<!-- replace local end -->			            
				<!-- start main -->
						            <tr>
						              <td width="100%" valign="top">
						          								                    													
											<f:subview id="UploadResourceListingForm" >	
												<jsp:include page="list_resources.jsp"/> 
											</f:subview>
																																												
									<div class="actionBar" align="left">
					          	   	<h:commandButton id="addButton_1" action="#{editSectionPage.setServerFile}" value="#{msgs.im_continue}" tabindex="" accesskey="#{msgs.continue_access}" title="#{msgs.im_continue_text}" styleClass="BottomImgContinue"/>
					          	 	<h:commandButton id="cancelButton_1" immediate="true" action="#{editSectionPage.cancelServerFile}" value="#{msgs.im_cancel}" tabindex="" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>
							    </div>									
						  </td>
			            </tr>
			           	</table>					

	<!-- This Ends the Main Text Area -->
	     	</h:form>
</sakai:view>
</f:view>
