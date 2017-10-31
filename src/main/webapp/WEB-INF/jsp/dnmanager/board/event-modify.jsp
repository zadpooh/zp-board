<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>

<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li> 
					<i class="ace-icon glyphicon glyphicon-edit"></i>
					<a href="#">공지사항&이벤트</a>
				</li> 
				<li class="active">게시판</li>
			</ul><!-- /.breadcrumb -->
		</div>
		<div class="page-content">
			<div class="page-header">
				<h1>
					이벤트
				</h1>
			</div><!-- /.page-header -->
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="row">
						<div class="col-xs-12"> 
							<div class="clearfix">
								<div class="pull-right tableTools-container"></div>
							</div>
							<div class="table-header">
								상세내용
							</div>
							<div>
								<form action="/adnsmanager/board/event-modify" method="post" enctype="multipart/form-data">
									<input type="hidden" name="num" value="${eventList.num}">
									<table id="dynamic-table" class="table table-striped table-bordered table-hover">
										<tr>
											<th width="80px">제목</th>
												<td valign="middle" style="padding-left: 10px; padding-top: 5px">
													<input id="write" style="width: 100% " type="text" name="title" value="${eventList.title}">
												</td>
										</tr>
										<tr>
											<th width="80px">내용</th>
												<td valign="middle" style="padding-left: 10px; padding-top: 5px">
													<textarea id="regiwrite" name="content" rows="20" cols="105" >${eventList.content}</textarea>
												</td>
										</tr>
										<tr>
											<th width="80px">파일</th>
												<td valign="middle" style="padding-left: 10px; padding-top: 5px">
												<div class="a" data-file-name="${eventList.originalFilename}">
													<div class="filename" >
														<div style="float: left; width:10%">
															<c:out value="${eventList.originalFilename}" />
														</div>
														<div style="float: left; width:33%">
															<button type="button" class="btn btn-white btn-minier btn-warning deleteFile" data-num="${eventList.num}">삭 제</button>
														</div>
													</div>
													<div>
														<div style="float: left; width:20%" class="fileupload">
															<input id="file" style="width: 100% " type="file" name="uploadFile">
														</div>
													</div>
												</div>
												</td>
										</tr>
									</table>
										<div> 
											<div align="right">   
				                            	<div>
						                            <button type="submit" class="btn btn-primary btn-sm">&nbsp;&nbsp;&nbsp;저장&nbsp;&nbsp;&nbsp;</button>
						                        	<button type="button" onclick="location.href='#'" class="btn btn-primary btn-sm board">&nbsp;&nbsp;&nbsp;목록&nbsp;&nbsp;&nbsp;</button>
						                        </div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div>
	</div>
</div><!-- /.main-content -->

<script type="text/javascript">

	$(function(){
		if($('.a').data("file-name")==""){
			$('.filename').hide();
			$('.fileupload').show();
		} else{
			$('.filename').show();
			$('.fileupload').hide();
		}
		$('.deleteFile').on("click", function() {
			$('.filename').hide();
			$('.fileupload').show();
			location.href="/adnsmanager/board/event-file-delete?num="+$(this).data("num");
		});
	});
	
	$(".board").on("click", function(){
		location.href="/adnsmanager/board/board-list?tab="+localStorage.getItem("tab");
	});

</script>

