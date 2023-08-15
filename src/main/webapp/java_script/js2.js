<<<<<<< HEAD


function validate(id) {
	
	


	var idname = "#"+id;
	var c = $(idname).val();
	var helpidname = idname + "help";


	if (c == "") {
		$(helpidname).html("<i class='hint'>**Plaese Fill Mandetory</i>");
		return false;
	}
	else {
		$(helpidname).html("");
		return true
	}
	//return false;
}
/*
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

*/

function getip() {
	var a = '';
	$.getJSON("https://api.ipify.org?format=json", function(data) {

		// Setting text of element P with id gfg
		ip = data.ip;
		console.log(data.ip);
		//alert(data.ip);
		//return a;
	})

}
=======


function validate(id) {


	var idname = "#"+id;
	var c = $(idname).val();
	var helpidname = idname + "help";


	if (c == "") {
		$(helpidname).html("<i class='hint'>**Plaese Fill Mandetory</i>");
		return false;
	}
	else {
		$(helpidname).html("");
		return true
	}
	//return false;
}
/*
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

*/

function getip() {
	var a = '';
	$.getJSON("https://api.ipify.org?format=json", function(data) {

		// Setting text of element P with id gfg
		ip = data.ip;
		console.log(data.ip);
		//alert(data.ip);
		//return a;
	})

}
>>>>>>> d9955a9ab8c53102d24d34c37ad539d41ecf6f67
