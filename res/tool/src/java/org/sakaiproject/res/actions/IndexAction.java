package org.sakaiproject.res.actions;

import org.sakaiproject.res.api.LinkService;
import org.springframework.beans.factory.annotation.Required;

import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9072977100759401624L;
	
	private LinkService linkService;
	
	
	@Required()
	public void setLinkService(LinkService linkService) {
		this.linkService = linkService;
	}

	private int count;


	public int getCount() {
		return count;
	}


	public String execute(){
		count = linkService.getAll().size();
		return SUCCESS;
	}

}
