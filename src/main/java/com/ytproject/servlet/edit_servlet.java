package com.ytproject.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ytproject.dao.UserDao;
import com.ytproject.entities.Message;
import com.ytproject.entities.User;
import com.ytproject.helper.ConnectionProvider;
import com.ytproject.helper.delete_save_profile_image;

import javax.servlet.http.*;

/**
 * Servlet implementation class edit_servlet
 */
@WebServlet("/edit_servlet")
@MultipartConfig
public class edit_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public edit_servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		String user_name = request.getParameter("u_name");
//		String user_mail = request.getParameter("u_email");
//		String user_contact = request.getParameter("u_contact");
//		Part part = request.getPart("u_image");
//		String image_name = part.getSubmittedFileName();
//		
//		
//		//create session for getting old data of user and update it
//		HttpSession session = request.getSession();
//		User user = (User)session.getAttribute("curentUser");
//		//getting old image name for delete old and update new
//		String old_image = user.getProfile_img();
//		
//		//update new data 
//		user.setName(user_name);
//		user.setEmail(user_mail);
//		user.setNumber(user_contact);
//		user.setProfile_img(image_name);
//		
//		 //create connection through UserDao
//		UserDao dao = new UserDao(ConnectionProvider.getConnection());
//		
//		 boolean update_status = dao.update_user(user);
//		 if (update_status) {
//			response.sendRedirect("profile.jsp");
//		} else {
//
//		}
//		
//		
//		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_name = request.getParameter("u_name");
		String user_mail = request.getParameter("u_email");
		String user_contact = request.getParameter("u_contact");
		String user_password = request.getParameter("u_pass");
		Part part = request.getPart("u_image");
		String image_name = part.getSubmittedFileName();

		// create session for getting old data of user and update it
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("curentUser");
		// getting old image name for delete old and update new
		String old_image = user.getProfile_img();
		if (image_name == "") {
			image_name = user.getProfile_img();
			if(image_name=="")
			{
				image_name="a.png";
			}
			
		}

		// update new data
		user.setName(user_name);
		user.setEmail(user_mail);
		user.setNumber(user_contact);
		user.setPassword(user_password);
		user.setProfile_img(image_name);
		
		

		// create connection through UserDao
		UserDao dao = new UserDao(ConnectionProvider.getConnection());

		boolean update_status = dao.update_user(user);
		if (update_status) {
			// create path for new image
			String new_img = request.getSession().getServletContext().getRealPath("/") + "pic" + File.separator
					+ user.getProfile_img();
			// create path for old image
			String old_img = request.getSession().getServletContext().getRealPath("/") + "pic" + File.separator
					+ old_image;

			if (image_name != old_image && old_image != "a.png") 
			{

				// delete old image
				delete_save_profile_image.delete_image(old_img);

				// save new one
				delete_save_profile_image.save_img(part.getInputStream(), new_img);
			}
			Message m = new Message("**Profile Edit Successfully", "sucess", "alert-success bg-green pl-1 mt-1");
			HttpSession s = request.getSession();
			s.setAttribute("status", m);
			response.sendRedirect("profile.jsp");

		} else {
			Message m = new Message("**Profile Edit unSuccessfully", "error", "alert-danger bg-#eb0d0d pl-1 mt-1");
			HttpSession s = request.getSession();
			s.setAttribute("status", m);
			response.sendRedirect("profile.jsp");

		}

	}

}
