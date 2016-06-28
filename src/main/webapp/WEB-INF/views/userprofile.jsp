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
<link href="resources/css/testimonials_with_carousel.css"
	rel="stylesheet">
<!-- 	<link href="resources/css/blogList.css" rel="stylesheet"> -->
<link href="resources/css/callsomeone.css" rel="stylesheet">
<!--##########################################|Css Files|########################################################## -->


</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<%-- <jsp:include page="navbar.jsp" /> --%>
		<jsp:include page="navbar_bootsnipp.jsp" />

		<!-- Page Content -->
		<div id="page-wrapper_">
			<div class="user-profile-container-fluid">
				<div class="wrapper">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<header id="header">
									<!-- <div class="slider">
										<div id="carousel-example-generic" class="carousel slide"
											data-ride="carousel">
											Wrapper for slides
											<div class="carousel-inner" role="listbox">
												<div class="item active">
													<img
														src="http://placehold.it/1200x400/blue/ffffff&text=Projects">
												</div>
												<div class="item">
													<img
														src="http://placehold.it/1200x400/e67e22/ffffff&text=Work">
												</div>
											</div>

											Controls
											<a class="left carousel-control"
												href="#carousel-example-generic" role="button"
												data-slide="prev"> <span class="fa fa-angle-left"
												aria-hidden="true"></span> <span class="sr-only">Previous</span>
											</a> <a class="right carousel-control"
												href="#carousel-example-generic" role="button"
												data-slide="next"> <span class="fa fa-angle-right"
												aria-hidden="true"></span> <span class="sr-only">Next</span>
											</a>
										</div>
									</div> -->
									<!--slider-->
									<nav class="navbar navbar-default">
										<!-- Brand and toggle get grouped for better mobile display -->
										<div class="navbar-header">
											<button type="button" class="navbar-toggle collapsed"
												data-toggle="collapse" data-target="#mainNav">
												<span class="sr-only">Toggle navigation</span> <span
													class="icon-bar"></span> <span class="icon-bar"></span> <span
													class="icon-bar"></span>
											</button>
											<a class="user-profile-navbar-brand" href="#"> <img
												class="img-responsive user-profile-img"
												src="data:${contenttype};base64,${userimage}">
											</a> <span class="site-name">${user.user_fname}
												${user.user_lname}</span> <span class="site-description">Servicii
												profesionale</span>
										</div>

										<!-- Collect the nav links, forms, and other content for toggling -->
										<div class="collapse navbar-collapse" id="mainNav">
											<ul class="nav main-menu navbar-nav nav-tabs"">
												<li><a href="#"><i class="fa fa-home"
														data-toggle="tab"></i> User</a></li>
												<li><a href="#personal_tab" data-toggle="tab">Personal</a></li>
												<li><a href="#tcAccountDetails_tab" data-toggle="tab">Thrash
														Account Details</a></li>
												<li><a href="#socialDetails_tab" data-toggle="tab">Social
														Details</a></li>
												<li><a href="#professionalDetails_tab"
													data-toggle="tab">Professional Details</a></li>
												<li><a href="#credentials_tab" data-toggle="tab">Credentials</a></li>
											</ul>
											<ul class="nav  navbar-nav navbar-right">
												<li><a href="#"><i class="fa fa-facebook"></i></a></li>
												<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
												<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
												<li><a href="#"><i class="fa fa-twitter"></i></a></li>
												<li><a href="#"><i class="fa fa-stack-overflow"></i></a></li>
												<li><a href="#"><i class="fa fa-github"></i></a></li>
												<li><a href="#"><i class="fa fa-gears"></i></a></li>
											</ul>
										</div>
										<!-- /.navbar-collapse -->
										<div></div>
									</nav>
								</header>
								<!--/#HEADER-->
								<div class="tab-content">
									<div class="tab-pane fade in active" id="personal_tab">
										<h4>_personal_tab</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam, quis nostrud
											exercitation ullamco laboris nisi ut aliquip ex ea commodo
											consequat. Duis aute irure dolor in reprehenderit in
											voluptate velit esse cillum dolore eu fugiat nulla pariatur.
											Excepteur sint occaecat cupidatat non proident, sunt in culpa
											qui officia deserunt mollit anim id est laborum.</p>
									</div>
									<div class="tab-pane fade" id="tcAccountDetails_tab">
										<h4>_tcAccountDetails_tab</h4>
										<p>
											<div class="col-md-8 col-sm-6 col-xs-12 personal-info">
						<h3>Personal info</h3>
						<form id="smkform" class="form-horizontal" role="form"
													data-smk-icon="glyphicon-remove-sign" runat="server"
													method="post" action="userUpdate"
													enctype="multipart/form-data">
							<div class="form-group">
								<label class="col-lg-3 control-label">First name:</label>
								<div class="col-lg-8">
									<input value="${user.user_fname}" name="user_fname"
																class="form-control" type="text"
																data-smk-msg="Required field" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Last name:</label>
								<div class="col-lg-8">
									<input value="${user.user_lname}" name="user_lname"
																class="form-control" type="text"
																data-smk-msg="Required field" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Email:</label>
								<div class="col-lg-8">
									<input value="${user.user_email}" name="user_email"
																class="form-control" type="email"
																data-smk-msg="Required field" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Username:</label>
								<div class="col-md-8">
									<input value="${user.user_id}" name="user_id"
																class="form-control" type="text"
																data-smk-msg="Required field" disabled required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Password:</label>
								<div class="col-md-8">
									<input value="${user.user_pwd}" name="user_pwd" id="pass1"
																class="form-control" type="password"
																data-smk-msg="Required field"
																data-smk-strongPass="medium" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Confirm password:</label>
								<div class="col-md-8">
									<input value="${user.user_pwd}" name="user_pwd" id="pass2"
																class="form-control" type="password"
																data-smk-msg="Required field"
																data-smk-strongPass="medium" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Picture:</label>
								<div class="col-md-8">
									<input value="${user.user_img}" name="user_img" type="file"
																class="text-center center-block well well-sm"
																id="imgInp" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"></label>
								<div class="col-md-8">
									<input class="btn btn-primary" value="Save Changes"
																id="savechanges" type="button"> <span></span> 
								</div>
							</div>
						</form>
					</div>
										</p>
										
									</div>
									<div class="tab-pane fade" id="socialDetails_tab">
										<h4>_socialDetails_tab</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam, quis nostrud
											exercitation ullamco laboris nisi ut aliquip ex ea commodo
											consequat. Duis aute irure dolor in reprehenderit in
											voluptate velit esse cillum dolore eu fugiat nulla pariatur.
											Excepteur sint occaecat cupidatat non proident, sunt in culpa
											qui officia deserunt mollit anim id est laborum.</p>
									</div>
									<div class="tab-pane fade" id="professionalDetails_tab">
										<h4>_professionalDetails_tab</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam, quis nostrud
											exercitation ullamco laboris nisi ut aliquip ex ea commodo
											consequat. Duis aute irure dolor in reprehenderit in
											voluptate velit esse cillum dolore eu fugiat nulla pariatur.
											Excepteur sint occaecat cupidatat non proident, sunt in culpa
											qui officia deserunt mollit anim id est laborum.</p>
									</div>
									<div class="tab-pane fade" id="credentials_tab">
										<h4>_credentials_tab</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam, quis nostrud
											exercitation ullamco laboris nisi ut aliquip ex ea commodo
											consequat. Duis aute irure dolor in reprehenderit in
											voluptate velit esse cillum dolore eu fugiat nulla pariatur.
											Excepteur sint occaecat cupidatat non proident, sunt in culpa
											qui officia deserunt mollit anim id est laborum.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
	<script src="resources/js/userprofile.js"></script>
	<!--##########################################|js Files|########################################################## -->
</body>

</html>