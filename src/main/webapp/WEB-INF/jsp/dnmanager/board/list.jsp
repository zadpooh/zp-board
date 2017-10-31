<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>

<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li> 
					<i class="ace-icon glyphicon glyphicon-edit"></i>
					<a href="#">공지사항&이벤트</a>
				</li> 
			</ul><!-- /.breadcrumb -->
		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					공지사항&이벤트 리스트
				</h1>
			</div><!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<div class="row" style="margin-bottom: 10px;">
						<div class="col-xs-9">
						</div>
						<div class="col-xs-3">
							<form id="searchForm" name="searchForm">
								<input type="hidden" name="where" value="T" />
								<div class="input-group">
									<input type="text" name="query" id="query" class="form-control" value="${boardParam.query }">
									<span class="input-group-btn">
										<button type="submit" class="btn btn-primary btn-sm" id="searchBtn">&nbsp;&nbsp;&nbsp;검 색&nbsp;&nbsp;&nbsp;</button>
									</span>
								</div>
							</form>
						</div>
					</div> 
					<div class="row">
						<div class="col-xs-12">

							<div>
								<table id="dynamic-table" class="table table-striped table-bordered table-hover">
									<colgroup>
										<col class="hidden-480" style="width: 50px" />
										<col style="width: 150px" />
										<col style="width: *" />
										<col class="hidden-480" style="width: 150px" />
										<col style="width: 50px" />
									</colgroup>
									<thead>
										<tr> 
											<th class="text-center hidden-480">NO</th>
											<th class="text-center">분류</th>
											<th class="text-center">제목</th>
											<th class="text-center hidden-480">등록일</th>
											<th class="text-center">관리</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${ fn:length(boardList) > 0 }">
											<c:forEach items="${boardList}" var="list" varStatus="i">
												<tr>
													<td class="text-center hidden-480">${pagination.itemNumber - i.count}</td>
													<td class="text-center hidden-480">
														<c:if test="${list.boardType == '1'}">
															공지사항
														</c:if>
														<c:if test="${list.boardType == '2'}">
															이벤트
														</c:if>
														<c:if test="${list.boardType == '3'}">
															마케팅
														</c:if>
													</td>
													<td><a href="#" class="dtl" data-src="/adnsmanager/board/edit/${list.boardId}" title="게시물 수정" data-toggle="modal" data-target="#myModal">${list.boardTitle}</a></td>
													<td class="text-center hidden-480">${list.registDe}</td>
													<td class="text-center">
														<button type="button" class="btn btn-white btn-minier btn-warning deleteBtn" data-board-id="${list.boardId}">삭 제</button>
														<!-- <button class="btn btn-xs btn-danger">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</button> -->
													</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${ fn:length(boardList) <= 0 }">
											<tr>
												<td colspan="4" class="text-center" style="vertical-align: middle;">등록된 데이터가 없습니다.</td>
											</tr>
										</c:if>
									</tbody>
								</table>
								<div class="row">
									<div class="col-xs-6">
										<button type="button" class="btn btn-success btn-sm" id="createBtn" data-src="/adnsmanager/board/create" title="게시물 등록" data-toggle="modal" data-target="#myModal">&nbsp;&nbsp;&nbsp;등록&nbsp;&nbsp;&nbsp;</button>
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
	
    Common.layoutPopup(".dtl,#createBtn");
    Common.modalReload("#myModal","N");
    
    $(".deleteBtn").on("click", function(){
    	if(confirm("데이터를 삭제 하시겠습니까?")){
			var data = {
				"boardId" : $(this).data("boardId")
			}
			
			$.post("/adnsmanager/board/delete-action", data, function(resp){
				if( resp == "SUCCESS" ){
					alert("데이터가 삭제 되었습니다.");
					location.reload();
				}
			});
    	}
    });
    
});
</script>
