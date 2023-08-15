<<<<<<< HEAD
<%@page import="java.util.List"%>
<%@page import="com.ytproject.entities.Chatroom"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ytproject.dao.Dao"%>
<%@page import="com.ytproject.entities.User"%>
<%@page import="java.util.Set"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ytproject.helper.ConnectionProvider"%>

<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
int userid = 0;

//User u=(User) session.getAttribute("currentuser");
User chat_user = (User) session.getAttribute("curentUser");
if (chat_user == null) {

	response.sendRedirect("index.jsp");
} else {
	userid = chat_user.getId();

}
%>





<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css_files/NewFile.css">
<link rel="stylesheet" href="css_files/chatroom.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.chat-member {
	padding: 15px;
	background-color: white;
}

.member {
	display: flex;
	height: 50px;
	border: 1px solid;
	border-style: dashed;
	border-radius: 16px;
	background: #246d66;
	margin-bottom: 5px;
}

.member-pic {
	width: 42px;
	height: 48px;
	border-radius: 15px;
	position: relative;
	left: 2px;
	border: 1px solid white;
}

.member-details {
	margin-left: 15px
}
.dim1
{height: 98% !important;
    overflow: hidden !important;
    position: fixed !important;
    

}
.dim2
{
height: 503px !important;
    scroll-behavior: smooth !important;
    overflow-y: scroll !important;
    
padding-bottom:40px;

}
/*
.conversation .conversation-container {
    height: calc(100% ) !important;
    box-shadow: inset 0 10px 10px -10px #000000;
    overflow-x: hidden;
    padding: 0 16px;
    margin-bottom: 5px;
}	


*/
</style>
</head>
<body>


	<!-- modal fade-->
	<div class=" modal fade dim1" id="ChatRoom-model" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">



		<div class="modal-dialog" role="document">

			<div class="modal-content">

				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">
						<span class="far fa-comment" > Chat Room</span>
					</h3>
					<button type="button" class="close" data-dismiss="modal"
						onclick="closemodel()" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="chat-member dim2" id="chat-member">
					<%
					String sql = "select id,name,email,profile_image,contact from user_inf where id!=" + userid;

					/*
					Connection chat_con=ConnectionProvider.getConnection();
					String sql="select id,name,email,profile_image from user_inf";
					Statement chat_stmt=chat_con.createStatement();
					ResultSet chat_set= chat_stmt.executeQuery(sql);
					*/
					ResultSet chat_set = new Dao(ConnectionProvider.getConnection()).getData(sql);
					while (chat_set.next()) {
					%>

					<div class="member" data=<%=chat_set.getInt("id")%>
						onclick="openchat('<%=chat_set.getInt("id")%>','<%=chat_set.getString("name")%>','<%=chat_set.getString("profile_image")%>','<%=chat_set.getString("contact")%>')">

						<div>
							<img class="member-pic"
								src="pic\<%=chat_set.getString("profile_image")%>">
						</div>
						<div class="member-details">
							<span><%=chat_set.getString("name")%></span><br /> <span><%=chat_set.getString("email")%></span>
						</div>

					</div>
					<%
					}
					%>



				</div>

				<div class="chat" style="display: none" id="chat">
					<div class="chat-container">
						<div class="user-bar">
							<div class="back">
								
									<i class="fa-solid fa-backward" id="back"></i>
							</div>
							<div class="avatar">

								<img src="" id="receiverimg" alt="Avatar"
									style="border-radius: 12px; position: absolute; top: -5px;">
							</div>
							<div class="name">
								<span id="receivername"></span> <span id="receivernumber"
									class="status"></span>
							</div>
							<div class="actions more">
								<i class="zmdi zmdi-more-vert"></i>
							</div>
							<div class="actions attachment">
								<i class="zmdi zmdi-attachment-alt"></i>
							</div>
							<div class="actions">
								<i class="zmdi zmdi-phone"></i>
							</div>
						</div>
						<div class="conversation dim2" style="height:356px !important">
							<div class="conversation-container" id="conversation-container" style="height: auto !important">

								<img src='pic/java.jpg'>

								
							</div>

						</div>
							<div class="modal-footer">
						<textarea class="form-control chat_input"
							placeholder="Start Typing...." id="textAreaExample" rows="4"></textarea>

						<span class="fa fa-send send_btn" id="btn_send"></span> <span
							class="fa fa-ellipsis-v"></span>

					</div>
						
					</div>








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
	<script src='https://kit.fontawesome.com/a076d05399.js'
		crossorigin='anonymous'></script>

	<script>
	
			
		var receiverID=0;
		var livechat<%=userid%>='';
		var lastactime='';
		function openchat(id, name, img, contact) {
			debugger;
			  receiverID = id;

			/*=============================*/

			const d = {
				rid : receiverID,
				sid :<%=userid%>,
				operation:'loadchat'
		

			}
			$.ajax({

				url : "ChatRoom",
				data : d,
				method : 'POST',
				
				success : function(data, textStatus, jqXHR) {

					console.log(data);

					$("#conversation-container").html(data);

					$("#chat-member").hide();
					$("#chat").show();

					$("#receivername").html(name);
					$("#receiverimg").attr("src", "pic/" + img);
					$("#receivernumber").html(
							"<i class='fas fa-mobile-alt' ></i>  " + contact);
					
					livechat<%=userid%>=setInterval(getLiveChat,1000,<%=userid%>,receiverID);

				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR);

				}

			});
		}
		function closemodel() {
			
			$("#chat-member").show();
			$("#chat").hide();
			clearInterval(livechat<%=userid%>);
		}
		$("#back").click(function() {
			$("#chat-member").show();
			$("#chat").hide();
			clearInterval(livechat<%=userid%>);

		});
		$("#btn_send").click(function() {
			if($("#textAreaExample").val()=='')
				return;
			const dd = {
					rid : receiverID,
					sid :<%=userid%>,
					content:$("#textAreaExample").val(),
					operation:'insertchat'
			

				}
			$.ajax({	
				url : "ChatRoom",
				data : dd,
				method : 'POST',
				success : function(data, textStatus, jqXHR) {

					var a=new Date();
					var month=parseInt(a.getMonth()+1)<10?"0"+parseInt(a.getMonth()+1):parseInt(a.getMonth()+1);
					var date=parseInt(a.getDate())<10?"0"+a.getDate():a.getDate();
					var h=parseInt(a.getHours())<10?'0'+a.getHours():a.getHours();
					var m=parseInt(a.getMinutes())<10?'0'+a.getMinutes():a.getMinutes();
					var s=parseInt(a.getSeconds())<10?'0'+a.getSeconds():a.getSeconds()
							var timestamp=a.getFullYear()+'-'+month+'-'+date+' '+h+':'+m+':'+s;
					//var timestamp=a.getFullYear()+"-"+(parseInt(a.getMonth()+1) < 10 ? month : a.getMonth()+1)+'-'+a.getDay()>10?date:a.getDay() +' '+a.getHours()+':'+a.getMinutes()+':'+ a.getSeconds()
						//var timestamp=a.getFullYear()+"-"+month+'-'+date +' '+parseInt(a.getHours())<10?+'0'+a.getHours():a.getHours()+':'+parseInt(a.getMinutes())<10?+'0'+a.getMinutes():a.getMinutes()+':'+ parseInt(a.getSeconds())<10?+'0'+a.getSeconds():a.getSeconds();
					$("#conversation-container:last-child").append("<div class='message sent'>"+$("#textAreaExample").val()+ "<span class='metadata'> <span class='time'>"+getTime(new Date())+"</span></span><span class='actime' style='display:none'>"+timestamp+"</span></div>");
					$('#textAreaExample').val('')
					livechat=setInterval(getLiveChat,1000,<%=userid%>,receiverID);


				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR);

				}

			});
			
		});
		function getTime(date) {
			var h=date.getHours();
			var m=date.getMinutes();
			var t=h>=12?'pm':'am';
			h=h%12;
			h=h?h:12;
			m=m<10?'0'+m : m;
			return h+':'+m+' '+t;
			
			
		}
		function getLiveChat(senderid,recid) {
			var actime=$("#conversation-container div:last-child .actime").html();
			actime=actime.replace('.',':');
			/*if(lastactime!=actime)
				{*/
				lastactime=actime
				
			const data={
					rid : recid,
					sid :senderid,
					time:actime,
					operation:'getlivechat'						
			};
			$.ajax({	
				url : "ChatRoom",
				data : data,
				method : 'POST',
				success : function(data, textStatus, jqXHR) {

					console.log(data);
					if(data != null && data != "")
						{
										$("#conversation-container:last-child").append(data);
						}
					

					
					//a.getFullYear()+"-"+(a.getMonth()+1)+'-'+a.getDay() +' '+a.getHours()+':'+a.getMinutes()+':'+ a.getMilliseconds()
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR);

				}

			});
				//}
		}
	
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
<link rel="stylesheet" href="css_files/chatroom.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">


</style>
</head>
<body>



	<div class=" " id="ChatRoom" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">
						<span class="far fa-comment" /> Chat Room
					</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="chat">
          <div class="chat-container">
            <div class="user-bar">
              <div class="back">
                <i class="zmdi zmdi-arrow-left"></i>
              </div>
              <div class="avatar">
                <img src="" alt="Avatar">
              </div>
              <div class="name">
                <span>Zeno Rocha</span>
                <span class="status">online</span>
              </div>
              <div class="actions more">
                <i class="zmdi zmdi-more-vert"></i>
              </div>
              <div class="actions attachment">
                <i class="zmdi zmdi-attachment-alt"></i>
              </div>
              <div class="actions">
                <i class="zmdi zmdi-phone"></i>
              </div>
            </div>
            <div class="conversation">
              <div class="conversation-container">
                <div class="message sent">
                  What happened last night?
                  <span class="metadata">
                      <span class="time"></span><span class="tick"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" id="msg-dblcheck-ack" x="2063" y="2076"><path d="M15.01 3.316l-.478-.372a.365.365 0 0 0-.51.063L8.666 9.88a.32.32 0 0 1-.484.032l-.358-.325a.32.32 0 0 0-.484.032l-.378.48a.418.418 0 0 0 .036.54l1.32 1.267a.32.32 0 0 0 .484-.034l6.272-8.048a.366.366 0 0 0-.064-.512zm-4.1 0l-.478-.372a.365.365 0 0 0-.51.063L4.566 9.88a.32.32 0 0 1-.484.032L1.892 7.77a.366.366 0 0 0-.516.005l-.423.433a.364.364 0 0 0 .006.514l3.255 3.185a.32.32 0 0 0 .484-.033l6.272-8.048a.365.365 0 0 0-.063-.51z" fill="#4fc3f7"/></svg></span>
                  </span>
                </div>
                <div class="message received">
                  You were drunk.
                  <span class="metadata"><span class="time"></span></span>
                </div>
                <div class="message sent">
                  No I wasn't.
                  <span class="metadata">
                      <span class="time"></span><span class="tick"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" id="msg-dblcheck-ack" x="2063" y="2076"><path d="M15.01 3.316l-.478-.372a.365.365 0 0 0-.51.063L8.666 9.88a.32.32 0 0 1-.484.032l-.358-.325a.32.32 0 0 0-.484.032l-.378.48a.418.418 0 0 0 .036.54l1.32 1.267a.32.32 0 0 0 .484-.034l6.272-8.048a.366.366 0 0 0-.064-.512zm-4.1 0l-.478-.372a.365.365 0 0 0-.51.063L4.566 9.88a.32.32 0 0 1-.484.032L1.892 7.77a.366.366 0 0 0-.516.005l-.423.433a.364.364 0 0 0 .006.514l3.255 3.185a.32.32 0 0 0 .484-.033l6.272-8.048a.365.365 0 0 0-.063-.51z" fill="#4fc3f7"/></svg></span>
                  </span>
                </div>
                <div class="message received">
                  <span id="random">You were hugging an old man with a beard screaming "DUMBLEDORE YOU'RE ALIVE!"</span>
                  <span class="metadata"><span class="time"></span></span>
                </div>
              </div>
              
            </div>
          </div>
        
				
				<!-- 
				<div class="modal-body">
				  <div class="d-flex flex-row justify-content-start mb-4">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
                alt="avatar 1" style="width: 45px; height: 100%;">
              <div class="p-3 ms-3" style="border-radius: 15px; background-color: rgba(57, 192, 237,.2);">
                <p class="small mb-0">...</p>
              </div>
            </div>
             <div class="d-flex flex-row justify-content-end mb-4">
             
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2-bg.webp"
                alt="avatar 1" style="width: 45px; height: 100%;">
            </div>
            -->
				<!-- 
				<section style="background-color: #eee;">
  <div class="container py-5">

    <div class="row d-flex justify-content-center">
      <div class="col-md-8 col-lg-6 col-xl-4">

        <div class="card" id="chat1" style="border-radius: 15px;">
        
          <div class="card-body">

            <div class="d-flex flex-row justify-content-start mb-4">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
                alt="avatar 1" style="width: 45px; height: 100%;">
              <div class="p-3 ms-3" style="border-radius: 15px; background-color: rgba(57, 192, 237,.2);">
                <p class="small mb-0">Hello and thank you for visiting MDBootstrap. Please click the video
                  below.</p>
              </div>
            </div>

           

            
          
            <div class="form-outline">
              
              <label class="form-label" for="textAreaExample">Type your message</label>
            </div>

          </div>
        </div>

      </div>
    </div>

  </div>
</section>
				</div>
					
 -->
						<div class="modal-footer">
						<textarea class="form-control chat_input" placeholder="Start Typing...." id="textAreaExample" rows="4"></textarea>
							
							<span class="fa fa-send send_btn"></span>
							<span class="fa fa-ellipsis-v"></span>

						</div>
				



			




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
	<script src='https://kit.fontawesome.com/a076d05399.js'
		crossorigin='anonymous'></script>

	<script>
		
	</script>


</body>
</html>
>>>>>>> d9955a9ab8c53102d24d34c37ad539d41ecf6f67
