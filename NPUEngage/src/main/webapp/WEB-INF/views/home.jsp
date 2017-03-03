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
		<div class="mycontainer">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="row">
                        <div class="col-lg-5">
							<input type="text" name="title" placeholder="Job Title">                        
						</div>
                        <div class="col-md-4">
                            <input type="text" name="location" placeholder="Location">
                        </div>
                        <div class="col-lg-2">
							<a class="btn btn-dark searchbtn" href="#portfolio">Search</a>                      
						</div>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
	  
	</header>
	
	<!-- Job Listing -->
    <section id="portfolio" class="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Job Listing</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-lg-3">
                            <textarea class="search"></textarea>
                        </div>
                        <div class="col-md-9">
                            <textarea class="textarea"></textarea>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                    <a href="#" class="btn btn-dark">View More Items</a>
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

	<!-- jQuery -->
	<script src="resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>

</body>
</html>


