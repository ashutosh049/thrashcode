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

<title>allMessages</title>

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

		<jsp:include page="navbar_bootsnipp.jsp" />

		<!-- Page Content -->
		<div id="page-wrapper">

			<br>
			<br>
			<br>
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Inbox</h3>

								<!-- search mail -->
								<!-- <div class="box-tools pull-right">
	                    <div class="has-feedback">
	                      <input type="text" class="form-control input-sm" placeholder="Search Mail">
	                      <span class="glyphicon glyphicon-search form-control-feedback"></span>
	                    </div>
	                  </div> -->
								<!-- search mail -->


							</div>
							<!-- /.box-header -->
							<div class="box-body no-padding">

								<!-- <div class="mailbox-controls">
                    Check all button
                    <button class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i></button>
                    <div class="btn-group">
                      <button class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
                      <button class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
                      <button class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
                    </div>/.btn-group
                    <button class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                    <div class="pull-right">
                      1-50/200
                      <div class="btn-group">
                        <button class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                        <button class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                      </div>/.btn-group
                    </div>/.pull-right
                  </div> -->

								<div class="table-responsive mailbox-messages">
									<table class="table table-hover table-striped">
										<tbody>
<!-- 											<tr>
												<td><input type="checkbox"></td>
												<td class="mailbox-star"><a href="#"><i
														class="fa fa-star text-yellow"></i></a></td>
												<td class="mailbox-name"><a href="read-mail.html">Alexander
														Pierce</a></td>
												<td class="mailbox-subject"><b>AdminLTE 2.0 Issue</b> -
													Trying to find a solution to this problem...</td>
												<td class="mailbox-attachment"></td>
												<td class="mailbox-date">5 mins ago</td>
											</tr>
											<tr>
												<td><input type="checkbox"></td>
												<td class="mailbox-star"><a href="#"><i
														class="fa fa-star-o text-yellow"></i></a></td>
												<td class="mailbox-name"><a href="read-mail.html">Alexander
														Pierce</a></td>
												<td class="mailbox-subject"><b>AdminLTE 2.0 Issue</b> -
													Trying to find a solution to this problem...</td>
												<td class="mailbox-attachment"><i
													class="fa fa-paperclip"></i></td>
												<td class="mailbox-date">28 mins ago</td>
											</tr>
 -->											
											<c:forEach items="${articleNotificationsList}" var="notification" varStatus="notify_count">
												<tr>
												<td><input type="checkbox"></td>
												<td class="mailbox-star">
													<a href="#">
														<i class="fa fa-star-o text-yellow"></i>
													</a>
												</td>
												<td class="mailbox-name">
													<a href="read-mail.html">${notification.cmnt_by_user_fname} ${notification.cmnt_by_user_lname}</a>
												</td>
												<td class="mailbox-subject">
													${notification.notification_data}...</td>
												<td class="mailbox-attachment">
													<i class="fa fa-paperclip"></i>
												</td>
												<td class="mailbox-date">${notification.cmt_date}</td>
											</tr>
											</c:forEach>
											
										</tbody>
									</table>
									<!-- /.table -->
								</div>
								<!-- /.mail-box-messages -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer no-padding">
								<div class="mailbox-controls">
									<!-- Check all button -->
									<button class="btn btn-default btn-sm checkbox-toggle">
										<i class="fa fa-square-o"></i>
									</button>
									<div class="btn-group">
										<button class="btn btn-default btn-sm">
											<i class="fa fa-trash-o"></i>
										</button>
										<button class="btn btn-default btn-sm">
											<i class="fa fa-reply"></i>
										</button>
										<button class="btn btn-default btn-sm">
											<i class="fa fa-share"></i>
										</button>
									</div>
									<!-- /.btn-group -->
									<button class="btn btn-default btn-sm">
										<i class="fa fa-refresh"></i>
									</button>
									<div class="pull-right">
										1-50/200
										<div class="btn-group">
											<button class="btn btn-default btn-sm">
												<i class="fa fa-chevron-left"></i>
											</button>
											<button class="btn btn-default btn-sm">
												<i class="fa fa-chevron-right"></i>
											</button>
										</div>
										<!-- /.btn-group -->
									</div>
									<!-- /.pull-right -->
								</div>
							</div>
						</div>
						<!-- /. box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
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
