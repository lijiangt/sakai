/**********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.8.2/melete-util/src/java/org/etudes/simpleti/SakaiSimpleLTI.java $
 * $Id: SakaiSimpleLTI.java 63728 2009-10-01 22:57:28Z rashmi@etudes.org $
 **********************************************************************************
 *
 * Copyright (c) 2008, 2009 Etudes, Inc.
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
 **********************************************************************************/

package org.etudes.simpleti;

import java.util.Map;
import java.util.List;
import java.util.Properties;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.net.URL;
import java.net.URLEncoder;

import org.imsglobal.basiclti.XMLMap;
import org.imsglobal.simplelti.SimpleLTIUtil;
import org.sakaiproject.user.api.User;
import org.sakaiproject.user.cover.UserDirectoryService;
import org.sakaiproject.component.cover.ServerConfigurationService;
import org.sakaiproject.authz.cover.AuthzGroupService;
import org.sakaiproject.authz.api.AuthzGroup;
import org.sakaiproject.authz.cover.SecurityService;
import org.sakaiproject.site.api.Site;
import org.sakaiproject.site.cover.SiteService;
import org.sakaiproject.authz.api.GroupNotDefinedException;
import org.sakaiproject.entity.api.Reference;

/**
 * Some Utility code for Sakai Simple LTI
 */
public class SakaiSimpleLTI {

    private static Log M_log = LogFactory.getLog(SakaiSimpleLTI.class);

    public static final boolean verbosePrint = false;

    public static void dPrint(String str)
    {
        if ( verbosePrint ) M_log.warn(str);
    }

    public static Properties getLaunchProperties(String descriptor, String siteId, String resourceId)
    {
        Properties newMap = SimpleLTIUtil.parseDescriptor(descriptor);
        newMap.setProperty("action", "launchresolve");
        if ( newMap == null ) return null;

	// We demand an endpoint
        String lti2EndPoint = newMap.getProperty("launchurl");
        if ( lti2EndPoint == null || lti2EndPoint.trim().length() < 1 )
	{
		// TODO: Need to send back an error code
		return null;
	}

        String lti2ToolId = newMap.getProperty("tool_id");
        String lti2LaunchTypes = newMap.getProperty("accept_targets");

        String lti2Password = newMap.getProperty("secret");
        String lti2Resource = newMap.getProperty("resource");
        String lti2Widget = newMap.getProperty("widget");
        String lti2Height = newMap.getProperty("height");
        String lti2Width = newMap.getProperty("width");
        String lti2FrameHeight = newMap.getProperty("frameheight");

	// When in doubt be very secretive...
	// if ( lti2Password == null ) lti2Password = "secret";

	User user = UserDirectoryService.getCurrentUser();
	dPrint("User="+user);
	if ( user == null ) return null;
	dPrint("UserId="+user.getId());
        // Get our org_id and org_secret
        String org_id = ServerConfigurationService.getString("simplelti.org_id", null);
        String org_secret = null;

        if ( org_id != null ) {
                org_secret = getOrgSecret(lti2EndPoint);
                dPrint("org_id="+org_id+" org_secret="+org_secret);
        }

        // Add Nonce
        SimpleLTIUtil.addNonce(newMap,lti2Password,org_id,org_secret);

        // Resource/launch level details
        newMap.setProperty("launch_resource_id",resourceId);

        // Only do this if there is not one specified
        if ( lti2ToolId != null ) {
                newMap.setProperty("launch_tool_id", lti2ToolId);
        }

        // Request a widget
        if ( "on".equals(lti2Widget) ) {
                newMap.setProperty("launch_targets","widget,iframe,post");
	} else if ( lti2LaunchTypes != null ) {
                newMap.setProperty("launch_targets",lti2LaunchTypes);
        } else {
                newMap.setProperty("launch_targets","iframe,post,widget");
        }

        if ( lti2Width != null ) {
                newMap.setProperty("launch_width",lti2Width);
        }
        if ( lti2Height != null ) {
                newMap.setProperty("launch_height",lti2Height);
        }

        // TODO: Think about anonymus
        if ( user != null )
        {
                newMap.setProperty("user_id",user.getId());
                newMap.setProperty("user_firstname",user.getFirstName());
                newMap.setProperty("user_lastname",user.getLastName());
                newMap.setProperty("user_fullname",user.getDisplayName());
                newMap.setProperty("user_displayid",user.getDisplayId());
                newMap.setProperty("user_email",user.getEmail());
                newMap.setProperty("user_locale","en_US"); // TODO: Really get this
        }

        Site site = null;
        try {
                site = SiteService.getSite(siteId);
        } catch (Exception e) {
                dPrint("Could retrieve siteId="+siteId);
        }
	dPrint("site="+site);

        String theRole = "Student";
        if ( SecurityService.isSuperUser() )
        {
                theRole = "Administrator";
        }

        if ( site != null ) {
                newMap.setProperty("course_id",site.getId());
		String title = site.getTitle();
                if ( title != null ) 
		{
			newMap.setProperty("course_title",title);
		}
                String desc = site.getShortDescription();
		if ( desc != null ) 
		{
                	newMap.setProperty("course_name",desc);
		}
        	if ( SiteService.allowUpdateSite(site.getId()) )
        	{
                	theRole = "Instructor";
        	}
                String courseRoster = getExternalRealmId(site.getId());
                if ( courseRoster != null )
                {
                        newMap.setProperty("course_code",courseRoster);
                }
                // Hack for now - someday we will look deeper to find the precise user roster
                if ( courseRoster != null ) newMap.setProperty("user_roster",courseRoster);
        }
        newMap.setProperty("user_role",theRole);

        if( lti2Resource != null && lti2Resource.length() > 0 ) {
                newMap.setProperty("launch_resource_url",lti2Resource);
        }

        newMap.setProperty("launchurl",lti2EndPoint);
        if ( lti2FrameHeight != null ) newMap.setProperty("frameheight",lti2FrameHeight);
	dPrint("getLaunchProperties returning newMap = "+newMap);
        return newMap;
    }

    /* Do the Launch.  At this point, we are in a page where we want to embed the tool.
       This returns some HTML text that can be dropped into a web page.  If possible,
       this page will return a form with some HTML and Javascript to automatically 
       submit the form.  Alternatively is this is an iframe response, the iframe text
       will be returned.  If this is a widget response, the widget text will be returned.
       
       The non-POST approach is effectively deprecated because of the upcoming transition
       to BasicLTI and full LTI 2.0 will only support the POST launch.
     */
    public static Properties doLaunch(String descriptor, String siteId, String resourceId)
    {
        Properties newMap = getLaunchProperties(descriptor, siteId, resourceId);
        if ( newMap == null ) {
            M_log.warn("SakaiSimpleLTI.doLaunch, invalid descriptor");
            return null;
        }
        Properties pro = new Properties();
        String lti2EndPoint = newMap.getProperty("launchurl");
        if ( SimpleLTIUtil.isPostLaunch(descriptor) ) {
             String htmltext = SimpleLTIUtil.postLaunchHTML(newMap);
             pro.setProperty("htmltext",htmltext);
             pro.setProperty("status","success");
             pro.setProperty("type","post");
             pro.setProperty("launchurl",lti2EndPoint);
        } else {
            String lti2FrameHeight = newMap.getProperty("frameheight");
	    // Make the web-service call and then generate the HTML
            pro = SimpleLTIUtil.doLaunch(lti2EndPoint, newMap);
            // Add the HTML text to the properties
            SimpleLTIUtil.generateHtmlText(pro, newMap, lti2FrameHeight);
        }

	return pro;
    }

    private static String getExternalRealmId(String siteId) {
	String realmId = SiteService.siteReference(siteId);
	String rv = null;
	try {
		AuthzGroup realm = AuthzGroupService.getAuthzGroup(realmId);
		rv = realm.getProviderGroupId();
	} catch (GroupNotDefinedException e) {
		dPrint("SiteParticipantHelper.getExternalRealmId: site realm not found"+e.getMessage());
	}
	return rv;
    } // getExternalRealmId

        // String org_secret = ServerConfigurationService.getString("simplelti.org_secret");
        private static String getOrgSecret(String launchUrl)
        {
                String default_secret = ServerConfigurationService.getString("simplelti.org_secret",null);
                dPrint("launchUrl = "+launchUrl);
                URL url = null;
                try {
                        url = new URL(launchUrl);
                }
                catch (Exception e) {
                        url = null;
                }

                if ( url == null ) return default_secret;

                String hostName = url.getHost();
                dPrint("host = "+hostName);
                if ( hostName == null || hostName.length() < 1 ) return default_secret;

                // Look for the property starting with the full name
                String org_secret = ServerConfigurationService.getString("simplelti.org_secret."+hostName,null);
                if ( org_secret != null ) return org_secret;
                for ( int i = 0; i < hostName.length(); i++ ) {
                        if ( hostName.charAt(i) != '.' ) continue;
                        if ( i > hostName.length()-2 ) continue;
                        String hostPart = hostName.substring(i+1);
                        String propName = "simplelti.org_secret."+hostPart;
                        org_secret = ServerConfigurationService.getString(propName,null);
                        if ( org_secret != null ) return org_secret;
                }
                return default_secret;
        }

   
}
