package com.ssetest.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static final String username = "root";
	private static final String password = "Delumpa1!";
	private static final String dbUrl = "jdbc:mysql://localhost/JiveTest?autoReconnect=true&useSSL=false";
	
	public static Connection getConnection() throws SQLException{
		
		return DriverManager.getConnection(dbUrl, username, password);
	}
	
}
