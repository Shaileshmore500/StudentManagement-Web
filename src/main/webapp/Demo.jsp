<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<input type="text" id="name" name="fname">
<button id="save">save</button>





<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
	
		$('#save').click(function () {
			const d = {
					name:"shilesh"
				}
			$.ajax({

				url: "Demo_servlet",
				data: d,
				//op : "like",
				success: function(data, textStatus, jqXHR) {											
					console.log(data);
					location.reload();
				},
				error: function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR);

					//alert("fff");
				}


				//
			});			
		})
		
	
	
	});
	</script>
</body>
</html>