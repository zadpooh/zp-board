<%@ tag pageEncoding="utf-8" %>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags"%>


	<div class="col-xs-6">
		<div class="dataTables_paginate paging_simple_numbers" id="dynamic-table_paginate">
			<ul class="pagination">
				<c:if test="${pagination.previousPage > 0}">
					<li>
						<a href="${fn:replace(pagination.link, '[page]', pagination.previousPage)}">
							<i class="ace-icon fa fa-angle-double-left"></i>
						</a>
					</li>
				</c:if>
				<c:if test="${pagination.previousPage == 0}">
					<li class="disabled">
						<a href="#">
							<i class="ace-icon fa fa-angle-double-left"></i>
						</a>
					</li>
				</c:if>
				
				<c:choose>
					<c:when test="${empty pagination.totalPages}">	
						<li class="active">
							<a href="#">1</a>
						</li>
					</c:when>
					<c:when test="${pagination.totalPages == 0}">	
						<li class="active">
							<a href="#">1</a>
						</li>
					</c:when>
				    <c:when test="${pagination.totalPages < 10}">	
					    <c:forEach begin="1" end="${pagination.totalPages}" var="i" >
					        <c:choose>
					            <c:when test="${i == pagination.currentPage}">
					        		<li class="active">
										<a href="#">${i}</a>
									</li>
					            </c:when>
					            <c:otherwise>
					            	<li>
										<a href="${fn:replace(pagination.link, '[page]', i)}">${i}</a>
									</li>
					            </c:otherwise>
					        </c:choose>
					    </c:forEach>	
					</c:when>
			
				    <c:when test="${pagination.currentPage < 9}">	
					    <c:forEach begin="1" end="10" var="i" >
					        <c:choose>
					            <c:when test="${i == pagination.currentPage}">
					        		<li class="active">
										<a href="#">${i}</a>
									</li>
					            </c:when>
					            <c:otherwise>
					            	<li>
										<a href="${fn:replace(pagination.link, '[page]', i)}">${i}</a>
									</li>
					            </c:otherwise>
					        </c:choose>
					    </c:forEach>	
					</c:when>
			
					<c:when test="${pagination.currentPage > pagination.totalPages - 8}">	
						 
					    <c:forEach begin="${pagination.totalPages - 9}" end="${pagination.totalPages}" var="i" >
					        <c:choose>
					            <c:when test="${i == pagination.currentPage}">
					        		<li class="active">
										<a href="#">${i}</a>
									</li>
					            </c:when>
					            <c:otherwise>
					            	<li>
										<a href="${fn:replace(pagination.link, '[page]', i)}">${i}</a>
									</li>
					            </c:otherwise>
					        </c:choose>
					    </c:forEach>	
					</c:when>
			
					<c:otherwise>
						<c:forEach begin="${pagination.currentPage - 5}" end="${pagination.currentPage+5}" var="i" >
					        <c:choose>
					            <c:when test="${i == pagination.currentPage}">
					        		<li class="active">
										<a href="#">${i}</a>
									</li>
					            </c:when>
					            <c:otherwise>
					            	<li>
										<a href="${fn:replace(pagination.link, '[page]', i)}">${i}</a>
									</li>
					            </c:otherwise>
					        </c:choose>
					    </c:forEach>	
					</c:otherwise>
				</c:choose>
				
				<c:if test="${pagination.nextPage > 0}">
					<li>
						<a href="${fn:replace(pagination.link, '[page]', pagination.nextPage)}">
							<i class="ace-icon fa fa-angle-double-right"></i>
						</a>
					</li
				</c:if>
				<c:if test="${pagination.nextPage == 0}">
					<li class="disabled">
						<a href="#">
							<i class="ace-icon fa fa-angle-double-right"></i>
						</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
