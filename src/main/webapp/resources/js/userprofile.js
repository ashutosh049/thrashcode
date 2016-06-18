$(document).ready(function() {
	
	$('#savechanges').click(function() {
		  if ($('#smkform').smkValidate()) {
			  /*if( $.smkEqualPass('#pass1', '#pass2') ){
			      $.smkAlert({
			        text: $('#pass1').val(),
			        type: 'success'
			      });
			    }*/
		   /* $.smkAlert({
		    	 text: $('#formEmail #email').val(),
		         type: 'success'
		    });*/
		    
//		    return true;
		    $('#smkform')[0].submit();
		  }
		});
	
	
	function readURL(input) {
        if (input.files && input.files[0]) {
            var file = input.files[0];
            var sizeKB = file.size / 1024;
            
            /*
		                0 < length <=      255  -->  `TINYBLOB`
					  255 < length <=    65535  -->  `BLOB`
				    65535 < length <= 16777215  -->  `MEDIUMBLOB`
			     16777215 < length <=    2³¹-1  -->  `LONGBLOB`
		    */
            
            if(sizeKB > 65.535){
            	alert("can't be uploaded..."+"\n max upload size 65 KB");
            }else{
            	 var reader = new FileReader();
                 
                 reader.onload = function (e) {
                     $('#blah').attr('src', e.target.result);
                 }
            	 reader.readAsDataURL(input.files[0]);
            }
        }
    }
    
    $("#imgInp").change(function(){
        readURL(this);
        $('#blah').each(function() {
            var maxWidth = 160; // Max width for the image
            var maxHeight = 160;    // Max height for the image
            var ratio = 0;  // Used for aspect ratio
            var width = $(this).width();    // Current image width
            var height = $(this).height();  // Current image height
            $(this).css("width", maxWidth); // Set new width
            $(this).css("height", maxHeight);  // Scale height based on ratio
            
           /* if(width > maxWidth){
                ratio = maxWidth / width;   // get ratio for scaling image
                $(this).css("width", maxWidth); // Set new width
                $(this).css("height", height * ratio);  // Scale height based on ratio
                height = height * ratio;    // Reset height to match scaled image
                width = width * ratio;    // Reset width to match scaled image
            }*/
           /* if(height > maxHeight){
                ratio = maxHeight / height; // get ratio for scaling image
                $(this).css("height", maxHeight);   // Set new height
                $(this).css("width", width * ratio);    // Scale width based on ratio
                width = width * ratio;    // Reset width to match scaled image
                height = height * ratio;    // Reset height to match scaled image
            }*/
        });
    });
    
	
});