<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Post Article</title>

	
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


	<input type="hidden" id="arctl_id" value="${arctl_id}" />
	<input type="hidden" id="loggedInUserId" value="${loggedInUserId}" />
	<input type="hidden" id="loggedInUserFName"
		value="${loggedInUserFName}" />
	<input type="hidden" id="loggedInUserLName"
		value="${loggedInUserLName}" />
	<input type="hidden" id="loggedInUserEmail"
		value="${loggedInUserEmail}" />

	<div id="wrapper">

		<!-- Navigation -->
		<%-- <jsp:include page="navbar.jsp" /> --%>
		<jsp:include page="navbar_bootsnipp.jsp" />

		<div id="page-wrapper">
			<br /> <br /> <br />

			<div class="panel-body">
					<form:form method="post" 
								action="publishArticleByForm" 
								htmlEscape="true" 
								modelAttribute="articleModal" 
								enctype="multipart/form-data">
					<div class="row">
						<div class="col-lg-6">

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Article Title:</span> 
									<form:input type="text" id="publishArticle_title" class="form-control" path="artcle_title"/>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Article Type:</span> 
									<form:select class="form-control" id="publishArticle_artcltypes" path="artcle_type">
										<option value="article">Article</option>
										<option value="tips_tricks">tips & triks</option>
									</form:select>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Tags:</span> 
									<form:input type="text" id="publishArticle_tags" class="form-control token-example-field" path="artcl_tags"/>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Description:</span>
									<form:textarea id="publishArticle_desc" class="form-control" path="artcle_brf_desc"></form:textarea>
								</div>
							</div>
						</div>
					</div>
					<!-- ......CKEditor.................. -->
					<form:textarea id="publishArticle_data" name="publishArticle_data" path="artcle_Data"></form:textarea>
					<ckeditor:replace replace="publishArticle_data" basePath="resources/ckeditor/" />
					<br />
					<button id="publishArticleForm_Btn" type="submit" class="btn btn-success">Publish</button>
				</form:form>
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
