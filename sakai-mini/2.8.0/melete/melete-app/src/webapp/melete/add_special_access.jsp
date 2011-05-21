<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-app/src/webapp/melete/add_special_access.jsp $
 * $Id: add_special_access.jsp 68182 2010-06-15 20:18:18Z mallika@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2010 Etudes, Inc.
 *
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
<sakai:view title="Modules: Add Special Access" toolCssHref="rtbc004.css">
<%@include file="accesscheck.jsp" %>


<%@ page import="org.sakaiproject.util.ResourceLoader"%>

<% 
	ResourceLoader bundle = new ResourceLoader("org.etudes.tool.melete.bundle.Messages");
	String mensaje=bundle .getString("JS_date");
	
%>

<script language="JavaScript" src="js/calendar2.js"></script>
<script language="javascript">
function newWindow(newContent){
  winContent = window.open(newContent, 'nextWin', 'right=0, top=20,width=750,height=600, toolbar=no,scrollbars=yes, resizable=no') }
function showSdateCal()
{
  var string2 = "AddSpecialAccessForm:startDate";
  //alert(string2);
  var string2val = document.getElementById(string2).value;
  var dt;
    if((null == string2val) || (string2val.length == 0)) dt = new Date();
  else dt = new Date(document.getElementById(string2).value);
  
   if (!isNaN(dt))
  { 
    var cal2 = new calendar2(document.getElementById(string2));
    cal2.popup();
    document.getElementById(string2).select();
  }
  else
  {
    alert('<%=mensaje%>');
     document.getElementById(string2).select();
  }
}
function showEdateCal()
{
  var string2 = "AddSpecialAccessForm:endDate";
  //alert(string2);
  // var dt = new Date(document.getElementById(string2).value);
  var string2val = document.getElementById(string2).value;
  var dt;
    if((null == string2val) || (string2val.length == 0)) dt = new Date();
  else dt = new Date(document.getElementById(string2).value);
  
   if (!isNaN(dt))
  { 
    var cal2 = new calendar2(document.getElementById(string2));
    cal2.popup();
    document.getElementById(string2).select();
  }
  else
  {
    alert('<%=mensaje%>');
     document.getElementById(string2).select();
  }
} 
</script>

<h:form id="AddSpecialAccessForm">
	<f:subview id="top">
		<jsp:include page="topnavbar.jsp"/> 
	</f:subview>
	<div class="meletePortletToolBarMessage"><img src="images/access.png" alt="" width="16" height="16" align="absbottom"><h:outputText value="#{msgs.add_special_access}" /> </div>
    <h:outputText id="title" value="#{specialAccessPage.module.title}"/>
    <h:messages id="addspecialaccesserror" layout="table" showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
	
	<table id="AutoNumber1" class="maintableCollapseWithBorder">
       <tr>
         <td>
         	<table class="maintableCollapseWithNoBorder" >
         	  <tr>
      			<td colspan="2" height="20" class="maintabledata2"></td>
     		 </tr>
         	  <tr>
                <td class="col1" align="left" valign="top"> <h:outputText value="#{msgs.add_special_access_names}" />
				 </td>
				 <td>
				 <h:selectManyListbox id="usersList" value="#{specialAccessPage.users}">
								<f:selectItems value="#{specialAccessPage.usersList}" />							
				</h:selectManyListbox>	 	
				</td>
              </tr>
			   
              <tr>
                <td class="col1" align="left" valign="top"><h:outputText value="#{msgs.add_special_access_start_date}" /></td>
                <td>
					  <a name="startCalender"></a> <h:inputText id="startDate" 
                           value="#{specialAccessPage.specialAccess.startDate}" size="22" styleClass="formtext">
		        	      <f:convertDateTime  type="both" dateStyle="medium" timeStyle="short"/>
        		    </h:inputText>
		            <h:outputLink id="viewsdateCal" onclick="showSdateCal()" value="#startCalender" >
        	    		<h:graphicImage id="sdateCal"  value="images/date.png" alt="#{msgs.list_auth_modules_alt_popup_cal}" title="#{msgs.list_auth_modules_alt_popup_cal}" styleClass="DatePickerClass"/>
           			</h:outputLink>
					 </td>
              </tr>
			  
              <tr>
                <td  class="col1" align="left" valign="top"><h:outputText value="#{msgs.add_special_access_end_date}" /></td>
                <td>
                <a name="endCalender"></a><h:inputText id="endDate" 
                           value="#{specialAccessPage.specialAccess.endDate}" size="22" styleClass="formtext">
             			  <f:convertDateTime  type="both" dateStyle="medium" timeStyle="short"/>
          		 </h:inputText>
          <h:outputLink id="viewedateCal" onclick="showEdateCal()" value="#endCalender">
            <h:graphicImage id="edateCal"  value="images/date.png" alt="#{msgs.list_auth_modules_alt_popup_cal}" title="#{msgs.list_auth_modules_alt_popup_cal}" styleClass="DatePickerClass"/>
           </h:outputLink>
					 </td>
              </tr>			  
             	
		</table>
  		<div class="actionBar" align="left">
          	<h:commandButton action="#{specialAccessPage.addSpecialAccess}" value="#{msgs.im_done}" accesskey="#{msgs.done_access}" title="#{msgs.im_done_text}" styleClass="BottomImgReturn"/>
			<h:commandButton id="cancelButton" immediate="true" action="#{specialAccessPage.cancel}" value="#{msgs.im_cancel}" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>
	       </div>
        </td></tr>		
</table>
<p ><span class="required">*</span>&nbsp;<h:outputText value="#{msgs.edit_module_required}" /></p>
	<!-- here -->	
	</h:form>
</sakai:view>
</f:view>

