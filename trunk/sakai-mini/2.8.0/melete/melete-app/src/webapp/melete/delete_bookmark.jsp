<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-app/src/webapp/melete/delete_bookmark.jsp $
 * $Id: delete_bookmark.jsp 64898 2009-11-24 22:26:14Z mallika@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008 Etudes, Inc.
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
<sakai:view title="Modules: Delete bookmarks" toolCssHref="rtbc004.css">
<%@include file="meleterightscheck.jsp" %>
 <h:form id="DeleteBookmarkForm">
 	<f:subview id="top">
		<jsp:include page="topnavbar.jsp"/> 
	</f:subview>
	<div class="meletePortletToolBarMessage"><img src="images/Warning.gif" width="16" height="16" align="absbottom" border="0">
		     <h:outputText value="#{msgs.delete_bookmark_deletion_warning}" /></div>				
		     		
  <table class="maintableCollapseWithBorder">
       <!-- This Begins the Main Text Area -->
        <tr>       
      <td width="100%" valign="top" >
       <table class="maintableCollapseWithBorder">
        <!-- show table with delete bookmarks -->
        <tr><td width="100%" height="20" class="maintabledata5"></td></tr>
        <tr> 
        <td width="100%" valign="top">
           <h:messages id="deleteBookmarkError" layout="table" showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
           <table class="deleteConfirmTable">
        	<tr>
        		<td> <img src="images/Warning.gif" border="0">
        		</td>
        		<td> 
        			<h:outputText value="#{msgs.delete_bookmark_message1}" />
        			<br/> <br/>    			
        			<!--datatable or panelgrid to display res names -->
        			<h:outputText value="#{bookmarkPage.deleteBookmarkTitle}" styleClass="bold" />
        			<br/> <br/>    
        			
        			<h:outputText value="#{msgs.delete_bookmark_long1}" />
        			<h:outputText value="#{msgs.delete_bookmark_long2}"  styleClass="bold"/>
        			<h:outputText value="#{msgs.delete_bookmark_long3}" />
        			<h:outputText value="#{msgs.delete_bookmark_long4}"  styleClass="bold"/>
        			<h:outputText value="#{msgs.delete_bookmark_long5}" />
        		</td>
        	</tr>
           </table>
        </td></tr>
          <tr>
                <td>         
               <div class="actionBar" align="left">	
                	<h:commandButton id="delButton" action="#{bookmarkPage.deleteBookmark}" value="#{msgs.im_continue}" accesskey="#{msgs.continue_access}" title="#{msgs.im_continue_text}" styleClass="BottomImgDelete"/>			
                    <h:commandButton id="cancelButton" action="#{bookmarkPage.cancelDeleteBookmark}" value="#{msgs.im_cancel}" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>
              	</div></td>
              </tr>			 
            </table>
      </td></tr></table>

  <!-- This Ends the Main Text Area -->
  	</h:form>
</sakai:view>
</f:view>

