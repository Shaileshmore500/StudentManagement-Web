<<<<<<< HEAD
<%@page import="com.ytproject.entities.Message"%>
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
<title>You tube project</title>
<!-- BOOSTRAPH CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css_files/NewFile.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<style>
body {
	overflow-x: hidden
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
}

.hr {
	margin-top: 1rem;
	margin-bottom: 1rem;
	border: 0;
	border-top: 1px solid black;
}

.card {
	height: 515px;
	margin-left: 40px;
	width: 300px !important;
	margin-right: 40px;
	border-color: #246d66;
}

.content_text {
	max-height: 200px;
	overflow-y: auto;
}

.footer_card {
	padding: 0.75rem 1.25rem;
	background-color: rgba(0, 0, 0, .03);
	border-top: 1px solid rgba(0, 0, 0, .125);
	margin-top: 40px;
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

.card-img-top {
	height: 300px;
}

.temp_footer {
	padding-top: 4px;
	padding-bottom: 4px;
	border-radius: 5px;
}

.temp_footer a {
	float: right;
	margin: 0px 2px 0px 2px;
}
.msg-body {
	position: fixed;
	height: 45px;
	bottom: 59px;
	left: 21px;
	padding: 10px;
	width: 100%;
}
.msg{
	    padding: 15px;
    display: flex;
    flex-wrap: nowrap;
    min-width: 30%;
    max-width: 40%;
    font-size: inherit;
    border-radius: 9px;
}
.coursebtn{
float: right;
}
</style>


</head>

<body>
	<!-- nave bar -->
	<%@include file="normal_navbar.jsp"%>





	<!-- banner -->
	<div style="margin-top: 1%; margin-bottom: -100pxs">
		<div class="jumbotron primary-background text-white">
			<div class="container">
				<h3 class="display-3">Wellcome to Zep-Tech</h3>
				<p>A programming language is a formal language comprising a set
					of strings that produce various kinds of machine code output.
					Programming languages are one kind of computer language, and are
					used in computer programming to implement algorithms.</p>
				<p>Thousands of different programming languages have been
					created, and more are being created every year. Many programming
					languages are written in an imperative form (i.e., as a sequence of
					operations to perform) while other languages use the declarative
					form (i.e. the desired result is specified, not how to achieve it).</p>

				<a href="index.jsp"><button class="btn btn-outline-light btn-lg">
						<span class="fa fa-user-circle-o fa-spin"></span> LOGIN
					</button>&nbsp&nbsp&nbsp&nbsp</a> <a href="register_page.jsp"><button
						class="btn btn-outline-light btn-lg">
						<span class="	fa fa-user-plus"></span> REGISTER
					</button></a>

			</div>
		</div>
	</div>

	<div class="container">
		<div class="row" style="margin-top: 0px">
			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<div class="card-footer footer_card">
							<span class="coursebtn"> <a href="#" class="btn btn-primary">Apply</a> <a
								href="#" class="btn btn-primary"> <i class="fa fa-file">&nbsp</i>
									Read More
							</a>
							</span>

						</div>
					</div>


				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content</p>


					</div>
					<div class="temp_footer">
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>

				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>


				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="post_pnl_header">
			<span class="card-title">Post</span> <span
				class="glyphicon glyphicon-plus"></span>

		</div>
		<div>
			<%@include file="post.jsp"%>
		</div>
	</div>
	<hr class="hr">


	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>


				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>


				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>


				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>


				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>


				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>


				</div>
			</div>
		</div>
	</div>


	<div class="msg-body">
		<div class="alert-danger msg">Something went wrong.Please Try
			Again..
			
			<div id="bar" style="background-color: rgb(24, 23, 22); position: absolute; padding: 2px; width: 97%; bottom: 2px; left: 5px; display: none;"></div>
			</div>
	</div>






	<!-- java Script -->

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
</body>
=======
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
<title>You tube project</title>
<!-- BOOSTRAPH CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css_files/NewFile.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<style>
body {
	overflow-x: hidden
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
}

.hr {
	margin-top: 1rem;
	margin-bottom: 1rem;
	border: 0;
	border-top: 1px solid black;
}

.card {
	height: 515px;
	margin-left: 40px;
	width: 300px !important;
	margin-right: 40px;
	border-color: #246d66;
}

.content_text {
	max-height: 200px;
	overflow-y: auto;
}

.footer_card {
	padding: 0.75rem 1.25rem;
	background-color: rgba(0, 0, 0, .03);
	border-top: 1px solid rgba(0, 0, 0, .125);
	margin-top: 40px;
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

.card-img-top {
	height: 300px;
}

.temp_footer {
	padding-top: 4px;
	padding-bottom: 4px;
	border-radius: 5px;
}

.temp_footer a {
	float: right;
	margin: 0px 2px 0px 2px;
}
</style>


</head>

<body>
	<!-- nave bar -->
	<%@include file="normal_navbar.jsp"%>





	<!-- banner -->
	<div style="margin-top: 1%; margin-bottom: -100pxs">
		<div class="jumbotron primary-background text-white">
			<div class="container">
				<h3 class="display-3">Wellcome to Zep-Tech</h3>
				<p>A programming language is a formal language comprising a set
					of strings that produce various kinds of machine code output.
					Programming languages are one kind of computer language, and are
					used in computer programming to implement algorithms.</p>
				<p>Thousands of different programming languages have been
					created, and more are being created every year. Many programming
					languages are written in an imperative form (i.e., as a sequence of
					operations to perform) while other languages use the declarative
					form (i.e. the desired result is specified, not how to achieve it).</p>

				<a href="index.jsp"><button class="btn btn-outline-light btn-lg">
						<span class="fa fa-user-circle-o fa-spin"></span> LOGIN
					</button>&nbsp&nbsp&nbsp&nbsp</a> <a href="register_page.jsp"><button
						class="btn btn-outline-light btn-lg">
						<span class="	fa fa-user-plus"></span> REGISTER
					</button></a>

			</div>
		</div>
	</div>

	<div class="container">
		<div class="row" style="margin-top: 0px">
			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<div class="card-footer footer_card">
							<span> <a href="#" class="btn btn-primary">Apply</a> <a
								href="#" class="btn btn-primary"> <i class="fa fa-file">&nbsp</i>
									Read More
							</a>
							</span>

						</div>
					</div>


				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content</p>


					</div>
					<div class="temp_footer">
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>

				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>


				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="post_pnl_header">
			<span class="card-title">Post</span> <span
				class="glyphicon glyphicon-plus"></span>

		</div>
		<div>
			<%@include file="post.jsp"%>
		</div>
	</div>
	<hr class="hr">


	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>


				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>


				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>


				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>


				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>


				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="pic/java.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Java Developer</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Apply</a> <a href="#"
							class="btn btn-primary"> Read More</a>
					</div>


				</div>
			</div>
		</div>
	</div>





	<!-- java Script -->

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
</body>
>>>>>>> d9955a9ab8c53102d24d34c37ad539d41ecf6f67
</html>