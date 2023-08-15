package com.ytproject.helper;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class like_helper {
	Connection con=ConnectionProvider.getConnection();
	
	
	public boolean liked(int uid,int pid,String ip)
	{
		boolean f=false;
		try {
		
			String q="insert into like_status(uid,pid,ipaddress) values(?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setInt(1, pid);
			
			pstmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		
		
		
		return f;
	}

}
