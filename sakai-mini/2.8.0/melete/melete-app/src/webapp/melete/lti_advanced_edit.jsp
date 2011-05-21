<!--
 ***********************************************************************************
 *
 * Copyright (c) 2008, 2009 Etudes, Inc.
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
<h:panelGrid width="77%" border="0" columns="2" columnClasses="col1b,col2">											
<h:column>
	<h:outputText id="editLTITitle" value="#{msgs.addmodulesections_lti_item_title}" />
	<h:outputText value="  "/>
	<h:outputText value="*" styleClass="required"/>
</h:column>
<h:column>
	<h:inputText id="LTI_title" value="#{editSectionPage.newURLTitle}" size="40" />
</h:column>
<h:column>
	<h:outputText id="editLTIText_9" value="#{msgs.addmodulesections_lti_descriptor_1}"/>
	<h:outputText value="  "/>
	<h:outputText value="*" styleClass="required"/>
</h:column>
<h:column>
	<h:inputTextarea id="LTI_descriptor" value="#{editSectionPage.LTIDescriptor}" cols="60" rows="20" /> 
</h:column>
</h:panelGrid>
<h:outputText id="editLTIText_9-1" value="#{msgs.addmodulesections_lti_descriptor_2}" styleClass="italics"/>