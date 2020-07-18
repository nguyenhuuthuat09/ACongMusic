/*
disable click show dropdown base on screen width
*/
// disble click show dropdown "Thể loại" when screen with < 576px
$('.disable-click-show-dropdown-table').on('click', function(event) {
    if ($(window).width() < 576) {
        event.stopPropagation();
    }
});

// disble click show dropdowns when screen width > 992
// before disable: click will show dropdown menu instead of redirect to link in href
// after disable: hover will show menu, click will redirect to link in href
$('.disable-click-show-dropdown-menu, .disable-click-show-dropdown-table').on('click', function(event) {
    if ($(window).width() >= 992) {
        event.stopPropagation();
    }
});

$('.account-menu-button').on('click', function(event) {
    if ($(window).width() >= 992 || $(window).width() < 576) {
        event.stopPropagation();
    }
});

/* set place holder shortter in small screen */
$(function() {
    if ($(window).width() < 300) {
		$('.myform-control').attr('placeholder', 'Tìm kiếm gì đó...');
	}
});

/* back to top */
$(document).ready(function(){
     $(window).scroll(function () {
            if ($(this).scrollTop() > 50) {
                $('#back-to-top').fadeIn();
            } else {
                $('#back-to-top').fadeOut();
            }
        });
        // scroll body to 0px on click
        $('#back-to-top').click(function () {
            $('#back-to-top').tooltip('hide');
            $('body,html').animate({
                scrollTop: 0
            }, 700);
            return false;
        });
        
        $('#back-to-top').tooltip('show');

});







