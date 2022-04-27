package com.connection;

import org.apache.commons.dbcp.BasicDataSource;
import java.security.SecureRandom;
import java.sql.*;
import java.util.Random;

@SuppressWarnings("unused")
public class DatabaseConnection {
	static Connection con;

	public static Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/squad?useSSL=false", "root", "dhruvagrawal");
	}

	public static ResultSet getResultFromSqlQuery(String SqlQueryString) {
		ResultSet rs = null;
		try {
			con = getConnection();
			rs = con.createStatement().executeQuery(SqlQueryString);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return rs;
	}

	public static void insertUpdateFromSqlQuery(String SqlQueryString) {
		try {
			if (con == null) {
				getConnection();
			}
			con.createStatement().executeUpdate(SqlQueryString);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}