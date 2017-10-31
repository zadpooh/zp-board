<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>

<div class="main-content">
	<div class="main-content-inner">
		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="row">
						<div class="col-xs-12"> 
							<div>
								<table id="dynamic-table" class="table table-striped table-bordered table-hover">
									<colgroup>
										<col style="width: *" />
										<col style="width: 200px" />
										<col style="width: 200px" />
									</colgroup>
									<thead>
										<tr> 
											<th>아이디</th>
											<th class="text-center">별명</th> 
											<th class="text-center">로그인 일자</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${userInfoLogList}" varStatus="i">
											<tr>
												<td>${list.userId}</td>
												<td class="text-center">${list.userNikNm}</td>
												<td class="text-center">${list.recentLoginDe}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.page-content --> 
	</div> 
</div><!-- /.main-content -->
