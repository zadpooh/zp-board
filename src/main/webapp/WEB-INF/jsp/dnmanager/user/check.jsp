<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>

<div class="main-content">
	<div class="main-content-inner">

		<div class="page-content">
				<div class="page-header">
					<c:forEach var="list" items="${userList}" varStatus="i">
						<h1>
							${list.userNikNm}
						</h1>
					</c:forEach>
				</div><!-- /.page-header -->
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="row">
						<div class="col-xs-12"> 
							<div>
								<table id="dynamic-table" class="table table-striped table-bordered table-hover">
									<tbody>
										<c:forEach var="list" items="${userList}" varStatus="i">
											<tr>
												<th></th> 
											</tr>
											<tr>
												<th>휴대폰 :	${list.userId}</th>
											</tr>
											<tr>
												<th>${list.userNikNm}</th>
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
