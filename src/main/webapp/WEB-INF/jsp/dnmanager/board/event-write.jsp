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
								글쓰기
							</div>
							<div>
								<form enctype="multipart/form-data" name="form">
									<table id="dynamic-table" class="table table-striped table-bordered table-hover"><tr>
										<tr>
											<th width="80px">제목</th>
												<td valign="middle" style="padding-left: 10px; padding-top: 5px">
													<input id="write" style="width: 100% " type="text" name='title' placeholder="제목을 입력해 주세요.">
												</td>
										</tr>
										<tr>
											<th width="80px">내용</th>
												<td valign="middle" style="padding-left: 10px; padding-top: 5px">
													<textarea cols="80" name="content" rows="10" placeholder="내용을 입력해 주세요."></textarea>
												</td>
										</tr>
										<tr>
											<th width="80px">파일</th>
												<td valign="middle" style="padding-left: 10px; padding-top: 5px">
													<div class="filebox preview-image" style="float: left; width:33%">
														<input type="file" id="input-file" class="upload-hidden" name="uploadFile">
													</div>
												</td>
										</tr>
									</table>
										<div> 
											<div align="right"> 
				                            	<div>
				                            		<button type="button" onclick="eventWrite()" class="btn btn-primary btn-sm" >&nbsp;&nbsp;&nbsp;게시&nbsp;&nbsp;&nbsp;</button>
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

<style>
.filebox .upload-display { /* 이미지가 표시될 지역 */ margin-bottom: 5px; } @media(min-width: 768px) { 
.filebox .upload-display { display: inline-block; margin-right: 5px; margin-bottom: 0; } } 
.filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */ display: inline-block; width: 100px; padding: 2px; vertical-align: middle; border: 1px solid #ddd; border-radius: 5px; background-color: #fff; } 
.filebox .upload-display img { /* 추가될 이미지 */ display: block; max-width: 100%; width: 100% \9; height: auto; }
</style>

<script type="text/javascript">

	var imgTarget = $('.preview-image .upload-hidden'); 
	imgTarget.on('change', function(){ 
		var parent = $(this).parent(); 
		parent.children('.upload-display').remove(); 
		if(window.FileReader){ 
			//image 파일만 
			//if (!$(this)[0].files[0].type.match(/image\//)) return;
			var reader = new FileReader(); 
			reader.onload = function(e){ 
				var src = e.target.result; 
				parent.prepend('<div class="upload-display" style="float: left; width:25%"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>'); }
			reader.readAsDataURL($(this)[0].files[0]); 
			} 
		else { $(this)[0].select();
		$(this)[0].blur(); 
		var imgSrc = document.selection.createRange().text; 
		parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
		var img = $(this).siblings('.upload-display').find('img'); 
		img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";
		}
	});

	$(".board").on("click", function(){
		location.href="/adnsmanager/board/board-list?tab="+localStorage.getItem("tab");
	});
	
	$(".write").on("click", function(){
		location.href="/adnsmanager/board/event-write?tab="+localStorage.getItem("tab");
	});
	
	function eventWrite() {
		document.form.action='/adnsmanager/board/event-write?tab='+localStorage.getItem("tab");
		document.form.method='POST';
		document.form.submit(); 
	}

</script>

