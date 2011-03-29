package org.sakaiproject.res.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.sakaiproject.res.model.Link;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class LinkDao extends JdbcDaoSupport {
	public void add(Link l) {
		this.getJdbcTemplate().update(
				"insert into RES_LINKS(ID,NAME,URL) value(?,?,?)",
				new Object[] { l.getId(), l.getName(), l.getUrl() });
	}

	public void delete(long id) {
		this.getJdbcTemplate().update("delete from RES_LINKS where ID=?",
				new Object[] { id });
	}

	@SuppressWarnings("unchecked")
	public List<Link> getAll() {
		return this.getJdbcTemplate().query("select ID,NAME,URL from RES_LINKS",
				new RowMapper() {

					public Object mapRow(ResultSet rs, int mapRow)
							throws SQLException {
						Link l = new Link();
						l.setId(rs.getLong("ID"));
						l.setName(rs.getString("NAME"));
						l.setUrl(rs.getString("URL"));
						return l;
					}
				});
	}
}