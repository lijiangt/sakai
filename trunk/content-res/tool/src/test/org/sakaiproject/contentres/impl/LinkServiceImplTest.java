package org.sakaiproject.contentres.impl;

import javax.sql.DataSource;

import org.sakaiproject.contentres.api.LinkService;
import org.sakaiproject.contentres.model.Link;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.AbstractDependencyInjectionSpringContextTests;

public class LinkServiceImplTest extends
AbstractDependencyInjectionSpringContextTests {
	
	protected String[] getConfigLocations() {
		return new String[] { "components-test.xml", "components.xml" };
	}
	
	 /* (non-Javadoc)
	 * @see
	 org.springframework.test.AbstractTransactionalSpringContextTests#onSetUp()
	 */
	 @Override
	 protected void onSetUp() throws Exception {
	 super.onSetUp();
//	 this.executeSqlScript("org/sakaiproject/contentres/impl/recreate_table_link.sql", true);
	 JdbcTemplate jdbcTemplate = new JdbcTemplate((DataSource) this.applicationContext.getBean("javax.sql.LazyDataSource"));
	 // this.jdbcTemplate.execute("delete from LINK");
	 jdbcTemplate.execute("DROP TABLE IF EXISTS LINK");
	 jdbcTemplate.execute("CREATE TABLE LINK (id bigint(20) NOT NULL, name varchar(150) NOT NULL, url varchar(2000) NOT NULL, PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8");
	 linkService = (LinkService)
	 this.applicationContext.getBean("org.sakaiproject.contentres.api.LinkService");
	 }
	private LinkService linkService;

	public void testAdd() {
		int count = linkService.getAll().size();
		Link l = new Link();
		l.setId(11);
		l.setName("sohu");
		l.setUrl("http://www.sohu.com");
		linkService.add(l);
		assertEquals(count + 1, linkService.getAll().size());
	}

	public void testJustForTest() {
		try {
			linkService.justForTest();
			fail("No exception throws");
		} catch (Throwable e) {

		}
		assertEquals(0, linkService.getAll().size());
	}

//	public void testJustForTest2() {
//		try {
//			linkService.justForTest2();
//			fail("No exception throws");
//		} catch (Throwable e) {
//
//		}
//		assertEquals(0, linkService.getAll().size());
//	}
}
