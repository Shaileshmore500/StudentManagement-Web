<%@page import="com.ytproject.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" >
<title>register Page </title>

<!-- boostwrap scc -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css_files/NewFile.css" rel="stylesheet">


<style >

::-webkit-scrollbar{
width: 10px;

}


</style>


</head>
<body  >

<!--navbar  -->


	<main  class=" d-flex align-items-center    clip_path " style="margin-top: 5px;background-color: #06443e;">
		<div class="container " >
			<div class="row" style="border-radius: 50px">
				<div class="col-md-4 offset-md-4">
					<div class="card" style="border-radius: 15px" >
						<div class="class-header primary-background text-white text-center" style="border-radius: 15px" >
							<span class="fa fa-user-plus fa-3x" style="margin-top: 10px"></span>
							<p >Register Here....</p>
							
							
						</div>
						<%
							Message m = (Message) session.getAttribute("sms");
							
						if(m!=null)
						{
							%>
							<div class="<%=m.getCssClass()%>">
								<%=m.getContent() %>
							</div>
							
							<%
							session.removeAttribute("sms");
						}
						
						%>
						<div class="card-body"  >
							<form action="register_servlet" id="reg_form" enctype="multipart/form-data" method="post">
							
							
								 <div class="form-group">
								    <label for="exampleInputEmail1">User Name</label>
								    <input type="name" required name="name" required class="form-control" id="exampleInputName" aria-describedby="nameHelp" placeholder="Enter User name">
								    <small id="nameHelp" class="form-text text-muted" style=""></small>
								  </div>
							
							
								  <div class="form-group">
								    <label for="exampleInputEmail1">Email address</label>
								    <input type="email" required="required" value="@gmail.com" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
								    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
								  </div>
								  
								   <div class="form-group">
								    <label  for="exampleInputEmail1">Contact number</label>
								    <input type="number" name="number" id="number" required="required" class="form-control"  placeholder="Enter contact ">
								    <small id="contactHelp" class="form-text text-muted">We'll never share your contact with anyone else.</small>
								  </div>
								  
								  <div class="form-group">
								    <label for="exampleInputPassword1">Password</label>
								    <input type="password" required name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
								    <small id="passwordtHelp" class="form-text text-muted"></small>
								  </div>
								  
								  <div class="form-group">
								   <label for="exampleInputPassword1">Profile-image</label>
								   <input type="file" class="form-control" name="u_image">
								   <small id="imgHelp" class="form-text text-muted"></small>
								  </div>
								  
								  
								 
								  <div class="form-group">
								  <button type="submit" class="btn btn-primary"   id="submit">Submit</button>
								  </div>
								</form>
						
						</div>
					
					</div>
					
				</div>
			</div>
		
		</div>
	</main>

<!-- json validation
<script >
$(document).ready(function(){
	console.log("loaded");
	$('#reg_form').on('submit' , function(event) {
		event.preventDefault();
		
		let form =new FormData(this);
		//send register servlet
		$.ajax({
			
			url: "register_servlet",
			type:'get',
			data:form,
			success: function(data,textStatus,jqXHR) {
				concole.log(data)
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log(jqXHR)
			},
			processData: false,
			contentType: false
			
		});
	})

});
</script>
 -->
<!-- form VAlidation by jQuery -->

<!-- java Script -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/js2.js"></script>
<script type="text/javascript" src="C:\jquery-3.5.1"></script>

<script >
	$(document).ready(function () {
		$('#submit').click(function () {
			var user=$('#exampleInputName').val();
			if (user.length<=0) {
				$('#nameHelp').html("<b style='color:red'>**Field Is Mandatory</b>");
				return false;
			}
			else if (user.length<=2 || user.length>=25) {
				$('#nameHelp').html("<b style='color:red'>**Please enter name between 3-25 letters</b>");
				return false;
			}
			if (user.length>=2 || user.length<=25) {
				$('#nameHelp').html("");				
			}
			
			var contact=$('#number').val();
			if((((contact.length)))>10||(((contact.length)))==1||(((contact.length)))==2||(((contact.length)))==3||(((contact.length)))==4||(((contact.length)))==5||(((contact.length)))==6||(((contact.length)))==7||(((contact.length)))==8||(((contact.length)))==9)
			{
				$('#contactHelp').html('<b style="color:red">**please enter 10 digit valide number</b>');
				return false;
			}
			if((((contact.length)))==10)
			{
				$('#contactHelp').html("");
				
			}
			var password=$('#exampleInputPassword1').val();
			if(password.length<6)
			{
				$('#passwordtHelp').html('<b style="color:red">**Password must contain atleast 6 letters</b>');
				return false;
			}
			if(password.length>6)
			{
				$('#passwordtHelp').html('');
				
			}
			
			var check=$('#exampleCheck1').val();
			console.log(check);
			if(check!=null)
				{
					$('#checkHelp').html('<b style="color:red">**Please check me ...</b>');
					//$('#submit').removeAttr('disabled');
					
					return false;
				}
			if(check=null)
			{
				$('#checkHelp').html('');
				
				
			}
				
				
			
		})	
	});

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
	<script type="text/javascript" src="java_script/js2.js"></script>


</body>



</html>