<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>repositories</title>

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
	<link href="resources/css/repo.css" rel="stylesheet">
	<link href="resources/css/blogList.css" rel="stylesheet">
	<link href="resources/css/bootstrap-tokenfield.css" rel="stylesheet">
<!--##########################################|Css Files|########################################################## -->

</head>

<body>
	<jsp:include page="navbar_bootsnipp.jsp" />
			
		<div id="wrapper">
		<div class="container">
			<div class="row">
				<div class="col-md-4 pull-left">
					<ul id="tree2">
						<li><a href="#" id="parentTree">TECH</a>
							<ul>
								<c:forEach items="${articleCategoryArticlesMap}" var="catMap" varStatus="catMapOrder">
									<li role="presentation">
										<c:choose>
											<c:when test="${catMapOrder.index==0}">
												<a href="#${catMap.key.artcl_cat_id}" 
													aria-controls="home" 
													role="tab" 
													data-toggle="tab" 
													class="effectCorrespondingTab default" 
													treeRef="${catMap.key.artcl_cat_id}"
													id="tree_${catMap.key.artcl_cat_id}">
													${catMap.key.artcl_cat_name}
												</a>										
											</c:when>
											<c:otherwise>
												<a href="#${catMap.key.artcl_cat_id}" 
													aria-controls="home" 
													role="tab" 
													data-toggle="tab" 
													class="effectCorrespondingTab" 
													treeRef="${catMap.key.artcl_cat_id}"
													id="tree_${catMap.key.artcl_cat_id}">
													${catMap.key.artcl_cat_name}
												</a>											
											</c:otherwise>
										</c:choose>
										<ul>
											<c:forEach items="${catMap.value}" var="article">
												<li>
													<a href='renderArticleFile?arctl_id=${article.artcl_id}' class='articleReadAnchor'>
														${article.artcl_title}
													</a>
												</li>
											</c:forEach>
										</ul>
									</li>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</div>
				<div class="col-md-8 pull-right">
					<!-- Nav tabs -->
					<div class="nav">
						<ul class="nav nav-tabs" role="tablist">
							<c:forEach items="${articleCategoryArticlesMap}" var="catMap" varStatus="catMapOrder">
								<c:choose>
									<c:when test="${catMapOrder.index==0}">
										<li role="presentation" class="catTabs active [ animate ]" id="tab_${catMap.key.artcl_cat_id}">
											<a href="#${catMap.key.artcl_cat_id}" aria-controls="home" role="tab" data-toggle="tab" class="effectCorrespondingTree" anchorRef="${catMap.key.artcl_cat_id}">
												${catMap.key.artcl_cat_name}
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li role="presentation" class="catTabs [ animate ]" id="tab_${catMap.key.artcl_cat_id}">
											<a href="#${catMap.key.artcl_cat_id}" aria-controls="home" role="tab" data-toggle="tab" class="effectCorrespondingTree" anchorRef="${catMap.key.artcl_cat_id}">
												${catMap.key.artcl_cat_name}
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
							<c:forEach items="${articleCategoryArticlesMap}" var="catMap">
								<div role="tabpanel" class="tab-pane active" id="${catMap.key.artcl_cat_id}">
									<c:forEach items="${catMap.value}" var="article">
										<div class='row articlesList'>
											<div class='col-md-12 post'>
												<div class='row'>
													<div class='col-md-12'>
														<h4>
															<strong>
																<div style='float: left; padding-top: 12px; margin-right: -15px;'>
																	<c:choose>
																		<c:when test="${article.artcl_type=='tips_tricks'}">
																			<img src='resources/images/tip.png' style='height: 25px;'>
																		</c:when>
																		<c:otherwise>
																			<img src='resources/images/article.png' style='height: 25px;'>
																		</c:otherwise>
																	</c:choose>
																</div>
																<div class='[ animbrand ]'>
																	<a class='[ navbar-brand ][ animate ]'
																		href='renderArticleFile?arctl_id=${article.artcl_id}'
																		id='artcl_list_title'>${article.artcl_title}</a>
																</div>
															</strong>
														</h4>
													</div>
												</div>
												<div class='row post-content'>
													<div class='col-md-9'>
														<p>${article.artcl_brf_desc}</p>
														<p></p>
													</div>
												</div>
												<div class='row'>
													<div class='col-md-12 post-header-line'>
														<span class='glyphicon glyphicon-user'></span> by <a
															href='#' class='artcl_list_anchors'>${article.artcl_owner_name}</a>
														&nbsp;&nbsp; <span class='glyphicon glyphicon-comment'>
														</span>${article.artcl_lastUpdateDate} &nbsp;&nbsp; <span
															class='glyphicon glyphicon-comment'></span><a href='#'
															class='artcl_list_anchors'> 3 Comments</a> <span
															class='glyphicon glyphicon-eye-open'> </span> <font
															class='artcl_list_anchors'>${article.artcl_hits} Views</font>
														&nbsp;&nbsp; <span class='glyphicon glyphicon-tags'>
														</span>Tags : ${article.artcl_tags}
														<div style='float: right;'>
															<a class='btn btn-read-more'
																href='renderArticleFile?arctl_id=artcl_id"'> Read
																more </a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</c:forEach>
						</div>
					</div>
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
	<script src="resources/ckeditor/ckeditor.js"></script>
	<script src="resources/js/scripts.min.js"></script>
	<script src="resources/js/article.js"></script>
	<script src="resources/js/articleCreate.js"></script>
	<script src="resources/js/bootstrap-tokenfield.min.js"></script>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/smoke.js"></script>
	<script src="resources/js/smoke.min.js"></script>
	<script src="resources/js/repo.js"></script>
	<script src="resources/js/bootsnipp_navBar.js"></script>
<!--##########################################|js Files|########################################################## -->
</body>
</html>
