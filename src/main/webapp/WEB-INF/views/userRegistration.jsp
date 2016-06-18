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

<title>UserRegistration</title>

<script language="JavaScript">
	function Validate() {
		var image = document.getElementById("image").value;
		if (image != '') {
			var checkimg = image.toLowerCase();
			if (!checkimg.match(/(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/)) {
				alert("Please enter Image File Extensions .jpg,.png,.jpeg");
				document.getElementById("image").focus();
				return false;
			}
		}
		return true;
	}
</script>

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
<!-- FB SDK -->
<!-- <script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '827243510736589',
      xfbml      : true,
      version    : 'v2.5'
    });
    FB.getLoginStatus(function(response) {
    	  if (response.status === 'connected') {
    	    console.log('Logged in.');
    	  }
    	  else {
    	    FB.login();
    	  }
    	});
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script> -->
<!-- FB SDK -->

<div id="fb-root"></div>
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '827243510736589',
      xfbml      : true,
      version    : 'v2.5',
   	  status     : true, 
      cookie     : true,
      oauth      : true,
    });
    FB.api('/me', {fields: 'last_name'}, function(response) {
  	  alert("last name :"+response.name);
  	  console.log(response.name);
  	});
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
  
  
  
</script>


<!-- FB login -->

<!-- <script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.5&appId=827243510736589";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
 --><!-- FB login -->

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
							<img id="blah" name="blah" src="resources/images/user_8.png" alt="your image" class="avatar img-circle img-thumbnail" alt=""/>
						</div>
					</div>
					<div class="col-md-8 col-sm-6 col-xs-12 personal-info">
						<h3>Personal info</h3>
						<form id="new_user_registration_form" 
					           class="form-horizontal" 
					           role="form" 
					           data-smk-icon="glyphicon-remove-sign" 
					           runat="server"
					           method="post"
					           action="handleUserRegistration"
					           enctype="multipart/form-data">
							<div class="form-group">
								<label class="col-lg-3 control-label">First name:</label>
								<div class="col-lg-8">
									<input autofocus="autofocus" id="user_fname" name="user_fname" class="form-control" type="text" data-smk-msg="Required field" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Last name:</label>
								<div class="col-lg-8">
									<input name="user_lname" class="form-control" type="text" data-smk-msg="Required field" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Email:</label>
								<div class="col-lg-8">
									<input name="user_email" class="form-control"	type="email" data-smk-msg="Required field" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Username:</label>
								<div class="col-md-8">
									<input name="user_id" class="form-control" type="text" data-smk-msg="Required field" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Password:</label>
								<div class="col-md-8">
									<input name="user_pwd" id="pass1" class="form-control" type="password" data-smk-msg="Required field" data-smk-strongPass="medium" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Confirm password:</label>
								<div class="col-md-8">
									<input name="user_pwd" id="pass2" class="form-control" type="password" data-smk-msg="Required field" data-smk-strongPass="medium" required="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Picture:</label>
								<div class="col-md-8">
									<input name="user_img" type="file" class="text-center center-block well well-sm" id="user_img" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"></label>
								<div class="col-md-8">
									<input class="btn btn-info" value="Save Changes" id="registerUserBtn" type="button"> <span></span> 
								</div>
								<div class="col-md-8">
									<div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="true"></div>
								</div>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- FB Like -->
<div
  class="fb-like"
  data-share="true"
  data-width="450"
  data-show-faces="true">
</div>
	<!--##########################################|js Files|########################################################## -->
	<script src="resources/bower_components/jquery/dist/jquery.min.js"></script>
	<script	src="resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="resources/dist/js/sb-admin-2.js"></script>
	<script src="resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>
	<script src="resources/js/scripts.min.js"></script>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/smoke.js"></script>
	<script src="resources/js/smoke.min.js"></script>
	<script src="resources/js/stars.js"></script>
	<script src="resources/js/bootsnipp_navBar.js"></script>
	<script src="resources/js/userRegistration.js"></script>
<!--##########################################|js Files|########################################################## -->
	
	
</body>

</html>
