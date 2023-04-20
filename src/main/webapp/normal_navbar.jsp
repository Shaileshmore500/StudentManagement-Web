
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
<!-- BOOSTRAPH CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css_files/NewFile.css" rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark primary-background"
		style="">

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
				<li class="nav-item active"><a class="nav-link"
					href="home_page.jsp"><span class="fa fa-home  "></span> Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-map-marker"></span> Location</a></li>
				<!-- drop down -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-graduation-cap"></span>
						cources
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#"><span class="	fa fa-empire"></span>Web-design</a>
						<a class="dropdown-item" href="#"><span class="	fa fa-empire"></span>java</a>
						<a class="dropdown-item" href="#"><span class="	fa fa-empire"></span>c++</a>
						<a class="dropdown-item" href="#"><span class="	fa fa-empire"></span>php</a>
						<a class="dropdown-item" href="#"><span class="	fa fa-empire"></span>phython</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">C#</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-globe"></span> about us</a></li>
				
				<li class="nav-item"><a class="nav-link" href="index.jsp"><span
						class="fa fa-user-circle-o "></span> Login</a></li>
					
				<li class="nav-item"><a class="nav-link"
					href="register_page.jsp"><span class="fa fa-user-plus "></span>
						Signup</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
				
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add_post_model"><span
						class="	fa fa-file-powerpoint-o"></span> Add-Post</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
			</form>
			<a class="nav-link" href="profile.jsp"><span style="color: #ffff"
				class="fa fa-user-circle-o fa-2x"></span></a>
		</div>
	</nav>




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
</html>
