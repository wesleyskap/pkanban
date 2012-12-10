$(document).ready(
	function () {
		$('div.recebeDrag').Sortable(
			{
				accept			: 'item_drag',
				helperclass		: 'dragAjuda',
				activeclass 	: 'dragAtivo',
				hoverclass 		: 'dragHover',
				handle			: 'h2',
				opacity			: 0.7,
				onChange 		: function()
				{	    			 
					//serialEsq = $.SortSerialize('drop-esquerda');
					//serialDir = $.SortSerialize('drop-direita');
					//$('#ser-e').val(serialEsq.hash);
					//$('#ser-d').val(serialDir.hash);
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
	}
);