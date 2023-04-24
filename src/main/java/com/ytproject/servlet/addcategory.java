package com.ytproject.servlet;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.jdbc.PreparedStatementWrapper;
import com.ytproject.helper.ConnectionProvider;

/**
 * Servlet implementation class addcategory
 */
@WebServlet("/addcategory")
public class addcategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addcategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		try
		{
		out.print("hii");
		String catname=request.getParameter("cat_name");
		String catdesc=request.getParameter("Decsription");
		ConnectionProvider con=new ConnectionProvider();
		String query2 = "insert into category (cat_name,cat_desc) values(?,?)";
		PreparedStatement pstmt2 = con.getConnection().prepareStatement(query2);
		
		pstmt2.setString(1,catname);
		pstmt2.setString(2,catdesc);
		int a= pstmt2.executeUpdate();
		out.print(a);
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
	}

}
