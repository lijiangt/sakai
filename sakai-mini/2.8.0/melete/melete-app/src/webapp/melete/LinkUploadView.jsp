<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/LinkUploadView.jsp $
 * $Id: LinkUploadView.jsp 67438 2010-04-29 22:18:36Z rashmi@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008, 2009, 2010 Etudes, Inc.
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
<sakai:view title="Modules: Link Upload" toolCssHref="rtbc004.css">
<%@include file="accesscheck.jsp" %>

 <h:form id="LinkUploadForm" enctype="multipart/form-data" >
 <!-- top nav bar -->
	<f:subview id="top">
			<jsp:include page="topnavbar.jsp"/> 
	</f:subview>
    <div class="meletePortletToolBarMessage"><img src="images/manage_content.png" alt="" width="16" height="16" align="absbottom" border="0"><h:outputText value="#{msgs.link_upload_title}" /></div>
    <table class="maintableCollapseWithBorder">
        <tr>
        <td class="maintabledata3">
          <table class="maintableCollapseWithNoBorder" id="AutoNumber1">
		  	<tr>
		  		<td height="20" class="maintabledata5"><h:outputText id="t1_1" value="#{msgs.manage_content_new_item}" styleClass="tableheader2"/> 
		  		</td>
		  	</tr>
		  
            <tr>
            	<td colspan="2">
            	<h:inputHidden id="numitems" value="#{addResourcesPage.numberItems}" />
              		<h:outputText id="t2" value="#{msgs.manage_content_number_links}"/>
                	
						  <h:selectOneMenu id="number" value="#{addResourcesPage.numberItems}" valueChangeListener="#{addResourcesPage.updateNumber}" onchange="this.form.submit();"  >
						    <f:selectItem itemValue="1" itemLabel="#{msgs.manage_content_one}"/>	
							<f:selectItem itemValue="2" itemLabel="#{msgs.manage_content_two}"/>	
							<f:selectItem itemValue="3" itemLabel="#{msgs.manage_content_three}"/>	
							<f:selectItem itemValue="4" itemLabel="#{msgs.manage_content_four}"/>
							<f:selectItem itemValue="5" itemLabel="#{msgs.manage_content_five}"/>	
							<f:selectItem itemValue="6" itemLabel="#{msgs.manage_content_six}"/>
							<f:selectItem itemValue="7" itemLabel="#{msgs.manage_content_seven}"/>	
							<f:selectItem itemValue="8" itemLabel="#{msgs.manage_content_eight}"/>
							<f:selectItem itemValue="9" itemLabel="#{msgs.manage_content_nine}"/>	
							<f:selectItem itemValue="10" itemLabel="#{msgs.manage_content_ten}"/>
						 </h:selectOneMenu>
				</td>	
			</tr>
			<tr>
			  <td>
			  <br>
			  </td>
			</tr>	
			
		  	<tr>
			  <td>
			  <br>
			  </td>
			</tr>	
				<tr>
		  	  <td colspan="2">
		  	<h:messages showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
		  	  </td>
		  	</tr>  
          <tr>
		    <td colspan="2">
	
			<h:dataTable id="utTable"  value="#{addResourcesPage.utList}" var="ut" border="1" cellpadding="1" cellspacing="0" styleClass="maintabledata1"   width="80%" binding="#{addResourcesPage.table}">
			 
			   <h:column>
			   <h:outputText id="brvalmsg" escape="false" value="<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" /><h:message for="url" id="errurlmsg" showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
		 	   <h:outputText id="brval0" escape="false" value="<BR>&nbsp;&nbsp;" />
			   <h:graphicImage id="contenttype_gif" alt="#{msgs.link_upload_view_content}" title="#{msgs.link_upload_view_content}" value="images/url.gif" styleClass="ExpClass"/>
			    <h:outputText escape="false" value="&nbsp;*&nbsp;" styleClass="required"/>
		       <h:outputText id="urltext" escape="false" value="#{msgs.link_upload_view_url}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />
				 <h:message for="url" id="errurlmsg" showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>                
                <h:inputText id="url" size="40" value="#{ut.url}" />
                <h:outputText id="spc" escape="false" value="&nbsp;" />
                 <h:commandLink id="removeLink"   actionListener="#{addResourcesPage.removeLink}" action="#{addResourcesPage.redirectToLinkUpload}" >  
                   <h:graphicImage id="remove_gif" alt="" value="images/remove_item.png" styleClass="ExpClass"/>
                    <h:outputText 	id="remove_text" value="#{msgs.link_upload_remove_item}"/>		
                  </h:commandLink>
                 <h:outputText id="brvaltitle" escape="false" value="<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />  
                <h:message for="title" id="errtitlemsg" showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
                <h:outputText id="brval" escape="false" value="<BR>" />
                 <h:outputText escape="false" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;" styleClass="required"/>
                <h:outputText id="titletext" escape="false" value="#{msgs.link_upload_view_title}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>
               
                <h:inputText id="title" size="40" value="#{ut.title}" />
                <h:outputText id="brval1" escape="false" value="<BR><BR>" />
              </h:column>  
             
	        </h:dataTable>
	        </td>
	     </tr>	
         <tr>
	       <td colspan="2">
	       <span class="required">* Required</span>
	       <br>
	       <br>
	       </td>
	     </tr>	     
	    </table>
		   <div class="actionBar" align="left">
	        <h:commandButton id="continueButton" action="#{addResourcesPage.addItems}" value="#{msgs.im_continue}" onclick="clearmessage()" accesskey="#{msgs.continue_access}" title="#{msgs.im_continue_text}" styleClass="BottomImgContinue"/>
	        <h:commandButton id="cancelButton" immediate="true" action="#{addResourcesPage.cancel}" value="#{msgs.im_cancel}" onclick="clearmessage()" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>			                          
	      </div>
	   </td>
	  </tr>						
	</table>	
</h:form>
<!-- This Ends the Main Text Area -->
</sakai:view>
</f:view>




