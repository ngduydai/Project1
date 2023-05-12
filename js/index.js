/*slider*/


var swiper = new Swiper('.section_slider .swiper-main', {
	pagination: {
		el: '.section_slider .swiper-pagination',
		clickable: true,
	},
	slidesPerView: 1,
	centeredSlides: false,
	loop: false,
	grabCursor: true,
	spaceBetween: 0,
	roundLengths: true,
	slideToClickedSlide: false,
	autoplay: {
		delay: 4000,
		disableOnInteraction: false
	}
});

$(".not-dqtab").each(function (e) {
	/*khai báo khởi tạo ban đầu cho 2 kiểu tab*/
	var $this1 = $(this);
	var $this2 = $(this);
	var datasection = $this1.closest('.not-dqtab').attr('data-section');
	$this1.find('.tabs-title:first-child').addClass('current');
	$this1.find('.tab-content').first().addClass('current');

	$this1.find('.tabtitle1.ajax').click(function () {
		var $this2 = $(this),
			tab_id = $this2.attr('data-tab'),
			url = $this2.attr('data-url');
		var etabs = $this2.closest('.e-tabs');
		etabs.find('.tab-viewall').attr('href', url);
		etabs.find('.tabs-title').removeClass('current');
		etabs.find('.tab-content').removeClass('current');
		$this2.addClass('current');
		etabs.find("." + tab_id).addClass('current');
		var active = $(this);
		var left = active.position().left;
		var currScroll = $(this).parent('.nav-tab').scrollLeft();
		var contWidth = $(this).parent('.nav-tab').width() / 2;
		var activeOuterWidth = active.outerWidth() / 2;
		left = left + currScroll - contWidth + activeOuterWidth;

		$(this).parent('.nav-tab').animate({
			scrollLeft: left
		}, 'slow');

		//Nếu đã load rồi thì không load nữa
		if (!$this2.hasClass('has-content')) {
			$this2.addClass('has-content');
			getContentTab(url, "." + datasection + " ." + tab_id);
			$(window).on('load resize', function () {
				resizeImage();
			});
		}
		resizeImage();
	});

});


// mobile tab



// Get content cho tab
function getContentTab(url, selector) {
	url = url + "?view=tabload";
	var loading = '<div class="text-center">Đang tải dữ liệu...</div>';
	var fill = $(selector);
	$.ajax({
		type: 'GET',
		url: url,
		beforeSend: function () {
			fill.find('.contentfill').html(loading);
		},
		success: function (data) {
			var content = $(data);
			setTimeout(function () {
				fill.find('.contentfill').html(content.html());
				setTimeout(function () {
					$(selector + ' .swiper-nth').each(function () {
						var swipertab = new Swiper('.swiper-nth', {
							slidesPerView: 3,
							//centeredSlides: true,
							loop: false,
							grabCursor: true,
							spaceBetween: 10,
							roundLengths: true,
							observer: true,
							observeParents: true,
							parallax: true,
							slideToClickedSlide: false,
							navigation: {
								nextEl: '.swiper-nth .swiper-button-next',
								prevEl: '.swiper-nth .swiper-button-prev',
							},
							autoplay: false,
							breakpoints: {
								300: {
									slidesPerView: 2.10,
									spaceBetween: 10
								},
								500: {
									slidesPerView: 2.25,
									spaceBetween: 10
								},
								640: {
									slidesPerView: 2.25,
									spaceBetween: 10
								},
								768: {
									slidesPerView: 2.25,
									spaceBetween: 10
								},
								991: {
									slidesPerView: 2.25,
									spaceBetween: 10
								},
								1024: {
									slidesPerView: 2,
									spaceBetween: 10
								},
								1199: {
									slidesPerView: 3,
									spaceBetween: 10
								}
							}
						});
					});
				}, 500);
				$(selector + ' .add_to_cart').click(function (e) {
					e.preventDefault();
					var $this = $(this);
					var form = $this.parents('form');
					$.ajax({
						type: 'POST',
						url: '/cart/add.js',
						async: false,
						data: form.serialize(),
						dataType: 'json',
						beforeSend: function () { },
						success: function (line_item) {
							$('.cart-popup-name').html(line_item.title).attr('href', line_item.url, 'title', line_item.title);
							ajaxCart.load();
							$('#popup-cart-desktops, .cart-sidebar, .backdrop__body-backdrop___1rvky').addClass('active');
						},
						cache: false
					});
				});
				awe_lazyloadImage();

			}, 300);
		},
		dataType: "html"
	});
}


var swipertab = new Swiper('.swiper-first', {
	slidesPerView: 3,
	//centeredSlides: true,
	loop: false,
	grabCursor: true,
	spaceBetween: 10,
	roundLengths: true,
	slideToClickedSlide: false,
	navigation: {
		nextEl: '.swiper-first .swiper-button-next',
		prevEl: '.swiper-first .swiper-button-prev',
	},
	autoplay: false,
	breakpoints: {
		300: {
			slidesPerView: 2.10,
			spaceBetween: 10
		},
		500: {
			slidesPerView: 2.25,
			spaceBetween: 10
		},
		640: {
			slidesPerView: 2.25,
			spaceBetween: 10
		},
		768: {
			slidesPerView: 2.25,
			spaceBetween: 10
		},
		991: {
			slidesPerView: 2.25,
			spaceBetween: 10
		},
		1024: {
			slidesPerView: 2,
			spaceBetween: 10
		},
		1199: {
			slidesPerView: 3,
			spaceBetween: 10
		}
	}
});

/*cate*/

var swipercate = new Swiper('.cate-list .swiper-container', {
	slidesPerView: 9.5,
	//centeredSlides: true,
	loop: false,
	grabCursor: true,
	spaceBetween: 5,
	roundLengths: true,
	slideToClickedSlide: false,
	navigation: {
		nextEl: '.cate-list .swiper-button-next',
		prevEl: '.cate-list .swiper-button-prev',
	},
	autoplay: false,
	breakpoints: {
		300: {
			slidesPerView: 4.2,
			spaceBetween: 5
		},
		375: {
			slidesPerView: 4.5,
			spaceBetween: 5
		},
		500: {
			slidesPerView: 4.5,
			spaceBetween: 5
		},
		640: {
			slidesPerView: 5.5,
			spaceBetween: 5
		},
		768: {
			slidesPerView: 8.5,
			spaceBetween: 5
		},
		992: {
			slidesPerView: 9.5,
			spaceBetween: 5
		}
	}
});


/*fashion*/
var swiperwish = new Swiper('.swiper-banner', {
	slidesPerView: 1,
	//centeredSlides: true,
	loop: false,
	grabCursor: true,
	spaceBetween: 7,
	roundLengths: true,
	slideToClickedSlide: false,
	autoplay: true,
	pagination: {
		el: '.swiper-banner .swiper-pagination',
		clickable: true,
	},
	breakpoints: {
		300: {
			slidesPerView: 1.3,
			spaceBetween: 7
		},
		500: {
			slidesPerView: 1.3,
			spaceBetween: 7
		},
		640: {
			slidesPerView: 1.4,
			spaceBetween: 7
		},
		768: {
			slidesPerView: 1.75,
			spaceBetween: 7
		},
		992: {
			slidesPerView: 1,
			spaceBetween: 7
		}
	}
});

/*wish*/
var swiperwish = new Swiper('.swiper-iwish', {
	slidesPerView: 4.5,
	//centeredSlides: true,
	loop: false,
	grabCursor: true,
	spaceBetween: 10,
	roundLengths: true,
	slideToClickedSlide: false,
	navigation: {
		nextEl: '.slide-iwish .swiper-button-next',
		prevEl: '.slide-iwish .swiper-button-prev',
	},
	autoplay: false,
	breakpoints: {
		300: {
			slidesPerView: 2.05,
			spaceBetween: 0
		},
		500: {
			slidesPerView: 2.05,
			spaceBetween: 0
		},
		640: {
			slidesPerView: 3,
			spaceBetween: 10
		},
		768: {
			slidesPerView: 4,
			spaceBetween: 10
		},
		1200: {
			slidesPerView: 4.5,
			spaceBetween: 10
		}
	}
});
/*service*/
var swiperService = new Swiper('.swiper-service', {
	slidesPerView: 4,
	//centeredSlides: true,
	loop: false,
	grabCursor: true,
	spaceBetween: 15,
	roundLengths: true,
	slideToClickedSlide: false,
	navigation: {
		nextEl: '.slide-service .swiper-button-next',
		prevEl: '.slide-service .swiper-button-prev',
	},
	autoplay: true,
	breakpoints: {
		300: {
			slidesPerView: 1,
			spaceBetween: 10
		},
		500: {
			slidesPerView: 1,
			spaceBetween: 10
		},
		768: {
			slidesPerView: 2,
			spaceBetween: 30
		},
		991: {
			slidesPerView: 3,
			spaceBetween: 30
		},
		1200: {
			slidesPerView: 4,
			spaceBetween: 10
		}
	}
});

if (window.location.href.includes('?section-blog')) {
	$('html, body').animate({
		scrollTop: $('.section_blog').offset().top
	}, 500);
}
setTimeout(function () {
	$('.cate-list .swiper-container.swiper-container-initialized').closest('.cate-list').addClass('loaded');
}, 600);