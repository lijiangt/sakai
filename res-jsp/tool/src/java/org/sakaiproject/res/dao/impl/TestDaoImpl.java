package org.sakaiproject.res.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.sakaiproject.res.dao.TestDao;

public class TestDaoImpl implements TestDao {

	
	
	public String[] getObj() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sakai?useUnicode=true&characterEncoding=UTF-8", "root", "");
			ps = conn.prepareStatement("select id,name from test");
			rs = ps.executeQuery();
			if(rs.next()){
				return new String[]{rs.getString(1),rs.getString(2)};
			}
		} catch (InstantiationException e) {
			throw new RuntimeException(e);
		} catch (IllegalAccessException e) {
			throw new RuntimeException(e);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}finally{
				try {
					if(rs!=null){
					rs.close();
					}
					if(ps!=null){
						ps.close();
					}
					if(conn!=null){
						conn.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			
		}
		throw new RuntimeException();
	}

	public void addObj(String[] obj) {

	}

}
