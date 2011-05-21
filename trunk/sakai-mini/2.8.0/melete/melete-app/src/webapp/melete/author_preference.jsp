<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/author_preference.jsp $
 * $Id: author_preference.jsp 70367 2010-09-22 18:33:20Z rashmi@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008,2010 Etudes, Inc.
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
<sakai:view title="Modules: User Preference" toolCssHref="rtbc004.css">
<%@include file="accesscheck.jsp" %>

 <h:form id="UserPreferenceForm">
<!-- top nav bar -->
	<f:subview id="top">
			<jsp:include page="topnavbar.jsp?myMode=Preferences"/> 
	</f:subview>
   <div class="meletePortletToolBarMessage"><img src="images/user1_preferences.gif" alt="" width="16" height="16" align="absbottom" border="0"><h:outputText value="#{msgs.author_preference_user_preference}" /></div>
	
	<h:messages showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>	  
    <table class="maintableCollapseWithBorder">          
        <tr>
          <td>
          	<table class="maintableCollapseWithNoBorder">          
    		   <tr>
       			  <td height="20" class="maintabledata5">          	
          			<h:outputText id="t1_1" value="#{msgs.author_preference_global_preference}" styleClass="bold"/>  
          	 	  </td>
          	    </tr>  
          	    <tr>
          	   	 <td>
					<h:panelGrid styleClass="authorPrefTable" rendered="#{authorPreferences.shouldRenderEditorPanel}">
                	 <h:column>
                		<h:outputText id="t1" value="#{msgs.author_preference_editor_select}" styleClass="bold"/>
                	</h:column>
                	 <h:column>
						<h:selectOneRadio value="#{authorPreferences.userEditor}" layout="pageDirection">
							<f:selectItems value="#{authorPreferences.availableEditors}" />
						</h:selectOneRadio>	
					</h:column>
				   </h:panelGrid>		
				   <h:panelGrid id="collapsePrefPanel" columns="1" styleClass="authorPrefTable">
						<h:column>
						 	<h:outputText id="t2" value="#{msgs.author_preference_view_select}"  styleClass="bold"/>      
						 </h:column>
		               	 <h:column>
							<h:selectOneRadio value="#{authorPreferences.userView}" layout="pageDirection">
								<f:selectItem itemLabel="#{msgs.author_preference_Expanded}" itemValue="true" />
								<f:selectItem itemLabel="#{msgs.author_preference_Collapsed}" itemValue="false"/>
							</h:selectOneRadio>	
						</h:column>
					 </h:panelGrid>
					<h:panelGrid id="LTIPrefPanel" columns="1" styleClass="authorPrefTable">
						<h:column>
						 	<h:outputText id="LTI1" value="#{msgs.author_preference_LTI_select}"  styleClass="bold"/>      
						 </h:column>
		               	 <h:column>
							<h:selectOneRadio value="#{authorPreferences.showLTI}" layout="pageDirection">
								<f:selectItem itemLabel="#{msgs.author_preference_yes}" itemValue="true" />
								<f:selectItem itemLabel="#{msgs.author_preference_no}" itemValue="false"/>
							</h:selectOneRadio>	
						</h:column>
					
		                <h:column>
						<jsp:include page="licenseform.jsp"/>						 						 	
						  <h:commandLink id="allLicenseButton"  action="#{authorPreferences.changeAllLicense}" >
							<h:graphicImage id="replaceImg2" value="images/replace2.gif" styleClass="AuthImgClass"/>
							<h:outputText value="#{msgs.overwriteLicenseMsg}"/>
				          </h:commandLink>
				       </h:column> 	
					 </h:panelGrid>
          	     </td>
          	    </tr> 
          	    <tr>
					<td height="20" class="maintabledata5">
						<h:outputText id="t3_1" value="#{msgs.author_preference_site_preference}"  styleClass="bold"/>  
					</td>
				</tr>
				<tr>
				  <td>
				    <h:panelGrid styleClass="authorPrefTable">
                	 <h:column>
                		<h:outputText id="t3" value="#{msgs.author_preference_material_printable}"  styleClass="bold"/>
                	</h:column>
                	 <h:column>
						<h:selectOneRadio value="#{authorPreferences.materialPrintable}" layout="pageDirection">
								<f:selectItem itemLabel="#{msgs.author_preference_yes}" itemValue="true" />
								<f:selectItem itemLabel="#{msgs.author_preference_no}" itemValue="false"/>
						</h:selectOneRadio>		
					</h:column>
				   </h:panelGrid>	
				   <h:panelGrid styleClass="authorPrefTable">
                	 <h:column>
                		<h:outputText id="t4" value="#{msgs.author_preference_autonumber}"  styleClass="bold"/>
                	</h:column>
                	 <h:column>
						<h:selectOneRadio value="#{authorPreferences.materialAutonumber}" layout="pageDirection">
								<f:selectItem itemLabel="#{msgs.author_preference_yes}" itemValue="true" />
								<f:selectItem itemLabel="#{msgs.author_preference_no}" itemValue="false"/>
						</h:selectOneRadio>		
					</h:column>
				   </h:panelGrid>	
				  </td>
				</tr>				       	    
          	   </table> 		
               <div class="actionBar" align="left">	
        	        <h:commandButton action="#{authorPreferences.setUserChoice}" value="#{msgs.im_set}" accesskey="#{msgs.set_access}" title="#{msgs.im_set_text}" styleClass="BottomImgSet"/>
				</div>	
		   </td>
	   </tr>		
     </table>
	</h:form>
  <!-- This Ends the Main Text Area -->
</sakai:view>
</f:view>

