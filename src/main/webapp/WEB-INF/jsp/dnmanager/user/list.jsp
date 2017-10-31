<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>

<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li> 
					<i class="ace-icon fa fa-user home-icon"></i>
					<a href="#">회원 관리</a>
				</li> 
				<li class="active">회원 목록</li>
			</ul><!-- /.breadcrumb -->
		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					회원 목록
				</h1>
			</div><!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="row">
						<div class="col-xs-12"> 
							<div>
								<table id="dynamic-table" class="table table-striped table-bordered table-hover">
									<colgroup>
										<col class="hidden-480" style="width: 50px" />
										<col style="width: *" />
										<col style="width: 300px" />
										<col style="width: 200px" />
										<col style="width: 200px" />
										<col style="width: 100px" />
									</colgroup>
									<thead>
										<tr> 
											<th class="text-center hidden-480" >NO</th>
											<th>아이디</th>
											<th class="text-center">별명</th> 
											<th class="text-center hidden-480">가입 일자</th>
											<th class="text-center hidden-480">로그인 일자</th>
											<th class="text-center hidden-480">로그인타입</th>
											<!-- <th>수익신청</th> -->
											<!-- <th>삭제</th> -->
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${userList}" varStatus="i">
											<c:set var="joinTyColor" value="" />
											
											<c:if test="${list.joinTy == 'ninano'}">
												<c:set var="joinTyColor" value="label-warning" />
											</c:if>
											<c:if test="${list.joinTy == 'facebook'}">
												<c:set var="joinTyColor" value="label-info" />
											</c:if>
											<c:if test="${list.joinTy == 'google'}">
												<c:set var="joinTyColor" value="label-danger" />
											</c:if>
											<c:if test="${list.joinTy == 'naver'}">
												<c:set var="joinTyColor" value="label-success" />
											</c:if>
											
											<tr>
												<td class="text-center hidden-480" >${pagination.itemNumber - i.count}</td> 
												<td>${list.userId}</td>
												<td class="text-center">${list.userNikNm}</td>
												<td class="text-center hidden-480">${list.registDe}</td>
												<td class="text-center hidden-480">
													<a href="javascript:;" class="dtl" data-src="/adnsmanager/user/login-history?userId=${list.userId}" title="영상 상세정보" data-toggle="modal" data-target="#myModal">${list.recentLoginDe}</a>
												</td>
												<td class="text-center hidden-480">
													<span class="label label-sm ${joinTyColor} arrowed-in-right arrowed">${list.joinTy}</span>
												</td>
												<%-- <td><button type="button" class="btn btn-default btn-white btn-minier btn-success btnAdd" onclick='window.open("/adnsmanager/user/check?userId=${list.userId}", "팝업", "widtd=500, height=500, top=300, left=500")' >보 기</button></td> --%>
												<%-- <td><button type="button" class="btn btn-white btn-minier btn-warning deleteBtn" data-user-id="${list.userId}">삭 제</button></td> --%>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="row">
									<div class="col-xs-6">
										<form id="searchForm" name="searchForm">
											<div class="row">
												<div class="col-xs-2" style="padding-right: 0;">
					                            	<select name="where" class="form-control">
					                            		<option value="I" ${userInfoParam.where == 'I' ? 'selected="selected" ' : '' }>아이디</option>
					                            		<option value="N" ${userInfoParam.where == 'N' ? 'selected="selected"' : '' }>닉네임</option>
					                            	</select>
				                            	</div>
				                            	<div class="col-xs-4" style="padding-right: 0;">
						                            <input type="text" name="query" class="form-control" value="${userInfoParam.query }">
						                        </div>
												<div class="col-xs-4">
													<button type="submit" class="btn btn-primary btn-sm" id="searchBtn">&nbsp;&nbsp;&nbsp;검 색&nbsp;&nbsp;&nbsp;</button>
												</div>
											</div>
										</form>
									</div>
									<page:pagination-manager />
								</div>
							</div>
						</div>
					</div>
					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.page-content --> 
	</div> 
</div><!-- /.main-content -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
<script type="text/javascript">

$(document).ready(function() {
  //  Common.layoutPopup(".btnAdd");
  	Common.layoutPopup(".dtl");
  	
    $(".deleteBtn").on("click", function(){
    	var check;
    	if(check=confirm('삭제하시겠습니까?')){
    		location.href='/adnsmanager/user/delete?userId='+$(this).data("user-id");
    	}
    	if(check) alert("삭제되었습니다");
    });
});
//검색
$("#searchBtn").click(function(){
	$("#searchForm").submit();
});
</script>
