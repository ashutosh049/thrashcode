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

<title>articlesRead</title>

<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->		
<!--###################################################|Css Files|####################################################################### -->	
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
<!--###################################################|Css Files|####################################################################### -->	
<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->		

</head>

<body>


	<input type="hidden" id="arctl_id" value="${arctl_id}" />
	<input type="hidden" id="loggedInUserId" value="${loggedInUserId}" />
	<input type="hidden" id="loggedInUserFName" value="${loggedInUserFName}" />
	<input type="hidden" id="loggedInUserLName"	value="${loggedInUserLName}" />
	<input type="hidden" id="loggedInUserEmail" value="${loggedInUserEmail}" />

	<div id="wrapper">
		
		<!-- ##################################|NavBar|##################################################################################### -->
		<jsp:include page="navbar_bootsnipp.jsp" />
		<!-- ##################################|NavBar|##################################################################################### -->
		
		
		<!-- ####################################|Body|############################################################################ -->
		<div id="page-wrapper" id="bootarticleDisplayArea">
			<!-- #######################|Article Title|############################################################################ -->
				<div class="row">
					<div class="" style="float: left;">
						<h1 class="page-header">${arctl_obj.artcle_title}</h1>
						<input type="hidden" id="artcle_title" value="${arctl_obj.artcle_title}"/>
					</div>
					<div style="float: right;">
						<button class="btn btn-info" type="button" id="artclDwnload" onclick="javascript:demoFromHTML();">download</button>
					</div>
				</div>
			<!-- #######################|Article Title|############################################################################ -->
			
			<!-- #######################|Article Content|########################################################################## -->	
				<div class="panel-body" id="articleDataDwnload">${arctl_obj.artcle_Data}</div>
			<!-- #######################|Article Content|########################################################################## -->
	
	
	
			<!-- #######################|Article Comment|########################################################################## -->
				<c:forEach var="genericdata" items="${genericWithImageList}">
					<div class="container">
						<div class="row">
							<c:choose>
								<c:when test="${arctl_obj.artcl_owner_id==genericdata.classData.user_id}">
									<div class="col-sm-10" style="float: right;">
										<div class="panel panel-white post panel-shadow">
											<div class="post-heading">
												<div class="pull-left image">
													<img src="data:${genericdata.contentType};base64,${genericdata.encoding}" class="img-circle avatar" alt=""/>
												</div>
												<div class="pull-left meta">
													<div class="title h5">
														<%-- <a href="#"><b>${comment.user_fname} ${comment.user_lname}</b></a> --%>
														<a href="#"><b>${genericdata.classData.user_fname} ${genericdata.classData.user_lname}</b></a>
													</div>
													<h6 class="text-muted time">${genericdata.classData.cmt_date}</h6>
												</div>
											</div>
											<div class="post-description">
												<p>${genericdata.classData.cmt_data}</p>
												<form method="post">
													<div class="stats">
														<a href="#" class="cmtlike btn btn-default stat-item"
															cmtid="${genericdata.classData.cmnt_id}"> <i
															class="fa fa-thumbs-up icon"></i>${genericdata.classData.cmt_likes}</a> 
														<a href="#" class="cmtdislike btn btn-default stat-item"
															cmtid="$nt.cmnt_id}"> <i class="fa fa-thumbs-down icon"></i>${genericdata.classData.cmt_dislikes}</a>
														<a href="#" class="btn btn-default stat-item" cmtid="${genericdata.classData.cmnt_id}">
															 <span class="glyphicon glyphicon-comment" />
														</a>
													</div>
												</form>
											</div>
										</div>
									</div>									
								</c:when>
								<c:otherwise>
									<div class="col-sm-10 ">
										<div class="panel panel-white post panel-shadow">
											<div class="post-heading">
												<div class="pull-left image">
													<img src="data:${genericdata.contentType};base64,${genericdata.encoding}" class="img-circle avatar" alt=""/>
												</div>
												<div class="pull-left meta">
													<div class="title h5">
														<%-- <a href="#"><b>${comment.user_fname} ${comment.user_lname}</b></a> --%>
														<a href="#"><b>${genericdata.classData.user_fname} ${genericdata.classData.user_lname}</b></a>
													</div>
													<h6 class="text-muted time">${genericdata.classData.cmt_date}</h6>
												</div>
											</div>
											<div class="post-description">
												<p>${genericdata.classData.cmt_data}
												</p>
												<form method="post">
													<div class="stats">
														<a href="#" class="cmtlike btn btn-default stat-item"
															cmtid="${genericdata.classData.cmnt_id}"> <i
															class="fa fa-thumbs-up icon"></i>${genericdata.classData.cmt_likes}</a> 
														<a href="#" class="cmtdislike btn btn-default stat-item"
															cmtid="$nt.cmnt_id}"> <i class="fa fa-thumbs-down icon"></i>${genericdata.classData.cmt_dislikes}</a>
														<a href="#" class="btn btn-default stat-item" cmtid="${genericdata.classData.cmnt_id}">
															 <span class="glyphicon glyphicon-comment" />
														</a>
													</div>
												</form>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:forEach>
			<!-- #######################|Article Comment|########################################################################## -->
	
				<br> <br>
	
		    <!-- #######################|Comment Box|############################################################################## -->
				<div class="container">
					<div class="row">
						<div class="col-md-8">
							<div class="widget-area no-padding blank">
								<div class="row">
									<h4><p class="text-primary">&nbsp;&nbsp;&nbsp;Leave a comment...</p></h4>
								</div>
								<form method="post">
									<textarea cols="80" id="editor1" name="editor1" rows="10"></textarea>
									<ckeditor:replace replace="editor1" basePath="resources/ckeditor/" />
									<button type=button class="btn btn-success green" id="postCommentBtn" data-toggle="modal" data-target="#myModal">
										<i class="fa fa-share"></i> Post
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			<!-- #######################|Comment Box|############################################################################## -->
		</div>
		<!-- ##################################|Body|##################################################################################### -->
		
		
	</div>

		
		
		
<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->
<!--##################################################################################################################################### -->		
<!--#####################################################|js Files|###################################################################### -->
	<script src="resources/bower_components/jquery/dist/jquery.min.js"></script>
	<script	src="resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- JSPDF -->
	<script src="resources/js/jspdf/jspdf.debug.js"></script>
	<script src="resources/js/jspdf/jspdf.min.js"></script>
	<script src="resources/js/jspdf/from_html.js"></script>
	<script src="resources/js/jspdf/html2pdf.js"></script>
	<script src="resources/js/jspdf/addhtml.js"></script>
	<script src="resources/js/jspdf/addimage.js"></script>
	<script src="resources/js/jspdf/canvas.js"></script>
	<script src="resources/js/jspdf/cell.js"></script>
	<script src="resources/js/jspdf/autoprint.js"></script>
	<script src="resources/js/jspdf/deflate.js"></script>
	<script src="resources/js/jspdf/downloadify.min.js"></script>
	<script src="resources/js/jspdf/css_colors.js"></script>
	<script src="resources/js/jspdf/polyfill.js"></script>
	<script src="resources/js/jspdf/png_support.js"></script>
	<script src="resources/js/jspdf/prevent_scale_to_fit.js"></script>
	<script src="resources/js/jspdf/split_text_to_size.js"></script>
	<script src="resources/js/jspdf/swfobject.js"></script>
	<!--  -->
	<script src="resources/js/articlesDownload.js"></script>
	<script src="resources/dist/js/sb-admin-2.js"></script>
	<script src="resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>
	<script src="resources/js/scripts.min.js"></script>
	<script src="resources/js/article.js"></script>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/smoke.js"></script>
	<script src="resources/js/smoke.min.js"></script>
	<script src="resources/js/stars.js"></script>
	<script src="resources/js/bootsnipp_navBar.js"></script>
<!--##########################################|js Files|########################################################## -->

</body>
</html>
