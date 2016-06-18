$(document).ready(function() {
	
	 $.ajaxSetup({ cache: true });
	  $.getScript('//connect.facebook.net/en_US/sdk.js', function(){
	    FB.init({
	      appId: '954938691252556',
	      version: 'v2.5' // or v2.0, v2.1, v2.2, v2.3
	    });     
	    $('#loginbutton,#feedbutton').removeAttr('disabled');
	    FB.getLoginStatus(updateStatusCallback);
	  });
	
	$('#dnr_id_ifield').hide();
	$('#dnr_registration_date').hide();
	$('#dnr_birthdate-ifield').datepicker();
	$('#dnr_registration_date').val(new Date().toISOString());
	
});