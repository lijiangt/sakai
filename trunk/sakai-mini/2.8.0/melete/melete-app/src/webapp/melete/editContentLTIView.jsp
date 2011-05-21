<!--
 ***********************************************************************************
 *
 * Copyright (c) 2008,2009,2010 Etudes, Inc.
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

<h:panelGrid id="LinkPanel" columns="2" columnClasses="col1,col2" width="100%" border="0">
	<h:column>
  		<h:outputText id="editlinkText1" value="#{msgs.editcontentltiview_link1}"/>
	</h:column>
	<h:column>					
		<h:commandLink id="serverViewButton"  action="#{editSectionPage.gotoServerLTIView}" styleClass="a1">
			<h:graphicImage id="replaceImg2" value="images/replace2.gif" styleClass="AuthImgClass"/>
			<h:outputText value="#{msgs.editcontentltiview_replace}"/>
                </h:commandLink>		
  </h:column>
  <h:column/>
   <h:column>
   		<h:outputLink id="showResourceLTI" value="#{editSectionPage.currLTIUrl}" target="_blank" title="Section Resource" styleClass="a1" rendered="#{editSectionPage.displayCurrLTI != null}">	  
  			<h:outputText id="editltiText3" value="#{editSectionPage.displayCurrLTI}" />
  		</h:outputLink>	
		<h:outputText id="editltiText4" value="#{msgs.editcontentltiview_noURL}" rendered="#{editSectionPage.displayCurrLTI == null}" styleClass="bold"/>
   </h:column>
  <h:column/>
   <h:column>     	
             <h:selectBooleanCheckbox id="windowopen" title="openWindow" value="#{editSectionPage.section.openWindow}" >
		  </h:selectBooleanCheckbox>
		  <h:outputText id="editltiText_8" value="#{msgs.editcontentlinkserverview_openwindow}" />
        </h:column>   				  
</h:panelGrid>	
