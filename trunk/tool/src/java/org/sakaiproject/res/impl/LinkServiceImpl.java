package org.sakaiproject.res.impl;

import java.util.List;

import org.sakaiproject.res.api.LinkService;
import org.sakaiproject.res.model.Link;

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

}