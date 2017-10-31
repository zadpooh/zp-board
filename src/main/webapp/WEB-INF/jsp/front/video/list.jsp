<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>

<article class="common-page list-chart">
	<header class="common-page-title">
		<c:if test="${ videoParam.categoryCode == '001' }">
			<h2 class="title">ⓝ chart</h2>
			<p class="desc">이 공간은 Creator들이 음악영상 콘텐츠 (반주)를 생산하여 게시하는 공간입니다.</p>
		</c:if>
		<c:if test="${ videoParam.categoryCode == '002' }">
			<h2 class="title">Hot ⓝple</h2>
			<p class="desc">이 공간은 User들이 음악영상 콘텐츠를 활용하여 노래 부른 영상이 게시되는 공간입니다.</p>
		</c:if>
	</header>

	<div class="common-content">
		<ul class="block-tab-menu">
			<li ${videoParam.chartType == '' || videoParam.chartType == null || videoParam.chartType == 'hour' ? 'class="on"' : ''}><a href="?chartType=hour">실시간</a></li>
			<li ${videoParam.chartType == 'day' ? 'class="on"' : ''}><a href="?chartType=day">일간</a></li>
			<li ${videoParam.chartType == 'weekly' ? 'class="on"' : ''}><a href="?chartType=weekly">주간</a></li>
			<li ${videoParam.chartType == 'best' ? 'class="on"' : ''}><a href="?chartType=best">Best</a></li>
			<li ${videoParam.chartType == 'new' ? 'class="on"' : ''}><a href="?chartType=new">New</a></li>
		</ul>
		
		
		<div class="list-date">
			<c:if test="${videoParam.chartType == 'hour' || videoParam.chartType == 'day' || videoParam.chartType == 'weekly'}">
				<div class="wrap">
					<c:if test="${videoParam.chartType == 'hour'}">
						<c:if test="${videoParam.dateTime != '00'}">
							<a href="?chartType=${videoParam.chartType}&chartCount=${videoParam.chartCount - 1}" class="btn-arw prev">이전</a>
						</c:if>
						<strong class="date">${videoParam.dateDay} &nbsp; <span class="time">${videoParam.dateTime}:00</span></strong>
					</c:if>
					
					<c:if test="${videoParam.chartType == 'day'}">
						<a href="?chartType=${videoParam.chartType}&chartCount=${videoParam.chartCount - 1}" class="btn-arw prev">이전</a>
						<strong class="date">${videoParam.dateDay}</strong>
					</c:if>
					<c:if test="${videoParam.chartType == 'weekly'}">
						<a href="?chartType=${videoParam.chartType}&chartCount=${videoParam.chartCount - 1}" class="btn-arw prev">이전</a>
						<strong class="date">${videoParam.dateDay} ~ ${videoParam.dateDayWeekly}</strong>
					</c:if>	
					
					<c:if test="${videoParam.chartCount < 0}">
						<a href="?chartType=${videoParam.chartType}&chartCount=${videoParam.chartCount + 1}" class="btn-arw next">다음</a>
					</c:if>
				</div>
			</c:if>
		</div>
		
		<!-- 검색결과 없을 때 -->
		<c:if test="${fn:length(videoList) <= 0}">
			<p class="content-list-no">
				<strong>등록된 영상이 없습니다.</strong><br>
			</p>
		</c:if>
		
		<c:if test="${fn:length(videoList) > 0}">
			<table class="content-list">
				<caption>
					<strong>곡 목록 테이블</strong><br>
					순위, 곡 정보, 작성자, 원곡가수, 연주, 좋아요, 조회수, 담기, 공유 항목으로 구성
				</caption>
				<thead>
					<tr>
						<c:if test="${videoParam.chartType != 'new' }">
							<th scope="col" class="num">순위</th>
						</c:if>
						<th scope="col" class="title">곡 정보</th>
						<th scope="col" class="name">작성자</th>
						<th scope="col" class="original">원곡가수</th>
						<th scope="col" class="play">연주</th>
						<th scope="col" class="like">좋아요</th>
						<th scope="col" class="view">조회수</th>
						<th scope="col" class="put">담기</th>
						<th scope="col" class="share">공유</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${videoList}" var="list" varStatus="i">
						<tr>
							<c:if test="${videoParam.chartType != 'new' }">
								<td class="num">
									<c:if test="${ i.count +pagination.startRownum <= 3 }">
										<span class="rank-flag rank-${i.count +pagination.startRownum}">${i.count +pagination.startRownum}</span>
									</c:if>
									<c:if test="${ i.count +pagination.startRownum > 3 }">
										${i.count +pagination.startRownum}
									</c:if>
								</td>
							</c:if>
							<td class="title left-cell">
								<div class="ellipsis">
									<p class="thumb"><a href="/video/view/${list.videoId}"><img src="${list.imageUrl}" alt=""></a></p>
									<a href="/video/view/${list.videoId}" class="tit">${list.videoTitle}</a>
								</div>
							</td>
							<td class="name"><div class="ellipsis">${list.userNikNm}</div></td>
							<td class="original"><div class="ellipsis">${list.videoSinger}</div></td>
							<td class="play">${list.categorySubName }</td>
							<td class="like">${list.videoLike}</td>
							<td class="view">${list.cahrtHits}</td>
							<td class="put"><a href="javascript:void(0);" class="btn-list-put" data-video-id="${list.videoId}">담기</a></td>
							<td class="share"><a href="javascript:void(0);" class="btn-list-share shareBtn" data-video-title="${list.videoTitle}" data-clipboard-text="${serverDomain}/video/view/${list.videoId}">공유</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<c:if test="${ videoParam.chartType != 'new'}">
				<ul class="block-tab-menu rank-page">
					<li ${ videoParam.page == 1 || videoParam.page == 0 ? 'class="on"' : '' }><a href="?chartType=${videoParam.chartType}&chartCount=${videoParam.chartCount}&page=1">1 ~ 50위</a></li>
					<c:if test="${pagination.totalItems > 50}">
						<li ${ videoParam.page == 2 ? 'class="on"' : '' }><a href="?chartType=${videoParam.chartType}&chartCount=${videoParam.chartCount}&page=2">51 ~ 100위</a></li>
					</c:if>
				</ul>
			</c:if>
			<c:if test="${ videoParam.chartType == 'new'}">
				<page:pagination />
			</c:if>
		</c:if>
	</div>
</article>

<section id="popSnsShare" class="layer-share-pop" style="display: none;">
	<div class="layer-main">
		<header class="pop-header">
			<h4>공유하기</h4>
			<button type="button" class="close" onclick="$('#popSnsShare').hide();">닫기</button>
		</header>
		<div class="con-body">
			<ul class="share-list">
				<li><a href="javascript:;" class="snsShare" data-sns-type="twitter"><img src="/content/img/com/ico-share-twitter.png" alt="" class="i"><span class="t">트위터</span></a></li>
				<li><a href="javascript:;" class="snsShare" data-sns-type="facebook"><img src="/content/img/com/ico-share-facebook.png" alt="" class="i"><span class="t">페이스북</span></a></li>
				<li><a href="javascript:;" class="snsShare" data-sns-type="naver"><img src="/content/img/com/ico-share-naver.png" alt="" class="i"><span class="t">네이버</span></a></li>
				<li><a href="javascript:;" class="snsShare" data-sns-type="kakaostory"><img src="/content/img/com/ico-share-story.png" alt="" class="i"><span class="t">카카오스토리</span></a></li>
				<!-- <li><a href="javascript:;" class="snsShare" data-sns-type="kakaotalk"><img src="/content/img/com/ico-share-kakao.png" alt="" class="i"><span class="t">카카오톡</span></a></li>
				<li><a href="javascript:;" class="snsShare" data-sns-type="line"><img src="/content/img/com/ico-share-line.png" alt="" class="i"><span class="t">라인</span></a></li> -->
			</ul>
			<div class="url-copy">
				<input type="text" title="공유URL" class="url" id="url" value="" style="width: 100%;" />
			</div>
		</div>
	</div>
</section>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">
	var userId = '${userDetail.userId}';
	
	$(function(){
		
		$(".shareBtn").on("click", function(){
			showLayerPop('#popSnsShare');
			$("#url").val($(this).data("clipboard-text"));
			$("#url").data("video-title", $(this).data("video-title"));
			
		});
		
		$(".snsShare").on("click", function(){
			var snsLink = $("#url").val();
			sendSns($(this).data("sns-type"), snsLink, $("#url").data("video-title"));
		});
		
		
		function sendSns(sns, url, txt)
		{
		    var o;
		    var _url = encodeURIComponent(url);
		    var _txt = encodeURIComponent(txt);
		    var _br  = encodeURIComponent('\r\n');
		    
		    switch(sns)
		    {
		        case 'facebook':
		            o = {
		                method:'popup',
		                url:'https://www.facebook.com/dialog/share?app_id=265733453886721&display=popup&href=' + _url
		            };
		            break;
		 
		        case 'twitter':
		            o = {
		                method:'popup',
		                url:'http://twitter.com/intent/tweet?text=' + _txt + _br + '&url=' + _url
		            };
		            break;
		       case 'naver':
		            o = {
		                method:'popup',
 		                url:'http://blog.naver.com/openapi/share?url='+_url+'&title='+_txt
		            };
		            break;
		       case 'line':
		            o = {
		                method:'popup',
		                url:'http://line.me/R/msg/text/?'+_txt+'\n'+_url
		            };
		            break;
		       case 'kakaostory':
		            o = {
		                method:'function'
		            };
		            break;
		       case 'kakaotalk':
		            o = {
		                method:'function'
		            };
		            break;
		 
		        default:
		            alert('지원하지 않는 SNS입니다.');
		            return false;
		    }
			
		    switch(o.method)
		    {
				
		        case 'popup':
		        	Common.popup(o.url);
		            break;
		            
		        case 'function':
		        	try{
		        		
			        	Kakao.init('d6d4ece391111e69d6177b1882ce3089');
			        	
			        	if( sns == "kakaotalk" ){
			        		
				        	Kakao.Link.sendDefault({
				                objectType: 'feed',
				                content: {
				                  title: '딸기 치즈 케익',
				                  description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
				                  imageUrl: 'http://ninano.adn25.com:18000/content/img/main/index-top-bg.jpg',
				                  link: {
				                    mobileWebUrl: 'https://developers.kakao.com',
				                    webUrl: 'https://developers.kakao.com'
				                  }
				                },
				                buttons: [
				                  {
				                    title: '웹으로 보기',
				                    link: {
				                      mobileWebUrl: 'https://developers.kakao.com',
				                      webUrl: 'https://developers.kakao.com'
				                    }
				                  },
				                  {
				                    title: '앱으로 보기',
				                    link: {
				                      mobileWebUrl: 'https://developers.kakao.com',
				                      webUrl: 'https://developers.kakao.com'
				                    }
				                  }
				                ]
			              	});
			        	}
			        	
			        	if( sns == "kakaostory" ){
				        	Kakao.Story.share({
			        	        url: url ,
			        	        text: txt
			        	    }); 
			        	}
			        	
		        	} catch (err) {
		        		alert(err);
		        	}
		        	
		            break;
		            
		        
		    }

		}
		
// 		var clipboard = new Clipboard('.shareBtn');
		
// 		clipboard.on('success', function(e) {
// 			alert("주소가 복사 되었습니다.");
// 		    e.clearSelection();
// 		});
		
		$(".btn-list-put").on("click", function(){
			
			var data = {
				"userId" : userId ,
				"videoId" : $(this).data("video-id")
			};
			
			$.post("/video/add-cart", data, function(resp){
				
				if( resp == "ACT0002" ){
					alert("회원만 담기를 할 수 있습니다.");
					return false;
				}
				
				if( resp == "ACT0003" ){
					alert("이미 담기가 등록 되어있는 영상 입니다.");
					return false;
				}
				
				if( resp == "SUCCESS" ) {
					alert("영상 담기가 실행 되었습니다.");
				} else {
					alert("영상 담기중 오류가 발생했습니다.");
					console.log(resp);
				}
			});
		});
	});
</script>

