<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.ytproject.helper.ConnectionProvider"%>
<%@page import="com.ytproject.entities.like"%>
<%@page import="com.ytproject.servlet.like_servlet"%>
<%@page import="com.ytproject.entities.User"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show post Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body {
	background-color: #000
}

.post_footer .btn2 {
	background: none;
	border: none;
}

.post_footer .btn2 img:hover {
	transform: scale(1.2);
}

.post_footer .btn2 i:hover {
	transform: scale(1.2);
	color: white;
}

.post_user_img {
	max-width: 50px;
	border-radius: 50%;
	max-height: 50px;
	width: 40px;
	height: 40px;
	margin: 2px;
}

.head_table {
	width: auto;
}

.card-body {
	margin: 5px 5px 5px 5px;
	padding: 0;
	padding: 0px !important;
}

.post_img {
	width: 100%;
	max-height: 253px;
	border-radius: 10px;
	min-height: 265px;
}

.hr {
	margin-top: 1rem;
	margin-bottom: 1rem;
	border: 0;
	border-top: 1px solid black;
}

.card {
	margin-left: 40px;
	width: 300px !important;
	margin-right: 40px;
}

.content_text {
	max-height: 200px;
	overflow-y: auto;
}

.all_post {
	display: inline-flex;
	margin-left: 15%;
	width: auto;
}

.post_main_div {
	margin-bottom: 15px;
	display: inline-flex;
}

.post_sub_div {
	margin-left: -15px;
	margin-right: 45px;
}

.like_img {
	height: 20px;
	width: 20px;
	border-radius: 50%;
	margin-left: 5px;
}

.share_img {
	height: 20px;
	width: 20px;
	border-radius: 50%;
	float: right;
	margin-top: 9px;
	margin-right: 15px;
}

.read_more_button {
	border-radius: 24px;
	width: 211px;
	padding: 1px;
	margin-left: 8px;
	margin-right: 8px;
}

.post_footer {
	padding-top: 4px;
	padding-bottom: 4px;
	border-radius: 5px;
	background-color: #246d66;
	display: flex;
}

.post_head {
	border-radius: 6px;
	background-color: #246d66;
	color: aliceblue;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    </script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="java_script/js2.js" type="text/javascript"></script>


</head>

<body>

	<%
	int uid = 0;
	String ip = "";

	//User u=(User) session.getAttribute("currentuser");
	User u = (User) session.getAttribute("curentUser");
	if (u != null) {
		uid = u.getId();

	}
	%>
	<div style="margin-left: 10%">
		<h5>
			<a href="#"> <b> <u>Posts Corner:</u>
			</b></a>
		</h5>
	</div>




	<!-- ---------------------------------------------------- -->
	<div class="container">
		<div class="row" style="margin-top: 0px">

			<%
			String s = "";
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ytprooject", "root", "");
			String query2 = "select pId,pTitle,pContent,pCode,pLink,pPic,cId,pDate,u.name,u.profile_image from ytprooject.post left join user_inf u on userId=u.id order by pId limit 3";

			Statement stmt2 = con2.createStatement();

			ResultSet set = stmt2.executeQuery(query2);

			while (set.next()) {

				int pid = set.getInt(1);
				String pTitle = set.getString("pTitle");
				String pcontent = set.getString("pContent");
				String pCode = set.getString(4);
				String pLink = set.getString(5);
				String pPic = set.getString(6);
				String cid = set.getString(7);
				Date postdate = set.getTimestamp(8);
				String uname = set.getString(9);
				String uimg = set.getString(10);
				SimpleDateFormat formatter=new SimpleDateFormat("dd.MM.yyyy");
				String pdate=formatter.format(postdate);

				//int uId=set.getInt(7);
			%>




			<div class="col-md-4">
				<div class="card">
					<!--
					<div class='post_head'>
					 
						<table class="head_table">
							<tr>
								<td rowspan="2"><img src="pic/<%=uimg%>"
									class='post_user_img'></td>
								<th style='padding-left: 5px'><%=uname%></th>
							</tr>
							<tr>

								<td style='padding-left: 5px'><i class="fa fa-clock-o"><%=pdate%></i></td>
							</tr>

						</table>

					</div>
 -->
					<div class='post_head' style="display: flex;">
						<div>
							<img src="pic/<%=uimg%>" class='post_user_img'>
						</div>
						<div
							style="width: 2px; margin: 5px; background-image: linear-gradient(90deg, #082526, #3c323259); margin-left: 3px; margin-right: 7px;"></div>
						<div>
							<div>
								<%=uname%>
							</div>
							<div>
								<%=pdate%>
							</div>
						</div>
					</div>



					<img class="card-img-top" style="height: 250px;" src="pic/java.jpg"
						alt="Card image cap">
					<div class="card-body">




						<h5 class="card-title"><%=pTitle.length() > 30 ? pTitle.substring(0, 30) + "..." : pTitle%></h5>
						<p class="card-text"><%=pcontent.length() > 100 ? pcontent.substring(0, 100) + "..." : pcontent%>...
						</p>
						<div>
							<span><a href="<%=pLink%>" target="_blank">More On
									Links</a></span>
						</div>
					</div>
					<div class="post_footer">


						<button class="btn2 btn btn-outline-light btn-lg " id="<%=pid%>">
							<%
							String liked = "none";
							String unliked = "inline";
							Connection con = ConnectionProvider.getConnection();
							String q = "Select * from  like_status where pid=? and uid=? limit 1 ";
							PreparedStatement ps = con.prepareStatement(q);
							ps.setInt(1, pid);
							ps.setInt(2, uid);
							ResultSet set2 = ps.executeQuery();
							while (set2.next()) {
								liked = "inline";
								unliked = "none";

							}
							%>

							<img src="pic/like2_img.png"
								style="height: 25px; width: 25px;display: <%=unliked%>"
								class="btn_hour" onclick="like(<%=uid%>,<%=pid%>)"
								id="likefalsebtn_<%=pid%>"> <img src="pic/like_img.png"
								style="height: 25px; width: 25px;display: <%=liked%>"
								onclick="dislike(<%=uid%>,<%=pid%>)" class="btn_hour"
								id="liketruebtn_<%=pid%>">

							<script type="text/javascript">	
							
							 
							 function like(uid, pid) {

									
									const d = {
										pid: pid,
										uid: uid,
										operation: "like"
									}

									$.ajax({

										url: "like_servlet",
										data: d,
										//op : "like",
										success: function(data, textStatus, jqXHR) {											
											console.log(data);
											document.getElementById("like_count"+pid).innerText=data;
											//location.reload();
										},
										error: function(jqXHR, textStatus, errorThrown) {
											console.log(jqXHR);

											//alert("fff");
										}


										//
									});
									
									
									//document.getElementById("like_count"+pid).contentWindow.location.reload(true);
									
								}
							 function dislike(uid, pid) {
									
									const d =
									{
										pid: pid,
										uid: uid,
										operation: 'dislike'

									}
									$.ajax({

										url: "like_servlet",
										data: d,
										success: function(data, textStatus, jqXHR) {
											console.log(data);
											//location.reload();
											document.getElementById("like_count"+pid).innerText=data;
											//alert(d);
										},
										error: function(jqXHR, textStatus, errorThrown) {
											console.log(jqXHR);

											//alert("fff");
										}

									});
								}


							 
							 
							 $(document).ready(function () {
								 
								 
								 
								<%like l2 = new like();
s = l2.like_count(pid);
//Str2ing s=(String) session.getAttribute("like_count");
//System.out.print(s);%>
								 $('#<%=pid%> img').click(function () {
									 
									$("#likefalsebtn_<%=pid%>").toggle();
									$("#liketruebtn_<%=pid%>").toggle();
									
								});
								 
							});
							 
							
							 
							 
							 </script>
							<i id="like_count<%=pid%>"><%=s%></i>
						</button>


						<button class="btn btn-outline-light btn-lg read_more_button">
							<span class="fa fa-plus"></span> Read More
						</button>
						<button class="btn2 btn btn-outline-light btn-lg">
							<!--  <i style="font-size: 25px" class="fa fa-share-alt btn_hour" style="font-size:36px"></i>-->
							<i style="font-size: 24px" class="fa btn_hour">&#xf1e0;</i>
						</button>



					</div>



				</div>
			</div>




			<%
			}
			%>
		</div>
	</div>



</body>
</html>