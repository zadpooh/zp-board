<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="adns"	uri="/WEB-INF/tlds/functions" %>

<link rel="image_src" href="${serverDomain}${videoDetail.imageUrl}" />
<meta name="description" content="${videoDetail.videoTitle} - ${videoDetail.videoSinger} ${videoDetail.videoContent}" /> 

<meta property="og:type" content="website">
<meta property="og:title" content="${videoDetail.videoTitle}">
<meta property="og:image" content="${serverDomain}${videoDetail.imageUrl}">
<meta property="og:description" content="${videoDetail.videoTitle} - ${videoDetail.videoSinger} ${videoDetail.videoContent}">


<article class="common-page detail-view">
	<header class="common-title">
		<h2 class="title">${videoDetail.videoTitle}</h2>
	</header>

	<div class="view-container">
		<div class="player-area">
			<div class="player-wrap">
				<iframe width="100%" height="100%" src="https://www.youtube.com/embed/${videoDetail.youtubeId}?autoplay=1" frameborder="0" allowfullscreen></iframe>
			</div>
		</div>

		<section class="detail-info">
			<header class="info-header">
				<h3 class="section-title">상세정보</h3>
				<p class="info">등록일 : ${videoDetail.registDe} &nbsp;/&nbsp; 조회수 : ${videoDetail.videoHits} &nbsp;/&nbsp; <span class="like-num">${videoDetail.videoLike }</span></p>
				<p class="author">
					<i class="ico-user inline" style="background-image: url('${videoDetail.userPhoto == null || videoDetail.userPhoto == '' ? '/content/img/com/ico-people.png' : videoDetail.userPhoto }');"></i>
					<span class="name">${videoDetail.userNikNm}</span>
				</p>
				
				<p class="action">
					<a href="javascript:void(0);" class="btn-like ${ myLike > 0 ? 'on' : '' }">좋아요</a>
					<a href="javascript:void(0);" class="btn-put">담기</a>
					<a href="javascript:void(0);" class="btn-share shareBtn">공유</a>
					<a href="javascript:void(0);" class="btn-comment" onclick="$('html,body').animate({scrollTop: $('.comment').offset().top - 70},300); return false;">댓글</a>
				</p>
				
			</header>
			<div class="content-txt">
				${videoDetail.videoTitle} - ${videoDetail.videoSinger} <br />
				${videoDetail.videoContent}
			</div>
		</section>

		<div class="side-area">
			<div class="related-list">
				<ul class="tab">
					<li><a href="#">작성자</a></li>
					<li><a href="#">같은 노래</a></li>
				</ul>
				<div class="tab-con">
					<h3 class="tab-title">작성자</h3>
					<ul class="small-content-list">
						<c:forEach items="${videoCreateUserList}" var="list">
							<li>
								<a href="/video/view/${list.videoId}">
									<p class="thumb"><img src="${list.imageUrl}" alt="${list.videoTitle}" /></p>
									<div class="info-box">
										<p class="title">${list.videoTitle}</p>
										<p class="info">
											작성자 : ${list.userNikNm}<br>
											조회수 : ${list.videoHits}
										</p>
									</div>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="tab-con">
					<h3 class="tab-title">같은 노래</h3>
					<ul class="small-content-list">
						<c:forEach items="${videoTitleList}" var="list">
							<li>
								<a href="/video/view/${list.videoId}">
									<p class="thumb"><img src="${list.imageUrl}" alt="${list.videoTitle}" /></p>
									<div class="info-box">
										<p class="title">${list.videoTitle}</p>
										<p class="info">
											작성자 : ${list.userNikNm}<br>
											조회수 : ${list.videoHits}
										</p>
									</div>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

		<script>
		// 탭메뉴 클릭
		$('.related-list .tab').on('click', 'a', function(e) {
			var $thisli = $(this).closest('li');
			var i = $thisli.index();

			$thisli.addClass('on').siblings().removeClass('on');
			$(e.delegateTarget).nextAll('.tab-con').hide().eq(i).show();

			e.preventDefault();
		}).find('a:eq(0)').trigger('click');
		</script>
	</div>

	<section class="comment">
		<header class="comment-header">
			<h3 class="section-title">
				댓글
				<span class="cnt">(총 <span class="num">${pagination.totalItems}</span>개)</span>
			</h3>
		</header>

		<form class="comment-frm" id="commentForm">
			<input name="videoId" type="hidden" value="${videoDetail.videoId}" />
			<fieldset>
				<legend>댓글 쓰기</legend>
				<i class="ico-user-big" style="background-image: url('${userInfo.userPhoto == null || userInfo.userPhoto == '' ? '/content/img/com/ico-people.png' : userInfo.userPhoto }');"></i>
				<label for="videoComment">댓글내용</label>
				<textarea name="videoComment" id="videoComment" cols="30" rows="10" class="txt-input" ${ userInfo == null ? 'disabled="disabled" placeholder="로그인 후 이용이 가능합니다."' : '' }></textarea>
				<button type="button" class="btn-submit" id="commentBtn">등록</button>
			</fieldset>
		</form>
		
		<!-- 댓글 없을 때 -->
		<c:if test="${pagination.totalItems <= 0 }">
			<ul class="comment-list">
				<li class="comment-no-list">
					첫 번째 댓글을 입력하고 응원해주세요.
				</li>
			</ul>
		</c:if>
		
		<c:if test="${pagination.totalItems > 0 }">
			<ul class="comment-list">
				<c:forEach items="${videoCommentList}" var="list">
					<li class="comment-item">
						<div class="info">
							<i class="ico-user inline" style="background-image: url('${adns:profileImage(list.userPhoto)}');"></i>
							<span class="name">${list.userNikNm }</span>
							<span class="info-txt">등록일 : ${list.registDe}</span>
						</div>
						<c:if test="${userInfo != null}">
							<div style="float: right;">
								<c:if test="${userInfo.userId == list.userId}">
									<a href="javascript:void(0);" class="btn commentEdit" data-video-comment-id="${list.videoCommentId}">수정</a>
									<a href="javascript:void(0);" class="btn commentDelete" data-video-comment-id="${list.videoCommentId}">삭제</a>
								</c:if>
								<c:if test="${userInfo.userId != list.userId}">
									<a href="javascript:void(0);" class="btn commentDeclaration" data-video-comment-id="${list.videoCommentId}">신고</a>
								</c:if>
							</div>
						</c:if>
						<div class="comment-txt">
							${adns:nl2br(list.videoComment)}
						</div>
					</li>
				</c:forEach>
			</ul>
		</c:if>
		
		<page:pagination />
		
	</section>
</article>

<article id="popComment" class="layer-pop pop-find-idpw" style="display: none;">
	<div class="layer-main" style="max-width: 1000px">
		<div class="con-body">
			<header class="pop-header">
				<button type="button" class="btn-layer-close">닫기</button>
			</header>
			<form class="comment-frm" id="commentEditForm">
				<fieldset>
					<legend>댓글 쓰기</legend>
					<i class="ico-user-big" style="background-image: url('${userInfo.userPhoto == null || userInfo.userPhoto == '' ? '/content/img/com/ico-people.png' : userInfo.userPhoto }');"></i>
					<label for="videoComment">댓글내용</label>
					<textarea name="videoComment" id="videoCommentEdit" cols="30" rows="10" class="txt-input" ${ userInfo == null ? 'disabled="disabled" placeholder="로그인 후 이용이 가능합니다."' : '' }></textarea>
					<button type="button" class="btn-submit" id="commentEditBtn">등록</button>
				</fieldset>
			</form>
		</div>
	</div>
</article>

<article id="popCommentDeclaration" class="layer-pop pop-find-idpw" style="display: none;">
	<div class="layer-main">
		<div class="con-body">
			<header class="pop-header">
				<button type="button" class="btn-layer-close">닫기</button>
			</header>
			<form class="comment-frm" id="commentDeclarationForm" style="padding: 10px;">
				<fieldset>
					<legend>댓글 쓰기</legend>
					<input type="radio" id="videoCommentDeclaration1" name="videoCommentDeclaration" value="1" />
					<label for="videoCommentDeclaration1" style="left:0; position: inherit;">욕설,음담패설</label> &nbsp;
					<input type="radio" id="videoCommentDeclaration2" name="videoCommentDeclaration" value="2" />
					<label for="videoCommentDeclaration2" style="left:0; position: inherit;">광고글</label> &nbsp;
					<input type="radio" id="videoCommentDeclaration3" name="videoCommentDeclaration" value="9" />
					<label for="videoCommentDeclaration3" style="left:0; position: inherit;">기타</label> &nbsp;
					<button type="button" class="btn" id="commentDeclarationBtn" style="background: #000; float: right;">등록</button>
				</fieldset>
			</form>
		</div>
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
				<input type="text" title="공유URL" class="url" id="url" value="${serverDomain}/video/view/${videoDetail.videoId}" style="width: 100%;" />
			</div>
		</div>
	</div>
</section>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

	var videoId = '${videoDetail.videoId}';
	var userId = '${userDetail.userId}';
	
	$(function(){
		
		/* var clipboard = new Clipboard('.shareBtn');
		
		clipboard.on('success', function(e) {
			alert("주소가 복사 되었습니다.");
		    e.clearSelection();
		}); */
		
		$(".btn-url-copy").on("click", function(){
			alert('a');
			document.execCommand("copy");
		});
		
		
		$(".shareBtn").on("click", function(){
			showLayerPop('#popSnsShare');
		});
		
		$(".snsShare").on("click", function(){
			var snsLink = $("#url").val();
			sendSns($(this).data("sns-type"), snsLink, '${videoDetail.videoTitle} - ${videoDetail.videoSinger} ');
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
		                url:'https://www.facebook.com/dialog/share?app_id=1127556197322772&display=popup&href=' + _url
		            };
		            break;
		 
		        case 'twitter':
		            o = {
		                method:'popup',
		                url:'http://twitter.com/intent/tweet?text=' + _txt + '&url=' + _url
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
		
		$("#videoComment").on("click, focusin", function(){
			if( userId == null ){ 
				alert("로그인 후 이용이 가능합니다.");
				return false;
			}
		});
		
		$("#commentBtn").on("click", function(){
			if( userId == null || userId == "" ){ 
				alert("로그인 후 이용이 가능합니다.");
				return false;
			}
			
			if( $("#videoComment").val() == "" ) {
				alert("내용을 입력 해주세요.");
				$("#videoComment").focus();
				return false;
			}
			
			if( userId != null ){
				
				var contentFlag = true;
				var getReturn;
				
				getReturn = $.get("/content/filter.json", "", function(resp){
					for( var i = 0; i < resp.length; i++ ){
						if( $("#videoComment").val().indexOf(resp[i]) > -1 ) {
							console.log(resp[i]);
							contentFlag = false;
						}
					}
				},'json');
				
				getReturn.done(function(){
					if( contentFlag ){
						
						var data = {
							"videoId" : videoId ,
							"userId" : userId ,
							"videoComment" : $("#videoComment").val()
						};
						
						$.post("/video/comment-create", data, function(resp){
							if( resp == "SUCCESS" ) {
								alert("댓글 등록이 완료 되었습니다.");
								location.reload();
							}
						});
						
					} else {
						alert("댓글 내용에 금칙어가 포함되어있습니다.");
					}
				});
				
			}
		});
		
		$("#commentEditBtn").on("click", function(){
			
			if( userId == null || userId == "" ){ 
				alert("로그인 후 이용이 가능합니다.");
				return false;
			}
			
			if( $("#videoCommentEdit").val() == "" ) {
				alert("내용을 입력 해주세요.");
				$("#videoComment").focus();
				return false;
			}
			
			if( userId != null ){
				
				var contentFlag = true;
				var getReturn;
				
				getReturn = $.get("/content/filter.json", "", function(resp){
					for( var i = 0; i < resp.length; i++ ){
						if( $("#videoCommentEdit").val().indexOf(resp[i]) > -1 ) {
							console.log(resp[i]);
							contentFlag = false;
						}
					}
				},'json');
				
				getReturn.done(function(){
					if( contentFlag ){
						
						var data = {
							"videoCommentId" : $("#commentEditForm").data("video-comment-id") ,
							"userId" : userId ,
							"videoComment" : $("#videoCommentEdit").val()
						};
						
						$.post("/video/comment-edit", data, function(resp){
							if( resp == "SUCCESS" ) {
								alert("댓글 수정이 완료 되었습니다.");
								location.reload();
							}
						});
						
					} else {
						alert("댓글 내용에 금칙어가 포함되어있습니다.");
					}
				});
				
			}
		});
		
		$(".btn-like").on("click", function(){
			
			var data = {
				"videoId" : videoId ,
				"userId" : userId 
			};
			
			if( $(this).attr("class").indexOf("on") > -1 ) {
				data["videoLikeType"] = "delete"; 
			} else {
				data["videoLikeType"] = "create";
			}
			
			$.post("/video/like", data, function(resp){
				
				if( resp == "LIK0001" ){
					alert("영상정보가 잘못 되었습니다.");
					return false;
				}
				
				if( resp == "LIK0002" ){
					alert("회원이 아닙니다. 로그인을 해주세요.");
					return false;
				}
				
				if( resp == "LIK0003" ){
					alert("이미 좋아요가 되어있습니다.");
					return false;
				}
				
				if( resp == "SUCCESS" ){
					if( data["videoLikeType"] == "create" ) {
						$(".like-num").text(Number($(".like-num").text()) + 1);
						$(".btn-like").addClass("on");
					} else {
						$(".like-num").text(Number($(".like-num").text()) - 1);
						$(".btn-like").removeClass("on");
					}
				}
			});
		});
		
		$(".btn-put").on("click", function(){
			
			var data = {
				"userId" : userId ,
				"videoId" : videoId
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
				}
			});
		});
		
		$(".commentDeclaration").on("click", function(){
			showLayerPop('#popCommentDeclaration');
			$("#commentDeclarationForm").data("video-comment-id", $(this).data("video-comment-id"));
		});
		
		$("#commentDeclarationBtn").on("click", function(){
			if(confirm("해당 댓글을 신고 하시겠습니까?")){
				
				var data = {
					"videoCommentId" : $("#commentDeclarationForm").data("video-comment-id") ,
					"userId" : userId ,
					"declarationType" : $("input[name=videoCommentDeclaration]:checked").val()
				};
				
				$.post("/video/comment-declaration", data, function(resp){
					if( resp == "ACT0001" ){
						alert("회원만 담기를 할 수 있습니다.");
						return false;
					}
					
					if( resp == "ACT0002" ){
						alert("데이터 정보가 잘못 되었습니다.");
						return false;
					}
					
					if( resp == "SUCCESS" ) {
						alert("댓글 신고하기가 완료 되었습니다.");
						location.reload();
					} else {
						alert("댓글 신고하기중 오류가 발생했습니다.");
						console.log(resp);
					}
				});
				
				
			}
		});
		
		$(".commentDelete").on("click", function(){
			if(confirm("삭제 하시겠습니까?")) {
				var data = {
					"videoCommentId" : $(this).data("video-comment-id")
				}
				
				$.post("/adnsmanager/comment/delete" ,data ,function(resp){
					if( resp == "SUCCESS" ) {
						alert("삭제가 완료 되었습니다.");
						location.reload();
					}
				});
			}
		});
		
		$(".commentEdit").on("click", function(){
			var index = $(".commentEdit").index(this);
			showLayerPop('#popComment');
			$("#commentEditForm").data("video-comment-id", $(this).data("video-comment-id"));
			$("#videoCommentEdit").val($(".comment-txt").eq(index).html().trim().replace(/<br>/g,"\n"));
		});
	
	});
	
</script>
