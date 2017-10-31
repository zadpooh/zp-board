<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>

<article class="common-page list-my">
	<header class="common-page-title">
		<h2 class="title">Notice</h2>
		<p class="desc">누구나 참여하여 함께 만들어 가는 오픈형 뮤직 플랫폼 서비스</p>
	</header>

	<div class="common-content">
		<div class="board-view">
			<header class="common-title">
				<h2 class="title">${boardDetail.boardTitle}</h2>
				<p class="info">작성일 : ${boardDetail.registDe} &nbsp;/&nbsp; 조회수 : ${boardDetail.boardHits}</p>
			</header>
			<div class="content-area">
				${boardDetail.boardContent}
			</div>
			<div class="foot">
				<a href="/board/list?${queryString}" class="btn big primary">목록</a>
			</div>
		</div>
	</div>
</article>

