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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ytproject.dao.UserDao;
import com.ytproject.entities.Message;
import com.ytproject.entities.User;
import com.ytproject.entities.post;
import com.ytproject.helper.ConnectionProvider;
import com.ytproject.helper.delete_save_profile_image;

/**
 * Servlet implementation class add_post
 */
@WebServlet("/add_post")
@MultipartConfig
public class add_post extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public add_post() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		out.print("in add-post servlet");

		int p_category = Integer.parseInt(request.getParameter("cat_name"));
		String p_title = request.getParameter("post_title");
		String p_content = request.getParameter("post_content");
		String p_code = request.getParameter("post_code");
		String p_link = request.getParameter("post_link");

		Part part = request.getPart("post_img");
		String post_image = part.getSubmittedFileName();

		HttpSession s = request.getSession();
		User u = (User) s.getAttribute("curentUser");
		int uid = u.getId();

		post p = new post(p_category, p_title, p_content, p_code, p_link, post_image, uid);

		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		boolean post_status = dao.add_post(p);
		// dao.add_post(p);
		if (post_status) {

			System.out.println("in add_post");

			String img_path = request.getSession().getServletContext().getRealPath("/") + "pic" + File.separator
					+ post_image;
			delete_save_profile_image.save_img(part.getInputStream(), img_path);

			Message m = new Message("Post Added Sucessfully", "error", "alert-success bg-#246d66 pl-1 mt-1");

			HttpSession ss = request.getSession();
			ss.setAttribute("msg", m);
			response.sendRedirect("profile.jsp");
		} else

		{
			Message m = new Message("Something Went Wrong!Please Try Again....", "error", "alert-danger bg-#246d66 pl-1 mt-1");

			HttpSession ss = request.getSession();
			ss.setAttribute("msg", m);
			response.sendRedirect("addpost.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
