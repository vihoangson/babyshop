// JavaScript Document

jQuery(document).ready(function ($) {
    "use strict";
    $(function () {
        //Keep track of last scroll
        var lastScroll = 0;
        var header = $(".header");
        var headerfixed = $("#header-main-fixed");
        var headerfixedbg = $(".header-bg");
        $(window).scroll(function () {
            //Sets the current scroll position
            var st = $(this).scrollTop();
            //Determines up-or-down scrolling
            if (st > lastScroll) {

                //Replace this with your function call for downward-scrolling
                if (st > 50) {
                    header.addClass("header-top-fixed");
                    header.find(".header-top-row").addClass("dis-n");
                    headerfixedbg.addClass("header-bg-fixed");
                    headerfixed.addClass("header-main-fixed");
                }
            }
            else {
                //Replace this with your function call for upward-scrolling
                if (st < 50) {
                    header.removeClass("header-top-fixed");
                    header.find(".header-top-row").removeClass("dis-n");
                    headerfixed.removeClass("header-main-fixed");
                    headerfixedbg.removeClass("header-bg-fixed");
                    //headerfixed.addClass("header-main-fixed")
                }
            }
            //Updates scroll position
            lastScroll = st;
        });
    });
    // Header search open functions
    $("#header-search").on("click", function () {
        var $obj = $("#header-top-search");
        if ($obj.hasClass("expanded")) {
            $obj.removeClass("expanded");
            $obj.slideUp({
                duration: 300,
                easing: "easeInQuad"
            });
        }
        else {
            $obj.addClass("expanded");
            $obj.slideDown({
                duration: 300,
                easing: "easeInQuad"
            });
        }
    });

    /* ==============================================
     Full screen div for home video
     =============================================== */
    // global vars
    var winWidth = $(window).width();
    var winHeight = $(window).height();
    // set initial div height / width
    $(".full-screen").css({
        'width': winWidth,
        'height': winHeight
    });

    // make sure div stays full width/height on resize
    $(window).resize(function () {
        $(".full-screen").css({
            'width': winWidth,
            'height': winHeight
        });
    });

    /* ==============================================
     background ticker
     =============================================== */
    $('.fade-ticker:has(>div:eq(1))').list_ticker({
        speed: 5000,
        effect: 'fade'
    });

    // Price Range  - JQuery UI slider
    $("#price-range").slider({
        range: true,
        min: 0,
        max: 1000,
        step: 10,
        values: [150, 800],
        slide: function (event, ui) {
            $("#price-from").val(ui.values[ 0 ]);
            $("#price-to").val(ui.values[ 1 ]);
        }
    });
    $("#price-from").val($("#price-range").slider("values", 0));
    $("#price-to").val($("#price-range").slider("values", 1));

    /* ==============================================
     // Facts show functions
     =============================================== */

    $(function () {
        var dataperc;
        $(".fact").appear(function () {
            $('.fact').each(function () {
                dataperc = $(this).attr('data-perc');
                $(this).find('.factor').delay(6000).countTo({
                    from: 0,
                    to: dataperc,
                    speed: 3000,
                    refreshInterval: 50
                });
            });
        });
    });



    $(window).load(function () {

        /* ==============================================
         // Bestseller owl slider script
         =============================================== */

        $("#nav-bestseller .next").on("click", function () {
            $("#owl-bestseller").trigger('next.owl.carousel');
        });
        $("#nav-bestseller .prev").on("click", function () {
            $("#owl-bestseller").trigger('prev.owl.carousel');
        });
        $("#owl-bestseller").owlCarousel({
            // Most important owl features
            loop: true,
            margin: 0,
            responsive: {
                0: {
                    items: 1
                },
                320: {
                    items: 1
                },
                580: {
                    items: 2
                },
                768: {
                    items: 2
                },
                992: {
                    items: 3
                },
                1200: {
                    items: 4
                }
            },
            lazyLoad: true,
            singleItem: false,
            itemsScaleUp: false,
            responsiveRefreshRate: 200,
            responsiveBaseWidth: window,
            autoplay: false,
            autoplayTimeout: 3000,
            autoplayHoverPause: true,
            navigation: false
        });
        /* ==============================================
         // Top owl slider script
         =============================================== */

        $("#nav-toprated .next").on("click", function () {
            $("#owl-toprated").trigger('next.owl.carousel');
        });
        $("#nav-toprated .prev").on("click", function () {
            $("#owl-toprated").trigger('prev.owl.carousel');
        });
        $("#owl-toprated").owlCarousel({
            // Most important owl features
            loop: true,
            margin: 0,
            responsive: {
                0: {
                    items: 1
                },
                320: {
                    items: 1
                },
                580: {
                    items: 2
                },
                768: {
                    items: 2
                },
                992: {
                    items: 3
                },
                1200: {
                    items: 3
                }
            },
            lazyLoad: true,
            singleItem: false,
            itemsScaleUp: false,
            responsiveRefreshRate: 200,
            responsiveBaseWidth: window,
            autoplay: false,
            autoplayTimeout: 3000,
            autoplayHoverPause: true,
            navigation: false
        });
        /* ==============================================
         // 3 column owl slider script
         =============================================== */

        $("#nav-col3 .next").on("click", function () {
            $("#owl-col3").trigger('next.owl.carousel');
        });
        $("#nav-col3 .prev").on("click", function () {
            $("#owl-col3").trigger('prev.owl.carousel');
        });
        $("#owl-col3").owlCarousel({
            // Most important owl features
            loop: true,
            margin: 0,
            responsive: {
                0: {
                    items: 1
                },
                320: {
                    items: 1
                },
                580: {
                    items: 2
                },
                768: {
                    items: 2
                },
                992: {
                    items: 3
                },
                1200: {
                    items: 3
                }
            },
            lazyLoad: true,
            singleItem: false,
            itemsScaleUp: false,
            responsiveRefreshRate: 200,
            responsiveBaseWidth: window,
            autoplay: false,
            autoplayTimeout: 3000,
            autoplayHoverPause: true,
            navigation: false
        });

        /* ==============================================
         // Tab horizantal owl slider script
         =============================================== */
        $("#nav-tabs-horizantal .next").on("click", function () {
            $("#owl-news").trigger('next.owl.carousel');
            $("#owl-featured").trigger('next.owl.carousel');
            $("#owl-rated").trigger('next.owl.carousel');
        });
        $("#nav-tabs-horizantal .prev").on("click", function () {
            $("#owl-news").trigger('prev.owl.carousel');
            $("#owl-featured").trigger('prev.owl.carousel');
            $("#owl-rated").trigger('prev.owl.carousel');
        });
        $("#owl-news").owlCarousel({
            // Most important owl features
            loop: true,
            margin: 0,
            responsive: {
                0: {
                    items: 1
                },
                320: {
                    items: 1
                },
                580: {
                    items: 2
                },
                768: {
                    items: 2
                },
                992: {
                    items: 3
                },
                1200: {
                    items: 4
                }
            },
            lazyLoad: true,
            singleItem: false,
            itemsScaleUp: true,
            responsiveRefreshRate: 200,
            responsiveBaseWidth: window,
            autoPlay: false,
            stopOnHover: false,
            navigation: false
        });

        $("#owl-featured").owlCarousel({
            // Most important owl features
            loop: true,
            margin: 0,
            responsive: {
                0: {
                    items: 1
                },
                320: {
                    items: 1
                },
                580: {
                    items: 2
                },
                768: {
                    items: 2
                },
                992: {
                    items: 3
                },
                1200: {
                    items: 4
                }
            },
            lazyLoad: true,
            singleItem: false,
            itemsScaleUp: false,
            responsiveBaseWidth: window,
            autoPlay: false,
            stopOnHover: false,
            navigation: false
        });
        $("#owl-rated").owlCarousel({
            // Most important owl features
            loop: true,
            margin: 0,
            responsive: {
                0: {
                    items: 1
                },
                320: {
                    items: 1
                },
                580: {
                    items: 2
                },
                768: {
                    items: 2
                },
                992: {
                    items: 3
                },
                1200: {
                    items: 4
                }
            },
            lazyLoad: true,
            singleItem: false,
            itemsScaleUp: false,
            responsiveBaseWidth: window,
            autoPlay: false,
            stopOnHover: false,
            navigation: false
        });

        /* ==============================================
         // 2 column 1 owl slider script
         =============================================== */

        $("#nav-col-2-1 .next").on("click", function () {
            $("#owl-col-2-1").trigger('next.owl.carousel');
        });
        $("#nav-col-2-1 .prev").on("click", function () {
            $("#owl-col-2-1").trigger('prev.owl.carousel');
        });
        $("#owl-col-2-1").owlCarousel({
// Most important owl features
            loop: true,
            margin: 0,
            responsive: {
                0: {
                    items: 1
                },
                320: {
                    items: 1
                },
                480: {
                    items: 2
                },
                768: {
                    items: 1
                },
                992: {
                    items: 2
                },
                1200: {
                    items: 2
                }
            },
            lazyLoad: true,
            singleItem: false,
            itemsScaleUp: false,
            responsiveRefreshRate: 200,
            responsiveBaseWidth: window,
            autoPlay: true,
            stopOnHover: false,
            navigation: false
        });


        /* ==============================================
         // 2 column 2 owl slider script
         =============================================== */

        $("#nav-col-2-2 .next").on("click", function () {
            $("#owl-col-2-2").trigger('next.owl.carousel');
        });
        $("#nav-col-2-2 .prev").on("click", function () {
            $("#owl-col-2-2").trigger('prev.owl.carousel');
        });
        $("#owl-col-2-2").owlCarousel({
// Most important owl features
            loop: true,
            margin: 0,
            responsive: {
                0: {
                    items: 1
                },
                320: {
                    items: 1
                },
                480: {
                    items: 2
                },
                768: {
                    items: 1
                },
                992: {
                    items: 2
                },
                1200: {
                    items: 2
                }
            },
            lazyLoad: true,
            singleItem: false,
            itemsScaleUp: false,
            responsiveRefreshRate: 200,
            responsiveBaseWidth: window,
            autoPlay: true,
            stopOnHover: false,
            navigation: false
        });
        /* ==============================================
         // Hot products owl slider script
         =============================================== */

        $("#nav-hot .next").on("click", function () {
            $("#owl-hot").trigger('next.owl.carousel');
        });
        $("#nav-hot .prev").on("click", function () {
            $("#owl-hot").trigger('prev.owl.carousel');
        });
        $("#owl-hot").owlCarousel({
// Most important owl features
            loop: true,
            margin: 0,
            responsive: {
                0: {
                    items: 1
                },
                320: {
                    items: 1
                },
                480: {
                    items: 2
                },
                768: {
                    items: 3
                },
                992: {
                    items: 4
                },
                1200: {
                    items: 5
                }
            },
            lazyLoad: true,
            singleItem: false,
            itemsScaleUp: false,
            responsiveRefreshRate: 200,
            responsiveBaseWidth: window,
            autoPlay: true,
            stopOnHover: false,
            navigation: false
        });



        $("#nav-small-product-1 .next").on("click", function () {
            $("#owl-small-product-1").trigger('next.owl.carousel');
        });
        $("#nav-small-product-1 .prev").on("click", function () {
            $("#owl-small-product-1").trigger('prev.owl.carousel');
        });

        $("#owl-small-product-1").owlCarousel({
            items: 1,
            loop: true,
            margin: 0,
            stagePadding: 0,
            smartSpeed: 450
        });

        $("#owl-block-slider").owlCarousel({
            items: 1,
            loop: true,
            autoplay: true,
            autoplayHoverPause: true,
            margin: 0,
            stagePadding: 0,
            autoplayTimeout: 2000,
            smartSpeed: 450
        });

        $("#nav-small-product-2 .next").on("click", function () {
            $("#owl-small-product-2").trigger('next.owl.carousel');
        });
        $("#nav-small-product-2 .prev").on("click", function () {
            $("#owl-small-product-2").trigger('prev.owl.carousel');
        });

        $("#owl-small-product-2").owlCarousel({
            items: 1,
            loop: true,
            margin: 0,
            stagePadding: 0,
            smartSpeed: 450
        });

        $("#nav-client-say .next").on("click", function () {
            $("#client-say").trigger('next.owl.carousel');
        });
        $("#nav-client-say .prev").on("click", function () {
            $("#client-say").trigger('prev.owl.carousel');
        });

        $("#client-say").owlCarousel({
            items: 1,
            loop: true,
            margin: 0,
            stagePadding: 0,
            smartSpeed: 450
        });

        $("#nav-small-product-3 .next").on("click", function () {
            $("#owl-small-product-3").trigger('next.owl.carousel');
        });
        $("#nav-small-product-3 .prev").on("click", function () {
            $("#owl-small-product-3").trigger('prev.owl.carousel');
        });

        $("#owl-small-product-3").owlCarousel({
// Most important owl features
            animateOut: 'bounceOutLeft',
            animateIn: 'bounceInRight',
            items: 1,
            loop: true,
            margin: 0,
            stagePadding: 0,
            smartSpeed: 450
        });

        $("#owl-partners").owlCarousel({
// Most important owl features
            loop: true,
            margin: 0,
            responsive: {
                0: {
                    items: 1
                },
                320: {
                    items: 1
                },
                580: {
                    items: 2
                },
                768: {
                    items: 3
                },
                992: {
                    items: 4
                },
                1200: {
                    items: 5
                }
            },
            lazyLoad: true,
            singleItem: false,
            itemsScaleUp: false,
            responsiveRefreshRate: 200,
            responsiveBaseWidth: window,
            autoplay: true,
            autoplayTimeout: 1000,
            autoplayHoverPause: true,
            navigation: false
        });


        $(".home-owl-slider .owl-slider-next").on("click", function () {
            $("#owl-home-slider").trigger('next.owl.carousel');
        });
        $(".home-owl-slider .owl-slider-prev").on("click", function () {
            $("#owl-home-slider").trigger('prev.owl.carousel');
        });
        $("#owl-home-slider").owlCarousel({
// Most important owl features
            lazyLoad: true,
            loop: true,
            margin: 0,
            responsive: {
                0: {
                    items: 1
                },
                320: {
                    items: 1
                },
                580: {
                    items: 2
                },
                768: {
                    items: 2
                },
                992: {
                    items: 3
                },
                1200: {
                    items: 3
                }
            },
            itemsScaleUp: false,
            responsiveRefreshRate: 200,
            responsiveBaseWidth: window,
            autoplay: true,
            autoplayTimeout: 1500,
            autoplayHoverPause: true
        });
    });



    $(function () {
        $('.dropdown').hover(function () {
            $(this).addClass('open');
        }, function () {
            $(this).removeClass('open');
        });
    });
    $(function () {
        $('.header-mini-cart').hover(function () {
            $(this).addClass('open');
        }, function () {
            $(this).removeClass('open');
        });
    });
    jQuery('.tp-banner').show().revolution(
            {
                dottedOverlay: "none",
                delay: 16000,
                startwidth: 1300,
                startheight: 750,
                hideThumbs: 200,
                thumbWidth: 100,
                thumbHeight: 50,
                thumbAmount: 5,
                navigationType: "none",
                navigationArrows: "solo",
                navigationStyle: "preview1",
                touchenabled: "on",
                onHoverStop: "off",
                swipe_velocity: 0.7,
                swipe_min_touches: 1,
                swipe_max_touches: 1,
                drag_block_vertical: false,
                parallax: "mouse",
                parallaxBgFreeze: "on",
                parallaxLevels: [7, 4, 3, 2, 5, 4, 3, 2, 1, 0],
                keyboardNavigation: "off",
                navigationHAlign: "center",
                navigationVAlign: "bottom",
                navigationHOffset: 0,
                navigationVOffset: 20,
                soloArrowLeftHalign: "left",
                soloArrowLeftValign: "center",
                soloArrowLeftHOffset: 20,
                soloArrowLeftVOffset: 0,
                soloArrowRightHalign: "right",
                soloArrowRightValign: "center",
                soloArrowRightHOffset: 20,
                soloArrowRightVOffset: 0,
                shadow: 0,
                fullWidth: "off",
                fullScreen: "on",
                spinner: "spinner1",
                stopLoop: "off",
                stopAfterLoops: -1,
                stopAtSlide: -1,
                shuffle: "off",
                autoHeight: "off",
                forceFullWidth: "on",
                hideThumbsOnMobile: "off",
                hideNavDelayOnMobile: 1500,
                hideBulletsOnMobile: "off",
                hideArrowsOnMobile: "off",
                hideTimerBar: "on",
                hideThumbsUnderResolution: 0,
                hideSliderAtLimit: 0,
                hideCaptionAtLimit: 0,
                hideAllCaptionAtLilmit: 0,
                startWithSlide: 0,
                fullScreenOffsetContainer: ""
            });

    $('.tool_tip').tooltip();
// Color Filter
    $(".colors li a").each(function () {
        $(this).css("background-color", "#" + $(this).attr("data-rel")).attr("href", "#" + $(this).attr("data-rel"));
    });
// Product zoom
    $('#product-zoom').elevateZoom({
        zoomType: "inner",
        cursor: "crosshair",
        zoomWindowFadeIn: 500,
        zoomWindowFadeOut: 750
    });
    var gallery = $('#gal1');
    gallery.find('a').hover(function () {

        var smallImage = $(this).attr("data-image");
        var largeImage = $(this).attr("data-zoom-image");
        var ez = $('#product-zoom').data('elevateZoom');
        ez.swaptheimage(smallImage, largeImage);
    });
// Daily Deal CountDown Clock Settings
    var date = new Date().getTime(); // This example is just to show how this function works.
    var new_date = new Date(date + 86400000); // You can set your own time whenever you want.
//    var n = new_date.toUTCString();				// 'date' value is given in milliseconds.
//alert(new_date)
    $(".time").countdown({
        date: new_date,
        yearsAndMonths: true,
        leadingZero: true
    });

// Categories Menu Manipulations
    $(".ul-side-category li a").on("click", function () {

        var sm = $(this).next();
        if (sm.hasClass("sub-category")) {
            if (sm.css("display") === "none") {
                $(this).next().slideDown();
            }
            else {

                $(this).next().slideUp();
                $(this).next().find(".sub-category").slideUp();
                /*$(this).next().find(".categories-submenu").slideUp("normal", function() {
                 $(this).parent().find(".icon-angle-down").removeClass("icon-angle-down").addClass("icon-angle-right");
                 });*/
            }

            return false;
        }
        else {
            return true;
        }
    }
    );
});

    (function ($) {
        $.fn.countTo = function (options) {
        // merge the default plugin settings with the custom options
        options = $.extend({}, $.fn.countTo.defaults, options || {});
        // how many times to update the value, and how much to increment the value on each update
                var loops = Math.ceil(options.speed / options.refreshInterval),
        increment = (options.to - options.from) / loops;
            return $(this).each(function () {
                    var _this = this,
                    loopCount = 0,
                    value = options.from,
            interval = setInterval(updateTimer, options.refreshInterval);
                function updateTimer() {
                value += increment;
                loopCount++;
                $(_this).html(value.toFixed(options.decimals));
                    if (typeof (options.onUpdate) === 'function') {
                options.onUpdate.call(_this, value);
                }
                
                    if (loopCount >= loops) {
                    clearInterval(interval);
                    value = options.to;
                        if (typeof (options.onComplete) === 'function') {
                    options.onComplete.call(_this, value);
                }
            }
        }
    });
    };
        $.fn.countTo.defaults = {
        from: 0, // the number the element should start at
        to: 100, // the number the element should end at
        speed: 1000, // how long it should take to count between the target numbers
        refreshInterval: 100, // how often the element should be updated
        decimals: 0, // the number of decimal places to show
        onUpdate: null, // callback method for every time the element is updated,
    onComplete: null // callback method for when the element finishes updating
};
})(jQuery);
new WOW().init();

