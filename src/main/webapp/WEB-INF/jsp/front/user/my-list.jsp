<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<article class="common-page list-my">
	<header class="common-page-title">
		<h2 class="title">My List</h2>
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
			<li><a href="/user/profile">업로드 리스트</a></li>
			<li class="on"><a href="/user/my-list">포스팅 리스트</a></li>
		</ul>
		
		<c:if test="${fn:length(videoCartList) <= 0}">
			<p class="content-list-no">
				<strong>등록된 영상이 없습니다.</strong><br>
			</p>
		</c:if>
		
		<c:if test="${fn:length(videoCartList) > 0}">
			<table class="content-list my-list">
				<caption>
					<strong>곡 목록 테이블</strong><br>
					곡 정보, 작성자, 원곡가수, 연주, 좋아요, 조회수, 삭제, 공유 항목으로 구성
				</caption>
				<thead>
					<tr>
						<th scope="col" class="title">곡 정보</th>
						<th scope="col" class="name">작성자</th>
						<th scope="col" class="original">원곡가수</th>
						<th scope="col" class="play">연주</th>
						<th scope="col" class="like">좋아요</th>
						<th scope="col" class="view">조회수</th>
						<th scope="col" class="del">삭제</th>
						<th scope="col" class="share">공유</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${videoCartList}" var="list">
						<tr>
							<td class="title left-cell">
								<div class="ellipsis">
									<p class="thumb"><a href="/video/view/${list.videoId}"><img src="${list.imageUrl}" alt=""></a></p>
									<a href="/video/view/${list.videoId}" class="tit">${list.videoTitle}</a>
								</div>
							</td>
							<td class="name"><div class="ellipsis">${list.userNikNm}</div></td>
							<td class="original"><div class="ellipsis">${list.videoSinger}</div></td>
							<td class="play">${list.categorySubName}</td>
							<td class="like">${list.videoLike}</td>
							<td class="view">${list.videoHits}</td>
							<td class="del"><a href="javascript:void(0);" data-video-cart-id="${list.videoCartId}" class="btn-list-del">삭제</a></td>
							<td class="share"><a href="javascript:void(0);" class="btn-list-share shareBtn" data-clipboard-text="${serverDomain}/video/view/${list.videoId}">공유</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<page:pagination />
		</c:if>		
	</div>
</article>

<script type="text/javascript">
	$(function(){
		var clipboard = new Clipboard('.shareBtn');
		
		clipboard.on('success', function(e) {
			alert("주소가 복사 되었습니다.");
		    e.clearSelection();
		});
		
		$(".btn-list-del").on("click", function(){
			if(confirm("삭제 하시겠습니까?")){
				var videoCartId =$(this).data("video-cart-id");
				$.post("/user/my-list/delete", "videoCartId="+videoCartId, function(resp){
					
					if( resp == "MYV9999" ){
						alert("삭제중 오류가 발생했습니다.");
						return false;
					}
					
					if( resp == "SUCCESS" ){
						alert("삭제가 완료 되었습니다.");
						location.reload();
					}
				});
			}
		});
	});
</script>