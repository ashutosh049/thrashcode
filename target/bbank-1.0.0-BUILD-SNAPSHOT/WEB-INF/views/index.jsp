<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>index_botsnipp</title>
</head>
<body>
	<!-- Head tags to include FontAwesome -->
<head>

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
	<link href="resources/css/testimonials_with_carousel.css" rel="stylesheet">
	<link href="resources/css/blogList.css" rel="stylesheet">
	<link href="resources/css/custom.css" rel="stylesheet">
<!--##########################################|Css Files|########################################################## -->	
</head>

<body>

<!--##########################################|Nav Bar|########################################################## -->
	<jsp:include page="navbar_bootsnipp.jsp"/>	
<!--##########################################|Nav Bar|########################################################## -->


<!--##########################################|Carousel|########################################################## -->
	<jsp:include page="carousal_bootsnipp.jsp"/>
<!--##########################################|Carousel|########################################################## -->


<!-- <div id='spinner'><img src='resources/images/animatedEllipse.gif'></div> -->
<!-- <div class="overlay"><i class="fa fa-refresh fa-spin"></i></div> -->

	<!--##########################################|Articles List|########################################################## -->
	<div class="container">
	    <div class="row">
	        <div class='spinner-div'>
				<div id="spinner">
					<i class="fa fa-refresh fa-spin" style="animation: fa-spin 2s infinite cubic-bezier(.6,-0.28,.74,.05);"></i>
					<div style="font-size: 20px; margin-left: -14px;">loading...</div>
				</div>
			</div>
			
	        <div class="col-md-12"  id="bootarticleDisplayArea">
				<br/><br/><br/><br/><br><br>
	        </div>
	        
	    </div>
	</div>
<!--##########################################|Articles List|########################################################## -->

    
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
<!--##########################################|js Files|########################################################## -->

</body>
</html>