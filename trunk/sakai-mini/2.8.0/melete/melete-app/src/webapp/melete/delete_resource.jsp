<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/delete_resource.jsp $
 * $Id: delete_resource.jsp 68182 2010-06-15 20:18:18Z mallika@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008, 2010 Etudes, Inc.
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
<sakai:view title="Modules: Delete Resource" toolCssHref="rtbc004.css">
<%@include file="accesscheck.jsp" %>
 
 <h:form id="DeleteResourceForm">
	<f:subview id="top">
		<jsp:include page="topnavbar.jsp"/> 
	</f:subview>
	 <div class="meletePortletToolBarMessage"><img src="images/Warning.gif" width="16" height="16" align="absbottom" border="0">
		     <h:outputText value="#{msgs.delete_resource_deletion_warning}" /></div>
  <table class="maintableCollapseWithBorder">
       <!-- This Begins the Main Text Area -->
  	 <tr>       
      <td width="100%" valign="top" >
       <table class="maintableCollapseWithNoBorder">
        <!-- show table with delete resources -->
        <tr><td width="100%" height="20" class="maintabledata5"></td></tr>
        <tr> 
        <td width="100%" valign="top">
           <h:messages id="deleteResourceError" layout="table" showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
           <table class="deleteConfirmTable">
        	<tr>
        		<td> <img src="images/Warning.gif" border="0">
        		</td>
        		<td> 
        			<h:outputText value="#{msgs.delete_resource_message1}" />
        			<br/> <br/>    			
        			<!--datatable or panelgrid to display res names -->
        			<h:outputText value="#{deleteResourcePage.delResourceName}" styleClass="bold" />
        			<br/> <br/>    
        			<!--datatable or panelgrid to display warning message in red -->
        			
        			 <h:panelGrid id="WarningPanel" columns="1" width="85%" border="0" styleClass="RedBorderClass" rendered="#{deleteResourcePage.warningFlag}">
        			 <h:column>
        			 	<h:outputText value="#{msgs.delete_resource_in_use_warning}" styleClass="red" />
        			 </h:column>        			 
        			 </h:panelGrid> 
        			<br/>
        			<h:outputText value="#{msgs.delete_resource_long1}" />
        			<h:outputText value="#{msgs.delete_resource_long2}"  styleClass="bold"/>
        			<h:outputText value="#{msgs.delete_resource_long3}" />
        			<h:outputText value="#{msgs.delete_resource_long4}"  styleClass="bold"/>
        			<h:outputText value="#{msgs.delete_resource_long5}" />
        		</td>
        	</tr>
           </table>
        </td></tr>        		 
            </table>
            <div class="actionBar" align="left">	
	        	<h:commandButton id="delButton" action="#{deleteResourcePage.deleteResource}" value="#{msgs.im_continue}" accesskey="#{msgs.continue_access}" title="#{msgs.im_continue_text}" styleClass="BottomImgDelete"/>			
	            <h:commandButton id="cancelButton" action="#{deleteResourcePage.cancelDeleteResource}" value="#{msgs.im_cancel}" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>
	      	</div>
      </td></tr></table>

  <!-- This Ends the Main Text Area -->
  	</h:form>
</sakai:view>
</f:view>

