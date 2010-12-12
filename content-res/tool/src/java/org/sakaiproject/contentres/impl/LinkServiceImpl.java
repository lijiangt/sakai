package org.sakaiproject.contentres.impl;

import java.util.List;

import org.sakaiproject.contentres.api.LinkService;
import org.sakaiproject.contentres.model.Link;

public class LinkServiceImpl implements LinkService {
	private LinkDao linkDao;

	/**
	 * @param linkDao the linkDao to set
	 */
	public void setLinkDao(LinkDao linkDao) {
		this.linkDao = linkDao;
	}

	public void add(Link l) {
		linkDao.add(l);
	}

	public void delete(long id) {
		linkDao.delete(id);
	}

	public List<Link> getAll() {
		return linkDao.getAll();
	}

	public void justForTest() {
		Link l = new Link();
		l.setId(111);
		l.setName("google");
		l.setUrl("http://www.google.com");
		linkDao.add(l);
		if(true){
			throw new RuntimeException();
		}
		linkDao.delete(l.getId());
	}

	public void justForTest2() {
		Link l = new Link();
		l.setId(111);
		l.setName("google");
		l.setUrl("http://www.google.com");
		linkDao.add(l);
		if(false){
			throw new RuntimeException();
		}
		linkDao.delete(l.getId());
	}
	
	
	
}
