<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/view_navigate_mod.jsp $
 * $Id: view_navigate_mod.jsp 56408 2008-12-19 21:16:52Z rashmi@etudes.org $  
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

<h:panelGrid id="navModuleItems" columns="5"  style=" border-width:medium; border-color: #E2E4E8">
	<h:column>
     	<h:commandLink id="prevItem" action="#{viewModulesPage.goPrevSection}" immediate="true" rendered="#{((viewModulesPage.prevMdbean != viewModulesPage.nullMdbean)&&((viewModulesPage.prevMdbean.module.whatsNext == viewModulesPage.nullString)||(viewModulesPage.prevMdbean.module.whatsNext == viewModulesPage.emptyString))&&(viewModulesPage.moduleSeqNo > 1)&&(viewModulesPage.prevSectionSize > 0))}">
			<h:outputText  id="prevItemMsg" value="#{msgs.view_navigate_mod_prev}"/>	
     	</h:commandLink>
     	<h:commandLink id="goPrevWhatsNext" action="#{viewModulesPage.goPrevWhatsNext}" immediate="true" rendered="#{((viewModulesPage.prevMdbean != viewModulesPage.nullMdbean)&&(viewModulesPage.prevMdbean.module.whatsNext != viewModulesPage.nullString)&&(viewModulesPage.prevMdbean.module.whatsNext != viewModulesPage.emptyString)&&(viewModulesPage.moduleSeqNo > 1))}">
			<h:outputText  id="prevItemMsg2" value="#{msgs.view_navigate_mod_prev2}"/>	
     	</h:commandLink>
     	<h:commandLink id="prevMod" action="#{viewModulesPage.goPrevNext}" immediate="true" rendered="#{((viewModulesPage.prevMdbean != viewModulesPage.nullMdbean)&&((viewModulesPage.prevMdbean.module.whatsNext == viewModulesPage.nullString)||(viewModulesPage.prevMdbean.module.whatsNext == viewModulesPage.emptyString))&&(viewModulesPage.moduleSeqNo > 1)&&(viewModulesPage.prevSectionSize == 0))}">
			<h:outputText  id="prevItemMsg3" value="#{msgs.view_navigate_mod_prev3}"/>	
			 <f:param name="modseqno" value="#{viewModulesPage.prevSeqNo}" />
     	</h:commandLink>
	</h:column>
		<h:column>
				<h:outputText id="seperatorMsg1" value=" | "/>	
		</h:column>
	<h:column>
	<h:commandLink id="TOCitem" action="#{viewModulesPage.goTOC}" immediate="true">
				  <h:outputText id="TOCMsg" value="#{msgs.view_navigate_mod_TOC}"/>
			</h:commandLink>  
	</h:column>
			<h:column>
				<h:outputText id="seperatorMsg2" value=" | "/>	
		</h:column>
	<h:column>
		<h:commandLink id="nextItem" action="#{viewModulesPage.goNextSection}" immediate="true" rendered="#{(viewModulesPage.sectionSize > 0)}">
		  <h:outputText  id="nextItemMsg1" value="#{msgs.view_navigate_mod_next}"></h:outputText>
     </h:commandLink>
      <h:commandLink id="whatsNext" action="#{viewModulesPage.goWhatsNext}" immediate="true" rendered="#{((viewModulesPage.mdbean.module.whatsNext != viewModulesPage.nullString)&&(viewModulesPage.mdbean.module.whatsNext != viewModulesPage.emptyString)&&(viewModulesPage.sectionSize == 0))}">
		  <h:outputText  id="nextItemMsg2" value="#{msgs.view_navigate_mod_next2}"></h:outputText>
		   <f:param name="modseqno" value="#{viewModulesPage.moduleSeqNo}" />
     </h:commandLink>   
     <h:commandLink id="nextMod" action="#{viewModulesPage.goPrevNext}" immediate="true" rendered="#{(((viewModulesPage.mdbean.module.whatsNext == viewModulesPage.nullString)||(viewModulesPage.mdbean.module.whatsNext == viewModulesPage.emptyString))&&(viewModulesPage.sectionSize == 0)&&(viewModulesPage.moduleSeqNo < viewModulesPage.nextSeqNo))}">
			<h:outputText  id="nextItemMsg3" value="#{msgs.view_navigate_mod_next3}"/>	
			 <f:param name="modseqno" value="#{viewModulesPage.nextSeqNo}" />
     	</h:commandLink>
   
	</h:column>
</h:panelGrid>