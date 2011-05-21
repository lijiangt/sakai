<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/trunk/melete-app/src/webapp/melete/list_special_access.jsp $
 * $Id: list_special_access.jsp 68182 2010-06-15 20:18:18Z mallika@etudes.org $  
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
--%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://sakaiproject.org/jsf/sakai" prefix="sakai" %>

<f:view>
<sakai:view title="Modules: List Special Access" toolCssHref="rtbc004.css">

<%@include file="accesscheck.jsp" %>

<script type="text/javascript" language="javascript">

function selectAll()
{
  var listSizeStr = "listspecialaccessform:listSize";
  var listSizeVal = document.getElementById(listSizeStr).value;
  if (document.getElementById("listspecialaccessform:table:allacccheck") != null)
  {	  
  if (document.getElementById("listspecialaccessform:table:allacccheck").checked == true)
  {	  
    for (i=0;i<parseInt(listSizeVal);i++)
    {
	  var accchStr = "listspecialaccessform:table:"+i+":accCheck";
	  if (document.getElementById(accchStr).checked == false)
	  {	  
	    document.getElementById(accchStr).checked=true;
	  }  	  
    }
  } 
  else
  {	  
	  resetCheck();
   } 	   	  
  }
}

function resetCheck()
{
	 var inputs = document.getElementsByTagName("input");
	  for (var i = 0; i < inputs.length; i++) {   
		  if (inputs[i].type == "checkbox") {   
		  inputs[i].checked = false;
		  }
	  }	  
}

function resetAllAcc()
{
	if (document.getElementById("listspecialaccessform:table:allacccheck") != null)
	{	
	  document.getElementById("listspecialaccessform:table:allacccheck").checked=false;
	}
}

</script>

<h:form id="listspecialaccessform">
    <f:subview id="top">
		<jsp:include page="topnavbar.jsp"/> 
	</f:subview>
	<div class="meletePortletToolBarMessage"><img src="images/access.png" alt="" width="16" height="16" align="absbottom"><h:outputText value="#{msgs.list_special_access}" /> </div>
    <h:outputText id="title" value="#{specialAccessPage.module.title}"/>
	<h:messages showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
	
 <table width="100%" rules="rows" class="maintableCollapseWithBorder">
  <tr>
   <td>
 	<f:subview id="authtop">
    <h:panelGrid columns="2" columnClasses="authBarCol" cellspacing="5" width="16%">
	<h:column>
		<h:commandLink id="addAction" action="#{specialAccessPage.addAccessAction}" immediate="true">
		    <h:graphicImage id="addAccessImg" value="images/document_add.gif" styleClass="AuthImgClass"/>
	  		<h:outputText  value="#{msgs.list_special_access_add}"/>
		</h:commandLink>
	</h:column>
	<h:column>
		<h:commandLink id="delAction" action="#{specialAccessPage.deleteAction}">
	        <h:graphicImage id="deleteImg" value="images/delete.gif" styleClass="AuthImgClass"/>
	        <h:outputText  id="del" value="#{msgs.list_special_access_delete}"></h:outputText>
	     </h:commandLink>
	</h:column>
    </h:panelGrid>
	</f:subview>
  </td>
 </tr>
<tr>
   <td>
   <h:dataTable id="table" 
                  value="#{specialAccessPage.saList}"
                  var="saObj"  headerClass="tableheader" rowClasses="row1,row2" columnClasses="ListModCheckClass,ListTitleClass,ListDateInputClass,ListDateInputClass" 
                  cellpadding="3" cellspacing="0" 
				  width="100%" binding="#{specialAccessPage.table}" styleClass="valignStyle9" summary="#{msgs.list_special_access_summary}">
                      
    <h:column>
    <f:facet name="header">
    <h:panelGroup>
       <h:selectBooleanCheckbox id="allacccheck" value="#{specialAccessPage.selectAllFlag}" onclick="selectAll()" valueChangeListener="#{specialAccessPage.selectAllAccess}" rendered="#{specialAccessPage.noAccFlag == false}" />   
    </h:panelGroup> 
     </f:facet>                      
      <h:selectBooleanCheckbox id="accCheck" value="#{saObj.selected}" onclick="resetAllAcc()" valueChangeListener="#{specialAccessPage.selectedAccess}" />
        </h:column>               
   <h:column>
 	<f:facet name="header">
 	 <h:panelGroup>
      <h:outputText id="t2" value="#{msgs.list_special_access_name}" />
     </h:panelGroup>        
    </f:facet>	
     <h:commandLink id="editAcc" actionListener="#{specialAccessPage.editSpecialAccess}"  action="#{specialAccessPage.redirectToEditSpecialAccess}">     				
     <f:param name="accidx" value="#{specialAccessPage.table.rowIndex}" />
     <h:outputText id="title2" value="#{saObj.userNames}" escape="false"></h:outputText>
     </h:commandLink>
     </h:column>      
       <h:column>
        <f:facet name="header">
             <h:outputText id="t4" value="#{msgs.list_special_access_start_date}" />
             </f:facet>             
             <h:outputText id="startDate0" 
                           value="-"    rendered="#{((saObj.startDate == null)||(saObj.startDate == saObj.module.moduleshdate.startDate))}">
            </h:outputText>
                  <h:outputText id="startDate" 
                           value="#{saObj.startDate}"    rendered="#{((saObj.startDate != null)&&(saObj.startDate != saObj.module.moduleshdate.startDate))}">
              <f:convertDateTime pattern="yyyy-MMM-d hh:mm a"/>
            </h:outputText>
              </h:column>         
        <h:column>
               <f:facet name="header">
				 <h:outputText id="t6" value="#{msgs.list_special_access_end_date}" />
             </f:facet>
             
             <h:outputText id="endDate0" 
                           value="-"    rendered="#{((saObj.endDate == null)||(saObj.endDate == saObj.module.moduleshdate.endDate))}">
             </h:outputText>
              <h:outputText id="endDate"
                           value="#{saObj.endDate}"
                              rendered="#{((saObj.endDate != null)&&(saObj.endDate != saObj.module.moduleshdate.endDate))}">
               <f:convertDateTime pattern="yyyy-MMM-d hh:mm a"/>
            </h:outputText>
         </h:column>         
    </h:dataTable>   
   <h:inputHidden id="listSize" value="#{specialAccessPage.listSize}"/>   
   <div class="actionBar" align="left">				
	<h:commandButton id="returnButton"  immediate="true" action="#{specialAccessPage.returnAction}" value="#{msgs.im_return}" tabindex="" accesskey="#{msgs.return_access}" title="#{msgs.im_return_text}" styleClass="BottomImgReturn" />
   </div>	
	
<!--End Content-->
   </td>
  </tr> 

 </table>
</h:form>
</sakai:view>
<script type="text/javascript">
 		 resetCheck();	
</script>
</f:view>


 

 
