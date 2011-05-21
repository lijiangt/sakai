<%@ page import="org.etudes.tool.melete.BookmarkPage,javax.faces.application.FacesMessage, java.util.ResourceBundle"%>

<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-app/src/webapp/melete/confirm_bookmark.jsp $
 * $Id: confirm_bookmark.jsp 64898 2009-11-24 22:26:14Z mallika@etudes.org $  
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

<%
final javax.faces.context.FacesContext facesContext = javax.faces.context.FacesContext.getCurrentInstance();
final BookmarkPage bookmarkPage = (BookmarkPage)facesContext.getApplication().getVariableResolver().resolveVariable(facesContext, "bookmarkPage");
bookmarkPage.resetValues();
%>
<html>
<body>
<script language="javascript">
alert("Bookmark saved");
var elementToGet = "ManageBookmarksForm"+ ":" + "refreshButton";  
var form = window.opener.document.forms['ManageBookmarksForm'];  
if (form != null)
{
   var button = form.elements[elementToGet];  
    button.click();
 }
 else
 {
   //Do nothing
 }    
window.close();
</script>
</body>
</html>