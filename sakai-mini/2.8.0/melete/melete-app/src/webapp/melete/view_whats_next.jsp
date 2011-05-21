<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/view_whats_next.jsp $
 * $Id: view_whats_next.jsp 69284 2010-07-19 21:49:38Z mallika@etudes.org $  
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
<sakai:view title="Modules: Student View" toolCssHref="rtbc004.css">
<%@include file="meleterightscheck.jsp" %>
<a name="newanchor"></a>
<h:form id="viewNSsectionform">   
	<f:subview id="top">
	  <jsp:include page="topnavbar.jsp?myMode=View"/> 
	</f:subview> 
	<table class="maintableCollapseWithNoBorder" >
	<!--Page Content-->

	<tr>
		<td align="center">
		     <!-- The getmodule method correctly determines the prev and next seq nos in the backing bean -->
			<!-- The hidden field below has been added just to get the getmodule method to execute first -->
		    <h:inputHidden id="hacktitle" value="#{viewNextStepsPage.module.title}"/>
					<f:subview id="topmod">
						<jsp:include page="view_navigate_wn.jsp"/>
					</f:subview>
				<h:panelGroup id="bcsecpgroup" binding="#{viewNextStepsPage.secpgroup}"/>
			</td>
</tr> 
<tr>
<td align="right">
<h:commandLink id="myBookmarksLink" action="#{bookmarkPage.gotoMyBookmarks}">
<h:graphicImage id="mybook_gif" value="images/my-bookmarks.png" alt="" styleClass="AuthImgClass"/>
 <h:outputText id="mybks" value="#{msgs.my_bookmarks}" />
 <f:param name="fromPage" value="view_whats_next" />
</h:commandLink>				  
</td>
</tr>
<tr>
		<td align="left">  &nbsp;		</td>
</tr> 

<tr>
		<td align="left">  
				<h:outputText value="#{msgs.view_whats_next_whats_next}"   styleClass="bold style7"></h:outputText>      
		</td>
</tr> 
<tr>
		<td align="left">  
				<h:outputText id="wnext" value="#{viewNextStepsPage.module.whatsNext}"></h:outputText>     
		</td>
</tr> 

 <tr>
<td align="left"> &nbsp;</td>
</tr>
<tr>
<td align="center">
					<f:subview id="bottommod">
						<jsp:include page="view_navigate_wn.jsp"/>
					</f:subview>
</td>
</tr>                



  </table>

<!--End Content-->
</h:form>
</sakai:view>
</f:view>

