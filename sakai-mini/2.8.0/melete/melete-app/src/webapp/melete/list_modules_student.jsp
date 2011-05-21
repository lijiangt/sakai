<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/list_modules_student.jsp $
 * $Id: list_modules_student.jsp 70438 2010-09-27 20:50:02Z rashmi@etudes.org $  
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
<script type="text/javascript" language="javascript" src="js/sharedscripts.js"></script>

<h:form id="listmodulesStudentform">
	<f:subview id="top">
		<jsp:include page="topnavbar.jsp?myMode=View"/> 
	</f:subview>
<!--Page Content-->
<br/>
<div align="right">
<h:commandLink id="lastVisitedLink" actionListener="#{bookmarkPage.viewSection}" action="#{bookmarkPage.redirectViewSection}" rendered="#{listModulesPage.bookmarkSectionId > 0}">
 <f:param name="sectionId" value="#{listModulesPage.bookmarkSectionId}" /> 
 <h:graphicImage id="lvisit_gif" value="images/last-visited.png" alt="" styleClass="BmImgClass"/>
 <h:outputText id="lastvisit" value="#{msgs.last_visited}" />									
</h:commandLink>
<h:outputText value="|" rendered="#{listModulesPage.bookmarkSectionId > 0}"/> 
<h:commandLink id="myBookmarksLink" action="#{bookmarkPage.gotoMyBookmarks}">
<f:param name="fromPage" value="list_modules_student" />
<h:graphicImage id="mybook_gif" value="images/my-bookmarks.png" alt="" styleClass="BmImgClass"/>
 <h:outputText id="mybks" value="#{msgs.my_bookmarks}" />									
</h:commandLink>	
</div>

<h:messages showDetail="true" showSummary="false"/>
<h:outputText id="nomodstext" value="#{msgs.no_modules}" rendered="#{listModulesPage.nomodsFlag == null || listModulesPage.nomodsFlag}" styleClass="left"/>
 <h:dataTable id="table" 
                  value="#{listModulesPage.modDataModel}"
                  var="vmbean"   rowClasses="row1,row2"  rendered="#{listModulesPage.nomodsFlag != null && !listModulesPage.nomodsFlag}" 
              columnClasses="StudentListTitleClass,ListDateClass,ListDateClass,ListPrintClass" headerClass="tableheader"
                   border="0" cellpadding="3" cellspacing="0" width="100%" 
                   binding="#{listModulesPage.modTable}" summary="#{msgs.list_modules_stud_summary}">
      <h:column>   
      <f:facet name="header">
      <h:panelGroup>
       <h:commandLink id="expandCollapseAction"  action="#{listModulesPage.expandCollapseAction}" immediate="true">
     	    <h:graphicImage id="exp_all_gif" alt="#{msgs.list_modules_stud_expand_all}" title="#{msgs.list_modules_stud_expand_all}" value="images/expand-collapse.gif"   rendered="#{listModulesPage.expandAllFlag != listModulesPage.trueFlag}" styleClass="ExpClass"/>
             <h:graphicImage id="col_all_gif" alt="#{msgs.list_modules_stud_collapse_all}" title="#{msgs.list_modules_stud_collapse_all}" value="images/collapse-expand.gif"   rendered="#{listModulesPage.expandAllFlag == listModulesPage.trueFlag}" styleClass="ExpClass"/>
          </h:commandLink>
      </h:panelGroup>
      </f:facet>                                  
    
    <h:commandLink id="showHideSections" action="#{listModulesPage.showHideSections}" immediate="true">
        <h:graphicImage id="exp_gif" alt="#{msgs.list_modules_stud_expand}" title="#{msgs.list_modules_stud_expand}" value="images/expand.gif" rendered="#{((vmbean.moduleId != listModulesPage.showModuleId)&&(vmbean.vsBeans != listModulesPage.nullList)&&(listModulesPage.expandAllFlag != listModulesPage.trueFlag))}" styleClass="ExpClass"/>
          <h:graphicImage id="col_gif" alt="#{msgs.list_modules_stud_collapse}" title="#{msgs.list_modules_stud_collapse}" value="images/collapse.gif" rendered="#{(((vmbean.moduleId == listModulesPage.showModuleId)&&(vmbean.vsBeans != listModulesPage.nullList))||((listModulesPage.expandAllFlag == listModulesPage.trueFlag)&&(vmbean.vsBeans != listModulesPage.nullList)))}" styleClass="ExpClass"/>
       </h:commandLink> 
      <h:outputText id="mod_seq" value="#{vmbean.seqNo}. " rendered="#{listModulesPage.autonumber}"/>
         <h:commandLink id="viewModule"  actionListener="#{listModulesPage.viewModule}" action="#{listModulesPage.redirectToViewModule}" rendered="#{vmbean.visibleFlag == listModulesPage.trueFlag}" immediate="true">
              <f:param name="modidx" value="#{listModulesPage.modTable.rowIndex}" />
                  <h:outputText id="title"
                           value="#{vmbean.title}" >
              </h:outputText>             
          </h:commandLink>
          <h:outputText id="titleTxt2" value="#{vmbean.title}" rendered="#{vmbean.visibleFlag != listModulesPage.trueFlag}"/>         
        
        <h:dataTable id="tablesec" rendered="#{((vmbean.moduleId == listModulesPage.showModuleId)||(listModulesPage.expandAllFlag == listModulesPage.trueFlag))}"
                  value="#{vmbean.vsBeans}"
                  var="vsbean" rowClasses="#{vmbean.rowClasses}" width="95%" binding="#{listModulesPage.secTable}" summary="#{msgs.list_modules_stud_sections_summary}">
                    <h:column> 
              <h:graphicImage id="bul_gif" value="images/bullet_black.gif" rendered="#{!listModulesPage.autonumber}"/>
             
	       <h:outputText id="sec_seq" value="#{vsbean.displaySequence}. " rendered="#{listModulesPage.autonumber}"/>    
             <h:commandLink id="viewSectionEditor"   actionListener="#{listModulesPage.viewSection}" action="#{listModulesPage.redirectToViewSection}"  rendered="#{((vsbean.contentType != listModulesPage.isNull && vsbean.contentType == listModulesPage.typeLink)&&(vmbean.visibleFlag == listModulesPage.trueFlag))}" immediate="true">
               <f:param name="modidx" value="#{listModulesPage.modTable.rowIndex}" />
               <f:param name="secidx" value="#{listModulesPage.secTable.rowIndex}" />
 
               <h:outputText id="sectitleEditor" 
                           value="#{vsbean.title}">
               </h:outputText>
             </h:commandLink>
             <h:commandLink id="viewSectionLink"   actionListener="#{listModulesPage.viewSection}" action="#{listModulesPage.redirectToViewSectionLink}"  rendered="#{((vsbean.contentType != listModulesPage.isNull && vsbean.contentType != listModulesPage.typeLink)&&(vmbean.visibleFlag == listModulesPage.trueFlag))}" immediate="true">
                <f:param name="modidx" value="#{listModulesPage.modTable.rowIndex}" />
               <f:param name="secidx" value="#{listModulesPage.secTable.rowIndex}" />
            
               <h:outputText id="sectitleLink" 
                           value="#{vsbean.title}">
               </h:outputText>
             </h:commandLink>             
             <h:outputText id="sectitleEditorTxt2" value="#{vsbean.title}" rendered="#{vmbean.visibleFlag != listModulesPage.trueFlag}"/>
             </h:column>
          </h:dataTable>
          
          <h:outputText id="emp_space6_bul" value="  " styleClass="NextStepsPaddingClass"/>
          <h:outputText id="next_seq" value="#{vmbean.nextStepsNumber}. " rendered="#{listModulesPage.autonumber && vmbean.whatsNext != listModulesPage.isNull && ((listModulesPage.expandAllFlag == listModulesPage.trueFlag)||(vmbean.moduleId == listModulesPage.showModuleId))}"/>
          <h:graphicImage id="bul_gif1" value="images/bullet_black.gif" rendered="#{!listModulesPage.autonumber && vmbean.whatsNext != listModulesPage.isNull && ((listModulesPage.expandAllFlag == listModulesPage.trueFlag)||(vmbean.moduleId == listModulesPage.showModuleId))}" style="border:0"/>
          
          <h:commandLink id="whatsNext" action="#{listModulesPage.goWhatsNext}" immediate="true" rendered="#{((vmbean.visibleFlag == listModulesPage.trueFlag)&&(vmbean.whatsNext != listModulesPage.isNull)&&((listModulesPage.expandAllFlag == listModulesPage.trueFlag)||(vmbean.moduleId == listModulesPage.showModuleId)))}">
		    <h:outputText  id="whatsNextMsg" value="#{msgs.list_modules_stud_next_steps}" />
		    <f:param name="modidx2" value="#{listModulesPage.modTable.rowIndex}" />
		    <f:param name="modseqno" value="#{vmbean.seqNo}" />
          </h:commandLink>  
          <h:outputText  id="whatsNextMsg2" value="#{msgs.list_modules_stud_next_steps}" rendered="#{((vmbean.visibleFlag != listModulesPage.trueFlag)&&(vmbean.whatsNext != listModulesPage.isNull)&&((listModulesPage.expandAllFlag == listModulesPage.trueFlag)||(vmbean.moduleId == listModulesPage.showModuleId)))}"/>
           </h:column>
           <h:column>
           <f:facet name="header">
             <h:panelGroup>
             <h:outputText value="#{msgs.list_modules_stud_start_date}" />
             </h:panelGroup>
           </f:facet>  
            <h:outputText id="startDate0" 
                           value="-"    rendered="#{(vmbean.startDate == listModulesPage.nullDate)}">
            </h:outputText>
                <h:outputText id="startDate" 
                           value="#{vmbean.startDate}" rendered="#{(vmbean.startDate != listModulesPage.nullDate)}">
              <f:convertDateTime pattern="yyyy-MMM-d hh:mm a"/>
            </h:outputText>
          </h:column>
      <h:column>
      <f:facet name="header">
        <h:panelGroup>
        <h:outputText value="#{msgs.list_modules_stud_end_date}" />
        </h:panelGroup>
        </f:facet>
        
       <h:outputText id="endDate0" 
                           value="-"    rendered="#{(vmbean.endDate == listModulesPage.nullDate)}">
            </h:outputText>
               <h:outputText id="endDate"
                           value="#{vmbean.endDate}" rendered="#{(vmbean.endDate != listModulesPage.nullDate)}">
               <f:convertDateTime pattern="yyyy-MMM-d hh:mm a"/>
            </h:outputText>
         </h:column>
		 <h:column rendered="#{listModulesPage.printable}">  
         <h:outputLink id="printModuleLink" value="list_modules_student" onclick="OpenPrintWindow(#{listModulesPage.printModuleId},'Melete Print Window');" rendered="#{vmbean.visibleFlag}">
	 	    <h:graphicImage id="printImgLink" value="images/printer.png"  alt="#{msgs.list_auth_modules_alt_print}" title="#{msgs.list_auth_modules_alt_print}" styleClass="AuthImgClass"/>
	 	 </h:outputLink>
	    
	    </h:column>	      
      </h:dataTable>  
  
       	 <div class="actionBar" align="left">&nbsp;</div>
 
 <!--End Content-->
  	</h:form>
  </sakai:view>
</f:view>

