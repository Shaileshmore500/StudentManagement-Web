<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ytproject.entities.User"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/NewFile.css" rel="stylesheet">
<script src="java_script\js2.js"></script>
</head>
<style>
.hint {
	font-weight: 600;
	color: red;
}
</style>
<body>

	<form action="addcategory" method="post"><!-- // -->
		<table class="table table-striped">

			<tbody>

				<tr>
					<th scope="row">Category Name :</th>
					<td><input type="text" id="name" name="cat_name"><br>
						<small id="namehelp" class="form-text text-muted"></small></td>
				</tr>
				<tr>
					<th scope="row" style="font-size: 14px">Decsription :</th>
					<td><input type="text" id="decsription" name="Decsription"><br>
						<small id="decsriptionhelp" class="form-text text-muted"></small></td>

				</tr>

			</tbody>
		</table>
		<div class="container">
			<button type="submit" id="save_category"
				class="btn btn-outline-primary">Save</button>

		</div>
	</form>
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
	
	<script>
	
	
		
		$(document).ready(function() {

			$("#save_category").click(function() {
				debugger;
				//alert("hiii")

				if(!validate("name"))
					{return false;}
				if(!validate("decsription"))
				{return false;}
				

			})

		});
	</script>



</body>
</html>