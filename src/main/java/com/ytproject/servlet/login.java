package com.ytproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.ytproject.dao.UserDao;
import com.ytproject.entities.User;
import com.ytproject.entities.Message;
import com.ytproject.helper.ConnectionProvider;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out=response.getWriter();
			
			System.out.println("hiii");
		
		
		String email=request.getParameter("u_mail");
		String password=request.getParameter("u_password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User u =dao.login(email, password);
		
		if(u==null)
		{
//			out.print("invalide user"); 
			
			//show error sms in same page
			Message  m = new Message("**Invalide Details!Try with another", "error", "alert-danger bg-#eb0d0d pl-1 mt-1");
				
			//create HttpSession for send data in login jsp for show errors
			HttpSession s = request.getSession();
			s.setAttribute("msg" , m);
			response.sendRedirect("login_page.jsp");
			
			
			
		}else {
			//login sucessfully
			//create HttpSession and send data through session in profile.jsp
			HttpSession s=request.getSession();
			s.setAttribute("curentUser", u);
			response.sendRedirect("home_page.jsp");
		}
		
		
		
		
		
		
		
			
//			Connection con=	ConnectionProvider.getConnection();
//			
//			//crete Query
//			String q="select * from user_inf where email=? and password=?";
//			PreparedStatement pstmt=con.prepareStatement(q);
//			pstmt.setString(1, email);
//			pstmt.setString(2, password);
//			out.print("hivviiivv");
//			ResultSet set=pstmt.executeQuery();
//			
//			
//			if(set.next())
//			{
//				out.print("wellcome" + email);
//			}
//			else {
//				out.print(status);
//			}
//			UserDao dao = new UserDao(ConnectionProvider.getConnection());
//			
//			
//			
//			dao.login(email, password);
//			if(dao.t==true)
//			out.print("sucess");
//			out.print(email);
		
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
	
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
