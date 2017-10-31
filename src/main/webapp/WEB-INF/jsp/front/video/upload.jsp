<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article class="common-page content-add">
	<header class="common-page-title">
		<h2 class="title">Upload</h2>
		<p class="desc">누구나 참여하여 함께 만들어 가는 오픈형 뮤직 플랫폼 서비스</p>
	</header>

	<div class="common-content">
		<form action="" method="post" class="write-frm">
		
			<dl class="frm-basic-row">
				<dt class="frm-basic-bu">동영상</dt>
				<dd>
					<div class="flex-input">
						<input type="text" name="uploadFileName" id="filename" title="파일명" readonly="readonly" class="basic-txt" style="width: 200px;" />
						<input type="file" name="uploadFile" id="uploadFile" style="display: none;" />
						<button id="mp4Btn" type="button" class="btn">파일선택</button>
					</div>
					<p class="desc">
						*1GB 이하 용량의 영상만 가능.<br />
						&nbsp;(mp4, mov) 확장자 영상만 업로드 하실수있습니다.
					</p>
					<div class="progress">
						<div class="bar"><div id="progressBar" style="width: 0;"></div></div>
						<div class="percent" id="percent">0%</div>
					</div>
				</dd>
			</dl>
			<dl class="frm-basic-row">
				<dt class="frm-basic-bu">영상 썸네일</dt>
				<dd>
					<div class="flex-input">
						<input type="text" id="thumbImage" title="영상 썸네일" readonly="readonly" class="basic-txt" style="width: 200px;" />
						<input type="file" name="uploadFileImage" id="uploadFileImage" style="display: none;" />
						<button id="imageBtn" type="button" class="btn">파일선택</button>
					</div>
					<p class="desc">
						*이미지 해상도는 600x600 사이즈를 권장합니다.<br />
						&nbsp;(jpg, gif, png, bmp) 확장자 이미지만  업로드 하실수있습니다. 
					</p>
				</dd>
			</dl>
			<dl class="frm-basic-row">
				<dt class="frm-basic-bu"><label for="videoSinger">원곡가수</label></dt>
				<dd>
					<div class="flex-input">
						<input type="text" id="videoSinger" name="videoSinger" class="basic-txt" style="width: 200px;" />
					</div>
				</dd>
			</dl>
			<dl class="frm-basic-row">
				<dt class="frm-basic-bu"><label for="categoryCode">카테고리</label></dt>
				<dd>
					<select name="categoryCode" id="categoryCode" title="카테고리 대분류" class="basic-select category-select">
						<option value="">선택</option>
						<c:forEach items="${categoryList}" var="list">
							<option value="${list.categoryCode}">${list.categoryName}</option>
						</c:forEach>
					</select>
					
					<select name="categorySubCode" id="categorySubCode" title="카테고리 소분류" class="basic-select category-select" disabled="disabled">
						<option value="">선택</option>
					</select>
					
					<p class="desc">*보컬 영상은 서브 카테고리를 선택하실 필요가 없습니다.</p>
				</dd>
			</dl>
		
			<section class="content-info">
				<h3 class="title">기본정보</h3>
		
				<dl class="frm-basic-row">
					<dt class="frm-basic-bu"><label for="videoTitle">제목</label></dt>
					<dd>
						<div class="flex-input">
							<input type="text" id="videoTitle" name="videoTitle" class="basic-txt full" />
						</div>
					</dd>
				</dl>
				<dl class="frm-basic-row">
					<dt class="frm-basic-bu"><label for="ottState">공개여부</label></dt>
					<dd>
						<div class="flex-input">
							<select name="ottState" id="ottState" class="basic-select" style="width: 200px;">
								<option value="">선택</option>
								<option value="1">공개</option>
								<option value="0">비공개</option>
							</select>
						</div>
						<p class="desc">*니나노 노래방에서 업로드 하실 영상 공개 여부 입니다.</p>
					</dd>
				</dl>
				<dl class="frm-basic-row">
					<dt class="frm-basic-bu"><label for="videoTags">태그</label></dt>
					<dd>
						<div class="flex-input">
							<input type="text" id="videoTags" name="videoTags" class="basic-txt full" />
						</div>
						<p class="desc">(예:기타연주, 프로포즈, 트와이스)</p>
					</dd>
				</dl>
				<dl class="frm-basic-row">
					<dt class="frm-basic-bu"><label for="videoContent">설명</label></dt>
					<dd>
						<textarea name="videoContent" id="videoContent" cols="30" rows="10" class="basic-txt full" style="height: 70px;"></textarea>
					</dd>
				</dl>
				<dl class="frm-basic-row">
					<dt class="frm-basic-bu">자막</dt>
					<dd>
						<input type="checkbox" id="videoSubtitleState" class="basic-chk" value="1" />
						<label for="useSubtitle">자막 삽입</label>
						<p class="desc">
							*자막 선택 시 올려주신 영상에 노래 가사를 자막으로 붙여 줍니다.<br>
							&nbsp;노래가사가 붙은 영상은 니나노 노래방에서 찾아서 노래 하실 수 있습니다. (자막 작업에 3~24시간 정도 소요 됩니다)
						</p>
					</dd>
				</dl>
			</section>
		
			<div class="frm-basic-action">
				<button type="button" id="uploadBtn" class="btn big primary">업로드</button>
				<a href="#" class="btn big" onclick="history.back(); return false;">취소</a>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(function(){
			
			$("#categoryCode").on("change", function(){
				$("#categorySubCode").html("<option value=''>선택</option>");
				$("#categorySubCode").attr("disabled", true);
				if( $(this).val() == "001"){
					$.post("/video/category","categoryCode="+$(this).val(), function(resp){
						selectHtml(resp);
					},'json');
				}
			});
			
			$("#mp4Btn, #filename").on("click", function(){
				$("#uploadFile").trigger("click");
			});
			
			$("#uploadFile").on("change", function(){
				var fileNames = $(this).val().split("\\");
				var fileName = fileNames[fileNames.length-1];
				var fileNameComma = fileName.split(".");
				var extension = fileNameComma[fileNameComma.length-1].toLowerCase(); //확장자
				var iSize = 0;
				var browser=navigator.appName;
				
				if(extension != "mp4" &&
					extension != "mov"
				){ //확장자를 확인합니다.
					alert('동영상 파일(mp4, mov)만 등록 가능합니다.');
					$(this).val('');
					return false;
				}
				
				// 익스플로러일 경우
				if (browser=="Microsoft Internet Explorer"){
					var objFSO = new ActiveXObject("Scripting.FileSystemObject");
					var sPath = $(this)[0].value;
					var objFile = objFSO.getFile(sPath);
					var iSize = objFile.size;
					iSize = iSize / 1024 / 1024;
				}else {
					iSize = ($(this)[0].files[0].size / 1024 / 1024);
				}
				
				if( iSize > 1000){
					alert("동영상 파일은 1GB 이하 용량의 영상만 가능 합니다.");
					$(this).val('');
					return false;
				}
				
				$("#filename").val(fileName);
			});
			
			$("#imageBtn, #thumbImage").on("click", function(){
				$("#uploadFileImage").trigger("click");
			});
			
			$("#uploadFileImage").on("change", function(){
				var fileNames = $(this).val().split("\\");
				var fileName = fileNames[fileNames.length-1];
				var fileNameComma = fileName.split(".");
				var extension = fileNameComma[fileNameComma.length-1].toLowerCase(); //확장자
				
				if(extension != "jpg" && extension != "png" &&  extension != "gif" &&  extension != "bmp"){ //확장자를 확인합니다.
					alert('썸네일은 이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
					$(this).val('');
					return false;
				}
				
				$("#thumbImage").val(fileName);
			});
			
		});
		
		function selectHtml(resp){
			$("#categorySubCode").attr("disabled", false);
			for(var i = 0; i < resp.length; i++){
				$("#categorySubCode").append("<option value='"+resp[i].categoryCode+"'>"+resp[i].categoryName+"</option>");
			}
		}
		
		var _submit = document.getElementById('uploadBtn'), 
	    _file = document.getElementById('uploadFile'), 
	    _fileImage = document.getElementById('uploadFileImage'), 
	    _progress = document.getElementById('progressBar'),
	    _percent = $('#percent');
	
	    var upload = function(){
	
			if( _file.files == null || _file.files.length === 0){
	        	alert('동영상 파일을 선택 해주세요');
	        	$("#mp4Btn").focus();
	            return;
			}
	        
	        if( _fileImage.files == null || _fileImage.files.length === 0){
	        	alert('영상 썸네일을 선탣 해주세요');
	        	$("#imageBtn").focus();
	        	return;
	        }
	        
	        if($("#videoSinger").val() == ""){
	        	alert("원가수를  입력 해주세요");
	        	$("#categoryCode").focus();
	        	return;
	        }
	        
	        if($("#categoryCode").val() == ""){
	        	alert("카테고리를 선택 해주세요");
	        	$("#categoryCode").focus();
	        	return;
	        }
	        
	        if($("#categoryCode").val() == "001" && $("#categorySubCode").val() == ""){
	        	alert("카테고리를 선택 해주세요");
	        	$("#categorySubCode").focus();
	        	return;
	        }
	        
	        if($("#videoTitle").val() == ""){
	        	alert("영상 제목을 입력 해주세요");
	        	$("#videoTitle").focus();
	        	return;
	        }
	        
	        if($("#ottState").val() == ""){
	        	alert("공개여부를 선택 해주세요");
	        	$("#ottState").focus();
	        	return;
	        }
	        
	        if($("#videoTags").val() == ""){
	        	alert("태그를 입력 해주세요");
	        	$("#videoTags").focus();
	        	return;
	        }
	        
	        if($("#videoContent").val() == ""){
	        	alert("설명을 입력 해주세요");
	        	$("#videoContent").focus();
	        	return;
	        }
	        
	        $("#uploadBtn").attr("disabled", true);
	        
	        var data = new FormData();
	        
	        data.append('uploadFile', _file.files[0]);
	        data.append('uploadFileImage', _fileImage.files[0]);
	        data.append('categoryCode', $("#categoryCode").val());
	        data.append('categorySubCode', $("#categorySubCode ").val());
	        data.append("videoTitle", $("#videoTitle").val());
	        data.append("videoSinger", $("#videoSinger").val());
	        data.append("updateState", "0");
	        data.append("ottState", $("#ottState").val());
	        data.append("videoTags", $("#videoTags").val());
	        data.append("videoContent", $("#videoContent").val());
	        data.append("videoSubtitleState", $("#videoSubtitleState:checked").val() == null || $("#videoSubtitleState:checked").val() == "" ? "0" :  $("#videoSubtitleState:checked").val());
	
	        var request = new XMLHttpRequest();
	        request.onreadystatechange = function(){
	            if(request.readyState == 4){
	                try {
	                	if( request.response == "FUP0001" ){
	                		alert("영상 파일이 존재 하지않습니다.");	
	                		$("#uploadBtn").attr("disabled", false);
	                	}
	                	
	                	if( request.response == "FUP0001" ){
	                		alert("썸네일 이미지가 존재 하지않습니다.");
	                		$("#uploadBtn").attr("disabled", false);
	                	}
	                	
	                	if( request.response == "FUP9999" ){
	                		alert("데이터 등록중 오류가 발생 되었습니다.");
	                		$("#uploadBtn").attr("disabled", false);
	                	}
	                	
	                	if( request.response == "SUCCESS" ){
	                		alert("데이터 등록이 완료 되었습니다.");
	                		location.href="/user/profile";
	                	}/*  else {
	                		alert("알수 없는 오류가 발생 되었습니다.");
	                	} */
	                	
	                    //var resp = JSON.parse(request.response);
	                } catch (e){
	                	
	                    var resp = {
	                        status: 'error',
	                        data: 'Unknown error occurred: [' + request.responseText + ']'
	                    };
	                    
	                    alert("알수 없는 오류가 발생 되었습니다.");
	                    $("#uploadBtn").attr("disabled", false);
	                    console.log(resp);
	                }
	            }
	        };
	
	        request.upload.addEventListener('progress', function(e){
	        	var p = e.loaded/e.total; 
	            _progress.style.width = p.toFixed(3) * 100 + '%';
	            _percent.text(Math.ceil(p.toFixed(2) * 100) + '%');
	        }, false);
	
	        request.open('POST', '/video/upload/create', true);
	        request.send(data); 
	    }
	
	    _submit.addEventListener('click', upload);
	</script>

</article>