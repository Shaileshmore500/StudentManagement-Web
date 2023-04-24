package com.ytproject.entities;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ytproject.helper.ConnectionProvider;

public class like {
	PreparedStatement pstmt ;
	int count=0;
	String s="";
	public String like_count(int pid) {
		
		String q2="select count(*) as count from like_status where pid=?";
		
		 try {
			pstmt=ConnectionProvider.getConnection().prepareStatement(q2);
			pstmt.setInt(1, pid);
			ResultSet set= pstmt.executeQuery();
			while(set.next()) {
				 count=set.getInt(1);	
				
				 s=String.valueOf(count);
					 
				 return s;
				 
				 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//System.out.println(count);
		 count=0;
return s;
		
	}
	public boolean dislike(int u,int p) 
	{
		boolean f= false;
		try {
		String q="delete from like_status where pid=? and uid=?";
		pstmt=ConnectionProvider.getConnection().prepareStatement(q);
		pstmt.setInt(1, p);
		pstmt.setInt(2, u);
		pstmt.executeUpdate();
		f=true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	

	public boolean dolike(int u,int p) {
	
boolean f=false;
	
	
	try {
		//ConnectionProvider con= new ConnectionProvider();
		String q="insert into like_status (pid,uid) values(?,?)";
		  pstmt=ConnectionProvider.getConnection().prepareStatement(q);
		pstmt.setInt(1, p);
		pstmt.setInt(2, u);
//		pstmt.setString(3, a);
		pstmt.executeUpdate();
		
		f=true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	
	
	
return f;
}
	public boolean like_status(int pid,int uid) {
		return false;
		
		
	}
}
