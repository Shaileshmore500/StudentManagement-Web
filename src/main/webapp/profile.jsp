
<%@page import="com.ytproject.entities.Message"%>
<%@page import="com.ytproject.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
//out.print("user is not null");
User user = (User) session.getAttribute("curentUser");
if (user == null) {
	Message m = new Message("**Login First...", "error", "alert-danger bg-#eb0d0d pl-1 mt-1");
	session.setAttribute("msg", m);

	response.sendRedirect("login_page.jsp");
	//session.removeAttribute("msg");
} else {
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css_files/NewFile.css" rel="stylesheet">
</head>
<body>
	<!-- profile page nave bar -->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">

		<a class="navbar-brand" href="home_page.jsp" style="margin-left: 50px"><span
			class="fa fa-child nav_icon"></span>Zep</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-home  "></span> Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-map-marker"></span> Location</a></li>


				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-globe"></span> about us</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add_post_model"><span
						class="	fa fa-file-powerpoint-o"></span> Add-Post</a></li>

			</ul>
			<ul class="navbar-nav mr-right ">
				<li class="nav-item" style="padding-right: 20px"><a
					class="nav-link" href="#" data-toggle="modal"
					data-target="#exampleModal2"><span class="fa fa-user-circle-o "></span>
						<%=user.getName()%></a></li>

				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#exampleModal" style="margin-right: 50px"><span
						class="fa fa-user-plus "></span>Logout</a></li>

			</ul>

		</div>
	</nav>

	<%
	Message m = (Message) session.getAttribute("status");
	if (m != null) {
	%>
	<div class="<%=m.getCssClass()%>">
		<%=m.getContent()%>

	</div>
	<%
	session.removeAttribute("status");

	}
	%>

	<%
	Message mes = (Message) session.getAttribute("msg");
	if (mes != null) {
	%>
	<div class="<%=mes.getCssClass()%>">
		<%=mes.getContent()%>
	</div>


	<%
	}
	session.removeAttribute("msg");
	%>







	<!-- End of navbar -->
	<!-- logout model -->
	<!-- model for logout-->
	<form action="logout_servlet">
		<div class="modal fade " id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content ">
					<div class="modal-header primary-background text-white">
						<h5 class="modal-title" id="exampleModalLabel">Are you sure
							for Logout ?</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true" class="text-white">&times;</span>
						</button>
					</div>
					<div class="modal-body">Click ok for Logout !</div>
					<div class="modal-footer">

						<button type="submit" class="btn btn-primary">OK</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">CANCLE</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- end of logout-model -->

	<!-- start profile model -->



	<!-- Modal -->
	<div class="modal fade " id="exampleModal2" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header  primary-background text-white">
					<h1 class="modal-title fa fa-child nav_icon"
						style="font-size: 25px" id="exampleModalLabel">Zep Bussiness.</h1>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="text-white">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">

						<img class="img-fluid"
							style="border-radius: 50%; max-width: 150px"
							src="pic/<%=user.getProfile_img()%>"> <br>




						<h5 class="modal-title"><%=user.getName()%></h5>
						<!-- profile details div -->
						<div class="container " id="profile_details">
							<table class="table table-striped">

								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">NAME :</th>
										<td><%=user.getName()%></td>

									</tr>
									<tr>
										<th scope="row">EMAIL :</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">CONTACT :</th>
										<td><%=user.getNumber()%></td>

									</tr>
									<tr>
										<th scope="row">Register Date :</th>
										<td><%=user.getRegister_date()%></td>

									</tr>
								</tbody>
							</table>


						</div>
						<!-- Edit profile div -->
						<form action="edit_servlet" enctype="multipart/form-data"
							method="post">
							<!-- <form action="edit_servlet" > -->
							<div class="container " id="edit_profile_details"
								style="display: none;">
								<table class="table table-striped">

									<tbody>
										<tr>
											<th scope="row">ID :</th>
											<td><%=user.getId()%></td>

										</tr>
										<tr>
											<th scope="row">NAME :</th>
											<td><input type="text" id="exampleInputName"
												value="<%=user.getName()%>" name=u_name><br> <small
												id="nameHelp" class="form-text text-muted" style=""></small>
											</td>
										</tr>

										<tr>
											<th scope="row">EMAIL :</th>


											<td><input type="email" name="u_email"
												class="form-control" value="<%=user.getEmail()%>"
												id="exampleInputEmail1" aria-describedby="emailHelp"
												placeholder="Enter email"> <br> <small
												id="emailHelp" class="form-text text-muted"></small></td>

										</tr>

										<tr>
											<th scope="row">CONTACT :</th>
											<td><input type="text" id="number"
												value="<%=user.getNumber()%>" name=u_contact><br>
												<small id="contactHelp" class="form-text text-muted"></small></td>
										</tr>
										<tr>
											<th scope="row" style="font-size: 14px">PASSWORD :</th>
											<td><input type="text" id="exampleInputPassword1"
												value="<%=user.getPassword()%>" name=u_pass><br>
												<small id="passwordtHelp" class="form-text text-muted"></small>
											</td>

										</tr>
										<tr>
											<th scope="row">New Profile:</th>
											<td><input type="file" class="form-control"
												name="u_image"></td>



										</tr>
									</tbody>
								</table>

								<div class="container">
									<button type="submit" id="save_profile"
										class="btn btn-outline-primary">Save</button>

								</div>

							</div>
						</form>




					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancle</button>
					<button type="button" id="edit_button" class="btn btn-primary">Edit-Profile</button>
				</div>
			</div>
		</div>
	</div>


	<!-- add post model -->
	<%@include file="addpost.jsp"%>
	
	







	<!-- end profile model -->


	Name :
	<%=user.getName()%>
	<br> Email :
	<%=user.getEmail()%>
	<br> Contact :
	<%=user.getNumber()%>
	<br> Id :
	<%=user.getId()%>



	<!-- java Script files -->
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
	<script type="text/javascript" src="java_script/js2.js"></script>



	<script>
		$(document).ready(function() {

			let edit_status = false;
			$('#edit_button').click(function() {

				if (edit_status == false) {
					$('#profile_details').hide();
					$('#edit_profile_details').show();
					edit_status = true;
					$(this).text("Back");
				} else {
					$('#profile_details').show();
					$('#edit_profile_details').hide();
					edit_status = false;
					$(this).text("Edit-Profile");
				}
			});

		});
	</script>


	<script>
		$(document)
				.ready(
						function() {
							$('#save_profile')
									.click(
											function() {
												var user = $(
														'#exampleInputName')
														.val();
												if (user.length<=2 || user.length> = 25) {
													$('#nameHelp')
															.html(
																	"<b style='color:red'>**Please enter name between 3-25 letters</b>");
													return false;
												}
												if (user.length >= 2
														|| user.length <= 25) {
													$('#nameHelp').html(
															"<b>wellcome </b>");
												}

												var contact = $('#number')
														.val();
												if ((((contact.length))) != 10) {
													$('#contactHelp')
															.html(
																	'<b style="color:red">**please enter 10 digit valide number</b>');
													return false;
												}
												if ((((contact.length))) == 10) {
													$('#contactHelp').html("");

												}
												var password = $(
														'#exampleInputPassword1')
														.val();
												if (password.length <= 6) {
													$('#passwordtHelp')
															.html(
																	'<b style="color:red">**Password must contain atleast 6 letters</b>');
												}

											})
						});
	</script>








</body>
</html>
<%
}
%>