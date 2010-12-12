package org.sakaiproject.contentres.tool;

import org.sakaiproject.contentres.tool.pages.BasePage;
import org.sakaiproject.contentres.tool.pages.HelloWorld;

public class Dispatcher extends BasePage {
	
	public Dispatcher() {
		super();
		
		setResponsePage(new HelloWorld());
		
	}
}
