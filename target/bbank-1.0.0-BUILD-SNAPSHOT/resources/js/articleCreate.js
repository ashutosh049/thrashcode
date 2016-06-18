$(document).ready(function() {

	$('#publishArticle_tags').tokenfield();

	$('#publishArticle_Btn').click(function(e) {
		
		var publishArticle_title  = $('#publishArticle_title').val();
		var publishArticle_artcltypes  = $("#publishArticle_artcltypes option:selected").text();
		var publishArticle_desc  = $('#publishArticle_desc').val();
		var publishArticle_tags = $('#publishArticle_tags').val(); 
		var loggedInUserId = $('#loggedInUserId').val();
		var ckEditorData = CKEDITOR.instances.publishArticle_data.getData();
		var encodedData = encodeURIComponent(ckEditorData);

		/*$('#publishArticle_tags').each(function(i, selected){ 
			alert("");
			publishArticle_tags[i] = $(selected).text(); 
		});*/
		
		var completeData = "publishArticle?" +
						   "publishArticle_title="+publishArticle_title+
						   "&publishArticle_artcltypes="+publishArticle_artcltypes+
						   "&publishArticle_desc="+publishArticle_desc.split(',')+
		                   "&publishArticle_tags="+publishArticle_tags+
		                   "&loggedInUserId="+loggedInUserId+
		                   "&encodedData="+encodedData;
		if(loggedInUserId==null || loggedInUserId==""){
			$("#loginModal").modal('show');
			
		}else{
			e.stopPropagation();
			$.ajax({
				type:'GET',
				dataType: 'html',
				url  : completeData,
				success : function(response) {
					e.preventDefault();
					$.smkAlert({
					    text: ''+publishArticle_title+' have been successfully published..!',
					    type: 'success',
					    position:'center'
					  });
					document.location.href=response;
				},
				error : function(xhr, status, error) {
					alert("xhr :"+xhr+"\nstatus :"+status+"\nerror :"+error);
				}
			});
		}
	});
	
	
	$('#publishArticle_Btn_').click(function(e) {
//		var textToWrite = document.getElementById('publishArticle_data').value;
		var textToWrite = $('#publishArticle_data').val();
		alert('textToWrite : '+ textToWrite);
        var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
        
        $.ajax({
			type:'GET',
			processData: false,
			contentType: false,
			url  : "fetchArticleFile",
			data : textFileAsBlob,
			success : function(response) {
				alert("success returned..")
			},
			error : function(xhr, status, error) {
				alert("xhr :"+xhr+"\nstatus :"+status+"\nerror :"+error);
			}
		});
	});
	
	function saveTextAsFile(){

		var textToWrite = document.getElementById('publishArticle_data').value;
        var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
        var fileNameToSaveAs = "ecc.plist";
    
        var downloadLink = document.createElement("a");
        downloadLink.download = fileNameToSaveAs;
        downloadLink.innerHTML = "Download File";
        if (window.webkitURL != null)
        {
            // Chrome allows the link to be clicked
            // without actually adding it to the DOM.
            downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
        }
        else
        {
            // Firefox requires the link to be added to the DOM
            // before it can be clicked.
            downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
            downloadLink.onclick = destroyClickedElement;
            downloadLink.style.display = "none";
            document.body.appendChild(downloadLink);
       }
        downloadLink.onclick = destroyClickedElement;
	}
});














