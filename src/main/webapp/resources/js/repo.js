$(document).ready(function() {
/*	$(function(){
		$('a[title]').tooltip();
		});
*/
	
	$('.effectCorrespondingTree').click(function(e){
    	var anchorRef= $(this).attr('anchorRef');
    	$('#tree_'+anchorRef).click();
    	
    	$('.effectCorrespondingTab').css({
    		"color": "#ee8b2d;",
    		"border-bottom-color":"none",
    		"border-bottom-style": "none",
    		"border-bottom-width": "0px",
    		"border-radius":"0 0 0 0"
    	  });

    	$('#tree_'+anchorRef).css({
    		"color": "#ee8b2d;",
    		"border-bottom-color":"#ee8b2d;",
    		"border-bottom-style": "solid",
    		"border-bottom-width": "5px",
    		"border-radius":"0 0 0 0"
    	  });
	});
	
	$.fn.extend({
	    treed: function (o) {
	      
	      var openedClass = 'glyphicon-minus-sign';
	      var closedClass = 'glyphicon-plus-sign';
	      
	      if (typeof o != 'undefined'){
	        if (typeof o.openedClass != 'undefined'){
	        openedClass = o.openedClass;
	        }
	        if (typeof o.closedClass != 'undefined'){
	        closedClass = o.closedClass;
	        }
	      };
	      
	        //initialize each of the top levels
	        var tree = $(this);
	        tree.addClass("tree");
	        tree.find('li').has("ul").each(function () {
	            var branch = $(this); //li with children ul
	            branch.prepend("<i class='indicator glyphicon " + closedClass + "'></i>");
	            branch.addClass('branch');
	            branch.on('click', function (e) {
	                if (this == e.target) {
	                    var icon = $(this).children('i:first');
	                    icon.toggleClass(openedClass + " " + closedClass);
	                    $(this).children().children().toggle();
	                }
	            })
	            branch.children().children().toggle();
	        });
	        //fire event from the dynamically added icon
	      tree.find('.branch .indicator').each(function(){
	        $(this).on('click', function () {
	            $(this).closest('li').click();
	            alert("tree:"+$(this).attr('treeRef'));
	        });
	      });
	        //fire event to open branch if the li contains an anchor instead of text
	        tree.find('.branch>a').each(function () {
	            $(this).on('click', function (e) {
	            	var aa = $("a")[0];
	                $(this).closest('li').click();
	                $('.effectCorrespondingTab').css({
	            		"color": "#ee8b2d;",
	            		"border-bottom-color":"none",
	            		"border-bottom-style": "none",
	            		"border-bottom-width": "0px",
	            		"border-radius":"0 0 0 0"
	            	  });
	                $(this).closest('a').css({
	            		"color": "#ee8b2d;",
	            		"border-bottom-color":"#ee8b2d;",
	            		"border-bottom-style": "solid",
	            		"border-bottom-width": "5px",
	            		"border-radius":"0 0 0 0"
	            	  });
	                var href = $(this).attr('treeRef');
	                if(!$('#tab_'+href).hasClass('active')){
		                $('.catTabs').removeClass('active');
		                $('#tab_'+href).addClass('active');
	                }
	                e.preventDefault();
	            });
	        });
	        //fire event to open branch if the li contains a button instead of text
	        tree.find('.branch>button').each(function () {
	            $(this).on('click', function (e) {
	                $(this).closest('li').click();
	                e.preventDefault();
	            });
	        });
	    }
	});

	//Initialization of treeviews
	$('#tree1').treed();

	$('#tree2').treed({openedClass:'glyphicon-folder-open', closedClass:'glyphicon-folder-close'});
	$('#parentTree').click();
	$('.default').click().css({
		"color": "#ee8b2d;",
		"border-bottom-color":"#ee8b2d;",
		"border-bottom-style": "solid",
		"border-bottom-width": "5px",
		"border-radius":"0 0 0 0"
	  });
	$('#tree3').treed({openedClass:'glyphicon-chevron-right', closedClass:'glyphicon-chevron-down'});

});

