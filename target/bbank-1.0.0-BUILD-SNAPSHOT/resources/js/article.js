$(document).ready(function() {
	
	/*--------- add comment part...-----------*/
	$("[data-toggle=tooltip]").tooltip();
	/*--------- edit comment div--------------*/
	$('#commentData').each(function(){
	    $(this).attr('contenteditable','true');
	});
	
	
	
	
	/*--------- fetch articles-----------*/
	$('#fetchArticleBtn').click(function() {
		$("#articleDisplayArea").html("");// clear previous articles and the area for the new searched one to be appended
		$.ajax({
			type:'GET',
			async: false,
			data:"",
			contentType: 'application/json',
			dataType : 'json',
			url  : "fetchArticle?tags="+$('#articleTag').val(),
			success : function(data) {

				var table = "";
				var panelColor = "panel-default";
				var panelColorCount = 1;	
				
					$.each(data, function(key,articleList) { 
						
						console.log(articleList.artcl_id);
						console.log(articleList.artcl_date);
						console.log(articleList.artcl_owner_name);
						console.log(articleList.artcl_tags);
						console.log(articleList.artcl_owner_id);
						console.log(articleList.artcle_title);
						console.log(articleList.artcle_brf_desc);
	
						var  artcl_id= "";
						var  artcl_date= "";
						var  artcl_owner_name= "";
						var  artcl_tags= "";
						var  artcl_owner_id= "";
						var  artcle_title= "";
						var  artcle_brf_desc= "";
						
						
						artcl_id= articleList.artcl_id;
						artcl_date= articleList.artcl_date;
						artcl_owner_name= articleList.artcl_owner_name;
						artcl_tags= articleList.artcl_tags;
						artcl_owner_id= articleList.artcl_owner_id;
						artcle_title= articleList.artcle_title;
						artcle_brf_desc= articleList.artcle_brf_desc;

						if(panelColorCount%2==0){
							panelColor = "panel-primary";
						}else if(panelColorCount%3==0){
							panelColor = "panel-success";
						}else if(panelColorCount%4==0){
							panelColor = "panel-info";
						}else if(panelColorCount%5==0){
							panelColor = "panel-danger";
						}else if(panelColorCount%6==0){
							panelColor = "panel-warning";
						}else if(panelColorCount%7==0){
							panelColor = "panel-green";
						}else if(panelColorCount%8==0){
							panelColor = "panel-yellow";
						}
						
						
						var indvArticleDivs = "<div class='col-lg-4' >"+
												"<div class='panel "+panelColor+" readArticle' artcl_id='"+artcl_id+"' artcle_title='"+artcle_title+"'>"+
												"<div class='panel-heading'>"+artcle_title+
												"</div>"+
												"<div class='panel-body'>"+
												"<p>"+artcle_brf_desc+"</p>"+
												"</div>"+
												"<div class='panel-footer'>"+artcl_tags+"</ br> | posted on :"+artcl_date+""+
												"</div>"+
												"</div>"+
												"</div>";
						
						$('#articleDisplayArea').append(indvArticleDivs);
						if(panelColorCount>8){
							panelColorCount=0;
						}else{
							panelColorCount=panelColorCount+1;
						}
					});
					},
			error : function(xhr, status, error) {
				alert("xhr : "+xhr+"status : "+status+"error : "+error+" errror fetching user uploaded data");
			}
		});
	});

	
	
	
	
	
	/*------------read article----------*/	
	$('#articleDisplayArea').on("click",".readArticle",function() {
		var arctl_id = $(this).attr('artcl_id');
		$.ajax({
			type:'POST',
			async: false,
			url  : "prepreArticleToRead?arctl_id="+arctl_id,
			data : '',
			type : "POST",
			success : function(response) {
					document.location.href=response;
					},
			error : function(xhr, status, error) {
				alert("error reading article : "+cur_artcl);
			}
		});
	});
	
	
	
     /*.....................post Comment Btn...........................*/	
	$('#postCommentBtn').click(function(e) {
		var arctl_id=$('#arctl_id').val();
		var loggedInUserId = $('#loggedInUserId').val();
		var ckEditorData = CKEDITOR.instances.editor1.getData();
		var encodedData = encodeURIComponent(ckEditorData)
		var completeData = "postComment?arctl_id="+arctl_id+"&loggedInUserId="+loggedInUserId+"&argCmtData="+encodedData;
		
		if(loggedInUserId==null || loggedInUserId==""){
			$("#loginModal").modal('show');
		}else{
			e.stopPropagation();
			$.ajax({
				type:'POST',
				datatype:"html",
				async: false,
				url  : completeData,
				type : "POST",
				success : function(response) {
					window.location.reload();
				},
				error : function(xhr, status, error) {
					alert("xhr :"+xhr+"\nstatus :"+status+"\nerror :"+error);
				}
			});
		}
	});



	$('.cmtlike').click(function(e) {
		var arctl_id=$('#arctl_id').val();
		var cmt_id=$(this).attr("cmtid");
		$.ajax({
			type:'POST',
			async: false,
			url  : "likeComment?arctl_id="+arctl_id+"&cmt_id="+cmt_id,
			type : "POST",
			success : function(response) {
				window.location.reload();
			},
			error : function(xhr, status, error) {
				alert("xhr :"+xhr+"\nstatus :"+status+"\nerror :"+error);
			}
		});
	});
	$('.cmtdislike').click(function(e) {
		var arctl_id=$('#arctl_id').val();
		var cmt_id=$(this).attr("cmtid");
		$.ajax({
			type:'POST',
			async: false,
			url  : "dislikeComment?arctl_id="+arctl_id+"&cmt_id="+cmt_id,
			type : "POST",
			success : function(response) {
				window.location.reload();
			},
			error : function(xhr, status, error) {
				alert("xhr :"+xhr+"\nstatus :"+status+"\nerror :"+error);
			}
		});
	});
	
	
/* ##################################| fetchBootArticlesForm |######################################################################## */
	$('#fetchBootArticlesForm').submit(function(){
		$("#bootarticleDisplayArea").html("");// clear previous articles and the area for the new searched one to be appended
		$.ajax({
			type:'GET',
			async: false,
			data:"",
			contentType: 'application/json',
			dataType : 'json',
			url  : "fetchArticle?tags="+$('#fetchBootArticlesWithTags').val(),
			success : function(data) {

				var table = "";
				var panelColor = "panel-default";
				var panelColorCount = 1;	
				
					$.each(data, function(key,articleList) { 
						
						console.log(articleList.artcl_id);
						console.log(articleList.artcl_date);
						console.log(articleList.artcl_owner_name);
						console.log(articleList.artcl_tags);
						console.log(articleList.artcl_owner_id);
						console.log(articleList.artcle_title);
						console.log(articleList.artcle_brf_desc);
	
						var  artcl_id= "";
						var  artcl_date= "";
						var  artcl_owner_name= "";
						var  artcl_tags= "";
						var  artcl_owner_id= "";
						var  artcle_title= "";
						var  artcle_brf_desc= "";
						
						
						artcl_id= articleList.artcl_id;
						artcl_date= articleList.artcl_date;
						artcl_owner_name= articleList.artcl_owner_name;
						artcl_tags= articleList.artcl_tags;
						artcl_owner_id= articleList.artcl_owner_id;
						artcle_title= articleList.artcle_title;
						artcle_brf_desc= articleList.artcle_brf_desc;

						if(panelColorCount%2==0){
							panelColor = "panel-primary";
						}else if(panelColorCount%3==0){
							panelColor = "panel-success";
						}else if(panelColorCount%4==0){
							panelColor = "panel-info";
						}else if(panelColorCount%5==0){
							panelColor = "panel-danger";
						}else if(panelColorCount%6==0){
							panelColor = "panel-warning";
						}else if(panelColorCount%7==0){
							panelColor = "panel-green";
						}else if(panelColorCount%8==0){
							panelColor = "panel-yellow";
						}
						
						
						var indvArticleDivs = "<div class='col-lg-4' >"+
												"<div class='panel "+panelColor+" readArticle' artcl_id='"+artcl_id+"' artcle_title='"+artcle_title+"'>"+
												"<div class='panel-heading'>"+artcle_title+
												"</div>"+
												"<div class='panel-body'>"+
												"<p>"+artcle_brf_desc+"</p>"+
												"</div>"+
												"<div class='panel-footer'>"+artcl_tags+"</ br> | posted on :"+artcl_date+""+
												"</div>"+
												"</div>"+
												"</div>";
						
						$('#bootarticleDisplayArea').append(indvArticleDivs);
						if(panelColorCount>8){
							panelColorCount=0;
						}else{
							panelColorCount=panelColorCount+1;
						}
					});
					},
			error : function(xhr, status, error) {
				alert("xhr : "+xhr+"status : "+status+"error : "+error+" errror fetching user uploaded data");
			}
		});
	});
	/* ##################################| fetchBootArticlesForm |######################################################################## */

});














