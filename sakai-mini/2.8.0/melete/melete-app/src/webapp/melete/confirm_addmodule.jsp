<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/confirm_addmodule.jsp $
 * $Id: confirm_addmodule.jsp 70579 2010-10-05 21:18:31Z rashmi@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008,2009,2010 Etudes, Inc.
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
<sakai:view title="Modules: Add Module Confirmation" toolCssHref="rtbc004.css">
<%@include file="accesscheck.jsp" %>

 <h:form id="AddModuleConfirmForm">
	<f:subview id="top">
		<jsp:include page="topnavbar.jsp"/> 
	</f:subview>
	<div class="meletePortletToolBarMessage"><img src="images/check.gif" alt="" width="16" height="16" align="absbottom" border="0"> <h:outputText value="#{msgs.confirm_addmodule_confirming_module_addition}" /> </div>
    <table class="maintableCollapseWithBorder">
        <tr>
          <td class="maintabledata3">

		  <table width="100%" cellpadding="0" cellspacing="0">
		  	<tr><td  height="20" class="maintabledata5">&nbsp;</td></tr>
              <tr>
                <td width="100%">
                    <table class="deleteConfirmTable" border="1">
                    <tr class="maintabledata3">
                      <td valign="top"><img src="images/right_check.gif" width="24" height="24" align="absbottom" alt="#{msgs.confirm_addmodule_confirmation_signal}" border="0"></td>
                      <td align="left"><h:outputText value="#{msgs.confirm_addmodule_you_have_succes}" /><br>
                        <br><h:outputText value="#{addModulePage.module.title}" styleClass="bold"  />
                        <p align="left"><h:outputText value="#{msgs.confirm_addmodule_continue_adding}" /></p></td>
                    </tr>
                  </table></td>
              </tr>			 
            </table>
            <div class="actionBar" align="left">				
				<h:commandButton id="sectionButton"  action="#{addModulePage.addContentSections}" rendered="#{addModulePage.success}" value="#{msgs.im_add_content_sections}" tabindex="" accesskey="#{msgs.add_access}" title="#{msgs.im_add_content_sections_text}" styleClass="BottomImgAdd" />
				<h:commandButton id="returnButton"  action="#{addModulePage.backToModules}" value="#{msgs.im_done}" tabindex="" accesskey="#{msgs.done_access}" title="#{msgs.im_done_text}" styleClass="BottomImgReturn" />
			</div>
          </td>
        </tr>
      </table>
</h:form>
  <!-- This Ends the Main Text Area -->
</sakai:view>
</f:view>

