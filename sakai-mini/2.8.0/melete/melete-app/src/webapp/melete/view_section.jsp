<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/view_section.jsp $
 * $Id: view_section.jsp 70508 2010-09-30 22:50:35Z mallika@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008, 2009,2010 Etudes, Inc.
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
<script type="text/javascript" language="javascript" src="js/sharedscripts.js"></script>

<h:form id="viewsectionform"> 
	<f:subview id="top">
	  <jsp:include page="topnavbar.jsp?myMode=View"/> 
	</f:subview>  
<p></p>   
<table   class="maintableCollapseWithNoBorder">
<tr>
<td colspan="2" align="center">
<f:subview id="topmod">
 	<jsp:include page="view_navigate.jsp"/>
</f:subview>

	<h:panelGroup id="bcsecpgroup" binding="#{viewSectionsPage.secpgroup}"/>
</td>
<tr>
<td colspan="2" align="right">										
  <h:outputLink id="bookmarkSectionLink" value="view_section" onclick="OpenBookmarkWindow(#{viewSectionsPage.section.sectionId},'#{viewSectionsPage.section.title}','Melete Bookmark Window');">
		    	<f:param id="sectionId" name="sectionId" value="#{viewSectionsPage.section.sectionId}" />
	  			<f:param id="sectionTitle" name="sectionTitle" value="#{viewSectionsPage.section.title}" />
	  			<h:graphicImage id="bul_gif" value="images/bookmark-it.png" alt="" styleClass="AuthImgClass"/>
				      <h:outputText id="bookmarktext" value="#{msgs.bookmark_text}" > </h:outputText>
 	</h:outputLink>		
 <h:outputText value="|"/> 			
 <h:commandLink id="myBookmarksLink" action="#{bookmarkPage.gotoMyBookmarks}">
						<h:graphicImage id="mybook_gif" value="images/my-bookmarks.png" alt="" styleClass="AuthImgClass"/>
						<h:outputText id="mybks" value="#{msgs.my_bookmarks}" />									
 <f:param name="fromPage" value="view_section" />
</h:commandLink>
</td>
</tr>
<tr>
<td colspan="2" align="left">
     <h:outputText id="mod_seq" value="#{viewSectionsPage.moduleSeqNo}. " styleClass="bold style6" rendered="#{viewSectionsPage.autonumber}"/>
	 <h:outputText id="modtitle" value="#{viewSectionsPage.module.title}" styleClass="bold style6" />
</td>
</tr>    

<tr>
<td colspan="2" align="left">
<h:panelGrid id="sectionContentGrid" columns="1" width="100%" border="0" rendered="#{viewSectionsPage.section != null}">
<h:column>
 	<h:outputText id="sec_seq" value="#{viewSectionsPage.sectionDisplaySequence}. " styleClass="bold style7" rendered="#{viewSectionsPage.autonumber}"/>
 	<h:outputText id="title" value="#{viewSectionsPage.section.title}" styleClass="bold style7"></h:outputText>     
</h:column>
<h:column>
	<h:outputText value="#{msgs.view_section_student_instructions} " rendered="#{((viewSectionsPage.section.instr != viewSectionsPage.nullString)&&(viewSectionsPage.section.instr != viewSectionsPage.emptyString))}" styleClass="italics"/>
	<h:outputText id="instr" value="#{viewSectionsPage.section.instr}" rendered="#{((viewSectionsPage.section.instr != viewSectionsPage.nullString)&&(viewSectionsPage.section.instr != viewSectionsPage.emptyString))}"/>
</h:column>
<h:column rendered="#{viewSectionsPage.section.contentType != viewSectionsPage.nullString}">
	<h:inputHidden id="contentType" value="#{viewSectionsPage.section.contentType}"/>
	<h:inputHidden id="openWindow" value="#{viewSectionsPage.section.openWindow}"/>
	<h:outputText escape="false" value="<a target='new_window' href='" rendered="#{((viewSectionsPage.section.contentType == viewSectionsPage.typeLink || viewSectionsPage.section.contentType == viewSectionsPage.typeUpload || viewSectionsPage.section.contentType == viewSectionsPage.typeLTI)&&(viewSectionsPage.contentLink != viewSectionsPage.nullString)&&(viewSectionsPage.section.openWindow == true))}"/>
       <h:outputText value="#{viewSectionsPage.contentLink}" rendered="#{((viewSectionsPage.section.contentType == viewSectionsPage.typeLink || viewSectionsPage.section.contentType == viewSectionsPage.typeUpload || viewSectionsPage.section.contentType == viewSectionsPage.typeLTI)&&(viewSectionsPage.contentLink != viewSectionsPage.nullString)&&(viewSectionsPage.section.openWindow == true))}"/>
       <h:outputText escape="false" value="'>#{viewSectionsPage.linkName}</a>" rendered="#{((viewSectionsPage.section.contentType == viewSectionsPage.typeLink || viewSectionsPage.section.contentType == viewSectionsPage.typeUpload || viewSectionsPage.section.contentType == viewSectionsPage.typeLTI)&&(viewSectionsPage.contentLink != viewSectionsPage.nullString)&&(viewSectionsPage.section.openWindow == true))}"/>
    
    <h:outputText id="contentFrame" value="<iframe id=\"iframe1\" src=\"#{viewSectionsPage.content}\" style=\"visibility:visible\" scrolling= \"auto\" width=\"100%\" height=\"700\" border=\"0\" frameborder= \"0\"></iframe>" rendered="#{((viewSectionsPage.section.contentType ==viewSectionsPage.typeLink)&&(viewSectionsPage.linkName !=
    viewSectionsPage.nullString)&&(viewSectionsPage.section.openWindow == false))}" escape="false" />
  
  	<!-- render typeUpload  content in same window --> 
 	<h:outputText id="contentUploadFrame" value="<iframe id=\"iframe2\" src=\"#{viewSectionsPage.contentLink}\" style=\"visibility:visible\" scrolling= \"auto\" width=\"100%\" height=\"700\"
    border=\"0\" frameborder= \"0\"></iframe>" rendered="#{((viewSectionsPage.section.contentType ==viewSectionsPage.typeUpload)&&(viewSectionsPage.section.openWindow == false))}" escape="false" />

	<!-- render typeEditor content with form tags --> 
	<h:outputText id="contentTextFrame" rendered="#{(viewSectionsPage.section.contentType == viewSectionsPage.typeEditor)&& (viewSectionsPage.contentWithHtml == true) &&(viewSectionsPage.content != viewSectionsPage.nullString)}" >
		<f:verbatim>
		<iframe id="iframe3" name="iframe3" src="${viewSectionsPage.contentLink}" width="100%" height="100%" style="visibility:visible" scrolling= "auto" border="0" frameborder= "0">
		</iframe>
		</f:verbatim>
	</h:outputText>

	<!-- render typeEditor content without form tags -->
	<h:outputText value="#{viewSectionsPage.content}" escape="false" rendered="#{(viewSectionsPage.section.contentType == viewSectionsPage.typeEditor) && (viewSectionsPage.contentWithHtml == false) &&(viewSectionsPage.content != viewSectionsPage.nullString)}"/>	

	<!-- render typeLTI content -->
	<h:outputText id="contentLTI" value="#{viewSectionsPage.contentLTI}" 
              rendered="#{((viewSectionsPage.section.contentType == viewSectionsPage.typeLTI)&&(viewSectionsPage.section.openWindow == false))}" escape="false" />	
</h:column>
</h:panelGrid>

</td>

</tr>    
<tr>
<td colspan="2" align="center">
					<f:subview id="bottommod">
						<jsp:include page="view_navigate.jsp"/>
					</f:subview>
</td>
</tr>
</table>
</td>
</tr>
<tr><td>
<table  height="20"  class="maintableCollapseWithNoBorder" >
   	<tr>
	 <td align="center" class="meleteLicenseMsg center"><B>
  			<jsp:include page="license_info.jsp"/>      
         </B></td></tr>
	    </table>

<script type="text/javascript">
	window.onload=function(){
	 var oIframe = document.getElementById("iframe3");
	 if(oIframe)
		 {
	        var oDoc = oIframe.contentWindow || oIframe.contentDocument;
		    if (oDoc.document) {
			oDoc = oDoc.document;	
			oIframe.style.height = oDoc.body.scrollHeight + 40 +"px";				       
		    } else oIframe.height = oDoc.body.offsetHeight + 40 ; 
		   	for (i=0; i < document.styleSheets.length; i++)
			{
			  var link = document.createElement("link");
			  //finish constructing the links
		       link.setAttribute("rel", "stylesheet");
		       link.setAttribute("type", "text/css");
			   //assign this new link the href of the parent one
		       link.setAttribute("href", document.styleSheets[i].href);
			   oDoc.body.appendChild(link); 
		    }
		    						
		  }

	  setMainFrameHeight('<h:outputText value="#{meleteSiteAndUserInfo.winEncodeName}"/>');			  
	 }
</script>
</h:form>
</sakai:view>
</f:view>

