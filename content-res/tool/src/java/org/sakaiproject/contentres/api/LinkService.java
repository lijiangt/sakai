package org.sakaiproject.contentres.api;

import java.util.List;

import org.sakaiproject.contentres.model.Link;

public interface LinkService {
	void add(Link l);
	
	void delete(long id);
	
	List<Link> getAll();
	
	void justForTest();
	
	void justForTest2();
}
