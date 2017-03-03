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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>		
	<!-- Header -->
	<header id="top" class="header">
		<div class ="topcorner">
		<form action="./gotoLoginProfile" method="GET">
			<a href="./gotoLoginProfile">
			<img class="profile-img" src="http://bbsimg.ngfiles.com/2/4415000/ngbbs420f87bbdc87d.gif" alt="HTML5 Icon">
			</a>
			<label class="profile-name">${jobseeker.firstName}</label>
		</form>
		</div>
		<div id="profile_box">
			<div id="content" class="clearfix">
			 <div id="userphoto"><img src="https://image.flaticon.com/sprites/new_packs/147128-avatar-compilation.png" alt="user image"></div>
      			<h1>User Profile</h1>
      			
      			 <nav id="profiletabs">
			        <ul class="clearfix">
			          <li><a href="#bio" class="sel">Details</a></li>
			          <li><a href="#activity">Activity</a></li>
			          <li><a href="#friends">Friends</a></li>
			          <li><a href="#settings">Settings</a></li>
			        </ul>
			      </nav>
      			
      			<!-- Section -->
      			 <section id="bio">
      			 	  <p>Edit your user profile:</p>
	      			 
						<input type="text" class="details" name="firstName" placeholder="FirstName">
						<input type="text" class="details" name="lastName" placeholder="LastName">
						<input type="text" class="details" name="email" placeholder="EmailID">
						<input type="text" class="details" name="jobtitle" placeholder="JobTitle">
							<form  action="myform.cgi" class="fileupload">
							<input type="file" name="fileupload" value="fileupload" id="fileupload">
							<label for="fileupload"> Select a resume to upload</label>
							<input type="submit" value="submit">
							</form>
						<input type="submit" class="savebtn" name="sign" class="login loginmodal-submit" value="Save">
					  
				  
      			 </section>
      			 
      			 <section id="activity" class="hidden">
      			 <p>user activities</p>
      			 </section>
      			 
      			 <section id="friends" class="hidden">
      			 <p>friend List</p>
      			 </section>
      			 
      			 <section id="settings" class="hidden">
      			 <p>user setting</p>
      			 </section>
			</div>		
		</div>
	</header>
	

	<!-- jQuery -->
	<script src="resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	$(function(){
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
	});
</script>

</body>
</html>


