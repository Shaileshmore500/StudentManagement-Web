package com.ytproject.helper;



import java.sql.*;



public class ConnectionProvider {

	private static Connection con;
	
	public static Connection getConnection() {
		
		
		try {
//			
			//System.out.println("hii1");
			Class.forName("com.mysql.cj.jdbc.Driver");
			//System.out.println("hii2");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ytprooject", "root", "");
		} catch (Exception e) {
			e.printStackTrace();
			
		} 
	
		
	
		return con;
	}
	
}
