<%@ tag pageEncoding="utf-8" %>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags"%>

<div class="paging-common">
	<c:if test="${pagination.previousPage > 0}">
		<a href="${fn:replace(pagination.link, '[page]', 1)}" class="page-btn first">처음</a>
		<a href="${fn:replace(pagination.link, '[page]', pagination.previousPage)}" class="page-btn prev">이전</a>
		
	</c:if>
	
	<c:if test="${pagination.previousPage == 0}">
		
	</c:if>
	<span class="paging-num">
	<c:choose>
		<c:when test="${empty pagination.totalPages}">
			<a href="#" class="on">1</a>	
		</c:when>
		<c:when test="${pagination.totalPages == 0}">
			<a href="#" class="on">1</a>	
		</c:when>
	    <c:when test="${pagination.totalPages < 10}">	
		    <c:forEach begin="1" end="${pagination.totalPages}" var="i" >
		        <c:choose>
		            <c:when test="${i == pagination.currentPage}">
		        		<a href="#" class="on">${i}</a>
		            </c:when>
		            <c:otherwise>
		        		<a href="${fn:replace(pagination.link, '[page]', i)}">${i}</a>
		            </c:otherwise>
		        </c:choose>
		    </c:forEach>	
		</c:when>

	    <c:when test="${pagination.currentPage < 9}">	
		    <c:forEach begin="1" end="10" var="i" >
		        <c:choose>
		            <c:when test="${i == pagination.currentPage}">
		        		<a href="#" class="on">${i}</a>
		            </c:when>
		            <c:otherwise>
		        		<a href="${fn:replace(pagination.link, '[page]', i)}">${i}</a>
		            </c:otherwise>
		        </c:choose>
		    </c:forEach>	
		</c:when>

		<c:when test="${pagination.currentPage > pagination.totalPages - 8}">	
		    <c:forEach begin="${pagination.totalPages - 9}" end="${pagination.totalPages}" var="i" >
		        <c:choose>
		            <c:when test="${i == pagination.currentPage}">
		        		<a href="#" class="on">${i}</a>
		            </c:when>
		            <c:otherwise>
		        		<a href="${fn:replace(pagination.link, '[page]', i)}">${i}</a>
		            </c:otherwise>
		        </c:choose>
		    </c:forEach>	
		</c:when>

		<c:otherwise>
			<c:forEach begin="${pagination.currentPage - 5}" end="${pagination.currentPage+5}" var="i" >
		        <c:choose>
		            <c:when test="${i == pagination.currentPage}">
		        		<a href="#" class="on">${i}</a>
		            </c:when>
		            <c:otherwise>
		        		<a href="${fn:replace(pagination.link, '[page]', i)}">${i}</a>
		            </c:otherwise>
		        </c:choose>
		    </c:forEach>	
			
		</c:otherwise>
	</c:choose>
	</span>
	<c:if test="${pagination.nextPage > 0}">
		<a href="${fn:replace(pagination.link, '[page]', pagination.nextPage)}" class="page-btn next">다음</a>
		<a href="${fn:replace(pagination.link, '[page]', pagination.totalPages)}" class="page-btn last">마지막</a>
	</c:if>
	<c:if test="${pagination.nextPage == 0}">
		
	</c:if>
</div>
