<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<title>Stylish Portfolio - Start Bootstrap Theme</title>

<!-- Bootstrap Core CSS -->
<link href="<c:url value="resources/css/bootstrap.min.css"/>"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="<c:url value="resources/css/stylish-portfolio.css"/>"
	rel="stylesheet">
<link href="<c:url value="resources/css/archana.css"/>" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="<c:url value="resources/font-awesome/css/font-awesome.min.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"/>"
	rel="stylesheet" type="text/css">

<!-- autocomplete libs -->	
<link href="<c:url value ="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>" rel="stylesheet"></link>
<script src= "<c:url value ="http://code.jquery.com/jquery-1.9.1.js"/>"></script>
<script src="<c:url value ="http://code.jquery.com/ui/1.10.3/jquery-ui.js"/>"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div class="topnav">
				<input type="text" id="sName" placeholder="Search Name..">
				<img onClick = viewOtherProfile() src="http://www.cupahr.org/knowledgecenter/img/icons/Search.png">	
			  	<a href="./gotoJobListing">Job Listing</a>
		  		<a href="./gotoStudentBoard">Student Board</a>
		  		<a href="./">LogOut</a>
	</div>
	<!-- Header -->
	<header id="top" class="header">
		<div id="profile_box">
			<div id="content" class="clearfix">
				<div id="userphoto">
					<img
						src="https://image.flaticon.com/sprites/new_packs/147128-avatar-compilation.png"
						alt="user image">
				</div>
				<h1>${jobseeker.firstName}${jobseeker.lastName} Profile</h1>

				<nav id="profiletabs">
					<ul class="clearfix" id="profTabs">
						<li><a href="#bio" class="sel">Details</a></li>
						<li><a href="#activity">Activity</a></li>
						<li><a href="#friends">Friends</a></li>
						<li><a href="#settings">Settings</a></li>
					</ul>
				</nav>

				<!-- Section -->
				<section id="bio">

						<!-- show details -->
							<a href="#editDetails" id="showbox" onclick="popupDet()"><i
								class="fa fa-pencil" aria-hidden="true">Edit</i></a>
							<div class="text-center" >
								<div class="col-md-12">
								<h4 class=" h3 text-center">${profile.email}</h4>
								<h4 class=" h4 medium text-center">${profile.address}</h4>
								<h4 class=" h4 medium text-center">${profile.jobtitle}</h4>
								<hr>
								</div>
							
								<div class="col-md-12">
								<h4 class="h4 text_center"><strong>Summary</strong></h4>
								
								<h5 class=" h5 text-left">${profile.skills}</h5>
								<div id="expshow"></div>
								<%-- <textarea class=" details exp_textarea h5 text-left " name="experienceString"
										placeholder="Experience Summary">${profile.experienceString}</textarea>
								</div> --%>
								<br>
							</div>
							</div>

					<!-- pop up window to edit details -->
					<div id="editDetails" class="editProfileDet">
						<form action="./saveProfileDetails" method="POST"
							commandName="profile">
							<div class="col-md-12">
							<span class="close">&times;</span>
							</div>
							 <div class="form-group">
							 	<div class="col-md-4">
								<input type="text" class="details" name="email" placeholder="EmailID" 
								value= "${profile.email}"> 
								</div>
								<div class="col-md-4">
								<input type="text" class="details" name="address" placeholder="Address" value= "${profile.address}">
								</div>
								<div class="col-md-4">
								<input type="text" class="details" name="jobtitle" placeholder="JobTitle"
								value=${profile.jobtitle}> 
								</div>
							</div>
								<div class="col-md-12">
								<input type="text"
								class="details" name="skills" placeholder="Skills"
								value=${profile.skills}>
								</div>
								<div class="col-md-12">
								<textarea class=" details exp_textarea" name="experienceString" id="expString"
								placeholder="Experience Summary" >${profile.experienceString}</textarea>
								</div>
								<div class="col-md-3">
								<input type="submit" data-inline="true" class="savebtn" name="sign" class="login loginmodal-submit" value="SAVE">
								</div>
						</form>
					</div>
					
					<h4 class=" h4 text-center"><strong>Project Details</strong></h4>
					<a href="#editDetails" id="showbox" onclick="popupPrjtDet()">
					<i class="fa fa-pencil" aria-hidden="true" id="add" >Add</i></a>
					<textarea name="projectdet" id ="prj_details" class ="exp_textarea text-left h5" 
					placeholder="Add Project Description,links" value= ${profile.project_det}> ${profile.project_det}</textarea>
				
					<!-- popup for project details -->
					<div class=" editProfileDet" id ="editprojdet" >
						<div class="col-md-12">
							<span class="close2">&times;</span>
							</div>
					<div class="col-md-12">
					<textarea name="projectdet" id ="project_det" class ="exp_textarea text-left" 
					placeholder="Add Project Description,links" value=${profile.project_det}>${profile.project_det}</textarea>
					</div>
					<div class="col-md-3">
					<input type="submit" data-inline="true" class="savebtn" name="sign" class="login loginmodal-submit" value="SAVE" onclick = "savePrjtClose(); projectDetSave()">
					</div>
					</div>
					<%-- <div class="fileupload">
						<form action="./uploadResume" modelAttribute="file" method="POST"
							enctype="multipart/form-data">
							<input type="file" name="file" value="fileupload"> <label>${resumeStatus}</label>
							<label for="fileupload"> Select resume to upload</label> 
							<input type="submit" value="upload">
						</form>
					</div> --%>
				</section>

				
				<section id="activity" class="hidden">
					<p>Most recent actions:</p>

					<p class="activity">@10:15PM - Applied for a Job</p>

					<p class="activity">@9:50PM - Submitted a sell(book) request</p>

					<p class="activity">@8:15PM - Posted a comment</p>

					<p class="activity">@12:30PM - Submitted a news</p>
				</section>

				<section id="friends" class="hidden">
					<ul id="friendslist" class="clearfix">
						<li><a href="#"><img src="images/avatar.png" width="22"
								height="22"> SomeGuy123</a></li>
					</ul>
				</section>

				<section id="settings" class="hidden">
					<p class="setting">
						<span>Language - English(US)
					</p>

				</section>
			</div>
		</div>
	</header>
	<section id="services" class="services bg-primary-new">
     <div class="container">
     </div>
     </section>


	<!-- jQuery -->
	<!-- <script src="resources/js/jquery.js"></script> -->

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>

	<script type="text/javascript">
	
	//Go to Others Profile
	 function viewOtherProfile(){  
		
			var searchName = document.getElementById('sName').value;
		    window.location.href = '/capstone/gotoOtherProfile?id=' + searchName;
	 }
	
	//AutoComplete for search Profile
	 $(document).ready(function () {

 		$("#sName").autocomplete({ minlength:3,
		source: function (request, response) {
		console.log( "Inside func");
		$.ajax({
				url: "/capstone/AutoCompleteNameList",
				type: "POST",
				dataType: "json",
				data: { term: request.term },
				success: function (data) {
					
					/* for (i = 0; i < data.length; i++) {
		                alert(data[i]);
		            }
 */
				response($.map(data, function (item) {
				return {
						value: item
						};
				})); 
				},
				select: function (event, ui) {
				event.preventDefault();
				$('#sName').val(ui.item.val);
				},
				focus: function (event, ui) {
				event.preventDefault();
				$(this).text(ui.item.label);
				},
				messages: {
				noResults: "", results: "",
				}
				});
				}
				});
 		})
 		
	
	//Show just details tab if this is search profile
	// hide activity friends settings & Edits to Details tab
	 var profileOther ="${other}";
	 if( profileOther == "YES")
	 {
		 document.getElementById("profTabs").children[1].style.display="none";
		 document.getElementById("profTabs").children[2].style.display="none";
		 document.getElementById("profTabs").children[3].style.display="none";
		 document.getElementById("showbox").style.display = "none";
		 document.getElementById("add").style.display = "none";
		 document.getElementById('activity').style.display = "none";
	 }

	//save the space from textarea for exp_string
	var strMultiLineText = document.getElementById("expString").value;
	var strSingleLineText = strMultiLineText.replace(
		    // Replace out the new line character.
		    new RegExp( "\\n", "g" ), 
		    
		    // Put in ... so we can see a visual representation of where
		    // the new line characters were replaced out.
		    " <br /> " 
		    );
	document.getElementById("expshow").innerHTML = "<h5 class='h5 text-left'>"+ strSingleLineText +"</h5>";
	
	//Do not display project details area if empty
	$(function(){
			if (!$.trim($("#prj_details").val())) {
		    // textarea is empty or contains only white-spac
			    document.getElementById("prj_details").style.display ="none";
			}
	});
	
	  $('#profiletabs ul li a').on('click', function(e){
	    e.preventDefault();
	    var newcontent = $(this).attr('href');
	    
	    $('#profiletabs ul li a').removeClass('sel');
	    $(this).addClass('sel');
	    
	    $('#content section').each(function(){
	      if(!$(this).hasClass('hidden')) { $(this).addClass('hidden'); }
	    });
	    
	    $(newcontent).removeClass('hidden');
	  });
	
	
	// popup window settings
	var modal = document.getElementById('editDetails');
	var modalprjt = document.getElementById('editprojdet');
	var span = document.getElementsByClassName("close")[0];
	var span2 = document.getElementsByClassName("close2")[0];
	
	var savePrjtDet = document.getElementsByClassName("savebtn")[0];


	// When the user clicks the button, open the modal 
	function popupDet(){
		modal.style.display = "block";
	}
	
	// When the user clicks the button, open the project modal 
	function popupPrjtDet(){
		modalprjt.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}
	
	span2.onclick = function() {
		modalprjt.style.display = "none";
	}
	
	function savePrjtClose() {
		modalprjt.style.display = "none";
	}
	
	// Send JSON object for project details to be added to profile
	 function projectDetSave(){  

			$("#loading").hide();

			var details = document.getElementById("project_det").value;
			//console.log( details);
			
			$.ajax({
				url: '/capstone/processProjectDetReq',
				type: 'POST', 
				dataType: 'json',
				data: JSON.stringify({"prjt_desc": details}),
				headers: { 
					'Accept': 'application/json',
 					'Content-Type': 'application/json' 
 				}, 
				success: function(result) {
					document.getElementById("prj_details").style.display ="block";
					var headingDiv       = document.getElementById("prj_details");
					headingDiv.innerHTML = result.prjt_desc;
				},
				error: function (xhr, status) {
	            console.log(status); // Output as parseError
	            console.log(xhr.responseText); // My sResponse string ! But Why Here ?
					/* var headingDiv       = document.getElementById("ERROR");
					headingDiv.innerHTML = "<H1>" + xhr.responseText + "</H1>"; */
	        }
	});
	} 
	

</script>

</body>
</html>


