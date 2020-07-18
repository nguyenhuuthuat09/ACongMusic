/* Change button heart color after user presser*/
$(() => {
    	'use strict';
    	$('#song-player-love-button').click(function() {
    	$(this).toggleClass('pressed');
	});
});

$(() => {
    	'use strict';
    	$('#button-follow').click(function() {
    	$(this).toggleClass('pressed');
	});
});

/* chang follow to following after click */
$("#button-follow").on("click", function() {
  var el = $(this);
  el.text() == el.data("text-swap") 
    ? el.text(el.data("text-original")) 
    : el.text(el.data("text-swap"));
});


