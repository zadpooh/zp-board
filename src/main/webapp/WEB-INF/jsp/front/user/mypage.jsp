<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<article class="common-page my-page-edit">
	<header class="common-page-title">
		<h2 class="title">My Page</h2>
		<p class="desc">누구나 참여하여 함께 만들어 가는 오픈형 뮤직 플랫폼 서비스</p>
	</header>

	<div class="common-content">
		<section class="profile">
			<header class="common-title">
				<h3 class="title">개인정보</h3>
			</header>
		
			<form class="profile-frm" id="userEditForm">
				<input type="hidden" name="flagUserId" id="flagUserId" value="Y" />
				<input type="hidden" name="flagUserNikNm" id="flagUserNikNm" value="N" />
				<legend>개인정보 수정</legend>
				
				<dl class="frm-basic-row">
					<dt style="padding-left: 10px;"><label for="userid">아이디</label></dt>
					<dd>
						<div class="flex-input">
							<input type="text" id="userNewId" name="userNewId" class="basic-txt" style="width: 200px;" value="${userInfo.userId}" readonly="readonly" />
							<!-- <button type="button" class="btn">중복확인</button> -->
						</div>
						<!-- <p class="desc">2~20자 이내 (한글,영문,숫자,특수문자)</p> -->
					</dd>
				</dl>
				<dl class="frm-basic-row">
					<dt class="frm-basic-bu"><label for="passwd">기존 비밀번호</label></dt>
					<dd>
						<%-- <c:if test="${userInfo.joinTy == 'ninano'}"> --%>
							<input type="password" id="pswd" name="pswd" class="basic-txt flex" style="width: 200px;" />
						<%-- </c:if>
						<c:if test="${userInfo.joinTy == 'facebook'}">
							<a href="javascript:void(0)" class="btn full social-login facebook" id="facebookLogin" style="width: 200px; background: #3b5998;">Facebook 인증</a>
						</c:if>
						<c:if test="${userInfo.joinTy == 'google'}">
							<a href="javascript:void(0)" class="btn full social-login google" onClick="login()" style="width: 200px; background: #db4437;">Google 로그인</a>
						</c:if>
						<c:if test="${userInfo.joinTy == 'naver'}">
							<a href="javascript:Common.popup('${apiURL}','naver-Login','800px','500px')" class="btn full social-login naver" style="width: 200px; background: #3b5998;">Naver 로그인</a>
						</c:if> --%>
					</dd>
				</dl>
				<dl class="frm-basic-row">
					<dt style="padding-left: 10px;"><label for="pswdNew">새 비밀번호</label></dt>
					<dd>
						<input type="password" id="pswdNew" name="pswdNew" class="basic-txt flex" style="width: 200px;" />
						<p class="desc">영문,숫자를 포함한 6~16자를 입력해 주세요.</p>
					</dd>
				</dl>
				<dl class="frm-basic-row">
					<dt style="padding-left: 10px;"><label for="pswdNewConfirm">새 비밀번호 확인</label></dt>
					<dd>
						<input type="password" id="pswdNewConfirm" name="pswdNewConfirm" class="basic-txt flex" style="width: 200px;" />
					</dd>
				</dl>
				<dl class="frm-basic-row">
					<dt class="frm-basic-bu"><label for="userNikNm">닉네임</label></dt>
					<dd>
						<div class="flex-input">
							<input type="text" id="userNikNm" name="userNikNm" class="basic-txt" style="width: 200px;" value="${userInfo.userNikNm}" />
							<button type="button" class="btn" id="checkUserNikNm">중복확인</button>
						</div>
					</dd>
				</dl>
				<dl class="frm-basic-row">
					<dt style="padding-left: 10px;"><label for="profileAvatar">프로필사진</label></dt>
					<dd>
						<i class="ico-user-big inline avatar" style="background-image: url('${userInfo.userPhoto == '' || userInfo.userPhoto == null ? '/content/img/com/ico-people.png' : userInfo.userPhoto}');"></i>
						<input type="file" id="profileAvatar" name="uploadFile" style="width: 50%;" />
						<!-- <button type="button" class="btn">삭제</button> -->
					</dd>
				</dl>
				<dl class="frm-basic-row">
					<dt style="padding-left: 10px;"><label for="greeting">인사말</label></dt>
					<dd>
						<input type="text" id="greeting" name="userGreeting" class="basic-txt full" value="${userInfo.userGreeting }" />
					</dd>
				</dl>
				
				<div class="frm-basic-action">
					<button type="submit" class="btn big primary" id="editBtn">수정</button>
					<button type="button" class="btn big primary" id="deleteBtn">회원탈퇴</button>
				</div>
			</form>
		</section>
		
		<!-- <section class="additional">
			<header>
				<h3 class="title">수익신청</h3>
				<button class="btn-section-toggle" onclick="$(this).toggleClass('on'); $(this).closest('section').toggleClass('on');">영역 열기/닫기</button>
				<p class="desc">* 니나노 노래방에서 creator의 영상이 나올때 마다 수익이 발생해 creator의 저작료를 드립니다.</p>
			</header>

			<form action="" method="post" class="profile-frm">
				<legend>개인정보 수정</legend>

				<dl class="frm-basic-row">
					<dt class="frm-basic-bu"><label for="name">이름</label></dt>
					<dd>
						<div class="flex-input">
							<input type="text" id="name" name="name" class="basic-txt" style="width: 200px;">
						</div>
					</dd>
				</dl>
				<dl class="frm-basic-row">
					<dt class="frm-basic-bu"><label for="phone1">휴대폰</label></dt>
					<dd class="tel">
						<div class="flex-input">
							<input type="text" id="phone1" name="phone1" title="휴대폰 첫번째 번호" class="basic-txt" style="width: 55px;">
							-&nbsp;
							<input type="text" id="phone2" name="phone2" title="휴대폰 중간 번호" class="basic-txt" style="width: 55px;">
							-&nbsp;
							<input type="text" id="phone3" name="phone3" title="휴대폰 마지막 번호" class="basic-txt" style="width: 55px;">
							<button type="button" class="btn">인증하기</button>
						</div>
					</dd>
				</dl>
				<dl class="frm-basic-row">
					<dt class="frm-basic-bu"><label for="code">인증번호</label></dt>
					<dd>
						<div class="flex-input">
							<input type="text" id="code" code="code" class="basic-txt" style="width: 200px;">
						</div>
					</dd>
				</dl>
				<dl class="frm-basic-row">
					<dt class="frm-basic-bu"><label for="bankbookImage">통장사본</label></dt>
					<dd>
						<input type="file" id="bankbookImage" name="bankbookImage" style="width: 50%;">
						<button type="button" class="btn">삭제</button>
					</dd>
				</dl>

				<div class="frm-basic-action">
					<button type="submit" class="btn big primary">수익신청 등록</button>
				</div>
			</form>
			
		</section> -->
	</div>

</article>

<script type="text/javascript">
	$(function(){
		
		if( Common.getQueryString("tmprPswAt") != null && Common.getQueryString("tmprPswAt") != "" ){
			alert("비밀 번호를 변경해 주시기 바랍니다.");
		} 
		
		var $facebookAppId = "${config.facebookAppId}";
		var $googleClientid = "${config.googleClientid}";
		var $googleAppId = "${config.googleAppId}";
		
		var userNikNm = '${userInfo.userNikNm}';
		var joinTy = '${userInfo.joinTy}';
		
		/* var joinFlag = "0";
		
		$("#facebookLogin").on("click",function(){
 			
			 FB.login(function(response) {
				if (response.status === 'connected') {
			    	if( response.authResponse.accessToken ) {
			    		joinFlag = "1";
			    	}
			    	
			    } else if (response.status === 'not_authorized') {
			    } else {
			    }
			 }, {scope: 'public_profile,email'});
		  });
		  
		  window.fbAsyncInit = function() {
			  FB.init({
			    appId      : $facebookAppId,
			    cookie     : true,   
			    xfbml      : true,  
			    version    : 'v2.8' 
			  });
		  };
		  
		  (function(d, s, id) {
		    var js, fjs = d.getElementsByTagName(s)[0];
		    if (d.getElementById(id)) return;
		    js = d.createElement(s); js.id = id;
		    js.src = "//connect.facebook.net/en_US/sdk.js";
		    fjs.parentNode.insertBefore(js, fjs);
		  }(document, 'script', 'facebook-jssdk')); */
		
		 
		$("#deleteBtn").on("click", function(){
			if(confirm("회원 탈퇴를 하시겠습니까?") ){
				var data = { 
					"userId" : $("#userNewId").val()
				}
				
				$.post("/user/mypage/delete", data, function(resp){
					if( resp == "SUCCESS"){
						alert("니나노에서 탈퇴 되었습니다.");
						location.href = "/main";
					}
				});
			}
		});
		  
		$("#userEditForm").on("submit", function(){
			if(confirm("회원수정을 하시겠습니까?")){
				
				if( $("#pswd").val() == "" && joinTy == "ninano" ){
					alert("기존 비밀번호를 영문,숫자를 포함한 6~16자를 입력해 주세요.");
					$("#pswd").focus();
					return false;
				}
				
				if( Common.getQueryString("tmprPswAt") == null || Common.getQueryString("tmprPswAt") == "" ){
					if(  /^.*(?=.{6,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/.test($("#pswd").val()) == false && joinTy == "ninano" ){
						alert("기존 비밀번호를 영문,숫자를 포함한 6~16자를 입력해 주세요.");
						$("#pswd").focus();
						return false;
					}
				}
				
				/* if( joinFlag == "0" && joinTy != "ninano" ){
					alert("SNS 인증이 필요합니다.");
					return false;
				} */ 
				
				if( $("#pswdNew").val() != "" || $("#pswdNewConfirm").val() != "" ) {
					
					if( $("#pswdNew").val() == "" ){
						alert("새비밀번호를 영문,숫자를 포함한 6~16자를 입력해 주세요.");
						$("#pswdNew").focus();
						return false;
					}
					
					if(  /^.*(?=.{6,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/.test($("#pswdNew").val()) == false){
						alert("새비밀번호를 영문,숫자를 포함한 6~16자를 입력해 주세요.");
						$("#pswdNew").focus();
						return false;
					}
					
					if( $("#pswdNewConfirm").val() == "" ) {
						alert("새비밀번호 확인을 입력 해주세요");
						$("#pswdNewConfirm").focus();
						return false;
					}
					
					if( $("#pswdNew").val() != $("#pswdNewConfirm").val() ) {
						alert("비밀번호 와 비밀번호 확인을 입력 다릅니다.");
						$("#pswdNewConfirm").focus();
						return false;
					}
				}
				
				if( $("#userNikNm").val() == "" ) {
					alert("닉네임을 입력 해주세요");
					$("#닉네임").focus();
					return false;
				}
				
				if( $("#flagUserNikNm").val() != "Y" && $("#userNikNm").val() != userNikNm ) {
					alert("닉네임 중복 확인을 해주세요");
					$("#checkUserNikNm").focus();
					return false;
				}
				
		    	var formData = new FormData();
		    	
		    	formData.append("userId", $("#userNewId").val());
		    	formData.append("pswd", $("#pswd").val());
		    	formData.append("pswdNew", $("#pswdNew").val());
		    	formData.append("userNikNm", $("#userNikNm").val());
		    	formData.append("flagUserNikNm", $("#flagUserNikNm").val());
		    	formData.append("userGreeting", $("#greeting").val());
		    	formData.append("uploadFile", $('#profileAvatar').get(0).files[0]);
		    	
		        $.ajax({
		            url: '/user/mypage/edit',
		            processData: false,
		            contentType: false,
		            data: formData,
		            type: 'POST',
		            success: function(resp){
		            	
		            	console.log(resp);
		            	
		            	if( resp == "UIN0000" ) {
							alert("회원 등록 중 오류가 발생 되었습니다.");
						}
						
						if( resp == "UIN0002" ) {
							alert("회원 닉네임이 존재 합니다.");
						}
						
						if( resp == "UIN0003" ) {
							alert("기존 비밀번호가 다릅니다.");
						}
		            	
						if( resp == "SUCCESS" ) {
							alert("회원 수정이 완료 되었습니다.");
							location.href="/user/mypage";
						}
						
		            }
		        });
				
		        return false;
				
			} else {
				return false;
			}
		});
		
		$("#checkUserId").on("click", function(){
			
			if( $("#userId").val() == "" ) {
				alert("아이디 (이메일)을 입력 해주세요");
				$("#userId").focus();
				return false;
			}
			
			if( /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/.test($("#userId").val()) == false  ) {
				alert("아이디가 이메일 형식이 아닙니다.");
				$("#userId").focus();
				return false;
			}
			
			var data = {
				"userId" : $("#userId").val() ,
				"checkType" : "userId"
			};
			
			idNikCheck(data);
			
		});
		
		$("#checkUserNikNm").on("click", function(){
			
			if( $("#userNikNm").val() == "" ) {
				alert("닉네임을 입력 해주세요");
				$("#userNikNm").focus();
				return false;
			}
			
			var data = {
				"userNikNm" : $("#userNikNm").val() ,
				"checkType" : "userNikNm"
			};
			
			idNikCheck(data);
		});
		
		function idNikCheck(data) {
			$.post("/user/id-nik-check", data, function(resp){
				if(resp == "SUCCESS" ){
					if( data.checkType == "userId" ) {
						alert("사용 가능한 아이디 (이메일) 입니다.");
						$("#flagUserId").val("Y");
					}
					
					if( data.checkType == "userNikNm" ) {
						alert("사용 가능한 닉네임 입니다.");
						$("#flagUserNikNm").val("Y");
					}
				}
				
				if(resp == "UIN0001" ){
					alert("회원 아이디가 존재 합니다.");
				}
				
				if(resp == "UIN0002" ){
					alert("회원 닉네임이 존재 합니다.");
				}
			});
		}
	});
</script>