	<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/edit_sec_resourcePropertiesPanel.jsp $
 * $Id: edit_sec_resourcePropertiesPanel.jsp 67453 2010-04-30 23:55:54Z rashmi@etudes.org $  
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
<%@include file="accesscheck.jsp" %>

 
	   <h:panelGrid id="propertiesPanel" columns="1" width="100%" styleClass="maintabledata2">
		<h:column>
					<h:outputText id="propertiesPaneltxt" value="#{msgs.editsec_resources_proper_pan_properties}" />
					<h:outputText id="propertiesPaneltxt1" value="#{editSectionPage.secResourceName}" />
		</h:column>
	</h:panelGrid>
	<h:panelGrid id="propertiesPanel2" columns="2" width="100%" cellpadding="3" columnClasses="col1,col2" border="0">
		<h:column>
				 <h:outputText value="#{msgs.editsec_resources_proper_pan_URL}"  rendered="#{(editSectionPage.shouldRenderLink || editSectionPage.shouldRenderLTI)}" /><h:outputText value="*" styleClass="required" rendered="#{(editSectionPage.shouldRenderLink || editSectionPage.shouldRenderLTI)}"/>
		</h:column>	 
			<h:column>				
					 <h:inputText id="res_name" size="45" value="#{editSectionPage.secResourceName}" styleClass="formtext" rendered="#{(editSectionPage.shouldRenderLink || editSectionPage.shouldRenderLTI)}" />		
		</h:column>					                  
		<h:column>
					 <h:outputText value="#{msgs.editsec_resources_proper_pan_description}" rendered="#{ !editSectionPage.shouldRenderEditor}"  />											
		</h:column>	
		<h:column>		
			<h:inputTextarea id="res_desc" cols="45" rows="3" value="#{editSectionPage.secResourceDescription}" styleClass="formtext"  
			rendered="#{!editSectionPage.shouldRenderEditor}"  />																			
		</h:column>
						<!-- copyright license code -->
				</h:panelGrid>


    <f:subview id="LicenseForm" rendered="#{!editSectionPage.shouldRenderNotype}">
			<jsp:include page="licenseform.jsp"/>  
	</f:subview>
		
			        <!-- end license code -->		
