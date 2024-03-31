$(window).scroll(function () {
    var sticky = $('#header'),
        scroll = $(window).scrollTop();

    if (scroll >= 40) sticky.addClass('activeMenu');
    else sticky.removeClass('activeMenu');
});


$(document).ready(function () {
    $('.slider-group').slick({
        autoplay: true,
        prevArrow: '<button type="button" class="slick-prev custom-prev"><i class="fa-solid fa-chevron-left"></i></button>',
        nextArrow: '<button type="button" class="slick-next custom-next"><i class="fa-solid fa-chevron-right"></i></button>'
    })
})

$(document).ready(function () {
    $('.home-brand-slider').slick({
        autoplay: true,
        slidesToShow: 8,
        slidesToScroll: 1,
        prevArrow: '<button type="button" class="slick-prev custom-prev"><i class="fa-solid fa-chevron-left"></i></button>',
        nextArrow: '<button type="button" class="slick-next custom-next"><i class="fa-solid fa-chevron-right"></i></button>'
    })
})

$(document).ready(function () {
    $('.productLoop').slick({
        autoplay: true,
        slidesToShow: 5,
        slidesToScroll: 1,
        prevArrow: '<button type="button" class="slick-prev custom-prev"><i class="fa-solid fa-chevron-left"></i></button>',
        nextArrow: '<button type="button" class="slick-next custom-next"><i class="fa-solid fa-chevron-right"></i></button>'
    })
})

