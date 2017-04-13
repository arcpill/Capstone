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
<script>
function popupDet(){
	var modal = document.getElementById('editDetails');
	modal.style.display = "block";
}
</script>
<body>		

	<div class="topnav">
				<input type="text" id="sName" placeholder="Search Name..">
				<img onClick = viewOtherProfile() src="http://www.cupahr.org/knowledgecenter/img/icons/Search.png">					
			  	<a href="./gotoLoginProfile">Go to Profile</a>
		  		<a href="./gotoStudentBoard">Student Board</a>
		  		<a href="./">LogOut</a>
		  		<div id = "error" style="color: blue"><h6>${errors}</h6></div>
	</div>
				
	</div>
	<!-- Header -->
	<header id="top" class="header"><h3></h3>
		<div class ="topcorner"> 
			<!-- <a href="./gotoLoginProfile">
			<img class="profile-img" src="http://bbsimg.ngfiles.com/2/4415000/ngbbs420f87bbdc87d.gif" alt="HTML5 Icon">
			</a> -->
			<label class="profile-name h4.small" ><strong>Hi .. ${jobseeker.firstName}</strong></label>
		</div>
			<div class="mycontainer">
            <div class="row">
                	<div class="col-lg-12 text-center">
                	<div class="row">
                        <div class="col-lg-5">
						</div>
                        <div class="col-md-4">                        
                        </div>
                        <div class="col-lg-2">
							<a class="btn btn-dark searchbtn" href="./postJobRequest">Post A Job</a>                      
						</div>
                </div>
                	<hr>
 				<form action="./searchJobForm" method="GET" commandName="postjob">
                    <div class="row">
                        <div class="col-lg-5">
							<input type="text" name="jobtitle" placeholder="Job Title">                        
						</div>
                        <div class="col-md-4">
                            <input type="text" name="joblocation" placeholder="Location">
                        </div>
                        <div class="col-lg-2">
                        <button class="btn btn-dark searchbtn" >Search</button>
						</div>
                </div>
                 </form>
                <!-- /.col-lg-10 -->
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
            	
                <div class="col-lg-12 text-left">
                    <h2>Job Listing</h2>
                    <hr class="small">
                    <div class="row">
                        <c:set var="index" value="1"/>
      <c:forEach items="${sessionScope.searchjobList}" var="curOrder"> 
                        <div class="col-md-3">
                            <div class="textarea">
                       
      <div><b>${curOrder.jobtitle}</b></div>
      <div>	<b>${curOrder.companyName}</b></div>
      <div>${curOrder.joblocation}</div>
      <div>${curOrder.jobType}</div>
      <b>job description :</b> <div>${curOrder.jobdescription}</div>
		<button ><a href="#editDetails" id="showbox" onclick="popupDet()"><i
								class="fa fa-pencil" aria-hidden="true">Easy Apply</i></a></button>
       </div>
       </div>
      <c:set var="index" value="${index+1}"/>
		
      </c:forEach>
    





                    </div>
                    <!-- /.row (nested) -->
                    <a href="#" class="btn btn-dark">View More Items</a>
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
 <div id="editDetails" class="editProfileDet">
						<form action="./SubmitApplication" method="POST">
						<div class="form-group">
						<div class="col-md-4">
								<input type="text" class="details" name="companyname" placeholder="Company Name" 
								value= "${profile.email}"> 
								</div>
								</div>
							 <div class="form-group">
							 	<div class="col-md-4">
								<input type="text" class="details" name="email" placeholder="EmailID" 
								value= "${profile.email}"> 
								</div>
								<div class="col-md-4">
								<input type="text" class="details" name="phoneno" placeholder="Phone no">
								</div>
								<div class="col-md-4">
								<input type="file" class="details" name="file" placeholder="Resume"> 
								</div>
							</div>
								<div class="col-md-12">
								<textarea class=" details exp_textarea" name="experienceString" id="expString"
								placeholder="Cover Letter(Optional)" ></textarea>
								</div>
								<div class="col-md-3">
								<input type="submit" data-inline="true" class="savebtn" name="sign" class="login loginmodal-submit" value="Submit">
								</div>
						</form>
					</div>
					
    </section>

	<!-- jQuery -->
<!-- 	<script src="resources/js/jquery.js"></script>
 -->
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


	</script>

</body>
</html>


