$(document).ready(function() {
	
	
	$('#showLoginModalBtn').click(function(e) {
		var loggedInUserId = $('#loggedInUserId').val();
		if (loggedInUserId == null || loggedInUserId == "") {
			$("#loginModal").modal('show');
			return false;
		}

	});
	
	$('#loginModal').on('shown.bs.modal', function () {
	    $('#user_id').focus();
	})
	
	$('#userLoginForm').submit(function(e) {
		var user_id = $('#user_id').val();
		var user_pwd = $('#user_pwd').val();
		var cur = document.location.href;
		$.ajax({
			method:'POST',
			async : false,
			url : "handleAppLogin", 
			data :"user_id="+user_id+"&user_pwd="+user_pwd,
			success : function(response) {
				if (response != null && response=='success') {
					e.preventDefault();
					document.location.href=cur;
				} else {
					e.preventDefault();
					 $.smkAlert({
						    text: 'Invalid User-Id/Password.....!Try again.',
						    type: 'danger',
						    position:'top-center',
						    icon: 'glyphicon-exclamation-sign',
						    time: 5
						  });
					return false;
				}
			},
			error : function(xhr, status, error) {
				alert("xhr :" + xhr + "\nstatus :" + status+ "\nerror :" + error);
			}
		});

	
	});
});