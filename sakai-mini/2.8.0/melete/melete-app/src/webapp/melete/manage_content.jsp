<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/manage_content.jsp $
 * $Id: manage_content.jsp 68182 2010-06-15 20:18:18Z mallika@etudes.org $  
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
<sakai:view title="Modules: Manage Content" toolCssHref="rtbc004.css">
<%@include file="accesscheck.jsp" %>

 <h:form id="ManageContentForm">
	 <f:subview id="top">
		<jsp:include page="topnavbar.jsp"/> 
	</f:subview>
	<div class="meletePortletToolBarMessage"><img src="images/manage_content.png" alt="" width="16" height="16" align="absbottom" border="0"><h:outputText value="#{msgs.manage_content_title}" /></div>
		  
    <table class="maintableCollapseWithBorder">
        <tr>
          <td class="maintabledata3">
          	<h:messages showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
		  <table class="maintableCollapseWithNoBorder" id="AutoNumber1">
		  	<tr>
		  		<td height="20" class="maintabledata5"><h:outputText id="t1_1" value="#{msgs.manage_content_new_item}" styleClass="tableheader2"/> </td></tr>
            <tr>
                <td>
                	<table border="0" cellpadding="0" cellspacing="3" width="95%">
                	<tr>
                		<td colspan="2">
                		<h:outputText id="t1" value="#{msgs.manage_content_add_item}" />
       
						  <h:selectOneMenu id="fileType" value="#{manageResourcesPage.fileType}"  >

						    <f:selectItem itemValue="upload" itemLabel="#{msgs.manage_content_upload}"/>	
							<f:selectItem itemValue="link" itemLabel="#{msgs.manage_content_link}"/>	
						 </h:selectOneMenu>
					</td>	
			</tr>	
			<tr>
                		<td colspan="2">
                		<h:outputText id="t2" value="#{msgs.manage_content_number}"/>
                	
						  <h:selectOneMenu id="number" value="#{manageResourcesPage.numberItems}" >
						    <f:selectItem itemValue="1" itemLabel="#{msgs.manage_content_one}"/>	
							<f:selectItem itemValue="2" itemLabel="#{msgs.manage_content_two}"/>	
							<f:selectItem itemValue="3" itemLabel="#{msgs.manage_content_three}"/>	
							<f:selectItem itemValue="4" itemLabel="#{msgs.manage_content_four}"/>
							<f:selectItem itemValue="5" itemLabel="#{msgs.manage_content_five}"/>	
							<f:selectItem itemValue="6" itemLabel="#{msgs.manage_content_six}"/>
							<f:selectItem itemValue="7" itemLabel="#{msgs.manage_content_seven}"/>	
							<f:selectItem itemValue="8" itemLabel="#{msgs.manage_content_eight}"/>
							<f:selectItem itemValue="9" itemLabel="#{msgs.manage_content_nine}"/>	
							<f:selectItem itemValue="10" itemLabel="#{msgs.manage_content_ten}"/>
						 </h:selectOneMenu>
					</td>	
			</tr>	
			</table>
				</td></tr>						
				</table>
				<div class="actionBar" align="left">	
            	    <h:commandButton id="continueButton" action="#{manageResourcesPage.addItems}" value="#{msgs.im_continue}"  accesskey="#{msgs.continue_access}" title="#{msgs.im_continue_text}" styleClass="BottomImgContinue"/>
        	        <h:commandButton id="cancelButton" immediate="true" action="#{manageResourcesPage.cancel}" value="#{msgs.im_cancel}"  accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>
				</div>
				</td></tr>             
			 <tr>
        		 <td>
				  <f:subview id="DeleteResourceView">
						<jsp:include page="list_resources.jsp"/> 
				  </f:subview>	
				</td>
			</tr>									

            </table>
  <!-- This Ends the Main Text Area -->
  	</h:form>
</sakai:view>
</f:view>

