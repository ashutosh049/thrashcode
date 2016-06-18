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
	<link href="resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
	<link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">
	<link href="resources/css/bootsnipp.min.css" rel="stylesheet">
    <link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="resources/bower_components/morrisjs/morris.css" rel="stylesheet">
    <link href="resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="resources/css/smoke.css" rel="stylesheet">
	<link href="resources/css/smoke.min.css" rel="stylesheet">
	<link href="resources/css/custom.css" rel="stylesheet">
	<link href="resources/css/testimonials_with_carousel.css" rel="stylesheet">
	<link href="resources/css/blogList.css" rel="stylesheet">
<!--##########################################|Css Files|########################################################## -->	


</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<%-- <jsp:include page="navbar.jsp" /> --%>
		<jsp:include page="navbar_bootsnipp.jsp" />

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row" style="margin-top: 51px;">
					<!-- left column -->
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="text-center">
							<c:choose>
								<c:when test="${user.user_id!=null || user.user_id != ''}">
									<img id="blah" name="blah" src="data:${contenttype};base64,${userimage}" style="height:160px;width:160px;" alt="your image" class="avatar img-circle img-thumbnail" alt=""/>
								</c:when>
								<c:otherwise>
									<img id="blah" name="blah" src="resources/images/user_8.png" alt="your image" class="avatar img-circle img-thumbnail" alt=""/>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<!-- edit form column -->
					<div class="col-md-8 col-sm-6 col-xs-12 personal-info">
						<h3>Personal info</h3>
						<form id="smkform" 
					           class="form-horizontal" 
					           role="form" 
					           data-smk-icon="glyphicon-remove-sign" 
					           runat="server"
					           method="post"
					           action="userUpdate"
					           enctype="multipart/form-data">
							<div class="form-group">
								<label class="col-lg-3 control-label">First name:</label>
								<div class="col-lg-8">
									<input value="${user.user_fname}" name="user_fname" class="form-control" type="text" data-smk-msg="Required field" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Last name:</label>
								<div class="col-lg-8">
									<input value="${user.user_lname}" name="user_lname" class="form-control" type="text" data-smk-msg="Required field" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Email:</label>
								<div class="col-lg-8">
									<input value="${user.user_email}" name="user_email" class="form-control"	type="email" data-smk-msg="Required field" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Username:</label>
								<div class="col-md-8">
									<input value="${user.user_id}" name="user_id" class="form-control" type="text" data-smk-msg="Required field" disabled required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Password:</label>
								<div class="col-md-8">
									<input value="${user.user_pwd}" name="user_pwd" id="pass1" class="form-control" type="password" data-smk-msg="Required field" data-smk-strongPass="medium" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Confirm password:</label>
								<div class="col-md-8">
									<input value="${user.user_pwd}" name="user_pwd" id="pass2" class="form-control" type="password" data-smk-msg="Required field" data-smk-strongPass="medium" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Picture:</label>
								<div class="col-md-8">
									<input value="${user.user_img}" name="user_img" type="file" class="text-center center-block well well-sm" id="imgInp" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"></label>
								<div class="col-md-8">
									<input class="btn btn-primary" value="Save Changes" id="savechanges" type="button"> <span></span> 
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


<!--##########################################|js Files|########################################################## -->
	<script src="resources/bower_components/jquery/dist/jquery.min.js"></script>
	<script	src="resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="resources/dist/js/sb-admin-2.js"></script>
	<script src="resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>
	<script src="resources/js/scripts.min.js"></script>
	<script src="resources/js/smoke.js"></script>
	<script src="resources/js/smoke.min.js"></script>
	<script src="resources/js/bootsnipp_navBar.js"></script>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/userprofile.js"></script>
<!--##########################################|js Files|########################################################## -->
	
	
</body>

</html>
