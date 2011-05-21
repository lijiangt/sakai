<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/view_module.jsp $
 * $Id: view_module.jsp 69284 2010-07-19 21:49:38Z mallika@etudes.org $  
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
<sakai:view title="Modules: Student View" toolCssHref="rtbc004.css">
<%@include file="meleterightscheck.jsp" %>
<script type="text/javascript" language="javascript" src="js/sharedscripts.js"></script>
<h:form id="viewmoduleform">
 <f:subview id="top">
  	<jsp:include page="topnavbar.jsp?myMode=View"/>
  </f:subview>
  <p></p>
	<table class="maintableCollapseWithNoBorder" >

<!--Page Content-->
		 <tr>
			<td align="center">			
			<!-- The getmdbean method correctly determines the prev and next seq nos in the backing bean -->
			<!-- The hidden field below has been added just to get the getmdbean method to execute first -->
		    <h:inputHidden id="hacktitle" value="#{viewModulesPage.mdbean.module.title}"/>
			<f:subview id="topmod">
			<jsp:include page="view_navigate_mod.jsp"/>
			</f:subview>
			</td>
		</tr>      
<tr>
<td align="right">
<h:commandLink id="myBookmarksLink" action="#{bookmarkPage.gotoMyBookmarks}">
 <h:graphicImage id="mybook_gif" value="images/my-bookmarks.png" alt="" styleClass="AuthImgClass" />
 <h:outputText id="mybks" value="#{msgs.my_bookmarks}" />									
 <f:param name="fromPage" value="view_module" />
</h:commandLink>				  
</td>
</tr>			               
<tr>
<td>
	<h:panelGrid id="moduleContentGrid" columns="2" width="100%" columnClasses="style6,right" border="0" cellpadding="5" rendered="#{viewModulesPage.mdbean != null && viewModulesPage.mdbean.module != null}">
		<h:column>
			<h:outputText id="mod_seq" value="#{viewModulesPage.mdbean.cmod.seqNo}. " styleClass="bold" rendered="#{viewModulesPage.autonumber}"/>
			<h:outputText id="title" value="#{viewModulesPage.mdbean.module.title}" styleClass="bold" ></h:outputText>
		</h:column>
		<h:column rendered="#{viewModulesPage.printable}">
			<h:outputLink id="printModuleLink" value="view_module" onclick="OpenPrintWindow(#{viewModulesPage.mdbean.moduleId},'Melete Print Window');" rendered="#{viewModulesPage.printable}">
		    	<f:param id="printmoduleId" name="printModuleId" value="#{viewModulesPage.mdbean.moduleId}" />
	  			<h:graphicImage id="printImgLink" value="images/printer.png" alt="#{msgs.list_auth_modules_alt_print}" title="#{msgs.list_auth_modules_alt_print}" styleClass="AuthImgClass"/>
		 	</h:outputLink>
		</h:column>
	</h:panelGrid>
	<h:panelGrid id="moduleContentGrid1" columns="1" width="97%" border="0" cellpadding="3" rendered="#{viewModulesPage.mdbean != null && viewModulesPage.mdbean.module != null}">
		<h:column>
			<h:outputText id="description" value="#{viewModulesPage.mdbean.module.description}"  rendered="#{((viewModulesPage.mdbean.module.description != viewModulesPage.nullString)&&(viewModulesPage.mdbean.module.description != viewModulesPage.emptyString))}" />
		</h:column>
	<h:column>
		<h:outputText id="secs" value="#{msgs.view_module_student_content_section}" ></h:outputText>  
		<h:dataTable id="tablesec"  value="#{viewModulesPage.mdbean.sectionBeans}" var="sectionBean" rowClasses="#{viewModulesPage.mdbean.rowClasses}" rendered="#{viewModulesPage.sectionSize > 0}" styleClass="SectionTableClass">
           	  <h:column>
        		  <h:graphicImage id="bul_gif" value="images/bullet_black.gif" rendered="#{sectionBean.section.title != viewModulesPage.nullString && !viewModulesPage.autonumber}"/>
		          <h:commandLink id="viewSectionEditor"  action="#{viewModulesPage.viewSection}" rendered="#{sectionBean.section.title != viewModulesPage.nullString}" immediate="true">
				      <h:outputText id="sec_seq" value="#{sectionBean.displaySequence}. " rendered="#{viewModulesPage.autonumber}"/>
					  <h:outputText id="sectitleEditor" value="#{sectionBean.section.title}" > </h:outputText>
				  </h:commandLink>
			</h:column>
 		 </h:dataTable>        
	</h:column>
	<h:column rendered="#{viewModulesPage.mdbean.module.whatsNext != viewModulesPage.nullString}">
		<h:outputText value="#{msgs.view_module_student_whats_next}" styleClass="bold style7"></h:outputText>		
	</h:column>
	<h:column rendered="#{viewModulesPage.mdbean.module.whatsNext != viewModulesPage.nullString}">
		<h:outputText id="whatsnext" value="#{viewModulesPage.mdbean.module.whatsNext}"/>
	</h:column>	
	</h:panelGrid>	
</td>
</tr>             

<tr>
	<td align="center">
		<f:subview id="bottommod">
			<jsp:include page="view_navigate_mod.jsp"/>
		</f:subview>	  
		
	</td>	
		</tr>
		<tr><td class="maintabledata5">&nbsp;   </td></tr>    
		</table>

<!--End Content-->
</h:form>
</sakai:view>
</f:view>

 
