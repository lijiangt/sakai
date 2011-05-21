<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/authnavbar.jsp $
 * $Id: authnavbar.jsp 67281 2010-04-22 20:17:26Z rashmi@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008,2009 Etudes, Inc.
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
<%@include file="accesscheck.jsp" %>

<h:panelGrid columns="8" columnClasses="authBarCol" cellspacing="5" width="64%">
	<h:column>
		<h:commandLink id="addAction" action="#{listAuthModulesPage.AddModuleAction}" immediate="true">
		    <h:graphicImage id="addModuleImg" value="images/document_add.gif" styleClass="AuthImgClass"/>
	  		<h:outputText  value="#{msgs.authnavbar_add_module}"/>
		</h:commandLink>
	</h:column>
	<h:column>
		<h:commandLink id="addContAction" action="#{listAuthModulesPage.AddContentAction}">
	  		<h:graphicImage id="addContentImg" value="images/document_add.gif" styleClass="AuthImgClass"/>
	  		<h:outputText  value="#{msgs.authnavbar_add_content}"/>
		</h:commandLink>
	</h:column>
	<h:column>
		<h:commandLink id="BringUpSubSectionAction" action="#{listAuthModulesPage.BringSubSectionLevelUpAction}">
	  	  <h:graphicImage id="indentLeftImg" value="images/indent_left.png" styleClass="AuthImgClass"/>
	  	  <h:outputText  value="#{msgs.authnavbar_left}"/>
	  	</h:commandLink>
	</h:column>
	<h:column>
	  <h:commandLink id="CreateSubSectionAction" action="#{listAuthModulesPage.CreateSubSectionAction}">
	  	<h:graphicImage id="indentRightImg" value="images/indent_right.png" styleClass="AuthImgClass"/>
	  	<h:outputText  value="#{msgs.authnavbar_right}"/>
	  </h:commandLink>
	</h:column>
	<h:column>
	  <h:commandLink id="sortgoto" action="#{sortModuleSectionPage.goToSortModules}">
	    <h:graphicImage id="MoveUpImg" value="images/document_exchange.gif" styleClass="AuthImgClass"/>   
	   <h:outputText id="sort" value="#{msgs.modules_author_manage_sort}" />
  	</h:commandLink>
  	</h:column>
  	<h:column>
	<h:commandLink id="moveAction" action="#{listAuthModulesPage.MoveSectionAction}">
	    <h:graphicImage id="moveImg" value="images/page_go.png" styleClass="AuthImgClass"/>
	  	<h:outputText  value="#{msgs.authnavbar_move_section}"/>
	  </h:commandLink>
	</h:column>
	<h:column>
		<h:commandLink id="delAction" action="#{listAuthModulesPage.deleteAction}">
	        <h:graphicImage id="deleteImg" value="images/delete.gif" styleClass="AuthImgClass"/>
	        <h:outputText  id="del" value="#{msgs.authnavbar_delete}"></h:outputText>
	     </h:commandLink>
	</h:column>
	<h:column>
		<h:commandLink id="inactiveAction" action="#{listAuthModulesPage.InactivateAction}">
	  	<h:graphicImage id="inactiveImg" value="images/folder_out.gif" styleClass="AuthImgClass"/>
	  	<h:outputText  value="#{msgs.authnavbar_make_inactive}"/>
	  </h:commandLink>
	</h:column>
	
	
</h:panelGrid>
<!-- End code to display images horizontally. -->
