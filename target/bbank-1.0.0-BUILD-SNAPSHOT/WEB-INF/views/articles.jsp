<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>articles</title>

	<link href="resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
	<link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">
	<link href="resources/css/smoke.css" rel="stylesheet">
	<link href="resources/css/smoke.min.css" rel="stylesheet">
	<link href="resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="resources/css/custom.css" rel="stylesheet">

</head>

<body>

	<div id="wrapper">

<%-- 		<jsp:include page="navbar.jsp" /> --%>
			<jsp:include page="navbar_bootsnipp.jsp" />
		

		<div id="page-wrapper">
			<br /> <br /> <br /> <br /> <br /> ${loggedInUserFName}
			${loggedInUserLName} <input type="hidden" id="arctl_id"
				value="${arctl_id}" /> <input type="hidden" id="loggedInUserId"
				value="${loggedInUserId}" /> <input type="hidden"
				id="loggedInUserFName" value="${loggedInUserFName}" /> <input
				type="hidden" id="loggedInUserLName" value="${loggedInUserLName}" />
			<input type="hidden" id="loggedInUserEmail"
				value="${loggedInUserEmail}" />

			<!-- search box -->
			<div class="form-group input-group">
				<!-- 			  <form action="fetchArticle"> -->
				<input type="text" class="form-control" id="articleTag"> <span
					class="input-group-btn">
					<button class="btn btn-default" type="button" id="fetchArticleBtn">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>

			<a href="articlesCreate" class="btn btn-primary btn-lg btn-block">post a new Article </a>

			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Your Articles</h1>
				</div>
			</div>

			<div class="row" id="articleDisplayArea">
				<div class="row">
					<c:forEach items="${userArticles}" var="article" varStatus="article_count">
						<div class="col-lg-4 ">
							<div class="panel panel-primary readArticle" artcl_id="${article.artcl_id}">
								<div class="panel-heading">${article.artcle_title}</div>
								<div class="panel-body">
									<p>${article.artcle_brf_desc}</p>
								</div>
								<div class="panel-footer">posted on : ${article.artcl_date}</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<script src="resources/bower_components/jquery/dist/jquery.min.js"></script>
		<script	src="resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
		<script src="resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>
		<script src="resources/dist/js/sb-admin-2.js"></script>
		<script src="resources/js/article.js"></script>
		<script src="resources/js/common.js"></script>
		<script src="resources/js/smoke.js"></script>
		<script src="resources/js/smoke.min.js"></script>
</body>
</html>
