<%@ page import="org.etudes.tool.melete.MeleteSiteAndUserInfo"%>
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-app/src/webapp/melete/topnavbar.jsp $
 * $Id: topnavbar.jsp 67904 2010-05-28 22:44:17Z rashmi@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008, 2009,2010 Etudes, Inc.
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
<%@ taglib uri="http://sakaiproject.org/jsf/sakai" prefix="sakai" %>

<sakai:tool_bar>
  <sakai:tool_bar_item disabled="#{!navPage.shouldRenderView}" immediate="true" value="#{msgs.topnavbar_view}" action="#{navPage.viewAction}"/>	 
  
  <sakai:tool_bar_item disabled="#{!navPage.shouldRenderAuthor}" immediate="true" value="#{msgs.topnavbar_author}" action="#{navPage.authAction}" rendered="#{navPage.isInstructor}" />
    
  <sakai:tool_bar_item disabled="#{!navPage.shouldRenderManage}" immediate="true" value="#{msgs.topnavbar_manage}" action="#{navPage.manageAction}" rendered="#{navPage.isInstructor}" />
  
  <sakai:tool_bar_item disabled="#{!navPage.shouldRenderPreferences}" immediate="true" value="#{msgs.topnavbar_preferences}" action="#{navPage.PreferenceAction}"/>
</sakai:tool_bar>
<!-- End code to display images horizontally. -->




