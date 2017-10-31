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
					공지사항
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
								<form enctype="multipart/form-data">
									<table id="dynamic-table" class="table table-striped table-bordered table-hover">
											<tr>
												<th width="80px">제목</th>
													<td valign="middle" style="padding-left: 10px; padding-top: 5px">
														${boardList.title}
													</td>
											</tr>
											<tr>
												<th width="80px">내용</th>
													<td valign="middle" style="padding-left: 10px; padding-top: 5px">
														<img width="500" height="500" src= <c:out value='${boardList.fileUploadPath}${boardList.fileName}'/>>
													</td>
											</tr>
											<tr>
												<th width="80px">파일</th>
													<td valign="middle" style="padding-left: 10px; padding-top: 5px" class="filebox preview-image">
														<a href='/adnsmanager/board/download?fileUploadPath=${ boardList.fileUploadPath }&originalFilename=${ boardList.originalFilename }&fileName=${ boardList.fileName }'>
															${ boardList.originalFilename }
														</a>
													</td>
											</tr>
									</table>
										<div> 
											<div align="right">   
				                            	<div>
						                            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='/adnsmanager/board/notice-modify?num=${boardList.num}'">&nbsp;&nbsp;&nbsp;수정&nbsp;&nbsp;&nbsp;</button>
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
	
	$(".board").on("click",function(){
		location.href="/adnsmanager/board/board-list?tab="+localStorage.getItem("tab");
	});

</script>
