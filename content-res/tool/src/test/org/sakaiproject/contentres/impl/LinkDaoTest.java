package org.sakaiproject.contentres.impl;

import org.sakaiproject.contentres.model.Link;
import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;

public class LinkDaoTest extends
		AbstractTransactionalDataSourceSpringContextTests {
	protected String[] getConfigLocations() {
		return new String[] { "classpath:components-test.xml", "classpath:components.xml" };
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.test.AbstractTransactionalSpringContextTests#onSetUp
	 * ()
	 */
	@Override
	protected void onSetUp() throws Exception {
		super.onSetUp();
		// this.jdbcTemplate.execute("delete from LINK");
		this.jdbcTemplate.execute("DROP TABLE IF EXISTS LINK");
		this.jdbcTemplate
				.execute("CREATE TABLE LINK (id bigint(20) NOT NULL, name varchar(150) NOT NULL, url varchar(2000) NOT NULL, PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8");
		linkDao = (LinkDao) this.applicationContext.getBean("linkDao");
	}

	private LinkDao linkDao;

	public void testAdd() {
		int count = linkDao.getAll().size();
		Link l = new Link();
		l.setId(11);
		l.setName("sohu");
		l.setUrl("http://www.sohu.com");
		linkDao.add(l);
		assertEquals(count + 1, linkDao.getAll().size());
	}
}
