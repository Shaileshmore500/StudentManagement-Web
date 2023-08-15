<<<<<<< HEAD
<%@page import="com.ytproject.helper.ConnectionProvider"%>

<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>






<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css_files/NewFile.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>



	<div class="modal fade" id="add_post_model" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">Provide post
						details..</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="add_post" id="add_form" enctype="multipart/form-data"
						method="post">
						<div class="form-group">
							
							<select class="form-control" required="required" id="catid"
								name="cat_name">
								<option selected="selected" disabled="disabled">--select
									category--</option>
								<%
								try {

									//Class.forName("com.mysql.cj.jdbc.Driver");

									//Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ytprooject", "root", "");
									ConnectionProvider con22 = new ConnectionProvider();

									String Query = "select * from category";

									Statement statement = con22.getConnection().createStatement();
									ResultSet set2 = statement.executeQuery(Query);

									while (set2.next()) {

										int cId = set2.getInt(1);
										String cName = set2.getString(2);
								%>
								<option value=<%=cId%>><%=cName%></option>
								<%
								}

								} catch (Exception e) {
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<h6>Enter Post Title :</h6>
							<input type="text" required="required" name="post_title"
								class="form-control" placeholder="Enter here .......">
						</div>
						<div class="form-group">
							<h6>Enter Post content :</h6>
							<textarea class="form-control" required="required"
								name="post_content"
								placeholder=" Enter Post Content (between 50 to 200 words)...."
								style="height: 150px"></textarea>
						</div>
						<div class="form-group">
							<h6>Enter code(if any) :</h6>
							<textarea class="form-control" 
								name="post_code" placeholder=" Enter here...."
								style="height: 150px"></textarea>
						</div>
						<div class="form-group">
							<h6>Enter Resource link (if any) :</h6>
							<input type="text" name="post_link" class="form-control"
								placeholder="Enter here .......">
						</div>
						<div class="form-group">
							<h6>Select post pic :</h6>
							<input type="file" name="post_img" class="form-control">
						</div>
						<div>
							
							<div class="modal-footer">
							<button type="submit" id="add_post"
									class="btn btn-outline-primary">Post</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>

							</div>
						</div>



					</form>




				</div>

			</div>
		</div>
	</div>






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
			$('#add_form').submit(function() {
				var a=$('#catid').val();
				if(a==null)
					{
					alert("Please Select Category..");
					return false;
					}
			});

		});
	</script>


</body>
</html>
=======
<%@page import="com.ytproject.helper.ConnectionProvider"%>

<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>






<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css_files/NewFile.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>



	<div class="modal fade" id="add_post_model" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">Provide post
						details..</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="add_post" id="add_form" enctype="multipart/form-data"
						method="post">
						<div class="form-group">
							
							<select class="form-control" required="required" id="catid"
								name="cat_name">
								<option selected="selected" disabled="disabled">--select
									category--</option>
								<%
								try {

									//Class.forName("com.mysql.cj.jdbc.Driver");

									//Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ytprooject", "root", "");
									ConnectionProvider con22 = new ConnectionProvider();

									String Query = "select * from category";

									Statement statement = con22.getConnection().createStatement();
									ResultSet set2 = statement.executeQuery(Query);

									while (set2.next()) {

										int cId = set2.getInt(1);
										String cName = set2.getString(2);
								%>
								<option value=<%=cId%>><%=cName%></option>
								<%
								}

								} catch (Exception e) {
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<h6>Enter Post Title :</h6>
							<input type="text" required="required" name="post_title"
								class="form-control" placeholder="Enter here .......">
						</div>
						<div class="form-group">
							<h6>Enter Post content :</h6>
							<textarea class="form-control" required="required"
								name="post_content"
								placeholder=" Enter Post Content (between 50 to 200 words)...."
								style="height: 150px"></textarea>
						</div>
						<div class="form-group">
							<h6>Enter code(if any) :</h6>
							<textarea class="form-control" required="required"
								name="post_code" placeholder=" Enter here...."
								style="height: 150px"></textarea>
						</div>
						<div class="form-group">
							<h6>Enter Resource link (if any) :</h6>
							<input type="text" name="post_link" class="form-control"
								placeholder="Enter here .......">
						</div>
						<div class="form-group">
							<h6>Select post pic :</h6>
							<input type="file" name="post_img" class="form-control">
						</div>
						<div>
							
							<div class="modal-footer">
							<button type="submit" id="add_post"
									class="btn btn-outline-primary">Post</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>

							</div>
						</div>



					</form>




				</div>

			</div>
		</div>
	</div>






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


</body>
</html>
>>>>>>> d9955a9ab8c53102d24d34c37ad539d41ecf6f67
