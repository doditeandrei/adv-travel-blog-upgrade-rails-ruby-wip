// show/hide search-input
$(document).ready(function() {
    $( "#search-icon" ).click(function() {
        if($('#search-box:visible').length)
            $('#search-box').hide();
        else
            $('#search-box').show();
    });
});

// prevent hover on mobile for main_categories
jQuery(function ($) {
    if ($(window).width() > 769) {
        $('.navbar .dropdown').hover(function () {
            $(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown();

        }, function () {
            $(this).find('.dropdown-menu').first().stop(true, true).delay(100).slideUp();

        });

        $('.navbar .dropdown > a').click(function () {
            location.href = this.href;
        });

    }
});

// disable the search icon when on search page
function disable () {
    let search = document.getElementById('search-icon')
    let path = location.pathname.toString()

    if (path  === '/search') {
        search.style.pointerEvents = 'none';
    }
}
disable();

$(".alert-warning" ).fadeOut(5000);
$(".alert-info" ).fadeOut(9000);
