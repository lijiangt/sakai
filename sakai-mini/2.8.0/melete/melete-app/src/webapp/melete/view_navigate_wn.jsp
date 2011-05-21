<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/view_navigate_wn.jsp $
 * $Id: view_navigate_wn.jsp 56408 2008-12-19 21:16:52Z rashmi@etudes.org $  
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

<h:panelGrid id="navWhatsNextItems" columns="5"  style=" border-width:medium; border-color: #E2E4E8">
	<h:column>
     	<h:commandLink id="prevItem" action="#{viewNextStepsPage.goPrevItem}" immediate="true">
			<h:outputText id="prevItemMsg"  value="#{msgs.view_navigate_ws_prev}"/>	
			 <f:param name="prevmodid" value="#{viewNextStepsPage.prevModId}" />
			 <f:param name="prevsecid" value="#{viewNextStepsPage.prevSecId}" />
     	</h:commandLink>
	</h:column>
		<h:column>
				<h:outputText id="seperatorMsg1" value=" | "/>	
		</h:column>
	<h:column>
	<h:commandLink id="TOCitem" action="#{viewNextStepsPage.goTOC}" immediate="true">
				  <h:outputText  id="TOCMsg" value="#{msgs.view_navigate_ws_TOC}"/>
			</h:commandLink>  
	</h:column>
			<h:column>
				<h:outputText id="seperatorMsg2" value=" | "/>	
		</h:column>
	<h:column>
     <h:commandLink id="nextMod" action="#{viewNextStepsPage.goNextModule}" immediate="true" rendered="#{viewNextStepsPage.moduleSeqNo < viewNextStepsPage.nextSeqNo}">
			<h:outputText  id="nextItemMsg" value="#{msgs.view_navigate_ws_next}"/>	
			 <f:param name="modseqno" value="#{viewNextStepsPage.nextSeqNo}" />
     	</h:commandLink>
   
	</h:column>
</h:panelGrid>	