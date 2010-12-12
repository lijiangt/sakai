package org.sakaiproject.contentres.tool;

import org.apache.wicket.Application;
import org.apache.wicket.protocol.http.WebApplication;
import org.sakaiproject.contentres.api.LinkService;
import org.sakaiproject.user.api.UserDirectoryService;

public class HelloWorldApplication extends WebApplication {    
	
	protected void init(){
		getResourceSettings().setThrowExceptionOnMissingResource(true);
		getMarkupSettings().setStripWicketTags(true);
	}
	
	//set to DEPLOYMENT for production
	public String getConfigurationType() { return Application.DEVELOPMENT; }
	
	public HelloWorldApplication() {
	}
	
	//setup homepage		
	public Class<Dispatcher> getHomePage() {
		return Dispatcher.class;
	}
	
	//getter for Application 
	public static HelloWorldApplication get() {
		return (HelloWorldApplication) Application.get();
	}
	
	private UserDirectoryService userDirectoryService;
	public UserDirectoryService getUserDirectoryService() {
		return userDirectoryService;
	}

	public void setUserDirectoryService(UserDirectoryService userDirectoryService) {
		this.userDirectoryService = userDirectoryService;
	}
	
	private LinkService linkService;
	/**
	 * @param linkService the linkService to set
	 */
	public void setLinkService(LinkService linkService) {
		this.linkService = linkService;
	}

	/**
	 * @return the linkService
	 */
	public LinkService getLinkService() {
		return linkService;
	}
	
	
	
}
