<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-app/src/webapp/melete/delete_module.jsp $
 * $Id: delete_module.jsp 68182 2010-06-15 20:18:18Z mallika@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2010 Etudes, Inc.
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
<sakai:view title="Modules: Change License Confirmation" toolCssHref="rtbc004.css">
<%@include file="accesscheck.jsp" %>

 <h:form id="changeLicenseForm">
	<f:subview id="top">
		<jsp:include page="topnavbar.jsp"/> 
	</f:subview>
	  <div class="meletePortletToolBarMessage">
	  	<img src="images/user1_preferences.gif" alt="" width="16" height="16" align="absbottom" border="0">	  	
	  	<h:outputText value="#{msgs.confirm_license_caption}"/>
	 </div>
      <!-- This Begins the Main Text Area -->
      <h:messages id="changeLicenseError" layout="table" showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
  <table class="maintableCollapseWithBorder">
  <tr>
   <td width="100%">
      <table class="maintableCollapseWithNoBorder">
      <tr><td width="100%" height="20" class="maintabledata5"></td></tr>
        <tr>
          <td>
            <h:outputText value="#{msgs.confirm_license_1}" />
           </td>
	     </tr>
	     <tr>
		   <td align="right">
             <table class="deleteConfirmTable" width="75%" >
	          <tr>
		          <td>
		            <h:outputText id="lic1" value="#{msgs.license_info_copyright}"  rendered="#{authorPreferences.displayLicenseCode == 1}" styleClass="bold"/>
		          	<h:outputText id="lic2" value="#{msgs.license_info_public_domain}"  rendered="#{authorPreferences.displayLicenseCode == 2}" styleClass="bold"/>
		          	<h:outputText id="lic3" value="#{msgs.license_info_creative_commons}"  rendered="#{authorPreferences.displayLicenseCode == 3}" styleClass="bold"/>
			          	<h:outputText id="lic3-1" value="#{msgs.confirm_license_cc_allowCmrcl}"  rendered="#{authorPreferences.displayLicenseCode == 3 && authorPreferences.displayAllowCmrcl}" />
			          	<h:outputText id="lic3-1-1" value="#{msgs.confirm_license_cc_NoCmrcl}"  rendered="#{authorPreferences.displayLicenseCode == 3 && !authorPreferences.displayAllowCmrcl}" />
			          	<h:outputText id="lic3-2" value="#{msgs.confirm_license_cc_allowMod}"  rendered="#{authorPreferences.displayLicenseCode == 3 && authorPreferences.displayAllowMod == 2}" />
						<h:outputText id="lic3-2-1" value="#{msgs.confirm_license_cc_shareMod}"  rendered="#{authorPreferences.displayLicenseCode == 3 && authorPreferences.displayAllowMod == 1}" />
						<h:outputText id="lic3-2-2" value="#{msgs.confirm_license_cc_NoMod}"  rendered="#{authorPreferences.displayLicenseCode == 3 && authorPreferences.displayAllowMod == 0}" />
					<h:outputText id="lic4" value="#{msgs.license_info_fairuse}"  rendered="#{authorPreferences.displayLicenseCode == 4}" styleClass="bold"/>
		          </td>
	          </tr>
	    	  <tr>
		          <td>
	   				<h:outputText value="#{msgs.licenseform_cclicense_form_lic_holder2}" styleClass="bold"/><h:outputText value=": " styleClass="bold"/><h:outputText id="owner" value="#{authorPreferences.displayOwner}" />
	   			 </td>
	          </tr>
	    	  <tr>
		         <td>
	   				<h:outputText value="#{msgs.licenseform_cclicense_form_lic_year2}" styleClass="bold"/><h:outputText value=": " styleClass="bold"/><h:outputText id="year" value="#{authorPreferences.displayYear}" />
				 </td>
	          </tr>
	         </table>
	       </td>
	      </tr> 
	      <tr><td>&nbsp;</td></tr> 
    	  <tr>
	          <td>	                  
					<img src="images/Warning.gif" alt="" width="16" height="16" align="absbottom" border="0">
					<h:outputText value="#{msgs.confirm_license_disclaimer}" /> <h:outputText value="#{msgs.confirm_license_disclaimer_1}" styleClass="bold"/>
					<h:outputText value="#{msgs.confirm_license_disclaimer_2}" /> <h:outputText value="#{msgs.confirm_license_disclaimer_3}" styleClass="bold" /> <h:outputText value="#{msgs.confirm_license_disclaimer_4}" />
			  </td>
            </tr>
            
          </table>
     		 <div class="actionBar" align="left"">
            	<h:commandButton id="changeButton" action="#{authorPreferences.changeLicenseAction}" value="#{msgs.im_continue}" accesskey="#{msgs.continue_access}" title="#{msgs.im_continue_text}" styleClass="BottomImgSet" />
				<h:commandButton id="cancelButton" action="#{authorPreferences.cancelLicenseAction}" value="#{msgs.im_cancel}" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>       
			  </div>
     	 </td>
        </tr>              
      </table>
	</h:form>
  <!-- This Ends the Main Text Area -->
</sakai:view>
</f:view>

