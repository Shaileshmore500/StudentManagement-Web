package com.ytproject.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ytproject.dao.Dao;
import com.ytproject.entities.Chatroom;
import com.ytproject.entities.User;
import com.ytproject.helper.ConnectionProvider;

/**
 * Servlet implementation class ChatRoom
 */
@WebServlet("/ChatRoom")
public class ChatRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChatRoom() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {/*
							 * System.out.println("hello chat");
							 * 
							 * int sid = Integer.parseInt(request.getParameter("sid")); int rid =
							 * Integer.parseInt(request.getParameter("rid")); String sql =
							 * "select description,time,senderid,receiverid from chatroom where (senderid="
							 * + sid + " and receiverid=" + rid + ") or (senderid=" + rid +
							 * " and receiverid=" + sid + ") order by time desc;";
							 * 
							 * new Dao(ConnectionProvider.getConnection()); ResultSet set =
							 * Dao.getData(sql);
							 * 
							 * List<Chatroom> chatlist = new ArrayList<>();
							 * 
							 * try {
							 * 
							 * while (set.next()) { Chatroom chatroom = new Chatroom();
							 * chatroom.setDescription(set.getString("description"));
							 * chatroom.setTime(set.getTimestamp("time"));
							 * chatroom.setSenderid(set.getInt(3)); chatroom.setReceiverid(set.getInt(4));
							 * chatlist.add(chatroom);
							 * 
							 * } HttpSession sesion = request.getSession();
							 * sesion.removeAttribute("chatdata"); // fetch current user id int userid = 0;
							 * User chat_user = (User) sesion.getAttribute("curentUser"); if (chat_user ==
							 * null) {
							 * 
							 * response.sendRedirect("index.jsp"); } else { userid = chat_user.getId();
							 * 
							 * }
							 * 
							 * StringBuilder chat = new StringBuilder();
							 * System.out.println(chatlist.size()); if (chatlist.size() > 0) { for (Chatroom
							 * c : chatlist) {
							 * 
							 * 
							 * if (c.getSenderid() == userid) {
							 * 
							 * chat.append("<div class='message sent'>" + c.getDescription() +
							 * "<span class='metadata'> <span class='time'>12.00 pm</span></span></div>");
							 * 
							 * } else {
							 * 
							 * chat.append("<div class='message received'>" + c.getDescription() +
							 * "<span class='metadata'><span class='time'></span></span></div>");
							 * 
							 * }
							 * 
							 * } } else {
							 * 
							 * 
							 * 
							 * chat.append("<img src='pic/java.jpg' />"); }
							 * 
							 * sesion.setAttribute("chatdata", chat); response.sendRedirect("chatroom.jsp");
							 * 
							 * 
							 * } catch (SQLException e) { // TODO Auto-generated catch block
							 * e.printStackTrace(); }
							 */

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int sid = Integer.parseInt(request.getParameter("sid"));
			int rid = Integer.parseInt(request.getParameter("rid"));
			String op = (String) request.getParameter("operation");
			System.out.println("op : " + op);

			if ((op).equals("loadchat")) 
			{
				String sql = "select description,time,senderid,receiverid from chatroom where (senderid=" + sid
						+ " and receiverid=" + rid + ") or (senderid=" + rid + " and receiverid=" + sid + ") ;";

				String userSql = "select name , email,contact,profile_image from user_inf where id=" + rid + " limit 1";
				System.out.println(userSql);
				HttpSession sesion = request.getSession();
				new Dao(ConnectionProvider.getConnection());
				ResultSet set = Dao.getData(sql);
				ResultSet userset = Dao.getData(userSql);
				User u = new User();
				while (userset.next()) {
					u.setName(userset.getString(1));
					u.setEmail(userset.getString(2));
					u.setNumber(userset.getNString(3));
					u.setProfile_img(userset.getString(4));
				}
				sesion.setAttribute("receiverUser", u);

				List<Chatroom> chatlist = new ArrayList<>();

				while (set.next()) {
					Chatroom chatroom = new Chatroom();
					chatroom.setDescription(set.getString("description"));
					chatroom.setTime(set.getTimestamp("time"));
					chatroom.setSenderid(set.getInt(3));
					chatroom.setReceiverid(set.getInt(4));
					chatlist.add(chatroom);

				}

				// fetch current user id
				int userid = 0;
				User chat_user = (User) sesion.getAttribute("curentUser");
				if (chat_user == null) {

					response.sendRedirect("index.jsp");
				} else {
					userid = chat_user.getId();

				}

				StringBuilder chat = new StringBuilder();

				if (chatlist.size() > 0) {
					for (Chatroom c : chatlist) {

						String time = new SimpleDateFormat("hh:mm aa").format(c.getTime());

						if (c.getSenderid() == userid) {

							chat.append("<div class='message sent'>" + c.getDescription()
									+ "<span class='metadata'> <span class='time'>" + time + "</span></span><span class='actime' style='display:none'>"+c.getTime()+"</span></div>");

						} else {

							chat.append("<div class='message received'>" + c.getDescription()
									+ "<span class='metadata'><span class='time'>" + time + "</span></span><span class='actime' style='display:none'>"+c.getTime()+"</span></div>");

						}

					}
				} else {
					chat.append("<img src='pic/sayhii.gif' style='height: 100%;width: 100%;' />");
				}
				response.getWriter().print(chat);
			} else if ((op).equals("insertchat")) {
				String content = request.getParameter("content");
				String sql = "INSERT INTO `ytprooject`.`chatroom`(description,senderid,receiverid,time) VALUES('"
						+ content + "'," + sid + "," + rid + ",now())";
				new Dao(ConnectionProvider.getConnection());
				int inert = Dao.insertData(sql);

				System.out.println(inert);
				System.out.println(sql);

			} else if ((op).equals("getlivechat")) 
			{
				String actime=request.getParameter("time");
				System.out.println("hii in live chat");
				
				String sql = "select description,time,senderid,receiverid from chatroom where (senderid=" + rid
						+ " and receiverid=" + sid + ") and time > '"+actime+"' ;";
				ResultSet set = Dao.getData(sql);
				List<Chatroom> chatlist = new ArrayList<>();

				while (set.next()) {
					Chatroom chatroom = new Chatroom();
					chatroom.setDescription(set.getString("description"));
					chatroom.setTime(set.getTimestamp("time"));
					chatroom.setSenderid(set.getInt(3));
					chatroom.setReceiverid(set.getInt(4));
					chatlist.add(chatroom);

				}
				
				StringBuilder chat = new StringBuilder();

				if (chatlist.size() > 0) {
					for (Chatroom c : chatlist) {

						String time = new SimpleDateFormat("hh:mm aa").format(c.getTime());						

							chat.append("<div class='message received'>" + c.getDescription()
									+ "<span class='metadata'><span class='time'>" + time + "</span></span><span class='actime' style='display:none'>"+c.getTime()+"</span></div>");

						

					}
				} 
				response.getWriter().print(chat);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
