/**
 * 
 */
package com.ytproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;




/**
 * @author User
 *
 */
public class Dao {
	private static Connection con;

	/**
	 * 
	 */
	public Dao(Connection con) {
		// TODO Auto-generated constructor stub
		Dao.con=con;
	}
	public static ResultSet getData(String sql)
	{
		try {
			
			
			
			System.out.println(sql);
		PreparedStatement pstmt=con.prepareStatement(sql);
		/*
		PreparedStatement spt=con.prepareStatement("INSERT INTO `ytprooject`.`chatroom`\r\n"
				+ "(\r\n"
				+ "`description`,\r\n"
				+ "`senderid`,\r\n"
				+ "`receiverid`)\r\n"
				+ "VALUES\r\n"
				+ "('1ahjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj',4,7),('7jhgggggggggggggggggggggggggg',4,1),('1hgggggggggggggggggggggggggggggggggggggggggggggggggggggggggg',4,7),('7hggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg',4,1);");
		System.out.println(spt.executeUpdate());
		*/
		ResultSet set=pstmt.executeQuery();
		
	
		
		
		return set;
		}
		catch (Exception e) {
			// TODO: handle exception
			
			
			return null;
		}
		
		
		//return null;
	}
	public static int insertData(String sql ) 
	{
		try {
			PreparedStatement pstmt=con.prepareStatement(sql);
			System.out.println("inserted...");
			int count= pstmt.executeUpdate();
			return count;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

}
