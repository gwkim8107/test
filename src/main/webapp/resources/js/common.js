(function($) {
	$(document).on('click', '.btn_open', function () {
		if ($(this).hasClass('on')) {
			$(this).parents('.form_replay_search').find('.form_box').css({'display': 'none'});
			$(this).removeClass('on');
		} else {
			$(this).parents('.form_replay_search').find('.form_box').css({'display': 'block'});
			$(this).addClass('on');
		}
	});

	$(document).on('click', '.btn_s_cansel1', function () {
		if (!( $(this).hasClass('active'))) {
			$(this).parents('.tbl_item').find('.cansel_alim').css({'display': 'block'});
			$(this).addClass('active');
		}
	});
	$(document).on('click', '.cansel_alim .close', function () {
		$(this).parents('.tbl_item').find('.cansel_alim').css({'display': 'none'});
		$(this).parents('.tbl_item').find('.btn_s_cansel1').removeClass('active');
	});

	$(document).ready(function () {
		var layer1 = $('.layer_ty1');
		var layer2 = $('.layer_ty2');
		var layer3 = $('.layer_ty3');
		var layer4 = $('.layer_ty4');
		var re_search = $('.replay_search');

		// Show Hide
		$('.layer_rm').click(function () {
			var $this = $('.layer_rm');
			if ($this.hasClass("open")) {
				$this.removeClass("open");
				layer1.hide();
			} else {
				$this.addClass("open");
				layer1.show();
			}
		});
		$('.layer_ty1 .close').click(function () {
			layer1.removeClass('open');
			layer1.hide();
		});

		$('.layer_nmber').click(function () {
			var $this = $('.layer_nmber');
			if (!($this.hasClass("open"))) {
				$this.addClass("open");
				layer2.show();
			}
		});
		$('.layer_ty2 .close').click(function () {
			layer2.parents('.form_box').find('.layer_nmber').removeClass('open');
			layer2.parents('.form_box_ty1').find('.layer_nmber').removeClass('open');
			layer2.hide();
		});

		$('.replay_search').on('click', function () {
			var $this = $('.replay_search');

			if ($this.hasClass("open")) {
				$this.removeClass("open");
				layer3.hide();
			} else {
				$this.addClass("open");
				layer3.show();
			}
		});
		$('.layer_ty3 .close').click(function () {
			if (re_search.hasClass("open")) {
				re_search.removeClass("open");
				layer3.hide();
			}
		});

		$('.btn_surely').on('click', function () {
			var $this = $('.btn_surely');
			if (!($this.hasClass("open"))) {
				$this.addClass("open");
				layer4.show();
			}
		});
		$('.layer_ty4 .close').click(function () {
			layer4.parents('.form_box_ty1').find('.m_hide_ico_btn > button').removeClass('open');
			layer4.hide();
		});
	});

// tab dropdown
	$(document).ready(function () {
		// tab 인스턴스 생성
		var tab = new TabMenu(".tab_search");
	});

	function TabMenu(selector) {
		this.$tabMenu = null;
		this.$menuItems = null;
		this.$selectMenuItem = null;
		this.$textLink = null;

		this.init(selector);
		this.initEvent();
	};

// 요소 초기화
	TabMenu.prototype.init = function (selelctor) {
		this.$tabMenu = $(selelctor);
		this.$menuItems = this.$tabMenu.find("li>a");
		this.$textLink = this.$menuItems.next(".tab_search_cnt").find(">li > a");
	};

// 이벤트 등록
	TabMenu.prototype.initEvent = function () {
		var objThis = this;
		var data;
		this.$menuItems.on("click", function () {
			objThis.setSelectItem($(this));
			data = $(this);
		});

		this.$textLink.on("click", function () {
			var newTxt = $(this).text();
			$(this).closest(".tab_search_cnt").siblings(".tit").text(newTxt);

			if (this.$selectMenuItem) {
				this.$selectMenuItem.parent().removeClass("on");
			}

		});
	};

// $menuItem에 해당하는 메뉴 아이템 선택하기
	TabMenu.prototype.setSelectItem = function ($menuItem) {
		// 기존 선택메뉴 아이템을 비활성화 처리 하기
		var $this = this;
		if (this.$selectMenuItem) {
			this.$selectMenuItem.parent().removeClass("on");
		}
		$this.$textLink.text();
		// 신규 아이템 활성화 처리 하기
		this.$selectMenuItem = $menuItem;
		this.$selectMenuItem.parent().addClass("on");
		//this.textLink.eq(index).text( $(e.currentTarget).text() )
	};

// tab + content
	$(".tab_sub > ul > li").click(function () {
		$(".tab_sub > ul > li").removeClass("on");

		$(this).addClass("on");
		$(this).parent('ul').siblings('.tab_cnt').hide();

		//$(".tab_cnt").hide();
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).show()
	});

// 약관
	$(".tab_cla a").click(function () {
		$(".tab_cla a").removeClass("on");

		$(this).addClass("on");
		$(this).parents('.tbl_wrap').find('.tab_hide').hide();

		//$(".tab_cnt").hide();
		var activeTab = $(this).attr("rel");
		$('#' + activeTab).show()
	});
// 공통
	$(".tab_comm > ul > li").click(function () {
		$(".tab_comm > ul > li").removeClass("on");

		$(this).addClass("on");
		$(this).parents('.tbl_wrap').find('.tab_hide').hide();

		//$(".tab_cnt").hide();
		var activeTab = $(this).attr("href");
		$(activeTab).show()
	});

// 모바일 TAB
	$(".tab_menu > h3 > a").click(function () {
		$(".tab_menu > h3 > a").removeClass("on");

		$(this).addClass("on");
		$(this).parents('.tab_move_cnt').find('.m_cnt').hide();

		var activeTab = $(this).attr("rel");
		$("#" + activeTab).show();
	});

// TAB SCROLL
	$(function () {
		var menu = $('.tab_move > ul > li');
		var contents = $('.tab_move_cnt > div');

		menu.click(function (event) {
			event.preventDefault();
			0
			var tg = $(this);
			var i = tg.index();

			var section = contents.eq(i);
			var tt = section.offset().top - 70;

			$('html, body').stop().animate({scrollTop: tt});
		});

		$(window).scroll(function () {
			var sct = $(this).scrollTop();
			//var m1ove = $('.tab_move').offset().top;
			//console.log(move)

			$('div.tab_move').css('position', 'relative');
			if (sct > 600) {
				$('div.tab_move').css('position', 'fixed').css('top', '0').css('z-index', '500').css('margin-top', '0').css('background', '#fff');
			} else {
				$('div.tab_move').css('position', 'relative').css('top', '0').css('z-index', '500').css('margin-top', '60px').css('background', '#fff');
			}

			contents.each(function () {
				var tg = $(this);
				var i = tg.index();
				if (tg.offset().top - 70 <= sct) {
					menu.removeClass('on');
					menu.eq(i).addClass('on');
				}
			});
		});
	});
// ROLLING
	$(document).ready(function () {

		var slider = $('.bxslider').bxSlider({
			pagerCustom: '#bx-pager',

		});
		var slider1 = $('#bx-pager').bxSlider({
			slideWidth: 110,
			slideMargin: 10,
			moveSlides: 1,
			minSlides: 4,
			maxSlides: 4,      // 최소 노출 개수
			pager: false,
			controls: true,
			infiniteLoop: false,
			hideControlOnEnd: true

		});

		$('a.bx-prev').click(function () {
			var current = slider.getCurrentSlide();
			var current1 = slider1.getCurrentSlide();
			slider.goToPrevSlide(current) - 1;
			slider1.goToPrevSlide(current1) - 1;
		});
		$('a.bx-next').click(function () {
			var current = slider.getCurrentSlide();
			var current1 = slider1.getCurrentSlide();
			slider.goToNextSlide(current) + 1;
			slider1.goToNextSlide(current1) + 1;
		});

		$('#bx-pager > li > a').click(function () {
			var thumbIndex = $('#bx-pager > li > a').index(this);
			slider.goToSlide(thumbIndex);

			$('#bx-pager > li > a').removeClass('active');
			$(this).addClass('active');
			return false;
		});

		$('#bx-pager a:first').addClass('active');

	});

})(jQuery);