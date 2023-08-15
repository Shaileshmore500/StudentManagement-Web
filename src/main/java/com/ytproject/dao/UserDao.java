package com.ytproject.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import org.apache.coyote.http11.Http11AprProtocol;
import org.apache.jasper.tagplugins.jstl.core.Out;

import com.mysql.cj.Session;
import com.ytproject.entities.Message;
import com.ytproject.entities.User;
import com.ytproject.entities.post;

public class UserDao {
	private Connection con;

	// fetch connection via constructor
	public UserDao(Connection con) {
		this.con = con;
	}

	// create method for insert data user to database
	// create object for fetch data from User class

	// Register and save user
	public boolean saveUser(User user) {

		boolean f = false;
		try {

			String query = "insert into user_inf (name , email , contact , password , profile_image) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			// set data
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getNumber());
			pstmt.setString(4, user.getPassword());
			pstmt.setString(5, user.getProfile_img());
			pstmt.executeUpdate();

			f = true;

		} catch (Exception e) {
			// TODO: handle exception

			e.printStackTrace();
		}
		return f;

	}

	// for login user
	public User login(String email, String password) {
		User user = null;
		try {
			String q = "select * from user_inf where email=? and password=?";

			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				user = new User();
				// --->>fetch data from database
				int id = set.getInt("id");
				String name = set.getString("name");
				String Email = set.getString("email");
				// --->>set data in user or pass data in user
				user.setId(id);
				user.setName(name);
				user.setEmail(Email);
				// -->> 2nd method to set data in user
				user.setPassword(set.getString("password"));
				user.setProfile_img(set.getString("profile_image"));
				user.setNumber(set.getString("contact"));
				user.setRegister_date(set.getTimestamp("rdate"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public boolean update_user(User user) {

		boolean f = false;
		try {

			String q = "update user_inf set name=? , email=? , contact=?  , profile_image=? , password=? where id=?";
			PreparedStatement pstmt = con.prepareStatement(q);
			// set values
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getNumber());
			pstmt.setString(4, user.getProfile_img());
			pstmt.setString(5, user.getPassword());
			pstmt.setInt(6, user.getId());

			pstmt.executeUpdate();

			System.out.println(user.getPassword());

			f = true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return f;
	}

	// ----------------------add post-------------------

	public boolean add_post(post p) {
		System.out.println("in user dao");
		boolean f = false;
		try {

			String query = "insert into post (cId,pTitle , pContent , pCode , pLink , pPic,userId ) values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			// set data
			pstmt.setInt(1, p.getcId());
			pstmt.setString(2, p.getpTitle());
			pstmt.setString(3, p.getpContent());
			pstmt.setString(4, p.getpCode());
			pstmt.setString(5, p.getpLink());
			pstmt.setString(6, p.getpPic());
			pstmt.setInt(7, p.getUserId());

			
			int a= pstmt.executeUpdate();
System.out.println("this is a"+a);
			f = true;
			System.out.println("post saving in user Dio");
			
		} catch (Exception e) {
			f=false;
			e.printStackTrace();
			
			
			
		}
		return f;

	}

}
