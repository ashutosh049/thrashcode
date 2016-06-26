<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--##########################################|Carousel|########################################################## -->
	<div class="testimonial_caroussal" style="margin-top: 70px;">
		<div class="container content">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
				<c:forEach items="${articleListWithOwnerImg}" var="genericdata" varStatus="articleListWithOwnerImgIndex">
					<c:choose>
						<c:when test="${articleListWithOwnerImgIndex.index==0}">
							<div class="item active">
						</c:when>
						<c:otherwise>
							<div class="item">
						</c:otherwise>
					</c:choose>
								<div class="row">
									<div class="col-xs-12">
										<div class="thumbnail adjust1">
											<div class="col-md-2 col-sm-2 col-xs-12">
												<img src="data:${genericdata.contentType};base64,${genericdata.encoding}" style="height: 100px; width: 100px;" alt="#" class="media-object img-rounded img-responsive" />
											</div>
											<div class="col-md-10 col-sm-10 col-xs-12">
												<div class="caption">
													<p class="text-info lead adjust2">
														${genericdata.classData.article.artcl_title}
													</p>
													<p class="fa fa-user"> </p>
														<small>
<%-- 															<cite title="Source Title"> --%>
																&nbsp;${genericdata.classData.author}&nbsp;&nbsp;
																&nbsp;&nbsp;&nbsp;&nbsp; 
<%-- 															</cite> --%>
														</small>
														<span class="glyphicon glyphicon-time"> </span> ${genericdata.timeAgo}
													<br/>
													<blockquote class="adjust2">
														<small>
															<cite title="Source Title">
																${genericdata.classData.article.artcl_brf_desc}
															</cite>
														</small>
													</blockquote>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
				</c:forEach>
				</div>
				<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"> 
					<span class="glyphicon glyphicon-chevron-left"></span>
				</a> 
				<a class="right carousel-control" href="#carousel-example-generic" data-slide="next"> 
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
	</div>
<!--##########################################|Carousel|########################################################## -->


