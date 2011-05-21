<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/license_results_edit.jsp $
 * $Id: license_results_edit.jsp 63702 2009-09-30 21:29:05Z mallika@etudes.org $  
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
<%@include file="accesscheck.jsp" %>
<h:panelGrid id="cclicensetable" columns="1" rendered="#{!editModulePage.copyright}" >
	<h:column>
	 <h:outputText value="#{msgs.license_results_edit1}" /> 
	  <h:outputLink value="#{editModulePage.agreeResultUrl}" target="_blank"> 
		 <f:verbatim></f:verbatim>
		 <h:outputText value="#{editModulePage.agreeResult}" />
	 </h:outputLink>
	  <h:outputText value="#{msgs.license_results_edit2}" /> 	 
  </h:column>
</h:panelGrid>
<h:panelGrid id="cclicenseresultsedittable" columns="1" rendered="#{editModulePage.copyright && !editModulePage.fairuse}" >
	<h:column>
		 <h:outputText value="#{msgs.license_results_edit3} " /> 
		 <h:outputText value="#{editModulePage.agreeResultUrl}" styleClass="italics"/>
	 	  <h:outputText value="#{msgs.license_results_edit4} "/> 
	</h:column>
</h:panelGrid>

<h:panelGrid id="cclicenseresultstable1" columns="1" rendered="#{editModulePage.fairuse}" >
	<h:column>
		 <h:outputText value="#{msgs.license_results_edit5} " /> 
		  <h:outputText value="#{editModulePage.agreeResultUrl}" styleClass="italics"/>
	 	  <h:outputText value="#{msgs.license_results_edit6} " /> 	 
	
  </h:column>
</h:panelGrid>
