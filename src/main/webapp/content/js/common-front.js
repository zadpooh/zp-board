/**
 * 공통 UI
 */
'use strict';

// 레이어 열기
function showLayerPop(selector) {
	$(selector).eq(0).show();
}

// 레이어 닫기
function hideLayerPop() {
	$('.layer-pop').hide();
}

// 브라우저 체크
(function() {
	var thisBrowser = navigator.userAgent.toLowerCase();
	var $html = $('html');

	// IE9 체크
	if(thisBrowser.indexOf("msie 9") > -1) {
		$html.addClass("IE9");
	}
	// firefox 체크
	if(thisBrowser.indexOf("firefox") > -1) {
		$html.addClass("FF");
	}
	// noIE 클래스 추가
	if(thisBrowser.indexOf('msie') < 0 && thisBrowser.indexOf('trident') < 0) {
		$html.addClass('noIE');
	}
})();

// IE9에서 placeholder 처리
$(function() {
	if(navigator.userAgent.indexOf('MSIE 9') > -1) {
		$("input[placeholder]").each(function () {
			var $this = $(this);
			if($this.val() === ""){
				$this.val($this.attr("placeholder")).focus(function(){
					if($this.val() === $this.attr("placeholder")) {
						$this.val("");
					}
				}).blur(function(){
					if($this.val() === "") {
						$this.val($this.attr("placeholder"));
					}
				});
			}
   		});
	}
});

// DOM Ready
$(function() {
	var $window = $(window);
	var $body = $('body');
	var $wrapper = $('.wrapper');
	var $srchForm = $('.srch-frm');

	// 헤더 메뉴 토글
	$('.header-nav-toggle').on('click', function() {
		$wrapper.removeClass('srch-open').toggleClass('menu-open');
	});

	// 헤더 검색 토글
	$('.header-srch-toggle').on('click', function() {
		$wrapper.removeClass('menu-open').toggleClass('srch-open');
	});

	// 헤더 메뉴, 검색 닫기 - 헤더 외부 클릭
	$body.on('touchend click', function(e) {
		if($(e.target).closest('.common-header').length === 0) {
			$wrapper.removeClass('menu-open').removeClass('srch-open');
		}
	});

	// 유틸영역 검색 토글
	$('.common-util .srch-toggle').on('click', function() {
		$wrapper.toggleClass('util-srch-open');
	});

	// 댓글 영역 클릭시 등록버튼 오픈(모바일에서만)
	$('.comment-frm .txt-input').on('focusin', function() {
		$(this).closest('.comment-frm').addClass('is-focus');
	});

	// 레이어 닫기
	$body.on('click', '.btn-layer-close', hideLayerPop);

	// 레이어 닫기 - 레이어 외부 클릭
	$body.on('touchend click', function(e) {
		if($(e.target).hasClass('layer-pop')) {
			hideLayerPop();
		}
	});
});