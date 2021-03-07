var ticking = false;
var isFirefox = /Firefox/i.test(navigator.userAgent);
var isIe =
    /MSIE/i.test(navigator.userAgent) ||
    /Trident.*rv\:11\./i.test(navigator.userAgent);
var scrollSensitivitySetting = 30;
var slideDurationSetting = 600;
var currentSlideNumber = 0;
var pageSlide = $(".full-page section");
var totalSlideNumber = pageSlide.length;

function parallaxScroll(evt) {
    let delta = 0;
    if (isFirefox) {
        delta = evt.detail * -120;
    } else if (isIe) {
        delta = -evt.deltaY;
    } else {
        delta = evt.wheelDelta;
    }

    if (ticking != true) {
        if (delta <= -scrollSensitivitySetting) {
            ticking = true;
            if (currentSlideNumber !== totalSlideNumber - 1) {
                currentSlideNumber++;
                nextItem();
            }
            slideDurationTimeout(slideDurationSetting);
        }
        if (delta >= scrollSensitivitySetting) {
            ticking = true;
            if (currentSlideNumber !== 0) {
                currentSlideNumber--;
                previousItem();
            }
            slideDurationTimeout(slideDurationSetting);
        }
    }
}

function slideDurationTimeout(slideDuration) {
    setTimeout(function() {
        ticking = false;
    }, slideDuration);
}

var mousewheelEvent = isFirefox ? "DOMMouseScroll" : "wheel";
window.addEventListener(mousewheelEvent, _.throttle(parallaxScroll, 60), false);

function nextItem() {
    $("section").removeClass("current-page");
    var $previousSlide = pageSlide.eq(currentSlideNumber - 1);
    var $currentSlide = pageSlide.eq(currentSlideNumber);
    $currentSlide.addClass("current-page");
    $previousSlide.removeClass("up-scroll").addClass("down-scroll");
    if ($(window).width() > 1200 && $(".full-page").length >= 1) {
        $("header").addClass("active");
        $("#fake-header-open").addClass("active");
        $("#nav-pagination").addClass("active");
    }
    $("header .search-wrapper").removeClass("active");
    if ($currentSlide.is(":first-child")) {
        $("#to-top").removeClass("active");
        $("#mail").removeClass("active");
        $("#phone").removeClass("active");
        $("#facebook").removeClass("active");
    }
    if (currentSlideNumber == 1 && $(".full-page").length >= 1) {
        $("#to-top").addClass("active");
        $("#mail").addClass("active");
        $("#phone").addClass("active");
        $("#facebook").addClass("active");
    }
    $("#nav-pagination ul li").removeClass("active");
    $(
        "#nav-pagination ul li:nth-child(" + (currentSlideNumber + 1) + ")"
    ).addClass("active");
}

function previousItem() {
    $("section").removeClass("current-page");
    $("footer").removeClass("active");
    var $currentSlide = pageSlide.eq(currentSlideNumber);
    $currentSlide.addClass("current-page");
    if ($(".full-page").length >= 1) {
        $("#to-top").addClass("active");
        $("#mail").addClass("active");
        $("#phone").addClass("active");
        $("#facebook").addClass("active");
    }
    $("#fake-header-open").removeClass("last");
    if ($currentSlide.is(":first-child") && $(".full-page").length >= 1) {
        $("#to-top").removeClass("active");
        $("#mail").removeClass("active");
        $("#phone").removeClass("active");
        $("#facebook").removeClass("active");
        $("header").removeClass("active");
        $("#fake-header-open").removeClass("active");
    }

    $currentSlide.removeClass("down-scroll").addClass("up-scroll");
    $("#nav-pagination ul li").removeClass("active");
    $(
        "#nav-pagination ul li:nth-child(" + (currentSlideNumber + 1) + ")"
    ).addClass("active");
}

function setBackgroundElement() {
    $("[setBackground]").each(function() {
        var background = $(this).attr("setBackground");
        $(this).css({
            "background-image": "url(" + background + ")",
            "background-size": "cover",
            "background-position": "center center",
        });
    });
    $("[setBackgroundRepeat]").each(function() {
        var background = $(this).attr("setBackgroundRepeat");
        $(this).css({
            "background-image": "url(" + background + ")",
            "background-repeat": "repeat",
        });
    });
}

function EqualHeightElement(el) {
    let height = 0;
    let thisHeight = 0;
    $(el).each(function() {
        thisHeight = $(this).height();
        if (thisHeight > height) {
            height = thisHeight;
        }
    });
    $(el).height(height);
}

function scrollToTop() {
    window.addEventListener("scroll", function() {
        var bannerheight = $("#pagebanner").outerHeight();
        var heightHeader = $("header").outerHeight();
        if (
            window.pageYOffset > bannerheight + heightHeader &&
            $(".full-page").length == 0
        ) {
            $("#to-top").addClass("active");
            $("#mail").addClass("active");
            $("#phone").addClass("active");
            $("#facebook").addClass("active");
        } else {
            $("#to-top").removeClass("active");
            $("#mail").removeClass("active");
            $("#phone").removeClass("active");
            $("#facebook").removeClass("active");
        }
    });
    if ($(".full-page").length >= 1) {
        $("#to-top").on("click", function() {
            currentSlideNumber = 0;
            $("section").removeClass("down-scroll");
            $(".home-page-banner").addClass("current-page");
            $("header").removeClass("active");
            $("#fake-header-open").removeClass("active");
        });
    } else {
        $("#to-top").on("click", function(e) {
            e.preventDefault();
            $("html,body").animate({
                scrollTop: 0,
            });
            $("#back-to-top").removeClass("active");
            $("#mail").removeClass("active");
            $("#phone").removeClass("active");
            $("#facebook").removeClass("active");
        });
    }
}

function createPagination() {
    $("main").append("<div id='nav-pagination'><ul></ul></div>");
    var lstSection = $(".full-page section, footer");
    for (let i = 0; i < totalSlideNumber; i++) {
        var spanHtml = "";
        if ($(lstSection[i]).attr("data-title") != undefined) {
            spanHtml =
                " <span>" + $(lstSection[i]).attr("data-title") + "</span>";
        }
        if (i == 0) {
            $("#nav-pagination ul").append(
                "<li class='active' data-section='" +
                (i + 1) +
                "'>" +
                "0" +
                (i + 1) +
                "</li>"
            );
        } else {
            $("#nav-pagination ul").append(
                "<li data-section='" + (i + 1) + "'>" + "0" + (i + 1) + "</li>"
            );
        }
    }
    $("#nav-pagination ul li").on("click", function() {
        $("#nav-pagination ul li").removeClass("active");
        $(this).addClass("active");
        let e = $(this).attr("data-section") - 1;
        $(".full-page section").removeClass("down-scroll up-scroll");
        if (e < currentSlideNumber) {
            currentSlideNumber = e;
            $(
                ".full-page section:nth-child(" + (currentSlideNumber + 1) + ")"
            ).addClass("up-scroll current-page");
            $(".full-page section").removeClass("down-scroll");
            for (let i = currentSlideNumber; i < totalSlideNumber; i++) {
                $(
                    ".full-page section:nth-child(" +
                    (currentSlideNumber + 1) +
                    ")"
                ).addClass("up-scroll");
            }
        } else {
            currentSlideNumber = e;
            $(".full-page section").removeClass("current-page");
            $(
                ".full-page section:nth-child(" + (currentSlideNumber + 1) + ")"
            ).addClass("current-page");
            for (let i = 0; i < currentSlideNumber; i++) {
                $(".full-page section:nth-child(" + (i + 1) + ")").addClass(
                    "down-scroll"
                );
            }
        }
        currentSlideNumber + 1 == totalSlideNumber ?
            $("footer").addClass("active") :
            $("footer").removeClass("active"),
            0 != currentSlideNumber ?
            ($("header").addClass("active"),
                $("#fake-header-open").addClass("active")) :
            ($("header").removeClass("active"),
                $("#fake-header-open").removeClass("active")),
            5 == currentSlideNumber ?
            $("#fake-header-open").addClass("last") :
            $("#fake-header-open").removeClass("last");
    });
}

function toggleSearchWrapper() {
    $(".header-icon .btn-search").on("click", function() {
        $("header").find(".search-wrapper").toggleClass("active");
    });
    $("header .search-wrapper .close-button").on("click", function() {
        $("header .search-wrapper").toggleClass("active");
    });
    $("section").on("click", function() {
        $("header .search-wrapper").removeClass("active");
    });
}

function fixItem() {
    $(".primary-nav").sticky({
        zIndex: 9,
        topSpacing: $("header").outerHeight() + 5,
    });
}

function listBanerSlide() {
    //slider trong trang tin tuc chi tiet
    var sliderpostorther = new Swiper('.wrap-post-detail .swiper-container', {
        slidesPerView: 1,
        spaceBetween: 20,
        loop: true,
        navigation: {
            nextEl: '.wrap-post-detail .slider .button-slider .button-next',
            prevEl: '.wrap-post-detail .slider .button-slider .button-prev',
        },
        breakpoints: {
            575: {
                slidesPerView: 1,

            },
            768: {
                slidesPerView: 2,

            },
            1024: {
                slidesPerView: 3,

            },
        },
    });

    var myswiper = new Swiper("#home-banner .swiper-container", {
        loop: false,
        slidesPerView: 1,
        speed: 1000,
        effect: "fade",
        grabCursor: true,
        autoplay: {
            delay: 5000,
            disableOnInteraction: false,
        },
        pagination: {
            el: ".swiper-pagination",
        },
        fadeEffect: {
            crossFade: true,
        },
    });

    var home4_2 = new Swiper("#ka-swiper1", {
        // paginationClickable: true,
        loop: true,
        slidesPerView: 1,
        spaceBetween: 30,
        navigation: {
            nextEl: ".home-4 .s4-right .button-next",
            prevEl: ".home-4 .s4-right .button-prev",
        },
    });
    var home4 = new Swiper(".index-3-slide .swiper-container", {
        // slidesPerView: "auto",
        // slidesPerView: 2,
        // touchEventsTarget: 'wrapper',
        freeMode: true,
        observer: true,
        width: 190,
        observeParents: true,
        spaceBetween: 5,
        autoplay: true,
        speed: 500,
        // 116slideActiveClass: "active",
        navigation: {
            nextEl: ".home-4 .button-next",
            prevEl: ".home-4 .button-prev",
        },
        // on: {
        //     afterInit: function () {
        //       console.log('swiper initialized');
        //       $(".swiper-slide-active").css({"width": "50%"})
        //       $(".swiper-slide-duplicate-active").css({"width": "50%"})
        //     },
        //   },
    });
    var newsSwiper = new Swiper(".home-5 .swiper-news .swiper-container", {
        slidesPerView: 1,
        spaceBetween: 5,
        loop: true,
        navigation: {
            nextEl: ".home-5 .swiper-news .button-next",
            prevEl: ".home-5 .swiper-news .button-prev",
        },
        breakpoints: {
            768: {
                slidesPerView: 2,
                spaceBetween: 20,
            },
            1024: {
                slidesPerView: 3,
                spaceBetween: 30,
            },
        },
    });
    var wrapPartner = new Swiper(".wrap-partner .swiper-container", {
        slidesPerView: 1,
        spaceBetween: 5,
        loop: true,
        navigation: {
            nextEl: ".home-6 .button-next",
            prevEl: ".home-6 .button-prev",
        },
        breakpoints: {
            575: {
                slidesPerView: 2,
                spaceBetween: 5,
            },
            768: {
                slidesPerView: 4,
                spaceBetween: 20,
            },
            1024: {
                slidesPerView: 6,
                spaceBetween: 30,
            },
        },
    });
    var tongQuan = new Swiper(".swiper-tong-quan .swiper-container", {
        slidesPerView: 1,
        spaceBetween: 5,
        loop: true,
        navigation: {
            nextEl: ".swiper-tong-quan .button-next",
            prevEl: ".swiper-tong-quan .button-prev",
        },
    });
    var nangLuc = new Swiper(".swiper-nang-luc .swiper-container", {
        slidesPerView: 1,
        spaceBetween: 5,
        loop: true,
        navigation: {
            nextEl: ".swiper-nang-luc .button-next",
            prevEl: ".swiper-nang-luc .button-prev",
        },
    });
}

function menuFake() {
    let menu = $("header .primary-menu");
    menu.clone().appendTo(".menu-fullscreen");
    $("#fake-header-open").on("click", function() {
        $(".menu-fullscreen").addClass("active");
    });
    $(".icon-close").click(function() {
        $(".menu-fullscreen").removeClass("active");
    });
}

function tabs() {
    $(".tabs > li").on("click", function() {
        var $panel = $(this).closest(".tab-panels");
        $panel.find("li.active").removeClass("active");
        $(this).addClass("active");
        var panelToShow = $(this).attr("rel");
        $panel.find(".panel.active").fadeOut(300, showNextPanel);

        function showNextPanel() {
            $(this).removeClass("active");
            $("#" + panelToShow).fadeIn(300, function() {
                $(this).addClass("active").fadeIn(300);
            });
        }
    });
    if ($(window).width() < 992 && ".category-nav".length >= 1) {
        $(".category-nav").on("click", function() {
            $(this).find(".material-icons").toggleClass("active");
            $(this).siblings(".tabs, .filter-content").slideToggle("slow");
        });
    }
}

function headerActive() {
    const heightHeader = document.querySelector("header").offsetHeight;
    if ($(".full-page").length == 0) {
        window.addEventListener("scroll", function() {
            if (window.pageYOffset >= heightHeader) {
                document.querySelector("header").classList.add("active-scroll");
            } else {
                document
                    .querySelector("header")
                    .classList.remove("active-scroll");
            }
        });
    }
}

function category() {
    if ($(window).width() <= 991 && ".zone-nav".length >= 1) {
        $(".zone-nav .categroly .box-category").on("click", function(x) {
            x.stopPropagation();
            $(".zone-nav .categroly").toggleClass("active");
            $(".zone-nav .box-category .material-icons").toggleClass("active");
        });
        window.addEventListener("scroll", function() {
            $(".zone-nav .categroly").removeClass("active");
            $(".zone-nav .categroly")
                .find(".material-icons")
                .removeClass("active");
        });
    }
}

function crollToDiv() {
    $(".zone-nav .categroly ul li .nav-link").on("click", function(event) {
        $(this).parents("li").addClass("active");
        var heightHeader = $("header").outerHeight();
        if (this.hash !== "") {
            event.preventDefault();
            var hash = this.hash;
            $("html, body").animate({
                    scrollTop: $(hash).offset().top - 160,
                },
                900,
                function() {
                    window.location.hash = hash;
                }
            );
        }
        $(".zone-nav .categroly ul li .nav-link")
            .not(this)
            .parent("li")
            .removeClass("active");
        window.addEventListener("scroll", function() {
            var bannerheight = $("#pagebanner").outerHeight();
            if (window.pageYOffset > bannerheight) {
                document.querySelector(".zone-nav").classList.add("scolled");
            } else {
                document.querySelector(".zone-nav").classList.remove("scolled");
            }
        });
    });
}

function crollTop() {
    if ($(".zone-nav").length >= 1) {
        window.addEventListener("scroll", function() {
            var bannerheight = $("#pagebanner").outerHeight();
            var heightHeader = $("header").outerHeight();
            if (window.pageYOffset > bannerheight) {
                document.querySelector(".zone-nav").classList.add("scolled");
                $(".scolled").css("top", heightHeader);
            } else {
                document.querySelector(".zone-nav").classList.remove("scolled");
                $(".zone-nav").css("top", 0);
            }
        });
    }
}
const checkLayoutBanner = () => {
    const pagesBanner = $("#pagebanner");
    const heightHeader = $("header").outerHeight();
    const mainBanner = $("#home-banner");
    if (mainBanner.length >= 1) {
        $("main").css("padding-top", 0);
    } else if (pagesBanner.length >= 1) {
        $("main").css("padding-top", heightHeader);
    } else {
        $("main").css("padding-top", heightHeader);
    }
};

function checkFullpage() {
    if ($(".full-page").length >= 1) {
        $("body").toggleClass("overflow-hidden");
    }
    if ($(window).width() < 1200) {
        $("body").removeClass("overflow-hidden");
        $(".full-page .home-page-6").toggleClass("active");
    }
}

const toggleMenuMobile = () => {
    $(".toggle-menu").on("click", function() {
        $(".menu-fullscreen").addClass("active");
        $(".icon-close").click(function() {
            $(".menu-fullscreen").removeClass("active");
        });
    });
};
const InsertBd = () => {
    $(".breadcrumb-wrapper").appendTo("#pagebanner .box-text");
};

function phantrang() {
    $(".modulepager")
        .find(".pagination")
        .find("li>a.NextPage, li>a.LastPage, li>a.BackPage, li>a.FirstPage")
        .parent()
        .hide();
}

function tool() {
    window.addEventListener("scroll", function() {
        if (window.pageYOffset > 5500) {
            document.querySelector("#tool-wrapper").classList.add("active");
        } else {
            document.querySelector("#tool-wrapper").classList.remove("active");
        }
    });
    $("#go-to-top").on("click", function(e) {
        e.preventDefault();
        $("html,body").animate({
            scrollTop: 0,
        });
    });
}

function Showmap() {
    $(".list-select .list-item .item").click(function() {
        $(this).addClass("active");
        var datahref = $(this).attr("data-href");
        $(".show-map")
            .find("iframe")
            .attr("src", function() {
                return datahref;
            });
        $(".list-select .list-item .item").not(this).removeClass("active");
    });
}

function changePlaceholder() {
    $(".wrap-form .frm-captcha .frm-captcha-input input ").attr(
        "placeholder",
        "Nhập mã captcha"
    );
    if ($(".wrap-form .frm-captcha").length >= 1) {
        $(".form-contact .wrap-form .frm-btnwrap").appendTo(
            ".wrap-form .frm-captcha"
        );
    }
    $(".footer-subscribed .wrap-form .frm-btnwrap input").attr("value", "");
}
const clickMenu = () => {
    $(".hambuger").click(function() {
        $(".menu-fullscreen").addClass("active");
    });
};
const clickSearch = () => {
    $(".icon-search").click(function() {
        $(".search-wrap").addClass("active");
    });
    $(".close-btn").click(function() {
        $(".search-wrap").removeClass("active");
    });
};
const selectQh = () => {
    $(".select-qh").selectize({
        create: true,
        sortField: "text",
    });
};

function serviceSlide() {
    var galleryThumbsSer = new Swiper(
        ".block-service .gallery-thumbs-product", {
            slidesPerView: 1,
            breakpoints: {
                575: {
                    slidesPerView: 2,
                },
                1200: {
                    slidesPerView: 4,
                },
            },
        }
    );
    var galleryTop = new Swiper(".block-service .gallery-top", {
        thumbs: {
            swiper: galleryThumbsSer,
        },
        navigation: {
            nextEl: ".nav-next",
            prevEl: ".nav-prev",
        },
    });
}

// Slide product-detail
function productSlide() {
    var galleryThumbs123 = new Swiper(
        ".block-product-news .gallery-thumbs-product", {
            // freeMode: true,
            // watchSlidesVisibility: true,
            // watchSlidesProgress: true,
            slidesPerView: 1,
            breakpoints: {
                575: {
                    slidesPerView: 2,
                },
                1200: {
                    slidesPerView: 3,
                },
            },
        }
    );
    var galleryTop = new Swiper(".block-product-news .gallery-top-product", {
        thumbs: {
            swiper: galleryThumbs123,
        },
        navigation: {
            nextEl: ".nav-next",
            prevEl: ".nav-prev",
        },
    });
}
const getWidthLab2 = () => {
    alert($(".lab-main-2 .swiper-slide-active").outerWidth());
};
const clickChangLang = () => {
    $(".change-lang").click(function() {
        $(".list-change").toggleClass("active");
    });
};

function projectDetailSlide() {
    var galleryThumbs = new Swiper(".gallery-thumbs-project", {
        spaceBetween: 15,
        slidesPerView: 3,
        freeMode: true,
        watchSlidesVisibility: true,
        watchSlidesProgress: true,
        breakpoints: {
            576: {
                slidesPerView: 3,
            },
            1000: {
                slidesPerView: 5,
            },
        },
    });
    var galleryTop = new Swiper(".gallery-top-project", {
        thumbs: {
            swiper: galleryThumbs,
        },
    });
}
const openPopupCd = () => {
    if ($(".quan-he-co-dong").length == 1) {
        $("a[href='#tab-2']").click(function() {
            $("#tab-2").addClass("active-fc");
            $("#tab-2").fancybox().trigger("click");
            $(".quan-he-co-dong ul li a")
                .not("a[href='#tab-2']")
                .click(function() {
                    $("#tab-2").removeClass("active-fc");
                });
        });
    }
};
const scorllActive = () => {
    let header = $("header").outerHeight();
    // console.log(header);
    $(".primary-nav").activescroll({
        scroll: "scroll",
        active: "active",
        offset: header,
    });
};
const moveDetail = () => {
    $(".block-project").insertAfter(".project-detail");
};
const wrapTable = () => {
    if ($(".product-detail").length == 1) {
        $("table").wrap("<div class='wrap-table-main'></div>");
    }
};
const clickFullImage = () => {
    // $(".home-4 .box-img").click(function () {
    // 	$(this).parent().toggleClass("sw-index");
    // });
    // Jquery

    // Vanila
    var fsmActual = document.createElement("div");
    fsmActual.setAttribute("id", "fsm_actual");
    document.getElementById("home-4").appendChild(fsmActual);
    var $fsm = document.querySelectorAll(".home-4 .box-img");
    var $fsmActual = document.querySelector("#fsm_actual");
    var $ImageF = document.querySelector("#test-img");
    $fsmActual.style.position = "absolute";
    var position = {};
    var size = {};
    //modal action stuffs
    var openFSM = function(event) {
        // Delete
        var $this = event.currentTarget;
        $this.style.opacity = "0";
        $this.style.transition = "0s ease";
        position = $this.getBoundingClientRect();
        size = {
            width: window.getComputedStyle($this).width,
            height: window.getComputedStyle($this).height,
        };
        console.log(position.top);
        setTimeout(() => {
            $fsmActual.innerHTML = $this.innerHTML;
            var classes = $this.classList.value.split(",");
            for (var i = 0; i < classes.length; i++) {
                $fsmActual.classList.add(classes[i]);
            }
        }, 0);
        $fsmActual.style.position = "absolute";
        $fsmActual.style.top = "420px";
        $fsmActual.style.left = position.left + "px";
        $fsmActual.style.height = size.height;
        $fsmActual.style.width = size.width;
        $fsmActual.style.margin = $this.style.margin;
        $fsmActual.style.transition = "0s ease";
        // $fsmActual.style.zindex = "99";
        setTimeout(function() {
            $fsmActual.innerHTML = $this.innerHTML;
            var classes = $this.classList.value.split(",");
            for (var i = 0; i < classes.length; i++) {
                $fsmActual.classList.add(classes[i]);
            }
            $fsmActual.classList.add("growing");
            $fsmActual.style.height = "100%";
            $fsmActual.style.width = "100%";
            $fsmActual.style.top = "0";
            $fsmActual.style.left = "0";
            $fsmActual.style.margin = "0";
            $fsmActual.style.boxShadow = "7px 13px 20px 20px #00000030";
            $fsmActual.style.transition =
                "all 0.7s cubic-bezier(0.83, 0, 0.17, 1)";
        }, 100);
        setTimeout(function() {
            $this.style.opacity = "1";
        }, 1200);
        setTimeout(function() {
            $fsmActual.classList.remove("growing");
            $fsmActual.classList.add("full-screen");
        }, 1000);
    };

    var closeFSM = function(event) {
        var $this = document.querySelector("#fsm_actual");
        $this.style.height = size.height;
        $this.style.width = size.width;
        $this.style.top = position.top + "px";
        $this.style.left = position.left + "px";
        $this.style.margin = "0";
        $this.classList.remove("full-screen");
        $this.classList.add("shrinking");
        setTimeout(function() {
            while ($this.firstChild) $this.removeChild($this.firstChild);
            var classList = $this.classList;
            while (classList.length > 0) {
                classList.remove(classList.item(0));
            }
            $this.style = "";
        }, 1000);
    };

    for (var i = 0; i < $fsm.length; i++) {
        $fsm[i].addEventListener("click", openFSM);
    }
    $fsmActual.addEventListener("click", closeFSM);
    $(".home-4 .box-img").click(function() {
        console.log(11);
        $(".home-4").addClass("overlay-background");
        setTimeout(() => {
            $(".home-4").addClass("active");
        }, 100);
        setTimeout(() => {
            $(".home-4").removeClass("active");
        }, 600);
        // setTimeout(() => {
        // 	$(".home-4 .button-next").trigger("click");
        // }, 800);
        setTimeout(() => {
            let imageUrl = $(this).find("img").attr("data-src");
            $(".home-4").css({
                "background-image": "url(" + imageUrl + ")",
                transition: "0s ease",
            });
        }, 1200);
        $(
            ".home-4 .box-wrap .wrap-count-slide .wrap-button .button-next"
        ).trigger("click");
    });
    $(".home-4 .box-wrap .wrap-count-slide .wrap-button .button-next").on(
        "click",
        function() {
            $(".box-wrap .swiper-slide-active").each(function() {
                // console.log(11111);
                $(this).prev().trigger("click");
            });
        }
    );
};
const checkScorll = () => {
    var lastScrollTop = 0;
    $(window).scroll(function(event) {
        var checkScroll = $(this).scrollTop();
        console.log(checkScroll);
        lastScrollTop = checkScroll;
    });
};

function ajaxQHCD() {
    $(".select-ajax").each(function(index) {
        $(this).on("change", function() {
            let $url = this.value;
            let $indexSelect = index;
            $.ajax({
                url: $url,
                data: {
                    isajax: true,
                },
                success: function(data) {
                    $(".ajaxresponse .ajaxresponsewrap")
                        .eq($indexSelect)
                        .html($(data).find(".ajaxresponsewrap").html());
                },
            });
        });
    });
}
const clickScrollTo = () => {
    $(".wrap-scroll").click(function() {
        // $(".home-page-banner").addClass("down-scroll");
        // $(".home-2").addClass("current-page");
        $("li[data-section='2']").trigger("click");
        $("#nav-pagination").addClass("active");
    });
};

function dropDownMenu() {
    $(".primary-menu .title em").on("click", function() {
        // $(this).parents("li").addClass("open-sub");
        if ($(".primary-menu .dropdown-menu").hasClass("open-sub")) {
            $(".open-sub .dropdown").slideUp();
            $(".dropdown-menu").removeClass("open-sub");
        } else {
            $(".dropdown-menu").removeClass("open-sub");
            $(".open-sub .dropdown").slideUp();
            $(this).parent().next().slideDown();
            $(this).parents(".dropdown-menu").addClass("open-sub");
        }
    });
}

function checkFooter() {
    if ($("body").hasClass("homepage")) {
        $("footer .bg-fake .footer").appendTo($(".homepage .home-6 .bg-fake"));
    }
}

// function checkBigItem() {
//     let item = $(".wrap-slide-s4 .swiper-slide .wrapper .item");
//     // let item_2 = $(".wrap-slide-s4 .swiper-slide .wrapper .item.active");
//     item.on("click", function() {
//         $(this).addClass("active").siblings().removeClass("active")
//     });
// }

function checkMargin() {
    let container = $(".container").css("marginLeft");
    let sec_4 = $(".home-4 .s4-left");
    // let sec_4_title = $(".home-4 .wrap-slide-s4 .wrap-title");
    // sec_4.css(`flex`, `0 0 ${container}`);
    sec_4.css("margin-left", container);
    console.log(container);
    $(window).resize(checkMargin);
}

function SlideHover() {
    var slide = $(".index-3-slide .swiper-slide");
    $(".index-3-slide .swiper-slide")
        .first()
        .addClass("active")
    if ($(window).width() > 1024) {
        $(".index-3-slide .swiper-slide").on("mouseover", function() {
            $(this)
                .addClass("active")
            $(this)
                .siblings(".index-3-slide .swiper-slide")
                .removeClass("active")
        });
        $(".index-3-slide .swiper-slide-active").on("mouseout", function() {
            $(this)
                .removeClass("active")
            $(this)
                .first()
                .addClass("active")
        });
        $(".index-3-slide .button-next").on("click", function() {
            slide.removeClass("active")
            $(".index-3-slide .swiper-slide-active").addClass("active")

            $(this).css("pointer-events", "none");
            setTimeout(() => {
                $(this).css("pointer-events", "auto");
            }, 50);
            if ($(this).css("pointer-events", "auto")) {
                $(this).css("pointer-events", "none");
            }
        });
        $(".index-3-slide .button-prev").on("click", function() {

            if (slide.hasClass("active")) {
                slide
                    .removeClass("active")
                $(".swiper-slide-active").addClass("active");
            }
            $(this).css("pointer-events", "none");
            setTimeout(() => {
                $(this).css("pointer-events", "auto");
            }, 50);
            if ($(this).css("pointer-events", "auto")) {
                $(this).css("pointer-events", "none");
            }
        });

    } else {
        $(".index-3-slide .swiper-slide").on("touchstart", function() {
            $(this)
                .addClass("active")
            $(this)
                .siblings(".index-3-slide .swiper-slide")
                .removeClass("active")
        });
        $(".index-3-slide .swiper-slide").on("touchcancel", function() {
            $(this)
                .removeClass("active")
            $(this)
                .first()
                .addClass("active")
        });

    }
}
$(document).ready(function() {
    // $(".wrap-slide-s4 .swiper-slide .wrapper .item:first-child").addClass("active");
    listBanerSlide();
    fixItem();
    // $(".home-4").attr("id", "home-4");
    checkScorll();
    setBackgroundElement();
    scrollToTop();
    createPagination();
    setTimeout(() => {
        $("section:first-child").addClass("current-page");
    }, 100);
    ajaxQHCD();
    toggleSearchWrapper();
    menuFake();
    tabs();
    dropDownMenu();
    // headerActive();
    crollToDiv();
    crollTop();
    checkFullpage();
    toggleMenuMobile();
    category();
    InsertBd();
    phantrang();
    // tool();
    Showmap();
    clickMenu();
    //Nguyen
    clickSearch();
    // selectQh();
    clickChangLang();
    // End
    // serviceSlide();
    // productSlide();
    projectDetailSlide();
    scorllActive();
    // setTimeout(() => {
    //     let widthPa = $(".lab-main-2 .swiper-slide-active").outerWidth();
    //     // alert(widthPa);
    //     $(".lab-main-2 .swiper-pagination").css("width", widthPa);
    // }, 400);
    // openPopupCd();
    moveDetail();
    wrapTable();
    // clickFullImage();
    // New
    clickScrollTo();
    checkFooter();
    // checkBigItem();
    checkMargin();
    SlideHover();
});