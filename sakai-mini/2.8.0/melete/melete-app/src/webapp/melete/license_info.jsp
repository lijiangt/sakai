<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-app/src/webapp/melete/license_info.jsp $
 * $Id: license_info.jsp 61779 2009-07-14 17:29:43Z mallika@etudes.org $  
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
   <!--License code Copyright-->
   <h:outputText id="lic1_val1" value="#{msgs.license_info_copyright}" 

rendered="#{viewSectionsPage.section.sectionResource.resource.licenseCode == 1}"/> 
 <h:outputText id="lic1_val4" value="#{viewSectionsPage.section.sectionResource.resource.copyrightYear}" rendered="#{((viewSectionsPage.section.sectionResource.resource.licenseCode == 1)&&(viewSectionsPage.section.sectionResource.resource.copyrightYear != viewSectionsPage.nullString))}"/> 
      <h:outputText id="lic1_val2" escape="false" value="<BR>#{viewSectionsPage.section.sectionResource.resource.copyrightOwner}" 

rendered="#{viewSectionsPage.section.sectionResource.resource.licenseCode == 1}"/> 
  
      <!--End license code Copyright-->
 <!--License code Public domain-->
   <h:outputText id="lic2_val1" value="#{msgs.license_info_dedicated_to}" 

rendered="#{viewSectionsPage.section.sectionResource.resource.licenseCode == 2}"/> 
   <h:outputLink value="#{viewSectionsPage.section.sectionResource.resource.ccLicenseUrl}" target="_blank" 

rendered="#{viewSectionsPage.section.sectionResource.resource.licenseCode == 2}">
   <h:outputText id="lic2_val2" value="#{msgs.license_info_public_domain}" 

rendered="#{viewSectionsPage.section.sectionResource.resource.licenseCode == 2}"/> 
   </h:outputLink>
   <h:outputText id="lic2_val5" value=" #{viewSectionsPage.section.sectionResource.resource.copyrightYear}" rendered="#{((viewSectionsPage.section.sectionResource.resource.licenseCode == 2)&&(viewSectionsPage.section.sectionResource.resource.copyrightYear != viewSectionsPage.nullString))}"/> 
   <h:outputText id="lic2_val3" escape="false" value="<BR>#{viewSectionsPage.section.sectionResource.resource.copyrightOwner}"  

rendered="#{((viewSectionsPage.section.sectionResource.resource.licenseCode == 2)&&(viewSectionsPage.section.sectionResource.resource.copyrightOwner != viewSectionsPage.nullString))}"/> 
  
      <!--End license code Public domain-->   
      <!--License code CC license-->
   <h:outputText id="lic3_val1" value="#{msgs.license_info_licensed_under}" 

rendered="#{viewSectionsPage.section.sectionResource.resource.licenseCode == 3}"/> 
   <h:outputLink value="#{viewSectionsPage.section.sectionResource.resource.ccLicenseUrl}" target="_blank" 

rendered="#{viewSectionsPage.section.sectionResource.resource.licenseCode == 3}">
   <h:outputText id="lic3_val2" value="#{msgs.license_info_creative_commons}" 

rendered="#{viewSectionsPage.section.sectionResource.resource.licenseCode == 3}"/>
   </h:outputLink> <h:outputText id="lic3_val5" value=" #{viewSectionsPage.section.sectionResource.resource.copyrightYear}" rendered="#{((viewSectionsPage.section.sectionResource.resource.licenseCode == 3)&&(viewSectionsPage.section.sectionResource.resource.copyrightYear != viewSectionsPage.nullString))}"/> 
   <h:outputText id="lic3_val3" escape="false" value="<BR>#{viewSectionsPage.section.sectionResource.resource.copyrightOwner}"  

rendered="#{((viewSectionsPage.section.sectionResource.resource.licenseCode == 3)&&(viewSectionsPage.section.sectionResource.resource.copyrightOwner != viewSectionsPage.nullString))}"/> 

   
      <!--End license code CC license-->     	
	 
        <!--License code fairuse license-->
      <h:outputText id="lic4_val2" value="#{msgs.license_info_fairuse}"  rendered="#{viewSectionsPage.section.sectionResource.resource.licenseCode == 4}"/>
      <h:outputText id="lic4_val5" value=" #{viewSectionsPage.section.sectionResource.resource.copyrightYear}" rendered="#{((viewSectionsPage.section.sectionResource.resource.licenseCode == 4)&&(viewSectionsPage.section.sectionResource.resource.copyrightYear != viewSectionsPage.nullString))}"/> 
       <h:outputText id="lic4_val3" escape="false" value="<BR>#{viewSectionsPage.section.sectionResource.resource.copyrightOwner}"  

rendered="#{((viewSectionsPage.section.sectionResource.resource.licenseCode == 4)&&(viewSectionsPage.section.sectionResource.resource.copyrightOwner != viewSectionsPage.nullString))}"/> 

          <!--End license code fairuse license-->