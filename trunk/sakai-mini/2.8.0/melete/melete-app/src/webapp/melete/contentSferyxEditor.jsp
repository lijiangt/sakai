<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/contentSferyxEditor.jsp $
 * $Id: contentSferyxEditor.jsp 69815 2010-08-17 21:59:53Z rashmi@etudes.org $  
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

<%@ page import="org.etudes.tool.melete.MeleteSiteAndUserInfo,org.etudes.tool.melete.AddResourcesPage, org.etudes.tool.melete.AuthorPreferencePage"%>
<%
final javax.faces.context.FacesContext facesContext = javax.faces.context.FacesContext.getCurrentInstance();

final MeleteSiteAndUserInfo meleteSiteAndUserInfo = (MeleteSiteAndUserInfo)facesContext.getApplication().getVariableResolver().resolveVariable(facesContext, "meleteSiteAndUserInfo");

final AuthorPreferencePage authorPreferencePage = (AuthorPreferencePage)facesContext.getApplication().getVariableResolver().resolveVariable(facesContext, "authorPreferences");

final AddResourcesPage aResourcePage = (AddResourcesPage)facesContext.getApplication().getVariableResolver().resolveVariable(facesContext, "addResourcesPage");

String sId = (String)request.getAttribute("attr_sId");

String browseloca = meleteSiteAndUserInfo.getRemoteBrowseLocation() ;
String browselinkloca = meleteSiteAndUserInfo.getRemoteLinkBrowseLocation() ;
String docloca =  meleteSiteAndUserInfo.getMeleteDocsLocation() ;
String saveloca =  meleteSiteAndUserInfo.getMeleteDocsSaveLocation();
String editorloca =  meleteSiteAndUserInfo.getEditorArchiveLocation() ;
String absloca = meleteSiteAndUserInfo.getAbsoluteTranslationLocation();
boolean renderSferyx = authorPreferencePage.isShouldRenderSferyx();
boolean dispSferyx = authorPreferencePage.isDisplaySferyx();
String maxSize = meleteSiteAndUserInfo.getMaxUploadSize() +"M";
%>

<SCRIPT type="text/javascript" LANGUAGE="JavaScript">
<!--
    var _info = navigator.userAgent;
    var _ie = (_info.indexOf("MSIE") > 0 && _info.indexOf("Win") > 0 && _info.indexOf("Windows 3.1") < 0);
if(<%=dispSferyx %>){
     if(!_ie)
		{
				document.writeln('<applet code="sferyx.administration.editors.HTMLEditor" archive="<%=editorloca%>"  id="editor" WIDTH = "90%" HEIGHT = "600" name="htmleditor">');
if(_info.indexOf("Firefox") > 0) {
document.writeln('<PARAM name="useCookie"  value="' + document.cookie+ '">');
}
}
else
{
document.writeln('<OBJECT classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" id="editor" WIDTH = "95%" HEIGHT = "800" NAME = "htmleditor" style="visibility:visible" codebase="http://java.sun.com/products/plugin/autodl/jinstall-1_4-win.cab#Version=1,4,0,0">');
document.writeln('<PARAM NAME = "CODE" VALUE = "sferyx.administration.editors.HTMLEditor">');
document.writeln('<PARAM NAME = "ARCHIVE" VALUE ="<%=editorloca%>">');
document.writeln('<PARAM NAME="type" VALUE="application/x-java-applet;version=1.4">');
document.writeln('<PARAM NAME="scriptable" VALUE="true">');
}
				document.writeln('<PARAM NAME = "image" VALUE = "false">');
				document.writeln('<PARAM NAME = "boxmessage" VALUE ="Please wait while HTMLEditor is loading">');
				document.writeln('<PARAM NAME = "progressbar" VALUE = "true">');
              	document.writeln('<PARAM NAME = "boxbgcolor" VALUE = "#FFFFFF">');
		        document.writeln('<PARAM NAME="scriptable" VALUE="true">');
				document.writeln('<PARAM NAME = "variableName" VALUE="html_content">');
				document.writeln('<PARAM NAME = "dontConvertCharacters" VALUE="true">');
				document.writeln('<PARAM NAME = "maxFileUploadSize" VALUE="<%=maxSize%>">');

				document.writeln('<PARAM name="initialURLEncodedContent" VALUE="<%=aResourcePage.getResourceData(sId)%>">');

				document.writeln('<PARAM name="parametersToSend" VALUE="courseId=<%=meleteSiteAndUserInfo.getCourse_id()%>">');
				document.writeln('<PARAM name="saveURL" VALUE="<%=saveloca%>">');
	
				document.writeln('<PARAM NAME = "uploadContentAsMultipartFormData" VALUE="true">');
				document.writeln('<PARAM NAME="saveEntireFile" VALUE="true">');
				
				document.writeln('<PARAM NAME="useSaveAsSaveRemote" VALUE="true">');
				document.writeln('<PARAM NAME ="supressRemoteFileDialog" VALUE="false">');
				document.writeln('<PARAM NAME ="supressLocalFileDialog" VALUE="false">');
				document.writeln('<PARAM NAME ="remoteBrowseLocation" VALUE="<%=browseloca%>">');
				document.writeln('<PARAM NAME ="remoteLinksBrowseLocation" VALUE="<%=browselinkloca%>">');
				document.writeln('<PARAM NAME ="absoluteDocumentTranslationURL" VALUE="<%=docloca%>">');
				
				document.writeln('<PARAM NAME ="variableName" VALUE="html_content">');
				document.writeln('<PARAM NAME ="menusToRemove" VALUE="menuFile,menuForm">');
				document.writeln('<PARAM NAME ="statusbarVisible" VALUE="false">');
				document.writeln('<PARAM NAME ="menuItemsToRemove" VALUE="insertFormFieldTextBoxMenuItem, insertFormFieldTextAreaMenuItem, insertFormFieldCheckBoxMenuItem, insertFormFieldRadioButtonMenuItem,insertFormFieldDropDownMenuItem, insertFormFieldPushButtonMenuItem,insertFormFieldImageButtonMenuItem,pagePropertiesMainMenuItem">');
				document.writeln('<PARAM NAME ="toolbarItemsToRemove" VALUE="saveFileButton,openFileButton,newFileButton,styleClasses">');
				document.writeln('<PARAM NAME ="useFlowToolbarLayout" VALUE="true">');							
				
if(!_ie)
{	
	document.writeln('</applet>');
	}
else
{
		document.writeln('<COMMENT>');
		document.writeln('</COMMENT>');
		document.writeln('</OBJECT>');
}
}
//--></SCRIPT>
