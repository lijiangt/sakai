<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/FileUploadView.jsp $
 * $Id: FileUploadView.jsp 69815 2010-08-17 21:59:53Z rashmi@etudes.org $  
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
<sakai:view title="Modules: File Upload" toolCssHref="rtbc004.css">
<%@include file="accesscheck.jsp" %>

<%@ page import="javax.faces.application.FacesMessage, java.util.ResourceBundle"%>

<% 
	String status = (String)request.getAttribute("upload.status");
		if( status != null && !status.equalsIgnoreCase("ok"))
		{
			final javax.faces.context.FacesContext facesContext = javax.faces.context.FacesContext.getCurrentInstance();
			ResourceBundle bundle = ResourceBundle.getBundle("org.etudes.tool.melete.bundle.Messages", facesContext.getViewRoot().getLocale());
			String infoMsg = bundle.getString("file_too_large");
			FacesMessage msg = new FacesMessage(null, infoMsg);
			msg.setSeverity(FacesMessage.SEVERITY_ERROR);
			facesContext.addMessage(null, msg);		
	   }
%>
<script language="javascript1.2">
function fillupload()
{
	//var k =document.getElementById("file1").value;		
	//document.getElementById("AddSectionForm:ContentUploadView:filename").value=k;
}
function loadInputs()
{
  var str=document.getElementById("FileUploadForm:numitems").value;
  document.getElementById("FileUploadForm:number").selectedIndex=str-1;
  for (i=2; i<=str; i++)
  {
   document.getElementById("choose"+i).style.display='block';
  }   
   clearMsgs();
   showErrorMsgs();
   showSuccessMsgs();
}

function clearMsgs()
{
    for(j=1; j <=10; j++)
    	{
	document.getElementById("errMsg"+j).innerHTML=" ";
	document.getElementById("show"+j).innerHTML=" ";
	}
}

function showErrorMsgs()
{
  var errStr=document.getElementById("FileUploadForm:err_field_msgs").value;
   var end = 0;
   var len = 0;
   var idx;
   var msg;
  if(errStr != undefined)
  {
   len = errStr.length; 
   while(errStr != undefined && (end = errStr.indexOf(",")) != -1)
  	{
  	idx = errStr.substring(1,end);
  	errStr = errStr.substring(end+1,len);
  	len = errStr.length;  
  	if((end = errStr.indexOf(",")) != -1)
  	{
  	msg = errStr.substring(1,end);
  	errStr = errStr.substring(end+1,len);
  	len = errStr.length;   	
   	}
   	else
   	{
   	msg = errStr.substring(1,len-1);
   	errStr = null;
   	}   	
   	document.getElementById("errMsg"+idx).innerHTML=msg;
  	}
  }
}

function showSuccessMsgs()
{
  var successStr=document.getElementById("FileUploadForm:success_field_msgs").value;
   var end = 0;
   var len = 0;
   var idx;
   var msg;
  if(successStr != null)
  {
   len = successStr.length; 
   while(successStr != null && (end = successStr.indexOf(",")) != -1)
  	{
  	idx = successStr.substring(1,end);
  	successStr = successStr.substring(end+1,len);
  	len = successStr.length;  
  	if((end = successStr.indexOf(",")) != -1)
  	{
  	msg = successStr.substring(1,end);
  	successStr = successStr.substring(end+1,len);
  	len = successStr.length;   	
   	}
   	else
   	{
   	msg = successStr.substring(1,len-1);
   	successStr = null;
   	}   	
   	document.getElementById("choose"+idx).style.display='none';
   	document.getElementById("show"+idx).style.display='block';
   	document.getElementById("show"+idx).innerHTML=msg;
  	}
  }
}
function showInputs()
{
  var str=document.getElementById("FileUploadForm:number").value;
  
  for (i=1; i<=str; i++)
  {
     document.getElementById("choose"+i).style.display='block';
  }
  
  for (i=parseInt(str)+1; i<=10; i++)
  {
    document.getElementById("upload"+i).innerHTML="<INPUT TYPE=\"FILE\" id=\"file"+i+"\" NAME=\"file"+i+"\" /> <a id=\"remove"+i+"\" href=\"#\" onClick=\"javascript:clearItem("+i+")\"><img src=\"images/remove_item.png\" alt=\"\" border=\"0\"/>Remove item</a>";
    document.getElementById("choose"+i).style.display='none';
  }

}
function clearItem(id)
{
  document.getElementById("upload"+id).innerHTML="<INPUT TYPE=\"FILE\" id=\"file"+id+"\" NAME=\"file"+id+"\" /> <a id=\"remove"+id+"\" href=\"#\" onClick=\"javascript:clearItem("+id+")\"><img src=\"images/remove_item.png\" alt=\"\" border=\"0\"/>Remove item</a>";
  var str=document.getElementById("FileUploadForm:number").selectedIndex;
  if (str >= 1) 
  {
      document.getElementById("choose"+id).style.display='none';
    document.getElementById("FileUploadForm:number").selectedIndex=str-1;
  }  
  else 
  {
    document.getElementById("FileUploadForm:number").selectedIndex=0;
  }  
  document.getElementById("errMsg"+id).innerHTML=" ";
}
</script>
<script language ="javascript">
var XMLHttpRequestObject = false;

if(window.XMLHttpRequest) {
	XMLHttpRequestObject = new XMLHttpRequest();
} else if(window.ActiveXObject) {
	XMLHttpRequestObject = new ActiveXObject("Microsoft.XMLHTTP");
}

function validateFileName(divID, sourceID)
{	
	if(XMLHttpRequestObject){
	var obj = document.getElementById(divID);	
	var sourceobj = escape(document.getElementById(sourceID).value);
	XMLHttpRequestObject.open("GET", '/etudes-melete-tool/melete/fileNameCheck.jsf'+ '?up_field='+ sourceobj);
	
	XMLHttpRequestObject.onreadystatechange = function()
	{
	  if(XMLHttpRequestObject.readyState == 4 && XMLHttpRequestObject.status == 200)
		  obj.innerHTML = XMLHttpRequestObject.responseText;
	}
	XMLHttpRequestObject.send(null);
  }
}
</script>

 <h:form id="FileUploadForm"  enctype="multipart/form-data">
	<!-- top nav bar -->
				<f:subview id="top">
						<jsp:include page="topnavbar.jsp"/> 
				</f:subview>
  <div class="meletePortletToolBarMessage"><img src="images/manage_content.png" alt="" width="16" height="16" align="absbottom" border="0"><h:outputText value="#{msgs.file_upload_title}" /></div>
      <table class="maintableCollapseWithBorder">
        <tr>
        <td class="maintabledata3">   
        <h:messages showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>     
		  <table class="maintableCollapseWithNoBorder" id="AutoNumber1">
		  	<tr>
		  		<td height="20" class="maintabledata5"><h:outputText id="t1_1" value="#{msgs.manage_content_new_item}" styleClass="tableheader2"/> 
		  		</td>
		  	</tr>
            <tr>
            	<td colspan="2">
            	<h:inputHidden id="numitems" value="#{addResourcesPage.numberItems}" />
              		<h:outputText id="t2" value="#{msgs.manage_content_number_files}"/>
                	
						  <h:selectOneMenu id="number" value="#{addResourcesPage.numberItems}" onchange="showInputs();" >
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
			  	<h:inputHidden id="err_field_msgs" value="#{addResourcesPage.err_fields}" />
			  	<h:inputHidden id="success_field_msgs" value="#{addResourcesPage.success_fields}" />
			  </td>
			</tr>
          <tr>
		    <td colspan="2">		    	
			<p>
			<div id="choose1" class="fileclass" style="display:block">
			<br>			
			<div id="errMsg1" style="color:red">
				<p> </p>
			</div>		
			
			<b>&nbsp;&nbsp;<span class="required">* </span></b><h:outputText id="chooseFile1" value="#{msgs.file_upload_view_choose}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="upload1"><INPUT TYPE="FILE" id="file1" NAME="file1" onchange="validateFileName('errMsg1','file1')"/>
			
			<a id="remove1" href="#" onClick="javascript:clearItem(1)"><img src="images/remove_item.png" alt="" border="0"/><h:outputText id="removeItem1" value="#{msgs.link_upload_remove_item}" /></a>
			</span>
			<br>
			</div>
			<div id="show1" class="fileclass" style="color:blue;display:none">
			<p></p>			
			</div>
			<div id="choose2" class="fileclass" style="display:none">
			<br>
			<div id="errMsg2" style="color:red">
				<p> </p>
			</div>		

			<b>&nbsp;&nbsp;<span class="required">* </span></b><h:outputText id="chooseFile2" value="#{msgs.file_upload_view_choose}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="upload2"><INPUT TYPE="FILE" id="file2" NAME="file2" onchange="validateFileName('errMsg2','file2')"/>
			<a id="remove2" href="#" onClick="javascript:clearItem(2)"><img src="images/remove_item.png" alt="" border="0"/><h:outputText id="removeItem2" value="#{msgs.link_upload_remove_item}" /></a>
			</span>
			<br>
			</div>
			<div id="show2" class="fileclass" style="color:blue;display:none">
			<p></p>			
			</div>
			
			<div id="choose3" class="fileclass" style="display:none">
			<br>
			<div id="errMsg3" style="color:red">
				<p>  </p>
			</div>	
	
			<b>&nbsp;&nbsp;<span class="required">* </span></b><h:outputText id="chooseFile3" value="#{msgs.file_upload_view_choose}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="upload3"><INPUT TYPE="FILE" id="file3" NAME="file3" onchange="validateFileName('errMsg3','file3')"/>
			<a id="remove3" href="#" onClick="javascript:clearItem(3)"><img src="images/remove_item.png" alt="" border="0"/><h:outputText id="removeItem3" value="#{msgs.link_upload_remove_item}" /></a>
			</span>
			<br>
			</div>
			<div id="show3" class="fileclass" style="color:blue;display:none">
			<p></p>			
			</div>
			
			<div id="choose4" class="fileclass" style="display:none">
			<br>
			<div id="errMsg4" style="color:red">
				<p> </p>
			</div>
			<b>&nbsp;&nbsp;<span class="required">* </span></b><h:outputText id="chooseFile4" value="#{msgs.file_upload_view_choose}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="upload4"><INPUT TYPE="FILE" id="file4" NAME="file4" onchange="validateFileName('errMsg4','file4')"/>
			<a id="remove4" href="#" onClick="javascript:clearItem(4)"><img src="images/remove_item.png" alt="" border="0"/><h:outputText id="removeItem4" value="#{msgs.link_upload_remove_item}" /></a>
			</span>
			<br>
			</div>
			<div id="show4" class="fileclass" style="color:blue;display:none">
			<p></p>			
			</div>
			
            <div id="choose5" class="fileclass" style="display:none">
			<br>
			<div id="errMsg5" style="color:red">
				<p> </p>
			</div>
			<b>&nbsp;&nbsp;<span class="required">* </span></b><h:outputText id="chooseFile5" value="#{msgs.file_upload_view_choose}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="upload5"><INPUT TYPE="FILE" id="file5" NAME="file5" onchange="validateFileName('errMsg5','file5')"/>
			<a id="remove5" href="#" onClick="javascript:clearItem(5)"><img src="images/remove_item.png" alt="" border="0"/><h:outputText id="removeItem5" value="#{msgs.link_upload_remove_item}" /></a>
			</span>
			<br>
			</div>
			<div id="show5" class="fileclass" style="color:blue;display:none">
			<p></p>			
			</div>
			
			<div id="choose6" class="fileclass" style="display:none">
			<br>
			<div id="errMsg6" style="color:red">
				<p> </p>
			</div>
			<b>&nbsp;&nbsp;<span class="required">* </span></b><h:outputText id="chooseFile6" value="#{msgs.file_upload_view_choose}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="upload6"><INPUT TYPE="FILE" id="file6" NAME="file6" onchange="validateFileName('errMsg6','file6')"/>
			<a id="remove6" href="#" onClick="javascript:clearItem(6)"><img src="images/remove_item.png" alt="" border="0"/><h:outputText id="removeItem6" value="#{msgs.link_upload_remove_item}" /></a>
			</span>
			<br>
			</div>
			<div id="show6" class="fileclass" style="color:blue;display:none">
			<p></p>			
			</div>
			
			<div id="choose7" class="fileclass" style="display:none">
			<br>
			<div id="errMsg7" style="color:red">
				<p> </p>
			</div>
			<b>&nbsp;&nbsp;<span class="required">* </span></b><h:outputText id="chooseFile7" value="#{msgs.file_upload_view_choose}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="upload7"><INPUT TYPE="FILE" id="file7" NAME="file7" onchange="validateFileName('errMsg7','file7')"/>
			<a id="remove7" href="#" onClick="javascript:clearItem(7)"><img src="images/remove_item.png" alt="" border="0"/><h:outputText id="removeItem7" value="#{msgs.link_upload_remove_item}" /></a>
			</span>
			<br>
			</div>
			<div id="show7" class="fileclass" style="color:blue;display:none">
			<p></p>			
			</div>
			
			<div id="choose8" class="fileclass" style="display:none">
			<br>
			<div id="errMsg8" style="color:red">
				<p> </p>
			</div>
			<b>&nbsp;&nbsp;<span class="required">* </span></b><h:outputText id="chooseFile8" value="#{msgs.file_upload_view_choose}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="upload8"><INPUT TYPE="FILE" id="file8" NAME="file8" onchange="validateFileName('errMsg8','file8')"/>
			<a id="remove8" href="#" onClick="javascript:clearItem(8)"><img src="images/remove_item.png" alt="" border="0"/><h:outputText id="removeItem8" value="#{msgs.link_upload_remove_item}" /></a>
			</span>
			<br>
			</div>			
			<div id="show8" class="fileclass" style="color:blue;display:none">
			<p></p>			
			</div>
			
            <div id="choose9" class="fileclass" style="display:none">
            <br>
            <div id="errMsg9" style="color:red">
				<p> </p>
			</div>
			<b>&nbsp;&nbsp;<span class="required">* </span></b><h:outputText id="chooseFile9" value="#{msgs.file_upload_view_choose}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="upload9"><INPUT TYPE="FILE" id="file9" NAME="file9" onchange="validateFileName('errMsg9','file9')"/>
			<a id="remove9" href="#" onClick="javascript:clearItem(9)"><img src="images/remove_item.png" alt="" border="0"/><h:outputText id="removeItem9" value="#{msgs.link_upload_remove_item}" /></a>
			</span>
			<br>
			</div>	
			<div id="show9" class="fileclass" style="color:blue;display:none">
			<p></p>			
			</div>
			
			<div id="choose10" class="fileclass" style="display:none">
			<br>
			<div id="errMsg10" style="color:red">
				<p> </p>
			</div>
			<b>&nbsp;&nbsp;<span class="required">* </span></b><h:outputText id="chooseFile10" value="#{msgs.file_upload_view_choose}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="upload10"><INPUT TYPE="FILE" id="file10" NAME="file10" onchange="validateFileName('errMsg10','file10')"/>
			<a id="remove10" href="#" onClick="javascript:clearItem(10)"><img src="images/remove_item.png" alt="" border="0"/><h:outputText id="removeItem10" value="#{msgs.link_upload_remove_item}" /></a>
			</span>
			<br>
			</div>	
			<div id="show10" class="fileclass" style="color:blue;display:none">
			<p></p>			
			</div>
			</p>
	        </td>
	     </tr>	
	     <tr>
	       <td colspan="2">
	       <span class="required">* Required</span>
	       <br>
	       <h:outputText id="note" value="#{msgs.file_upload_view_note} #{addResourcesPage.maxUploadSize}MB."  styleClass="comment red"/>							<h:inputHidden id="filename" value="#{addSectionPage.hiddenUpload}" />						
		   <br>
	       </td>
	     </tr>
	    </table>
		<div class="actionBar" align="left">
	        <h:commandButton id="continueButton" immediate="true" action="#{addResourcesPage.addItems}" value="#{msgs.im_continue}" accesskey="#{msgs.continue_access}" title="#{msgs.im_continue_text}" styleClass="BottomImgContinue"/>
	        <h:commandButton id="cancelButton" immediate="true" action="#{addResourcesPage.cancel}" value="#{msgs.im_cancel}" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>			                
        </div> 
	   </td>
	  </tr>						
	</table>	
</h:form>
<!-- This Ends the Main Text Area -->
</sakai:view>
<script type="text/javascript">
 		 loadInputs();	
</script>
</f:view>




