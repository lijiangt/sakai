<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/view_navigate.jsp $
 * $Id: view_navigate.jsp 56408 2008-12-19 21:16:52Z rashmi@etudes.org $  
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

<h:panelGrid id="navSectionsItem" columns="5"  style=" border-width:medium; border-color: #E2E4E8">
	<h:column>
		<h:commandLink id="prevItem" action="#{viewSectionsPage.goPrevNext}" immediate="true"  rendered="#{viewSectionsPage.prevSecId != 0}">
			<h:outputText id="prevMsg" value="#{msgs.view_navigate_prev}"/>	
			<f:param name="modid" value="#{viewSectionsPage.moduleId}" />
			<f:param name="secid" value="#{viewSectionsPage.prevSecId}" />
     	</h:commandLink>
     	<h:commandLink id="prevMod" action="#{viewSectionsPage.goPrevModule}" immediate="true"  rendered="#{viewSectionsPage.prevSecId == 0}">
			<h:outputText  id="prevMsg1" value="#{msgs.view_navigate_prev}"/>	
			<f:param name="modid" value="#{viewSectionsPage.moduleId}" />
			<f:param name="secid" value="#{viewSectionsPage.prevSecId}" />
     	</h:commandLink>
	</h:column>
		<h:column>
				<h:outputText id="seperatorMsg1" value=" | "/>	
		</h:column>
	<h:column>
	<h:commandLink id="TOCitem" action="#{viewSectionsPage.goTOC}" immediate="true">
		  <h:outputText  id="TOCMsg" value="#{msgs.view_navigate_TOC}"/>
	</h:commandLink>    
	</h:column>
			<h:column>
				<h:outputText id="seperatorMsg2" value=" | "/>	
		</h:column>
	<h:column>
		<h:commandLink id="nextItem" action="#{viewSectionsPage.goPrevNext}" immediate="true" rendered="#{viewSectionsPage.nextSecId != 0}">
		  <h:outputText id="nextMsg"  value="#{msgs.view_navigate_next}"></h:outputText>
		    <f:param name="modid" value="#{viewSectionsPage.moduleId}" />
            <f:param name="secid" value="#{viewSectionsPage.nextSecId}" />
     </h:commandLink>
      <h:commandLink id="whatsNext" action="#{viewSectionsPage.goWhatsNext}" immediate="true" rendered="#{((viewSectionsPage.module != null && viewSectionsPage.module.whatsNext != viewSectionsPage.nullString)&&(viewSectionsPage.module != null && viewSectionsPage.module.whatsNext != viewSectionsPage.emptyString)&&(viewSectionsPage.nextSecId == 0))}">
		  <h:outputText  id="whatsNextMsg" value="#{msgs.view_navigate_next2}"></h:outputText>
		    <f:param name="modseqno" value="#{viewSectionsPage.moduleSeqNo}" />
     </h:commandLink>   
    <h:commandLink id="nextMod" action="#{viewSectionsPage.goNextModule}" immediate="true" rendered="#{(((viewSectionsPage.module != null && viewSectionsPage.module.whatsNext == viewSectionsPage.nullString)||(viewSectionsPage.module != null && viewSectionsPage.module.whatsNext == viewSectionsPage.emptyString))&&(viewSectionsPage.nextSecId == 0)&&(viewSectionsPage.moduleSeqNo < viewSectionsPage.nextSeqNo))}">
		  <h:outputText  id="nextModMsg" value="#{msgs.view_navigate_next3}"></h:outputText>
		    <f:param name="modseqno" value="#{viewSectionsPage.nextSeqNo}" />
     </h:commandLink>     
	</h:column>
</h:panelGrid>	