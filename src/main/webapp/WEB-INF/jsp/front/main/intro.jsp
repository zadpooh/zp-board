<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="intro-page">
	<div class="bg bg1"></div>
	<div class="bg bg2"></div>
	<div class="bg bg3"></div>
	<div class="bg bg4"></div>

	<div class="nav">
		<div class="item seq1">
			<a href="#">
				<span class="ico"><span></span></span>
				<span class="tit">유튜브를<br> 노래하라</span>
			</a>
			<div class="intro-detail-view" style="display: none;">
				<button type="button" class="close">닫기</button>
				<div class="main">
					<div class="video-area"></div>
				</div>
			</div>
		</div>
		<div class="item seq2">
			<a href="#">
				<span class="ico"><span></span></span>
				<span class="tit">네 연주로<br> 노래하라</span>
			</a>
			<div class="intro-detail-view" style="display: none;">
				<button type="button" class="close">닫기</button>
				<div class="main">
					<div class="video-area"></div>
				</div>
			</div>
		</div>
		<br>
		<div class="item seq3">
			<a href="#">
				<span class="ico"><span></span></span>
				<span class="tit">네 멋대로<br> 노래하라</span>
			</a>
			<div class="intro-detail-view" style="display: none;">
				<button type="button" class="close">닫기</button>
				<div class="main">
					<div class="video-area"></div>
				</div>
			</div>
		</div>
		<div class="item seq4">
			<a href="#">
				<span class="ico"><span></span></span>
				<span class="tit">스타랑<br> 노래하라</span>
			</a>
			<div class="intro-detail-view" style="display: none;">
				<button type="button" class="close">닫기</button>
				<div class="main">
					<div class="video-area"></div>
				</div>
			</div>
		</div>
	</div>

	<a href="/main" class="skip">Skip</a>
</div>

<script>
$(function() {
	var $window = $(window);
	var $intro = $('.intro-page');
	var tabSize = 1079;
	var wSize;

	var resizeHandler = function() {
		wSize = $window.width();

		if(wSize <= tabSize) {
			$intro.removeAttr('data-seq').find('.nav .item').removeClass('on');
		}
	};

	resizeHandler();
	$window.on('resize', resizeHandler);

	$intro.find('.nav .item').on('mouseenter', function() {
		if(wSize > tabSize) {
			var i = $intro.find('.nav .item').index(this);
			$(this).addClass('on').siblings().removeClass('on');
			$intro.attr('data-seq', i+1);
		}
	}).on('mouseleave', function() {
		$(this).removeClass('on');
		$intro.removeAttr('data-seq');
	});


	/* 영상 팝업 data */
	var videoArr = [
		'<iframe src="https://www.youtube.com/embed/WFuXVOaQEOU?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>',
		'<iframe src="https://www.youtube.com/embed/BbxHiFltfwM?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>',
		'<iframe src="https://www.youtube.com/embed/p5xLfmhkyrs?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>',
		'<iframe src="https://www.youtube.com/embed/4UB9Q0htkxs?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>'
	];

	// 팝업 열기
	$intro.find('.nav .item > a').on('click', function(e) {
		var i = $intro.find('.nav .item').index($(this).closest('.item'));
		
		$(this).closest('.item').find('.intro-detail-view').show().find('.video-area').html(videoArr[i]);

		e.preventDefault();
	});

	// 팝업 닫기
	$('.intro-detail-view .close').on('click', function() {
		$(this).parent().find('.video-area').html('').end().hide();
	});
});
</script>
