<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>

<div class="page-content">
	<div class="row">
		<div class="col-xs-12">
			<form enctype="multipart/form-data" name="form">
				<div class="widget-box">
					<div class="widget-body">
						<div class="widget-main">
							<div>
								<label for="boardTitle">
									제목:
								</label>
								<input type="text" id="boardTitle" placeholder="Title" class="form-control" class="form-control col-xs-10 col-sm-5" value="${boardDetail.boardTitle}" />
							</div>
							<hr />
							<div>
								<label for="boardType">
									게시판 타입:
								</label>
								<div class="radio">
									<label>
										<input name="boardType" type="radio" class="ace" value="1" ${boardDetail.boardType == '1' ? 'checked="checked"' : '' } >
										<span class="lbl">공지사항</span>
									</label>
									<label>
										<input name="boardType" type="radio" class="ace" value="2" ${boardDetail.boardType == '2' ? 'checked="checked"' : '' } >
										<span class="lbl">이벤트</span>
									</label>
									<label>
										<input name="boardType" type="radio" class="ace" value="3" ${boardDetail.boardType == '3' ? 'checked="checked"' : '' } >
										<span class="lbl">마케팅</span>
									</label>
								</div>
							</div>
							<hr />
							<div>
								<label for="description">
									내용: 
								</label>
								<div id="summernote">${boardDetail.boardContent}</div>
								<div>
									<button type="button" class="btn btn-success btn-xs" id="editView"> 
										<i class="ace-icon fa fa-floppy-o bigger-110"></i>
										Edit
									</button>
									<button type="button" class="btn btn-info btn-xs" id="preview">
										<i class="ace-icon fa fa-eye bigger-110"></i>
										Preview
									</button>
								</div>
							</div>
							<hr />
							<!-- <div>
								<label for="file">
									파일
								</label>
								<input type="file" id="input-file" class="upload-hidden" name="uploadFile" accept="image/*">
							</div>
							<hr /> -->
							<div>
								<div class="filebox preview-image">
								</div>
							</div>
							<div class="form-actions center">
								<button  class="btn btn-info" type="button" id="process">
									<i class="ace-icon fa fa-check bigger-110"></i>
									저장
								</button>
								<c:if test="${boardParam.mode == 'edit'}">
									<button  class="btn btn-danger deleteBtn" type="button" data-board-id="${boardDetail.boardId}">
										<i class="ace-icon fa fa-trash-o bigger-110"></i>
										삭제
									</button>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	var mode = "${boardParam.mode}";
	
	$(function(){
		$('#summernote').summernote({
			height: 300 ,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
		            sendFile(files[0], editor, welEditable);
		        }
			},
			lang: 'ko-KR'
		});
		
		function sendFile(file, editor, welEditable) {
		    data = new FormData();
		    data.append("uploadFileImage", file);
		    $.ajax({
		        data : data,
		        type : "POST",
		        url : "/adnsmanager/board/image-upload",
		        cache : false,
		        contentType : false,
		        processData : false,
		        success : function(resp) {
		        	console.log(resp);
		        	 var image = $('<img>').attr("src", resp.fileUrl);
		             $('#summernote').summernote("insertNode", image[0]);
		        }
		    });
		}

		$("#preview").on("click", function(event){
			$('#summernote').summernote('destroy');
		});
		
		$("#editView").on("click", function(event){
			$('#summernote').summernote({
				focus: true ,
				height: 300 ,
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {
			            sendFile(files[0], editor, welEditable);
			        }
				},
				lang: 'ko-KR'
			});
		});
		
		$("#process").on("click", function(){
			
			var action = mode == "create" ? "/adnsmanager/board/create-action" : "/adnsmanager/board/edit-action";
			
			if($('#boardTitle').val() == "" ) {
				alert('게시글 제목을 입력 하십시오');
				$('#boardTitle').focus();
				return false;
			}
			
			if( $('input[name=boardType]:checked').val() == "" || $('input[name=boardType]:checked').val() == null ) {
				alert('게시글 타입을 입력 하십시오');
				$('input[name=boardType]').eq(0).focus();
				return false;
			}
			
			if($('#summernote').summernote('isEmpty')) {
				alert('게시글 내용을 입력 하십시오');
				return false;
			}
			
			var data = {
				"boardTitle" : $('#boardTitle').val() , 
				"boardType" : $('#boardType').val() , 
				"boardContent" : $('#summernote').summernote('code')
			};
			
			if( mode == "edit" ){
				data["boardId"] = '${boardDetail.boardId}';
			}
			
			$.post(action, data, function(resp){
				if(resp == "SUCCESS"){
					alert("저장이 완료 되었습니다.");
					window.parent.closeModal('#myModal');
				}
			});			
			
		});
		
		$(".deleteBtn").on("click", function(){
	    	if(confirm("데이터를 삭제 하시겠습니까?")){
				var data = {
					"boardId" : $(this).data("boardId")
				}
				
				$.post("/adnsmanager/board/delete-action", data, function(resp){
					if( resp == "SUCCESS" ){
						alert("데이터가 삭제 되었습니다.");
						window.parent.closeModal('#myModal');
					}
				});
	    	}
	    });
	});
	
	
// 	var imgTarget = $('.upload-hidden');
	
// 	imgTarget.on('change', function(){
// 		console.log("A");
// 		/* var parent = $(this).parent(); 
// 		parent.children('.upload-display').remove(); */
// 		var parent = $(".preview-image");
// 		if(window.FileReader){ 
// 			//image 파일만 
// 			//if (!$(this)[0].files[0].type.match(/image\//)) return;
// 			var reader = new FileReader(); 
// 			reader.onload = function(e){ 
// 				var src = e.target.result;
// 				parent.html('<div class="upload-display" style="width:200px;"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb" width="200px"></div></div>'); 
// 			}
			
// 			reader.readAsDataURL($(this)[0].files[0]); 
// 		} else { 
			
// 			$(this)[0].select();
// 			$(this)[0].blur(); 
// 			var imgSrc = document.selection.createRange().text; 
			
// 			parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
// 			var img = $(this).siblings('.upload-display').find('img'); 
// 			img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";
// 		}
// 	});
	
// 	function showErrorAlert (reason, detail) {
// 		var msg='';
// 		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
// 		else {
// 			//console.log("error uploading file", reason, detail);
// 		}
// 		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
// 		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
// 	}
	
	/* $(".board").on("click", function(){
		location.href="/adnsmanager/board/board-list?tab="+localStorage.getItem("tab");
	});
		
	function noticeWrite() {
		document.form.action='/adnsmanager/board/notice-write?tab='+localStorage.getItem("tab");
		document.form.method='POST';
		document.form.submit();
	} */
</script>
