package org.sakaiproject.res.api;

import java.util.List;

import org.sakaiproject.res.model.Link;

public interface LinkService {
	void add(Link l);
	
	void delete(long id);
	
	List<Link> getAll();
}
