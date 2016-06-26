$(document).ready(function() {
	$('#spinner').css('display','none');
	appendArticles($('#viewUser_userId').val());
});

function appendArticles(findWith) {
	$.ajax({
		type:'GET',
		async: false,
		data:"",
		contentType: 'application/json',
		dataType : 'json',
		url  : "fetchArticleBy?constraint=artcl_owner_id&value="+findWith,
		success : function(data) {
			
				$.each(data, function(key,articleList) { 

					var  artcl_id= "";
					var  artcl_date= "";
					var  artcl_owner_name= "";
					var  artcl_tags;
					var  artcl_owner_id= "";
					var  artcl_title= "";
					var  artcl_brf_desc= "";
					var artcl_hits="";
					var artcl_type="";
					
					
					
					artcl_id= articleList.artcl_id;
					artcl_date= articleList.artcl_date;
					artcl_lastUpdateDate=articleList.artcl_lastUpdateDate;
					artcl_owner_name= articleList.artcl_owner_name;
					artcl_tags= articleList.artcl_tags;
					artcl_owner_id= articleList.artcl_owner_id;
					artcl_title= articleList.artcl_title;
					artcl_brf_desc= articleList.artcl_brf_desc;
					artcl_hits = articleList.artcl_hits;
					artcl_type = articleList.artcl_type;
					
					var alltags = "&nbsp;&nbsp;"; 
					var img = "";
					if(artcl_type=='tips_tricks'){
						img = "<img src='resources/images/tip.png' style='height: 25px;'>";
					}else{
						img = "<img src='resources/images/article.png' style='height: 25px;'>";
					}
					
					$.each(articleList.artcl_tags, function(index, tag) {  
						if(findWith!="" && tag.indexOf(findWith)>=0){
							alltags += "<a class='artcl_list_anchors includeInFetch' havingTag='"+tag+"'><span class='label label-success'>"+tag+"</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
						}else{
							alltags += "<a class='artcl_list_anchors includeInFetch' havingTag='"+tag+"'><span class='label label-warning'>"+tag+"</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
						}
					});
				   
					
					var indvArticleDivs = "<div class='row articlesList'>"+
					"<div class='col-md-12 post'>"+
					"<div class='row'>"+
						"<div class='col-md-12'>"+
							"<h4>"+
								"<strong>"+
										"<div style='float: left;padding-top: 12px; margin-right: -15px;'>"+
											img+
										"</div>"+
										"<div class='[ animbrand ]'>"+
											"<a class='[ navbar-brand ][ animate ]' href='renderArticleFile?arctl_id="+artcl_id+"' id='artcl_list_title'>"+artcl_title+"</a>"+
										"</div>"+
										"<div id='hearts' class='starrr' style='float: right;padding-top: 22px;'></div>"+
								"</strong>"+
							"</h4>"+
						"</div>"+
					"</div>"+
					"<div class='row post-content'>"+
						"<div class='col-md-9'>"+
							"<p>"+artcl_brf_desc+"</p>"+
							"<p>"+
							"</p>"+
						"</div>"+
					"</div>"+
					"<div class='row'>"+
						"<div class='col-md-12 post-header-line artclInfoLine'>"+
							"<span class='glyphicon glyphicon-user'></span>"+
							"by <a href='viewerProfile?user_id="+artcl_owner_id+"' class='artcl_list_anchors'>"+artcl_owner_name+"</a>"+
							"&nbsp;&nbsp;|  "+ 
							"<span class='glyphicon glyphicon-comment'> </span"+artcl_lastUpdateDate+ 
							"&nbsp;&nbsp;|  "+ 
							"<span class='glyphicon glyphicon-comment'></span><a href='#' class='artcl_list_anchors'> 3 Comments</a>"+ 
							"| "+
							"<span class='glyphicon glyphicon-eye-open'> </span>"+
								"<font class='artcl_list_anchors'>"+artcl_hits+" Views</font>"+
							"&nbsp;&nbsp;|  "+ 
							"<span class='glyphicon glyphicon-tags'> </span>Tags :"+ alltags +
							"<div  style='float: right;'>"+
								"<a class='btn btn-read-more' href='renderArticleFile?arctl_id="+artcl_id+"'>"+
								  "Read more"+
								"</a>"+ 
							 "</div>"+
						"</div>"+
					"</div>"+
				"</div>"+
			"</div><br/><br/><br/>";
					
					$('#bootarticleDisplayArea').append(indvArticleDivs);
				});
				$('#spinner').stop().fadeOut('slow');
				
			},
		error : function(xhr, status, error) {
			alert("xhr : "+xhr+"status : "+status+"error : "+error+" errror fetching user uploaded data");
		}
	});
}