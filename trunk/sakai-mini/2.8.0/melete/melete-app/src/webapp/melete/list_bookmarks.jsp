<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="org.etudes.tool.melete.BookmarkPage,javax.faces.application.*,javax.faces.context.*,javax.faces.component.*, java.util.ResourceBundle"%>

<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-app/src/webapp/melete/list_bookmarks.jsp $
 * $Id: list_bookmarks.jsp 59695 2009-04-06 23:00:53Z mallika@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2010 Etudes, Inc.
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
<sakai:view title="Modules: List of bookmarks" toolCssHref="rtbc004.css">
<%@include file="meleterightscheck.jsp" %>
<script type="text/javascript" language="javascript" src="js/sharedscripts.js"></script>

 <h:form id="ManageBookmarksForm">
 	<!-- top nav bar -->
		<f:subview id="top">
				<jsp:include page="topnavbar.jsp"/> 
		</f:subview>
		<div class="meletePortletToolBarMessage"><img src="images/my-bookmarks.png" alt="" width="16" height="16" align="absbottom" border="0"><h:outputText value="#{msgs.list_bookmarks_headtitle}" /></div>				
	  	<h:messages showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
		
    	<div class="right">
    	      <h:inputHidden id="bmlistflag" value="#{bookmarkPage.nobmsFlag}"/>
                 <h:commandLink id="exportNotesLink" actionListener="#{bookmarkPage.exportNotes}" action="#{bookmarkPage.redirectExportNotes}" rendered="#{bookmarkPage.nobmsFlag == false}">
                 	<h:graphicImage id="image0" alt="" url="images/export.png" styleClass="AuthImgClass"/>
                   <h:outputText id="exportnotes" value="#{msgs.list_bookmarks_export_notes}" />									
                 </h:commandLink>
          </div>
    	<table class="maintableCollapseWithBorder">
          		<tr>
            		<td valign="top">
          
			 <h:dataTable id="table"  value="#{bookmarkPage.bmList}"  var="bookmark"  border="0" headerClass="tableheader2" columnClasses="col25,col45wordwrap,col15,col15" rowClasses="row1,row2"  width="100%" summary="#{msgs.list_resources_summary}">
				  <h:column>
					   <f:facet name="header">
							<h:panelGroup>
							  <h:outputText value="#{msgs.list_bookmarks_title}" />
							 </h:panelGroup> 
						 </f:facet>
					 <h:outputText id="emp_space" value="     "  styleClass="ExtraPaddingClass" />	
					 <h:commandLink id="viewSection"  actionListener="#{bookmarkPage.viewSection}" action="#{bookmarkPage.redirectViewSection}" rendered="#{((bookmarkPage.instRole == false)&&(bookmark.sectionVisibleFlag == bookmarkPage.trueFlag))}">
					   <f:param name="sectionId" value="#{bookmark.sectionId}" />
					   <h:outputText id="bmtitle" value="#{bookmark.title}"/>
					 </h:commandLink>
					  <h:commandLink id="editSection"  actionListener="#{bookmarkPage.editSection}" action="#{bookmarkPage.redirectEditSection}" rendered="#{((bookmarkPage.instRole == true)&&(bookmark.sectionVisibleFlag == bookmarkPage.trueFlag))}">
					   <f:param name="sectionId" value="#{bookmark.sectionId}" />
					   <h:outputText id="editbmtitle" value="#{bookmark.title}"/>
					 </h:commandLink>
                     <h:commandLink id="editSectionItalics"  actionListener="#{bookmarkPage.editSection}" action="#{bookmarkPage.redirectEditSection}" rendered="#{((bookmarkPage.instRole == true)&&(bookmark.sectionVisibleFlag != bookmarkPage.trueFlag))}">
					   <f:param name="sectionId" value="#{bookmark.sectionId}" />
					   <h:outputText id="editbmtitleitalics" value="#{bookmark.title}" styleClass="italics"/>
					 </h:commandLink>					 
					 <h:outputText id="bmtitletext" value="#{bookmark.title}" rendered="#{((bookmarkPage.instRole == false)&&(bookmark.sectionVisibleFlag != bookmarkPage.trueFlag))}"/>
				    </h:column>
				    <h:column>
				    <f:facet name="header">
							 <h:outputText id="t2" value="#{msgs.list_bookmarks_notes}" />
					 </f:facet>
					 <h:outputText id="bmnotes" value="#{bookmark.briefNotes}"/>					 
					</h:column>
					<h:column>
					 <h:outputLink id="editBookmarkLink" value="list_bookmarks" onclick="OpenBookmarkWindow(#{bookmark.sectionId},'#{bookmark.title}','Melete Bookmark Window');">
		    	       <f:param id="sectionId" name="sectionId" value="#{bookmark.sectionId}" />
		    	       <f:param id="sectionTitle" name="sectionTitle" value="#{bookmark.title}" />
						  <h:graphicImage id="editgif" alt="" value="images/document_edit.gif" styleClass="AuthImgClass" />
			                <h:outputText id="emp_space-20" value=" " />
				    		<h:outputText id="deltext0" value="#{msgs.list_bookmarks_edit}"  />
					 </h:outputLink>						
					</h:column> 
				    <h:column>
					  <h:commandLink id="deleteaction" actionListener="#{bookmarkPage.deleteAction}"  action="#{bookmarkPage.redirectDeleteLink}" immediate="true" >
				    		<f:param name="bookmarkId" value="#{bookmark.bookmarkId}" />
				    		<f:param name="bookmarkTitle" value="#{bookmark.title}" />
				    		<h:graphicImage id="delgif" alt="" value="images/delete.gif" styleClass="AuthImgClass" />
							<h:outputText id="emp_space-2" value=" " />
				    		<h:outputText id="deltext" value="#{msgs.list_bookmarks_delete}"  />
					 </h:commandLink>	
				    </h:column>
                   </h:dataTable>
                   <h:outputText id="nobookmsg" value="#{msgs.list_bookmarks_no_bookmarks_available}" rendered="#{bookmarkPage.nobmsFlag == true}" style="text-align:left"/>
                 <div class="actionBar" align="left">				
				<h:commandButton id="returnButton"  immediate="true" action="#{bookmarkPage.returnAction}" value="#{msgs.im_return}" tabindex="" accesskey="#{msgs.return_access}" title="#{msgs.im_return_text}" styleClass="BottomImgReturn" />
		        <h:commandButton id="refreshButton"  action="#{bookmarkPage.refreshAction}" style="display: none; visibility: hidden;"  />
			    </div>
            </td>
         </tr>
         </table>    
         </h:form>
          </sakai:view>   
    </f:view>
      