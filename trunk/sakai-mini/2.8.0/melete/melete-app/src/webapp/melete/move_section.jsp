<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/move_section.jsp $
 * $Id: move_section.jsp 68182 2010-06-15 20:18:18Z mallika@etudes.org $  
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
<sakai:view title="Modules: Move Section" toolCssHref="rtbc004.css">
<%@include file="accesscheck.jsp" %>

<h:form id="moveSectionsForm">
	<f:subview id="top">
		<jsp:include page="topnavbar.jsp"/> 
	</f:subview>
	<div class="meletePortletToolBarMessage"><img src="images/page_go.png" alt="" width="16" height="16" align="absbottom"><h:outputText value="#{msgs.move_sections_msg}" /> </div>


		  <table class="maintableCollapseWithBorder">
			<tr>
				<td class="maintabledata3">
					<h:messages id="movesectionerror" layout="table" showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
					<table class="maintableCollapseWithNoBorder" id="AutoNumber1" summary="<h:outputText value='#{msgs.move_sections_summary}'/>">
					<tr>
						<td class="tableheader"><h:outputText id="title" value="#{msgs.move_sections_title}" /> 
						</td></tr>
        				<tr>
    	   				<td valign="top">    	   				
		   				     <h:selectOneRadio id="select_module_id" value="#{moveSectionsPage.selectId}" layout="pageDirection" rendered="#{!moveSectionsPage.nomodsFlag}">
	       				     	<f:selectItems value="#{moveSectionsPage.availableModules}" />	       				     
	       				     </h:selectOneRadio>
	       			<h:outputText id="no_modules_text" value="#{msgs.move_section_no_Modules}" rendered="#{moveSectionsPage.nomodsFlag}" />
         		    </td></tr>         		    
         		    </table> 
         		    <div class="actionBar" align="left">
		          		<h:commandButton id="moveSectionChanges" action="#{moveSectionsPage.move}"  rendered="#{moveSectionsPage.nomodsFlag == false}" value="#{msgs.im_save}" accesskey="#{msgs.save_access}" title="#{msgs.im_save_text}" styleClass="BottomImgSave"/>
		          		<h:commandButton id="cancelButton" immediate="true" action="#{moveSectionsPage.cancel}" value="#{msgs.im_cancel}" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>
		           </div>        		    	        		    
         		</td></tr>
         	</table>
      
      </h:form>
  	 </sakai:view>
   </f:view>     		    		   