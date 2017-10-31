<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<article class="common-page page-login">
		<header class="common-page-title">
			<h2 class="title">로그인</h2>
			<p class="desc">누구나 참여하여 함께 만들어 가는 오픈형 뮤직 플랫폼 서비스</p>
		</header>
		<div class="common-content">
			<form action="/user/auth-login" method="post" class="login-frm">
				<input type="hidden" id="target" name="target" value="${target}" />
				<input type="hidden" id="joinTy" name="joinTy" value="ninano" />
				<div class="copy">
					<p class="main">NINANO에 방문해 주셔서<br> 감사합니다.</p>
					<p class="sub">로그인 하시면 나의 영상을<br> 게시할 수 있습니다.</p>
				</div>
				<div class="wrap">
					<section class="login">
						<h3 class="hide">회원로그인</h3>
						<div class="frm-area">
							<label class="userid">
								<input type="text" id="userId" name="userId" title="ID" class="basic-txt userid" placeholder="Id" />
							</label>
							<label class="passwd">
								<input type="password" id="pswd" name="pswd" title="PW" class="basic-txt passwd" placeholder="Password" />
							</label>
							<button type="submit" class="btn primary btn-login">로그인</button>
						</div>
	
						<div class="action">
							<!-- <a href="#" onclick="showLayerPop('#popFindId'); return false;">아이디찾기</a>
							/ -->
							<a href="#" onclick="showLayerPop('#popFindPassword'); return false;">비밀번호찾기</a>
							<br>
							아직 회원이 아니신가요?  <a href="/user/join" class="join-link">가입하기</a>
						</div>
					</section>
					<section class="social">
						<h3 class="hide">소셜로그인</h3>
						<a href="javascript:void(0)" class="btn full social-login facebook" id="facebookLogin">Facebook 로그인</a>
						<a href="javascript:void(0)" class="btn full social-login google" onClick="login()">Google 로그인</a>
						<a href="javascript:Common.popup('${apiURL}','naver-Login','800px','500px')" class="btn full social-login naver">Naver 로그인</a>
					</section>
				</div>
			</form>
		</div>
		<script type="text/javascript">
			var $facebookAppId = "${config.facebookAppId}";
			var $googleClientid = "${config.googleClientid}";
			var $googleAppId = "${config.googleAppId}";
		</script>
		<script src="/content/js/sns-login.min.js?asdf=1"></script>
 		<script type="text/javascript">
 			
 			$(function(){
 				if( Common.getQueryString("error") != null && Common.getQueryString("error") != "" ){
 					
 					if( Common.getQueryString("error") == "1" ){
	 					alert("회원아이디 또는 비밀번호가 다릅니다.");
 					}
 					
 					if( Common.getQueryString("error") == "2" ){
	 					alert("탈퇴한 회원 입니다.");
 					}
 					
 					//location.href="/user/login";
 				} 	
 			});
 			
			/* function loginWithNaver(){
				
				$("body").trigger("#naver_id_login_anchor","click");
			}
			
	 		$("#facebookLogin").on("click",function(){
	 			
				 FB.login(function(response) {
					if (response.status === 'connected') {
	 			    	if( response.authResponse.accessToken ) {
							FB.api('/me?fields=name,email,picture', function(response) {
								var $data = {
									"userId" : response["email"] ,
									"snsId" : response["id"] , 
									"joinTy" : 'facebook'  
								};
							     
								sns_login($data);
							});
							
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
			  }(document, 'script', 'facebook-jssdk'));
	 		
			  
	 		function login() 
			{
			  var myParams = {
			    'clientid' : $googleClientid,
			    'cookiepolicy' : 'single_host_origin',
			    'callback' : 'loginCallback',
			    'approvalprompt':'force',
			    'scope' : 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read'
			  };
			  gapi.auth.signIn(myParams);
			}
 		
	 		function loginCallback(result)
	 		{
	 		    if(result['status']['signed_in'])
	 		    {
	 		        var request = gapi.client.plus.people.get({'userId': 'me'});
	 		        
	 		        request.execute(function (resp)
	 		        {
	 		            var email = '';
	 		            if(resp['emails'])
	 		            {
	 		                for(i = 0; i < resp['emails'].length; i++)
	 		                {
	 		                    if(resp['emails'][i]['type'] == 'account')
	 		                    {
	 		                        email = resp['emails'][i]['value'];
	 		                    }
	 		                }
	 		            }
	 		           
	 		          	var $data = {
							"userId" : email ,
							"snsId" : resp['id'] , 
							"joinTy" : 'google'  
						};
	 		          	
	 		          	sns_login($data);
	 		        });
	 		    }
	 		 
	 		}
	 		
			function onLoadCallback()
			{
			    gapi.client.setApiKey($googleAppId);
			    gapi.client.load('plus', 'v1',function(){});
			}
	 
			(function() {
				var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
				po.src = 'https://apis.google.com/js/client.js?onload=onLoadCallback';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
			})();
			
			function sns_login(data){
				$.get("/user/auth-login", data, function(resp){
		    		
		    		if( resp == "UE0000"){
		    			alert("동일한 아이디가 존재 합니다.");	
		    		}
		    		
		    		if( resp == "UE0001"){
		    			alert("회원 정보 가입경로가 다릅니다.");
		    		}
		    		
		    		if( resp == "UE9997"){
		    			alert("접근경로가 다릅니다.");
		    		}
		    		if( resp == "SUCCESS" ){
		    			if( Common.getQueryString("target") == null || Common.getQueryString("target") == "" ) {
				    		location.href= "/";
		    			} else {
		    				location.href= decodeURIComponent(Common.getQueryString("target"));
		    			}
		    		}
		    	});
			} */
			
			$(function() {
				var $frm = $('.login-frm');
				var $inputs = $frm.find('.basic-txt');
				var $id = $inputs.filter('.userid');
				var $pw = $inputs.filter('.passwd');
	
				$frm.on('submit', function() {
					if($id.val() === '') {
						alert("아이디를 입력해주세요");
						$id.focus();
						return false;
					}
					if($pw.val() === '') {
						alert("비밀번호를 입력해주세요");
						$pw.focus();
						return false;
					}
				});
			});
		</script>

	</article>

	<!-- 팝업 : 아이디 찾기  
	<article id="popFindId" class="layer-pop pop-find-idpw" style="display: none;">
		<div class="layer-main">
			<div class="con-body">
				<header class="pop-header">
					<h1>아이디 찾기</h1>
					<p class="desc">등록하신 E-mail 주소를 입력하시면, <br>아이디를 보내드립니다.</p>
					<button type="button" class="btn-layer-close">닫기</button>
				</header>
				<form method="post" class="body">
					<fieldset>
						<legend>아이디 찾기</legend>
						<label for="userid" class="hide">E-mail 입력</label>
						<input type="text" id="userid" class="basic-txt full" placeholder="E-mail 을 입력해 주세요.">
						<button type="submit" class="btn primary full btn-submit">보내기</button>
					</fieldset>
				</form>
			</div>
		</div>
	</article> -->

	<!-- 팝업 : 비밀번호 찾기  -->
	<article id="popFindPassword" class="layer-pop pop-find-idpw" style="display: none;">
		<div class="layer-main">
			<div class="con-body">
				<header class="pop-header">
					<h1>비밀번호 찾기</h1>
					<p class="desc">등록하신 E-mail 주소를 입력하시면, <br>임시 비밀번호를 보내드립니다.</p>
					<button type="button" class="btn-layer-close">닫기</button>
				</header>
				<fieldset>
					<legend>비밀번호 찾기</legend>
					<label for="passwd" class="hide">E-mail 입력</label>
					<input type="text" name="userId" id="userPasswordSearch" class="basic-txt full" placeholder="E-mail 을 입력해 주세요.">
					<button type="button" id="passwordSearchBtn" class="btn primary full btn-submit">보내기</button>
				</fieldset>
			</div>
		</div>
	</article>
	
	<script type="text/javascript">
	$(function(){
		$("#passwordSearchBtn").on("click", function(){
			var $btn = $(this);
			var data = {
				"userId" : $("#userPasswordSearch").val()
			};
			
			$btn.text("보내기...");
			$btn.attr("disabled", true);
			
			$.post("/user/password/search", data, function(resp){
				
				if( resp == "PWD0001" ){
					alert("입력된 이메일이 없습니다.");
					$btn.text("보내기");
					$btn.attr("disabled", false);
				}
				
				if( resp == "PWD0002" ){
					alert("SNS 회원은 해당 SNS에서 찾기 바랍니다.");
					$btn.text("보내기");
					$btn.attr("disabled", false);
				}
				
				if( resp == "PWD0003" ){
					alert("회원 데이터가 존재 하지않습니다.");
					$btn.text("보내기");
					$btn.attr("disabled", false);
				}
				
				if( resp == "SUCCESS" ){
					alert("이메일로 새비밀번로 발송 되었습니다.");
					$btn.text("보내기");
					$btn.attr("disabled", false);
					$(".btn-layer-close").trigger("click");
				}
			});
		});
	});
	
	function loginOk(){
		if( Common.getQueryString("target") == null || Common.getQueryString("target") == "" ) {
    		location.href= "/main";
		} else {
			location.href= decodeURIComponent(Common.getQueryString("target"));
		}
	}
	</script>
	