<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>

<article class="common-page new-release-list">
	<header class="common-page-title">
		<h2 class="title">Search Result</h2>
		<p class="desc">누구나 참여하여 함께 만들어 가는 오픈형 뮤직 플랫폼 서비스</p>
	</header>

	<div class="common-content">

		<div class="srch-result-txt">
			<strong>‘${videoParam.videoQuery}’</strong> 검색결과 (<span>${pagination.totalItems}</span>)
		</div>

		<!-- 검색결과 없을 때 -->
		<c:if test="${ pagination.totalItems <= 0 }">
			<p class="content-list-no">
				<strong>검색된 영상이 없습니다.</strong><br>
				단어의 철자가 정확한지 확인해 보세요.
			</p>
		</c:if>
		<c:if test="${ pagination.totalItems > 0 }">
			<table class="content-list srch-list">
				<caption>
					<strong>곡 목록 테이블</strong><br>
					곡 정보, 작성자, 원곡가수, 연주, 좋아요, 조회수, 담기, 공유 항목으로 구성
				</caption>
				<thead>
					<tr>
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
					<c:forEach items="${videoList}" var="list">
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
							<td class="del"><a href="javascript:void(0);" class="btn-list-del">삭제</a></td>
							<td class="share"><a href="javascript:void(0);" class="btn-list-share shareBtn" data-clipboard-text="${serverDomain}/video/view/${list.videoId}">공유</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<page:pagination />
		</c:if>
	</div>

</article>