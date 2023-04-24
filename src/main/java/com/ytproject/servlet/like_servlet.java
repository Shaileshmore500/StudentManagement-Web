package com.ytproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result;
import com.ytproject.entities.like;
import com.ytproject.helper.ConnectionProvider;

/**
 * Servlet implementation class like_servlet
 */
@WebServlet("/like_servlet")
public class like_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public like_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
			PrintWriter out =response.getWriter();
			
			//var count="";
		like l=new like();
		
		int p=Integer.parseInt(request.getParameter("pid"));
		//int p=10;
		String o=request.getParameter("operation");
		System.out.println(o);
		System.out.println(p);
		if((o).equals("like"))
		{
			int u=Integer.parseInt(request.getParameter("uid"));
			
			boolean i= l.dolike( u, p);
			System.out.println("in like");
			
			
		}
		
		if((o).equals("dislike"))
		{
			int u=Integer.parseInt(request.getParameter("uid"));
			System.out.println(u);
			
			boolean i= l.dislike(u, p);
			System.out.println("in dislike");
			
			
		}
		out.print(l.like_count(p));
		int []a= {1,2,3,4,5,6,7,8,9};
		out.println(a);
		/*if((o).equals("like_count"))
		{
			
			
			System.out.println("in like count");
			//
		 count= l.like_count(p);
		// System.out.println(count);
		 //System.out.println("count");
		
		HttpSession s=request.getSession();
		s.setAttribute("like_count", count);
		
		response.sendRedirect("post.jsp");
		
		}
		
		*/
		
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
	

}
