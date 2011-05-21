<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/editpreview.jsp $
 * $Id: editpreview.jsp 70043 2010-08-31 17:08:56Z rashmi@etudes.org $  
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
<sakai:view title="Modules: Preview Section" toolCssHref="rtbc004.css">

<%@include file="accesscheck.jsp" %>

 	<h:form id="previewForm" > 	
 	<f:subview id="top">
		<jsp:include page="topnavbar.jsp"/> 
	</f:subview>		
	<div class="meletePortletToolBarMessage"><img src="images/note_view.gif" alt="" width="16" height="16" align="absmiddle"><h:outputText value="#{msgs.edit_preview_previewing_section}" /></div>
     <table class="maintableCollapseWithBorder">          
		  <tr>
		    <td colspan="2" height="20"> <div  class="maintabledata5">&nbsp;</div>
		    </td>
		  </tr>	
		  <tr>
		    <td>
			<h:outputText value="#{msgs.edit_preview_previewing}" styleClass="bold" /> <h:outputText value="#{editSectionPage.module.title}" styleClass="bold"/>
			</td>
		  </tr>					
		
			  <tr><td>
						<h:outputText value="#{msgs.edit_preview_section}" />  <h:outputText value=" : " /> 	<h:outputText id="sec1" value="#{editSectionPage.section.title}"></h:outputText>
			  </td></tr>					
			  <tr><td>
						<h:outputText id="sec3" value="#{msgs.edit_preview_instruction}" rendered="#{editSectionPage.renderInstr}" styleClass="bold"></h:outputText> 
			  </td></tr>
			  <tr><td>
						<h:outputText id="sec2" value="#{editSectionPage.section.instr}" rendered="#{editSectionPage.renderInstr}"></h:outputText>
			  </td></tr>
			  <tr><td>
		      <h:inputHidden id="contentType" value="#{editSectionPage.section.contentType}"/>
			 
	            <h:outputLink id="viewSectionLink"  value="#{editSectionPage.previewContentData}" target="_blank" rendered="#{(editSectionPage.shouldRenderLink || editSectionPage.shouldRenderUpload || editSectionPage.shouldRenderLTI) && editSectionPage.section.openWindow == true}">
                <h:outputText id="sectitleLink" 
                           value="#{editSectionPage.secResourceName}">
                </h:outputText>
                </h:outputLink>	
                    <h:outputText id="contentFrame" value="<iframe id=\"iframe1\" src=\"#{editSectionPage.previewContentData}\" style=\"visibility:visible\" scrolling= \"auto\" width=\"100%\" height=\"700\"
               	    border=\"0\" frameborder= \"0\"></iframe>" rendered="#{(editSectionPage.shouldRenderUpload || editSectionPage.shouldRenderLink|| editSectionPage.shouldRenderLTI) && editSectionPage.section.openWindow == false}" escape="false" />			
		      
		      <h:outputText id="contentTextFrame" rendered="#{editSectionPage.shouldRenderEditor && editSectionPage.contentWithHtml == true}" >
					<f:verbatim>
					<iframe id="iframe3" name="iframe3" src="${editSectionPage.previewContentData}" width="100%" height="700px" style="visibility:visible" scrolling= "auto" border="0" frameborder= "0">
					</iframe>
					</f:verbatim>
				</h:outputText>
				
				<!-- render typeEditor content without form tags -->
				<h:outputText value="#{editSectionPage.previewContentData}" escape="false" rendered="#{editSectionPage.shouldRenderEditor && editSectionPage.contentWithHtml == false}"/>
				
		      </td></tr>
	       
			<tr><td>
				<div class="actionBar" align="left">
						<h:commandButton id="return" action="#{editSectionPage.returnBack}" value="#{msgs.im_return}" accesskey="#{msgs.return_access}" title="#{msgs.im_return_text}" styleClass="BottomImgReturn"/>
	   	        </div></td>
              </tr>
              			
         	 <tr><td>
         		 <table width="100%" border="0" cellpadding="3" cellspacing="0" >
   	         <tr>
	         <td align="center" class="meleteLicenseMsg center"><B>
	          <h:outputText id="lic1_val0" value="    "
rendered="#{editSectionPage.meleteResource.licenseCode == 0}"/>      
             <!--License code Copyright-->
   <h:outputText id="lic1_val1" value="#{msgs.edit_preview_copyright}" 

rendered="#{editSectionPage.meleteResource.licenseCode == 1}"/>      
   <h:outputText id="lic1_val4" value="#{editSectionPage.meleteResource.copyrightYear}" rendered="#{((editSectionPage.meleteResource.licenseCode == 1)&&(editSectionPage.meleteResource.copyrightYear != editSectionPage.nullString))}"/> 
   <h:outputText id="lic1_val2" escape="false" value="<BR>#{editSectionPage.meleteResource.copyrightOwner}" rendered="#{editSectionPage.meleteResource.licenseCode == 1}"/> 
      <!--End license code Copyright-->
 <!--License code Public domain-->
   <h:outputText id="lic2_val1" value="#{msgs.edit_preview_dedicated_to}" rendered="#{editSectionPage.meleteResource.licenseCode == 2}"/> 
<h:outputLink value="#{editSectionPage.section.sectionResource.resource.ccLicenseUrl}" target="_blank" rendered="#{editSectionPage.section.sectionResource.resource.licenseCode == 2}">
   <h:outputText id="lic2_val2" value="#{msgs.edit_preview_public_domain}" 
rendered="#{editSectionPage.meleteResource.licenseCode == 2}"/> 
</h:outputLink> 
   
  <h:outputText id="lic2_val5" value="#{editSectionPage.meleteResource.copyrightYear}" rendered="#{((editSectionPage.meleteResource.licenseCode == 2)&&(editSectionPage.meleteResource.copyrightYear != editSectionPage.nullString))}"/> 
 <h:outputText id="lic2_val3" escape="false" value="<BR>#{editSectionPage.meleteResource.copyrightOwner} "  

rendered="#{((editSectionPage.meleteResource.licenseCode == 2)&&(editSectionPage.meleteResource.copyrightOwner != editSectionPage.nullString))}"/>	
 
      <!--End license code Public domain-->   
      <!--License code CC license-->
   <h:outputText id="lic3_val1" value="#{msgs.edit_preview_licensed_under}" 

rendered="#{editSectionPage.meleteResource.licenseCode == 3}"/> 
 <h:outputLink value="#{editSectionPage.section.sectionResource.resource.ccLicenseUrl}" target="_blank" rendered="#{editSectionPage.section.sectionResource.resource.licenseCode == 3}">   
   <h:outputText id="lic3_val2" value="#{msgs.edit_preview_creative_commons}" 

rendered="#{editSectionPage.meleteResource.licenseCode == 3}"/>
</h:outputLink>
   <h:outputText id="lic3_val5" value="#{editSectionPage.meleteResource.copyrightYear}" rendered="#{((editSectionPage.meleteResource.licenseCode == 3)&&(editSectionPage.meleteResource.copyrightYear != editSectionPage.nullString))}"/> 
	  <h:outputText id="lic3_val3" escape="false" value="<BR>#{editSectionPage.meleteResource.copyrightOwner} "  

rendered="#{((editSectionPage.meleteResource.licenseCode == 3)&&(editSectionPage.meleteResource.copyrightOwner != editSectionPage.nullString))}"/> 
      <!--End license code CC license-->     	
	 
        <!--License code fairuse license-->
      <h:outputText id="lic4_val2" value="#{msgs.edit_preview_fairuse}"  rendered="#{editSectionPage.meleteResource.licenseCode == 4}"/>
       
   <h:outputText id="lic4_val5" value="#{editSectionPage.meleteResource.copyrightYear}" rendered="#{((editSectionPage.meleteResource.licenseCode == 4)&&(editSectionPage.meleteResource.copyrightYear != editSectionPage.nullString))}"/> 
<h:outputText id="lic4_val3" escape="false" value="<BR>#{editSectionPage.meleteResource.copyrightOwner} "  

rendered="#{((editSectionPage.meleteResource.licenseCode == 4)&&(editSectionPage.meleteResource.copyrightOwner != editSectionPage.nullString))}"/> 

         <!--End license code fairuse license-->             
              </B></TD></TR>
	         </TABLE>
         	 
         	 
         	 </td></tr>
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
