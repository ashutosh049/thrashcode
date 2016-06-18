<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ERROR ! Article Not Found</title>

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
	<link href="resources/css/article.css" rel="stylesheet" type="text/css">
	<link href="resources/css/custom.css" rel="stylesheet">
	<link href="resources/css/testimonials_with_carousel.css" rel="stylesheet">
	<link href="resources/css/blogList.css" rel="stylesheet">
	<link href="resources/css/bootstrap-tokenfield.css" rel="stylesheet">
<!--##########################################|Css Files|########################################################## -->

</head>

<body>

	<%-- <jsp:include page="navbar.jsp"/> --%>
	<jsp:include page="navbar_bootsnipp.jsp" />
	<div id="wrapper">
		<div class="errorImg" style="float: left">
			<!-- <img src="resources/images/not_available_2.jpg"> -->
		</div>
		<div class="error-template">
			<h1>Oops!</h1>
			<h2>${argArticleTitle}</h2>
			<div class="error-details">The Article you were looking for
									   '${argArticleTitle}' could not be 
									   loaded properly, may be it's still 
									   under process !</div>
			<div class="error-actions">
				<a href="index" class="btn btn-primary btn-lg"> <span
					class="glyphicon glyphicon-home"></span> Take Me Home
				</a><a href="index" class="btn btn-default btn-lg"><span
					class="glyphicon glyphicon-envelope"> </span> Contact Support </a>
			</div>
		</div>
	</div>

	<!--##########################################|js Files|########################################################## -->
	<script src="resources/bower_components/jquery/dist/jquery.min.js"></script>
	<script	src="resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="resources/dist/js/sb-admin-2.js"></script>
	<script src="resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>
	<script src="resources/ckeditor/ckeditor.js"></script>
	<script src="resources/js/scripts.min.js"></script>
	<script src="resources/js/article.js"></script>
	<script src="resources/js/articleCreate.js"></script>
	<script src="resources/js/bootstrap-tokenfield.min.js"></script>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/smoke.js"></script>
	<script src="resources/js/smoke.min.js"></script>
	<script src="resources/js/stars.js"></script>
	<script src="resources/js/bootsnipp_navBar.js"></script>
<!--##########################################|js Files|########################################################## -->
</body>
</html>
