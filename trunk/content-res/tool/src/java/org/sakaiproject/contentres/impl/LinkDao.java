package org.sakaiproject.contentres.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.sakaiproject.contentres.model.Link;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class LinkDao extends JdbcDaoSupport {
	public void add(Link l) {
		this.getJdbcTemplate().update(
				"insert into LINK(id,name,url) value(?,?,?)",
				new Object[] { l.getId(), l.getName(), l.getUrl() });
	}

	public void delete(long id) {
		this.getJdbcTemplate().update("delete from LINK where id=",
				new Object[] { id });
	}

	@SuppressWarnings("unchecked")
	public List<Link> getAll() {
		return this.getJdbcTemplate().query("select id,name,url from LINK",
				new RowMapper() {

					public Object mapRow(ResultSet rs, int mapRow)
							throws SQLException {
						Link l = new Link();
						l.setId(rs.getLong("id"));
						l.setName(rs.getString("name"));
						l.setUrl(rs.getString("url"));
						return l;
					}
				});
	}
}
