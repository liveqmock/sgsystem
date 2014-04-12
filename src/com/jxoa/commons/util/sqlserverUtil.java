package com.jxoa.commons.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Flags.Flag;

import org.springframework.beans.factory.annotation.Autowired;

import com.jxoa.manager.zck.service.SyryglService;

public class sqlserverUtil {
	static Connection conn = null;

	/**
	 * 创建PreparedStatement对象
	 */
	private static PreparedStatement preparedStatement = null;
	
	/**
	 * 创建CallableStatement对象
	 */
	private static CallableStatement callableStatement = null;

	/**
	 * 创建结果集对象
	 */
	private static ResultSet resultSet = null;


	public static Connection getConnectionByJDBC(String ip) throws SQLException {
		try {
			// 装载驱动包类
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("装载驱动包出现异常!请查正！");
			e.printStackTrace();
		}
		String url = "jdbc:sqlserver://192.168.0.4:1433; DatabaseName=sg3d";
			conn = DriverManager.getConnection(url, "sa", "123456");
		return conn;
	}

	public static int zhixsql(String ip, String sql) {
		int m = 0;
		try {
			System.out.println(ip);
			getConnectionByJDBC(ip);
		} catch (SQLException e) {
			m = 1;
			System.out.println("链接数据库发生异常!");
			e.printStackTrace();
		}
		try {
			Statement stmt = conn.createStatement();
		
				if (!"".equals(sql)) {
					System.out.println(sql);
					stmt.executeUpdate(sql);
				}
			

		} catch (SQLException e) {// 执行sql失败
			m = 2;
			e.printStackTrace();
		} finally {
			// 预防性关闭连接（避免异常发生时在try语句块关闭连接没有执行)
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {// 连接失败
				m = 3;
				e.printStackTrace();
			}
		}
		return m;
	}
	
	
	
	public static List<Object> excuteQuery(String sql, String ip) {
		// 执行SQL获得结果集
		ResultSet rs = executeQueryRS(sql, "");
		
		// 创建ResultSetMetaData对象
		ResultSetMetaData rsmd = null;
		
		// 结果集列数
		int columnCount = 0;
		try {
			rsmd = rs.getMetaData();
			
			// 获得结果集列数
			columnCount = rsmd.getColumnCount();
		} catch (SQLException e1) {
			System.out.println(e1.getMessage());
		}

		// 创建List
		List<Object> list = new ArrayList<Object>();

		try {
			// 将ResultSet的结果保存到List中
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				for (int i = 1; i <= columnCount; i++) {
					map.put(rsmd.getColumnLabel(i), rs.getObject(i));
				}
				list.add(map);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			// 关闭所有资源
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {// 连接失败
				e.printStackTrace();
			}
		}

		return list;
	}

	private static ResultSet executeQueryRS(String sql, String ip) {
		try {
			getConnectionByJDBC(ip);
			
			// 调用SQL
			preparedStatement = conn.prepareStatement(sql);
			
			// 执行
			resultSet = preparedStatement.executeQuery();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return resultSet;
	}


}
