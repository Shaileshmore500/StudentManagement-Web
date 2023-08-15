<%@page import="com.ytproject.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page </title>

<!-- boostwrap scc -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css_files/NewFile.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css_files/NewFile.css" rel="stylesheet">
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



<style >
.cssClass
{
	color: red;
    background-color: #e795a2;
    margin: 5px;
}



</style>


</head>
<body style="" >

<!--navbar  -->



	<main  class=" d-flex align-items-center   clip_path" style="height: 80vh;margin-top: 5px;background-color: #06443e ">
		<div class="container " >
			<div class="row" style="border-radius: 50px">
				<div class="col-md-4 offset-md-4" >
					<div class="card" style="border-radius: 15px">
						<div class="class-header primary-background text-white text-center"  style="border-radius: 18px" >
							<span class="fa fa-user-plus fa-3x" style="margin-top: 10px"></span>
							<p >Login Here....</p>
							
							
						</div>
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
								
						<div class="card-body" >
							<form action="login">
								  <div class="form-group">
								    <label for="exampleInputEmail1">Email address</label>
								    <input type="email" name="u_mail" class="form-control" value="parimore24@gmail.com" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
								    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
								  </div>
								  <div class="form-group">
								    <label for="exampleInputPassword1">Password</label>
								    <input type="password" name="u_password" class="form-control"  value="123456" id="exampleInputPassword1" placeholder="Password">
								  </div>
								  
								  <button type="submit" class="btn btn-primary primary-background">Submit</button>
								</form>
						
						</div>
					
					</div>
					
				</div>
			</div>
		
		</div>
	</main>
























<!-- java Script -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="java_script/js2.js"></script>



</body>



</html>