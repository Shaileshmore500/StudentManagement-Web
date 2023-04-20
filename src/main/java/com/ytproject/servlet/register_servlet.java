

package com.ytproject.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;


import com.ytproject.dao.UserDao;
import com.ytproject.entities.Message;
import com.ytproject.entities.User;
import com.ytproject.helper.ConnectionProvider;
import com.ytproject.helper.delete_save_profile_image;

/**
 * Servlet implementation class register_servlet
 */
@WebServlet("/register_servlet")
@MultipartConfig
public class register_servlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

    public register_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException , NumberFormatException {
		
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		try {
//		
//		
//		String check=request.getParameter("check");
//		
//		
//		
//		if (check==null) {
//			out.print("<h1>Error Occured</h1>");
//			
//		}else {
//			String name=request.getParameter("name");
//			String email=request.getParameter("email");
//			String number=request.getParameter("number");
//			//long number = Long.parseLong(num);//convert number String to int
//			String password=request.getParameter("password");
//			
//			Part part = request.getPart("u_image");
//			String profile_image = part.getSubmittedFileName();
//			
//			
//			
//			
//			
//			
//			
////		create User class object for pass all data in User class			
//		
//		User user = new User(name , email , number , password , profile_image);
////		create object of  userDao class for get Connection
//		UserDao dao = new UserDao(ConnectionProvider.getConnection());
//		
//		if (dao.saveUser(user)) {
//			RequestDispatcher rd=request.getRequestDispatcher("home_page.jsp"); 
//					rd.forward(request, response);
//		} else {
//			out.print("<div>Swal.fire('Any fool can use a computer')</div>");
//			out.println(password);
//		}
//		
//		
//		}
//		
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//			out.println(e);
//		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("register code running");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
		
		
		
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String number=request.getParameter("number");
			//long number = Long.parseLong(num);//convert number String to int
			String password=request.getParameter("password");
			
			Part part = request.getPart("u_image");
			String profile_image = part.getSubmittedFileName();
			
			if(profile_image=="")
			{
				
				profile_image="a.png";
			}
			
			
			
			
			
			
//		create User class object for pass all data in User class			
		
		User user = new User(name , email , number , password , profile_image);
//		create object of  userDao class for get Connection
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		if (dao.saveUser(user)) {
			RequestDispatcher rd=request.getRequestDispatcher("home_page.jsp"); 
					rd.forward(request, response);
					HttpSession s=request.getSession();
					s.setAttribute("curentUser", user);
					
					//---->> save profile in imajes folder
//				@SuppressWarnings("deprecation")
//				String profile_img_path= request.getRealPath("/")+"images" +File.separator+profile_image;
//				or
				String img_path=request.getSession().getServletContext().getRealPath("/")+"pic"+File.separator+profile_image;
				delete_save_profile_image.save_img(part.getInputStream(), img_path);
		} else {
			Message m = new Message("<b class='fa fa-question-circle '>**Something went wrong!Invalide details</b>", "error", "alert-danger bg-#eb0d0d pl-1 mt-1");
			HttpSession s = request.getSession();
			s.setAttribute("sms", m);
			response.sendRedirect("register_page.jsp");
		}
		
		
		
		
		} catch (Exception e) {
			
			
			
			Message m = new Message("<b class='fa fa-question-circle '>**Something went wrong!Invalide details</b>", "error", "alert-danger bg-#eb0d0d pl-1 mt-1");
			HttpSession s = request.getSession();
			s.setAttribute("sms", m);
			response.sendRedirect("register_page.jsp");
			e.printStackTrace();
			
		}

	
	
	}

	
	

}
