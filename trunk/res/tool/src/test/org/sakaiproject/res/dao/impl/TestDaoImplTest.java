package org.sakaiproject.res.dao.impl;

import junit.framework.TestCase;

import org.sakaiproject.res.dao.TestDao;

public class TestDaoImplTest extends TestCase {
	public void testGetObj(){
		TestDao dao = new TestDaoImpl();
		String[] obj = dao.getObj();
		assertEquals("11111111", obj[0]);
		assertEquals("test name", obj[1]);
	}
}
