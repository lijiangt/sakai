package org.sakaiproject.contentres.tool.pages;


import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.model.ResourceModel;
import org.sakaiproject.contentres.model.Link;




public class HelloWorld extends BasePage{

	private static final Logger log = Logger.getLogger(BasePage.class); 

	public HelloWorld() {
		
		//simple labels
		add(new Label("current-user", userDirectoryService.getCurrentUser().getDisplayName()));
		add(new Label("current-date", new Date().toString()));
		
		//add some text from HelloWorldApplication.properties
		add(new Label("load-resource", new ResourceModel("sample.text")));
		List<Link> links = linkService.getAll();
		if(links.size()>0){
			Link link = links.get(0);
			add(new Label("link","name: "+ link.getName()+"  URL: "+link.getUrl()));
		}else{
			add(new Label("link","no record!"));
		}
	}
	
}



