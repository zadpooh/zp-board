<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>

<article class="common-page my-page">
	<header class="common-page-title">
		<h2 class="title">My Page</h2>
		<p class="desc">누구나 참여하여 함께 만들어 가는 오픈형 뮤직 플랫폼 서비스</p>
	</header>

	<div class="common-content">
		<div class="profile-box">
			<div class="info">
				<i class="ico-user-big2 avatar" style="background-image: url('${userInfo.userPhoto == '' || userInfo.userPhoto == null ? '/content/img/com/ico-people.png' : userInfo.userPhoto}');"></i>
				<p class="nickname">${userInfo.userNikNm}</p>
				<p class="email">${userInfo.userId}</p>
				<p class="greeting">${userInfo.userGreeting}</p>
			</div>
			
			<div class="stat">
				<ul class="stat-list">
					<%-- <li>
						<a href="/user/my-list"><strong>${cartCount}</strong><br>포스팅</a> 
					</li> --%>
					<!-- <li>
						<a href="#" onclick="showLayerPop('#popFollowing'); return false;"><strong>9</strong><br>팔로잉</a>
					</li>
					<li>
						<a href="#" onclick="showLayerPop('#popFollowers'); return false;"><strong>21</strong><br>팔로워</a>
					</li> -->
				</ul>
				
				<a href="/user/mypage" class="btn-action">
					<i class="edit"></i> Edit
				</a>
			</div>
		</div>
		
		<ul class="block-tab-menu" style="margin-bottom: 28px;">
			<li class="on"><a href="/user/profile">업로드 리스트</a></li>
			<li><a href="/user/my-list">포스팅 리스트</a></li>
		</ul>
		
		<c:if test="${fn:length(videoMyList) <= 0}">
			<p class="content-list-no">
				<strong>등록된 영상이 없습니다.</strong><br>
			</p>
		</c:if>
		
		<c:if test="${fn:length(videoMyList) > 0}">
			<table class="content-list my-profile-list">
				<caption>
					<strong>곡 목록 테이블</strong><br>
					곡 정보, 뽐내기, 작성자, 원곡가수, 연주, 좋아요, 조회수, 수정, 삭제, 공유 항목으로 구성
				</caption>
				<thead>
					<tr>
						<th scope="col" class="title">곡 정보</th>
						<th scope="col" class="name">작성자</th>
						<th scope="col" class="original">원곡가수</th>
						<th scope="col" class="play">연주</th>
						<th scope="col" class="like">좋아요</th>
						<th scope="col" class="view">조회수</th>
						<th scope="col" class="edit">수정</th>
						<th scope="col" class="del">삭제</th>
						<th scope="col" class="share">공유</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${videoMyList}" var="list">
						<tr ${ list.videoState != '2' ? 'class="wait"' : '' } >
							<td class="title left-cell">
								<div class="ellipsis">
									<p class="thumb"><a href="javascript:void(0);" data-href="/video/view/${list.videoId}" data-state="${list.videoState}" class="stateLink"><img src="${list.imageUrl}" alt=""></a></p>
									<a href="javascript:void(0);" data-href="/video/view/${list.videoId}" data-state="${list.videoState}" class="stateLink tit">
										<c:if test="${list.videoState == '0' || list.videoState == '1'}">
											[검수중]
										</c:if>
										<c:if test="${list.videoState == '3'}">
											[반려]
										</c:if>
										${list.videoTitle}
									</a>
								</div>
							</td>
							<td class="name"><div class="ellipsis">${list.userNikNm}</div></td>
							<td class="original"><div class="ellipsis">${list.videoSinger}</div></td>
							<td class="play">${list.categorySubName }</td>
							<td class="like">${list.videoLike}</td>
							<td class="view">${list.videoHits}</td>
							<td class="edit"><a href="javascript:void(0);" data-href="/video/upload-edit/${list.videoId}" data-state="${list.videoState}" class="stateLink btn-list-edit">수정</a></td>
							<td class="del"><a href="javascript:void(0);" class="btn-list-del" data-video-id="${list.videoId}" data-state="${list.videoState}">삭제</a></td>
							<td class="share"><a href="javascript:void(0);" class="btn-list-share shareBtn" data-state="${list.videoState}" data-video-title="${list.videoTitle}" data-clipboard-text="${serverDomain}/video/view/${list.videoId}">공유</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<page:pagination />
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

<script type="text/javascript">
	$(function(){
		
		$(".stateLink").on("click", function(){
			var href = $(this).data("href");
			var state = $(this).data("state");
			if( state == "2" ){
				location.href=href;
			}else if(state == "3") {
				alert("반려 되었습니다.\n반려시 삭제만 가능합니다.\n반려사유는 이메일로 발송 되었습니다.");
			}else {
				alert("검수중 입니다.");
			}
		});
		/* var clipboard = new Clipboard('.shareBtn');
		
		clipboard.on('success', function(e) {
			alert("주소가 복사 되었습니다.");
		    e.clearSelection();
		}); */
		

		$(".shareBtn").on("click", function(){
			var state = $(this).data("state");
			if( state == "2" ){
				showLayerPop('#popSnsShare');
				$("#url").val($(this).data("clipboard-text"));
				$("#url").data("video-title", $(this).data("video-title"));
			}else if(state == "3") {
				alert("반려 되었습니다.\n반려시 삭제만 가능합니다.\n반려사유는 이메일로 발송 되었습니다.");
			}else {
				alert("검수중 입니다.");
			}
			
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
		
		$(".btn-list-del").on("click", function(){
			var state = $(this).data("state");
			if( state == "2" ){
				if(confirm("영상을 삭제 하시겠습니까?")){
					var data = { 
						"videoId" : $(this).data("video-id")
					}
					
					$.post("/video/upload/delete", data, function(resp){
						if( resp == "FUP9999" ){
		            		alert("영상  삭제중 오류가 발생 되었습니다.");
		            	}
		            	
		            	if( resp == "SUCCESS" ){
		            		alert("영상 삭제가 완료 되었습니다.");
		            		location.href="/user/profile";
		            	}
					});
				}
			} else if( state == "3") {
				var data = { 
						"videoId" : $(this).data("video-id")
					}
					
					$.post("/video/upload/real-delete", data, function(resp){
						if( resp == "FUP9999" ){
		            		alert("영상  삭제중 오류가 발생 되었습니다.");
		            	}
		            	
		            	if( resp == "SUCCESS" ){
		            		alert("영상 삭제가 완료 되었습니다.");
		            		location.href="/user/profile";
		            	}
					});
			} else {
				alert("검수중 입니다.");
			}
		});
	});
</script>

