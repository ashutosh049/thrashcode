<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

	
	<c:set var="peak_index_active" value=""/>
	<c:set var="peak_article_read_active" value=""/>
	<c:set var="peak_article_create_active" value=""/>
	<c:set var="peak_notification_active" value=""/>
	<c:set var="peak_user_profile_active" value=""/>
	

	<c:if test="${peak_index!=null}">
		<c:set var="peak_index_active" value="active"/>
	</c:if>
	<c:if test="${peak_repo!=null}">
		<c:set var="peak_repo_active" value="active"/>
	</c:if>
	<c:if test="${peak_article_read!=null}">
		<c:set var="peak_article_read_active" value="active"/>
	</c:if>
	<c:if test="${peak_article_create!=null}">
		<c:set var="peak_article_create_active" value="active"/>
	</c:if>
	<c:if test="${peak_notification!=null}">
		<c:set var="peak_notification_active" value="active"/>
	</c:if>
	<c:if test="${peak_user_profile!=null}">
		<c:set var="peak_user_profile_active" value="active"/>
	</c:if>










<!--################################################|Nav Bar|########################################################## -->
	<nav class="[ navbar navbar-fixed-top ][ navbar-bootsnipp animate ]" role="navigation">
	    	<div class="[ container ]">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="[ navbar-header ]">
					<button type="button" class="[ navbar-toggle ]" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="[ sr-only ]">Toggle navigation</span>
						<span class="[ icon-bar ]"></span>
						<span class="[ icon-bar ]"></span>
						<span class="[ icon-bar ]"></span>
					</button>
					<div class="[ animbrand ]">
						<a class="[ navbar-brand ][ animate ]" href="index">poscode</a>
					</div>
					
				</div>
				
				<ul class="[ nav navbar-nav navbar-left ]">
					<li class="[ hidden-xs ]">
						<a href="#toggle-search" class="[ animate ]"> 
							<span class="[ glyphicon glyphicon-search ]"></span>
						</a>
					</li>
				</ul>
				
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="[ collapse navbar-collapse ]" id="bs-example-navbar-collapse-1">
					<ul class="[ nav navbar-nav navbar-right ]">
						<li class="[ visible-xs ]">
							<form action="http://bootsnipp.com/search" method="GET" role="search">
								<div class="[ input-group ]">
									<input type="text" class="[ form-control ]" name="q" placeholder="Search for snippets">
									<span class="[ input-group-btn ]">
										<button class="[ btn btn-primary ]" type="submit"><span class="[ glyphicon glyphicon-search ]"></span></button>
										<button class="[ btn btn-danger ]" type="reset"><span class="[ glyphicon glyphicon-remove ]"></span></button>
									</span>
								</div>
							</form>
						</li>
						<li class="${peak_index_active}"><a href="index" class="[ animate ]"> <span class="glyphicon glyphicon-home"></span> Home </a></li>
						<li class="${peak_article_create_active}"><a href="articlesCreate" class="[ animate ]"> <span class="glyphicon glyphicon-book"></span> Post Article </a></li>
						<li class="${peak_repo_active}"><a href="repositories" class="[ animate ]"> <span class="glyphicon glyphicon-folder-open"></span> Repositories </a></li>
						<c:if test="${loggedInUserId!=null}">
							<li class="dropdown ${peak_notification_active}">
								<a class="[dropdown-toggle] [ animate ]" data-toggle="dropdown" href="#" style="padding-bottom: 8px;"> 
									<i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
									<span class="notificationBadge">${articleNotificationsListCount}</span>
								</a>
								<ul class="dropdown-menu dropdown-messages cstm_dropdown-messages">
									<c:forEach items="${articleNotificationsList}" var="notification"
										varStatus="notify_count">
										<c:choose>
											<c:when test="${notify_count.index<4}">
												<li><a href="notifications">
														<div>
															<strong>${notification.cmnt_by_user_fname} ${notification.cmnt_by_user_lname}</strong>
														    <span class="pull-right text-muted" style="margin-top: -22px;"> 
														    	<em>${notification.cmt_date}</em>
															</span>
														</div>
														<div>${notification.notification_data}...</div>
												</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<li>
										<a class="text-center" href="allMessages"> <strong>ReadAll Messages</strong> <i class="fa fa-angle-right"></i></a>
									</li>
								</ul>
							</li>
						</c:if>
					<!-- 
						<li>
							<a href="articles" class="[ animate ]"><i class="fa fa-edit fa-fw"></i>Articles</a>
						</li>
					 -->
					<%-- 
						....logout.....
						<c:if test="${loggedInUserId!=null}">
							<li>
								<a class="[ animate ]" href="">
								 	<span class="glyphicon glyphicon-off"></span>
								</a>
							</li>
						</c:if> 
					--%>
					<c:if test="${loggedInUserId==null}">
						<li>
							<a id="showLoginModalBtn" class="[ animate ]" type="button" data-toggle="modal" data-target="#loginModal">
							 	<i class="fa fa-sign-out fa-fw"></i>Login
							</a>
						</li>
					</c:if>	
					<c:if test="${loggedInUserId!=null}">
							<li class="[ dropdown ] ${peak_user_profile_active}">
								<a class="[dropdown-toggle] [ animate ]" data-toggle="dropdown" href="#" style="padding-bottom: 0px;"> 
									<img src="data:${contenttype};base64,${userimage}" 
										style="
												height: 30px; 
												width: 30px;
												padding-left: 0px;
												padding-right: 0px;
												padding-top: 0px;
												padding-bottom: 2px;" 
										alt="#" 
										class="avatar img-circle img-thumbnail" /> 
									<i class="[ fa fa-caret-down ]"></i>
								</a>
								<ul class="dropdown-menu dropdown-user cstm_dropdown-messages" style="left : 1;right: calc;">
									<li><a href="userprofile">
									     <i class="fa fa-user fa-fw"></i>
											User Profile
										</a>
									</li>
									<li>
										<a href="settings" class="[ animate ]">
											<i class="fa fa-gear fa-fw"></i>
											  Settings
									    </a>
									</li>
									<li><a href="handAppLogout" class="[ animate ]"><i
											class="glyphicon glyphicon-off"></i> Logout</a></li>
								</ul>
							</li>
						</c:if>				
					</ul>
				</div>
			</div>
			<div class="[ bootsnipp-search animate ]">
				<div class="[ container ]">
					<form method="GET" role="search" id="fetchBootArticlesForm">
						<div class="[ input-group ]">
							<input id="fetchBootArticlesWithTags" type="text" class="[ form-control ]" placeholder="Search for articles, tips & tricks...hit enter">
							<span class="[ input-group-btn ]">
								<button class="[ btn btn-danger ]" type="reset"><span class="[ glyphicon glyphicon-remove ]"></span></button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</nav>
<!--################################################|Nav Bar|########################################################## -->


<!--############################################|LOGIN DIALOG|########################################################## -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-1" style="width:70%;">
					<div class="login-panel panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Please Sign In</h3>
						</div>
						<div class="panel-body">
							<form role="form" method="get" id="userLoginForm">
								<fieldset>
									<div class="form-group input-group input-group-lg">
										 <span class="input-group-addon">
										    <span class="glyphicon glyphicon-user"></span>
										  </span>
										<input class="form-control" placeholder="User Id"
											name="user_id" id="user_id" type="text" autofocus>
									</div>
									<div class=" form-group input-group input-group-lg">
										<span class="input-group-addon">
										    <span class="glyphicon glyphicon-lock"></span>
										  </span>
										<input class="form-control" placeholder="Password"
											name="password" id="user_pwd" type="password" value="">
									</div>
									<div class="checkbox">
										<label> <input name="remember" type="checkbox"
											value="Remember Me">Remember Me
										</label>
									</div>
									<input type="submit" value="Login" id="userLoginBtn" class="btn btn-info"/>
									<a href="userRegistration" type="button" class="btn btn-info" id="userSignup">Sign Up</a>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--##########################################|LOGIN DIALOG|########################################################## -->
