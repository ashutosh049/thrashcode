$(document).ready(function() {
	
	$('.artcl_attributes_div a').hover(
			function(){
						$(this).removeClass('glyphicon');
						$(this).removeClass('glyphicon-download-alt');
						$(this).addClass("label label-warning");
						$(this).css('color','#fff');
					}
			);
	
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
						var  artcl_id= "";
						var  artcl_date= "";
						var  artcl_owner_name= "";
						var  artcl_tags= "";
						var  artcl_owner_id= "";
						var  artcl_title= "";
						var  artcl_brf_desc= "";
						
						
						artcl_id= articleList.artcl_id;
						artcl_date= articleList.artcl_date;
						artcl_owner_name= articleList.artcl_owner_name;
						artcl_tags= articleList.artcl_tags;
						artcl_owner_id= articleList.artcl_owner_id;
						artcl_title= articleList.artcl_title;
						artcl_brf_desc= articleList.artcl_brf_desc;

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
												"<div class='panel "+panelColor+" readArticle' artcl_id='"+artcl_id+"' artcl_title='"+artcl_title+"'>"+
												"<div class='panel-heading'>"+artcl_title+
												"</div>"+
												"<div class='panel-body'>"+
												"<p>"+artcl_brf_desc+"</p>"+
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
	$('#fetchBootArticlesForm_not_using').submit(function(){
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
						var  artcl_id= "";
						var  artcl_date= "";
						var  artcl_owner_name= "";
						var  artcl_tags= "";
						var  artcl_owner_id= "";
						var  artcl_title= "";
						var  artcl_brf_desc= "";
						
						
						artcl_id= articleList.artcl_id;
						artcl_date= articleList.artcl_date;
						artcl_owner_name= articleList.artcl_owner_name;
						artcl_tags= articleList.artcl_tags;
						artcl_owner_id= articleList.artcl_owner_id;
						artcl_title= articleList.artcl_title;
						artcl_brf_desc= articleList.artcl_brf_desc;

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
												"<div class='panel "+panelColor+" readArticle' artcl_id='"+artcl_id+"' artcl_title='"+artcl_title+"'>"+
												"<div class='panel-heading'>"+artcl_title+
												"</div>"+
												"<div class='panel-body'>"+
												"<p>"+artcl_brf_desc+"</p>"+
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

	$('.artcl_hits_positive_none').click(function(){
		var arctl_id=$('#arctl_id').val();
		var loggedInUserId = $('#loggedInUserId').val();
		
		if(loggedInUserId==null || loggedInUserId==""){
			$("#loginModal").modal('show');
		}else{

		$.ajax({
			type:'POST',
			async: false,
			url  : "hitArticle?arctl_id="+arctl_id+"&hitType=artcl_hit_positive",
			type : "POST",
			success : function(response) {
				if(response.trim()=='SUCCESS'){
					window.location.reload();
				}
			},
			error : function(xhr, status, error) {
				alert("xhr :"+xhr+"\nstatus :"+status+"\nerror :"+error);
			}
		});
	}
		});
	$('.artcl_hits_negetive_none').click(function(){
		var arctl_id=$('#arctl_id').val();
		var loggedInUserId = $('#loggedInUserId').val();
		
		if(loggedInUserId==null || loggedInUserId==""){
			$("#loginModal").modal('show');
		}else{
		$.ajax({
			type:'POST',
			async: false,
			url  : "hitArticle?arctl_id="+arctl_id+"&hitType=artcl_hit_negetive",
			type : "POST",
			success : function(response) {
				if(response.trim()=='SUCCESS'){
					window.location.reload();
				}
			},
			error : function(xhr, status, error) {
				alert("xhr :"+xhr+"\nstatus :"+status+"\nerror :"+error);
			}
		});
	 }
	});
	
	
	

	
});