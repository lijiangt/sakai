package org.sakaiproject.contentres.tool.pages;

import org.apache.log4j.Logger;
import org.apache.wicket.markup.html.IHeaderContributor;
import org.apache.wicket.markup.html.IHeaderResponse;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.model.ResourceModel;
import org.sakaiproject.component.cover.ServerConfigurationService;
import org.sakaiproject.contentres.api.LinkService;
import org.sakaiproject.contentres.tool.HelloWorldApplication;
import org.sakaiproject.site.cover.SiteService;
import org.sakaiproject.tool.cover.SessionManager;
import org.sakaiproject.user.api.UserDirectoryService;


public class BasePage extends WebPage implements IHeaderContributor {
	
	private static final Logger log = Logger.getLogger(BasePage.class);
	protected transient UserDirectoryService userDirectoryService;
	
	protected transient LinkService linkService;

	
	public BasePage() {
		//super();
		
		if(log.isDebugEnabled()) log.debug("BasePage()");
		
		
    	//profile link
    	Link sampleLink = new Link("sampleLink") {
			public void onClick() {
				//setResponsePage(new MyProfile());
			}
		};
		sampleLink.add(new Label("sampleLinkLabel",new ResourceModel("sample.link")));
		add(sampleLink);
		
		
		//setup API's. Our other pages extend this page so will have this as well:
		userDirectoryService = HelloWorldApplication.get().getUserDirectoryService();
		linkService = HelloWorldApplication.get().getLinkService();
		
    }
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	//Style it like a Sakai tool
	protected static final String HEADSCRIPTS = "/library/js/headscripts.js";
	protected static final String BODY_ONLOAD_ADDTL="setMainFrameHeight( window.name )";
	
	public void renderHead(IHeaderResponse response) {
		//get Sakai skin
		String skinRepo = ServerConfigurationService.getString("skin.repo");
		String toolCSS = getToolSkinCSS(skinRepo);
		String toolBaseCSS = skinRepo + "/tool_base.css";
		
		//Sakai additions
		response.renderJavascriptReference(HEADSCRIPTS);
		response.renderCSSReference(toolBaseCSS);
		response.renderCSSReference(toolCSS);
		response.renderOnLoadJavascript(BODY_ONLOAD_ADDTL);
		
		//for jQuery
		response.renderJavascriptReference("javascript/jquery-1.2.5.min.js");
			
		//for datepicker
		response.renderCSSReference("css/flora.datepicker.css");
		response.renderJavascriptReference("javascript/jquery.ui.core-1.5.2.min.js");
		response.renderJavascriptReference("javascript/jquery.datepicker-1.5.2.min.js");

		//for cluetip
		response.renderCSSReference("css/jquery.cluetip.css");
		response.renderJavascriptReference("javascript/jquery.dimensions.js");
		response.renderJavascriptReference("javascript/jquery.hoverIntent.js");
		response.renderJavascriptReference("javascript/jquery.cluetip.js");
		
		//for color plugin
		//response.renderJavascriptReference("javascript/jquery.color.js");
		
		//Tool additions (at end so we can override if required)
		response.renderString("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />");
		//response.renderCSSReference("css/sample.css");
		//response.renderJavascriptReference("javascript/sample.js");
		
	}
	
	protected String getToolSkinCSS(String skinRepo) {
		String skin = null;
		try {
			skin = SiteService.findTool(SessionManager.getCurrentToolSession().getPlacementId()).getSkin();			
		}
		catch(Exception e) {
			skin = ServerConfigurationService.getString("skin.default");
		}
		
		if(skin == null) {
			skin = ServerConfigurationService.getString("skin.default");
		}
		
		return skinRepo + "/" + skin + "/tool.css";
	}
	
	
	
	
}
