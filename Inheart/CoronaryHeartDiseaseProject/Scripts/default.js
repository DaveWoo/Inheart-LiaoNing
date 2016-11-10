$(function () {
    pageInitModule.setWidth();
    pageInitModule.setSidebar();
    pageInitModule.setCarousel();
})
$(window).resize(function () {
    pageInitModule.setWidth();
})
$(window).scroll(function () {
    pageInitModule.setScrollToTop();
});

/*
* init page when page load
*/
var pageInitModule = (function (mod) {
    mod.setCarousel = function () {
        try {
            $('.carousel').hammer().on('swipeleft', function () {
                $(this).carousel('next');
            });
            $('.carousel').hammer().on('swiperight', function () {
                $(this).carousel('prev');
            });
        } catch (e) {
            console.log("you mush import hammer.js and jquery.hammer.js to let the carousel can be touched on mobile");
        }
    };
    mod.setWidth = function () {
        if ($(window).width() < 768) {
            $(".sidebar").css({ left: -220 });
            $(".all").css({ marginLeft: 0 });
        } else {
            $(".sidebar").animate({ left: 0 });
            $(".all").animate({ marginLeft: 220 });
        }
    };
    mod.setScrollToTop = function () {
        var top = $(window).scrollTop();
        if (top < 60) {
            $('#goTop').hide();
        } else {
            $('#goTop').show();
        }
    };
    mod.setSidebar = function () {
        $('[data-target="sidebar"]').click(function () {
            var asideleft = $(".sidebar").offset().left;
            if (asideleft == 0) {
                $(".sidebar").animate({ left: -220 });
                $(".all").animate({ marginLeft: 0 });
            }
            else {
                $(".sidebar").animate({ left: 0 });
                $(".all").animate({ marginLeft: 220 });
            }
        });
        $(".has-sub>a").click(function () {
            $(this).parent().siblings().find(".sub-menu").slideUp();
            $(this).parent().find(".sub-menu").slideToggle();
        })
        var _frameUrl = $("iframe[name='content3']")[0].src;
        $(".sidebar a[href]").each(function () {
            var tag = $(this).attr("href");
            var isActive = false;
            $(".breadcrumb>li a[href]").each(function (index) {
                if (tag == $(this).attr("href")) {
                    isActive = true;
                    return false;
                }
            })
            if (_frameUrl.indexOf(tag) > -1 || isActive) {
                $(this).parent().addClass("active");
                if ($(this).parents("ul").attr("class") == "sub-menu") {
                    $(this).parents("ul").slideDown();
                    $(this).parents(".has-sub").addClass("active");
                }
            }
        })
    }
    return mod;
})(window.pageInitModule || {});

/* 左侧菜单 */
function nav_left(navOjb) {
    var oItem = $('.nav li');
    for (var i = 0; i < oItem.length; i++) {
        $(oItem[i]).removeClass("active")
    }

    $(navOjb).parent().addClass("active");
    if ($(navOjb).parents("ul").attr("class") == "sub-menu") {
        $(navOjb).parents("ul").slideDown();
        $(navOjb).parents(".has-sub").addClass("active");
    }


}


//修改标题
function show_title(str, navOjb, hostName) {
    if (hostName != undefined) {
        $("#nav_host")[0].innerHTML = hostName;

        var oItem = $('.nav>li>a>i[title="nav"]');
        for (var i = 0; i < oItem.length; i++) {
            oItem[i].className = 'fa fa-caret-right fa-fw pull-right';
        }

        navOjb.childNodes[1].className = 'fa fa-caret-down fa-fw pull-right';
    }
    $("#nav_title")[0].innerHTML = str;
    nav_left(navOjb);
}
