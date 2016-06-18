<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>userProfile</title>

<!--##########################################|Css Files|########################################################## -->
<link
	href="resources/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">
<link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">
<link href="resources/css/bootsnipp.min.css" rel="stylesheet">
<link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">
<link href="resources/bower_components/morrisjs/morris.css"
	rel="stylesheet">
<link
	href="resources/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="resources/css/smoke.css" rel="stylesheet">
<link href="resources/css/smoke.min.css" rel="stylesheet">
<link href="resources/css/custom.css" rel="stylesheet">
<link href="resources/css/viewerProfile.css" rel="stylesheet">
<!--##########################################|Css Files|########################################################## -->


</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<%-- <jsp:include page="navbar.jsp" /> --%>
		<jsp:include page="navbar_bootsnipp.jsp" />

		<!-- Page Content -->
<!-- 		<div id="page-wrapper"> -->
			<div class="container-fluid">
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-6">
							<div class="well well-sm">
								<div class="row">
									<div class="col-sm-6 col-md-4">
										<img id="blah" name="blah" src="data:${viewUser_contenttype};base64,${viewUser_image}" style="height:160px;width:160px;" alt="your image" class="avatar img-circle img-thumbnail" alt=""/>
									</div>
									<div class="col-sm-6 col-md-8">
										<h4>${viewUser_fName} ${viewUser_lName}</h4>
										<small><cite title="San Francisco, USA">${viewUser_userId}<i class="glyphicon glyphicon-map-marker">
											</i>
										</cite></small>
										<p>
											<i class="glyphicon glyphicon-envelope"></i>${viewUser_email}
											<br /> <i class="glyphicon glyphicon-globe"></i><a
												href="http://www.jquery2dotnet.com">www.jquery2dotnet.com</a>
											<br /> <i class="glyphicon glyphicon-gift"></i>June 02, 1988
										</p>
										<!-- Split button -->
										<div class="btn-group">
											<button type="button" class="btn btn-primary">
												Social</button>
											<button type="button" class="btn btn-primary dropdown-toggle"
												data-toggle="dropdown">
												<span class="caret"></span><span class="sr-only">Social</span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Twitter</a></li>
												<li><a
													href="https://plus.google.com/+Jquery2dotnet/posts">Google
														+</a></li>
												<li><a href="https://www.facebook.com/jquery2dotnet">Facebook</a></li>
												<li class="divider"></li>
												<li><a href="#">Github</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
<!-- 		</div> -->
	</div>


	<!--##########################################|js Files|########################################################## -->
	<script src="resources/bower_components/jquery/dist/jquery.min.js"></script>
	<script
		src="resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="resources/dist/js/sb-admin-2.js"></script>
	<script
		src="resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>
	<script src="resources/js/scripts.min.js"></script>
	<script src="resources/js/smoke.js"></script>
	<script src="resources/js/smoke.min.js"></script>
	<script src="resources/js/bootsnipp_navBar.js"></script>
	<script src="resources/js/common.js"></script>
	<!--##########################################|js Files|########################################################## -->


</body>

</html>
