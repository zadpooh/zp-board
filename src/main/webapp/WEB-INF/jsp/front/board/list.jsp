<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>

<article class="common-page list-my">
	<header class="common-page-title">
		<h2 class="title">Notice</h2>
		<p class="desc">누구나 참여하여 함께 만들어 가는 오픈형 뮤직 플랫폼 서비스</p>
	</header>

	<div class="common-content">
		<form method="get" class="list-top-frm">
			<input type="hidden" name="where" value="T" />
			<fieldset>
				<legend>게시판 검색</legend>
				<label for="listSrchKeyword">제목</label>
				<input type="text" name="query" id="listSrchKeyword" class="basic-txt keyword" value="${boardParam.query}" />
				<button type="submit" class="btn primary btn-submit">검색</button>
			</fieldset>
		</form>

		<c:if test="${fn:length(boardList) <= 0}">
			<p class="content-list-no">
				<strong>등록된 데이터가 없습니다.</strong><br>
			</p>
		</c:if>
		
		<c:if test="${fn:length(boardList) > 0}">
			<table class="board-list">
				<caption>
					<strong>게시판 목록 테이블</strong><br>
					번호, 제목, 작성일, 조회수 항목으로 구성
				</caption>
				<thead>
					<tr>
						<th scope="col" class="num">번호</th>
						<th scope="col" class="title">제목</th>
						<th scope="col" class="date">작성일</th>
						<th scope="col" class="cnt">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList}" var="list" varStatus="i">
						<tr>
							<td class="num">${pagination.itemNumber - i.count}</td>
							<td class="title left-cell">
								<div class="ellipsis">
									<a href="/board/view/${list.boardId}?page=${boardParam.page}&query=${boardParam.query}&where=${boardParam.where}" class="tit">
										<c:if test="${list.boardType == '1'}">
											[공지사항]
										</c:if>
										<c:if test="${list.boardType == '2'}">
											[이벤트]
										</c:if>
										<c:if test="${list.boardType == '3'}">
											[마케팅]
										</c:if>
										${list.boardTitle}
									</a>
								</div>
							</td>
							<td class="date">${list.registDe }</td>
							<td class="cnt">${list.boardHits }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<page:pagination />
		</c:if>
	</div>
</article>
