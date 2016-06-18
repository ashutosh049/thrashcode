$(document).ready(function() {
	
	$('#registerUserBtn').click(function() {
	  if ($('#new_user_registration_form').smkValidate()) {
		  if( $.smkEqualPass('#pass1', '#pass2') ){
			  $('#new_user_registration_form')[0].submit();
		    }
	  }
	});
	
	$('#new_user_registration_form').on('load', function () {
		$('#user_fname').focus();
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
            
            var ext = $('#user_img').val().split('.').pop().toLowerCase();
            if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
                alert('invalid extension!Allowed types  [gif/png/jpg/jpeg]');
            }else if(sizeKB > 65.535){
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
    
    $("#user_img").change(function(){
        readURL(this);
        $('#blah').each(function() {
            var maxWidth = 160; 
            var maxHeight = 160;
            var ratio = 0;
            var width = $(this).width();
            var height = $(this).height();
            $(this).css("width", maxWidth);
            $(this).css("height", maxHeight);
        });
    });
    
	
    
});