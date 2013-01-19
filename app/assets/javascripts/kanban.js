
$(document).ready(function () {
		$('div.recebeDrag').Sortable(
			{
				accept			  : 'item_drag',
				helperclass		: 'dragAjuda',
				activeclass 	: 'dragAtivo',
				hoverclass 		: 'dragHover',
				handle			  : 'h6',
				opacity			  : 0.7,
				onChange 		  : function()
				{	  
  			 
					var coll_01 = $.SortSerialize('coll_01');
					var coll_02 = $.SortSerialize('coll_02');
					var coll_03 = $.SortSerialize('coll_03');
					var coll_04 = $.SortSerialize('coll_04');
       
          var mhash   =  coll_01.hash + "&" + coll_02.hash + "&" + coll_03.hash + "&" + coll_04.hash;

          $.ajax({
            url: "/tasks/sort",
            type: "POST",
            data: mhash,
            dataType: 'html'
          });

				},
				onStart : function()
				{
					$.iAutoscroller.start(this, document.getElementsByTagName('body'));
				},
				onStop : function()
				{
					$.iAutoscroller.stop();
				}
			}
		);


});
