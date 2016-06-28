$(document).ready(function() {
	$('#spinner').css('display','none');
	
	

	if($('#fetch_tags').val()!=null){
//		$("#carousel-example-generic").html("");
		appendArticles($('#fetch_tags').val());
	}
	
	
	$('#bootarticleDisplayArea').on('click','a.includeInFetch',function(e){
		if($('div').hasClass( "bootsnipp-search" )){
			$('div').addClass('open');
		}
		$('#fetchBootArticlesWithTags').val($(this).attr('havingTag'));
		$("#carousel-example-generic").html("");
		$("#bootarticleDisplayArea").html("<br><br><br><br>");
		appendArticles($(this).attr('havingTag'));
	});
});

function appendArticles(findWithTag) {
//	$('body').fadeTo( "fast", 0.2);
	$('#spinner').css('display','block');
	$.ajax({
		type:'GET',
		async: false,
		data:"",
		contentType: 'application/json',
		dataType : 'json',
		url  : "renderArticleList?tags="+findWithTag,
		success : function(data) {
			
				$.each(data, function(key,renderList) { 
					
					var articleList = renderList.article;
					var commentCount = renderList.commentCount;
					var  artcl_owner_name= renderList.author;
					
					var indvArticleDivs ="";	
					var  artcl_id= "";
					var  artcl_date= "";
					var  artcl_tags;
					var  artcl_owner_id= "";
					var  artcl_title= "";
					var  artcl_brf_desc= "";
					var artcl_visits="";
					var artcl_type="";
					
					
					if(articleList==null||articleList === undefined){
						indvArticleDivs = 
							"<div class='foundNothing'>"+
							"Searching for "+findWithTag+" returned nnothing.."
							"</div>" ;
					}else{
						artcl_id= articleList.artcl_id;
						artcl_owner_id= articleList.artcl_owner_id;
						artcl_date= articleList.artcl_create_date;
						artcl_lastUpdateDate=articleList.artcl_mod_date;
						artcl_tags= articleList.artcl_tags;
						artcl_title= articleList.artcl_title;
						artcl_brf_desc= articleList.artcl_brf_desc;
						artcl_visits = articleList.artcl_visits;
						artcl_hits_positive = articleList.artcl_hits_positive;
						artcl_hits_negetive = articleList.artcl_hits_negetive;
						artcl_type = articleList.artcl_type;
						
						var alltags = "&nbsp;&nbsp;"; 
						var img = "";
						if(artcl_type=='tips_tricks'){
							img = "<img src='resources/images/tip.png' style='height: 25px;'>";
						}else{
							img = "<img src='resources/images/article.png' style='height: 25px;'>";
						}
						
						$.each(articleList.artcl_tags, function(index, tag) {  
							if(findWithTag!="" && tag.toUpperCase().indexOf(findWithTag.toUpperCase())>=0){
								alltags += "<a class='artcl_list_anchors includeInFetch' havingTag='"+tag+"'><span class='label label-success'>"+tag+"</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
							}else{
								alltags += "<a class='artcl_list_anchors includeInFetch' havingTag='"+tag+"'><span class='label label-warning'>"+tag+"</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
							}
						});
					   
						
					indvArticleDivs = 
					"<div class='row articlesList'>"+
						"<div class='col-md-10 post' style='float: left;'>"+
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
								"by <a href='#' class='artcl_list_anchors'>"+artcl_owner_name+"</a>"+
								"&nbsp;&nbsp;|  "+ 
								"<span class='glyphicon glyphicon-comment'> </span"+artcl_lastUpdateDate+ 
								"&nbsp;&nbsp;|  "+ 
								"<span class='glyphicon glyphicon-comment'></span><a href='#' class='artcl_list_anchors'> "+commentCount+" Comments</a>"+ 
								"| "+
								"<span class='glyphicon glyphicon-eye-open'> </span>"+
									"<font class='artcl_list_anchors'>"+artcl_visits+" Views</font>"+
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
					"<div class='col-md-1 artcl_visits' style='float: right;'>"+
						"<p><a class='stat-item glyphicon glyphicon-chevron-up artcl_hits_positive'>"+artcl_hits_positive+"</a></p>"+
						"<p><a class='stat-item glyphicon glyphicon-chevron-down artcl_hits_negetive'>"+artcl_hits_negetive+"</a></p>"+
						"<p>"+
						"</p>"+
					"</div>"+
				"</div>" +
				"<br/><br/><br/>";

					}
					$('#bootarticleDisplayArea').append(indvArticleDivs);
				});
			
			},
		error : function(xhr, status, error) {
			alert("xhr : "+xhr+"status : "+status+"error : "+error+" errror fetching user uploaded data");
		}
	}).done(function() {
			$('#spinner').stop().fadeOut( "slow");
//			$('body').fadeOut( "fast", 1);
	});
}