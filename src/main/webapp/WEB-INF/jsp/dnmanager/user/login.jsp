<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Deep Night Admin - ${title}</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="/ace/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="/ace/assets/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="/ace/assets/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="/ace/assets/css/ace.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="/ace/assets/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="/ace/assets/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="/ace/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="/ace/assets/js/html5shiv.min.js"></script>
		<script src="/ace/assets/js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body class="login-layout">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="ace-icon fa fa-leaf green"></i>
									<span class="white" id="id-text2">Deep Night Admin</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; Deep Night Website</h4>
							</div>

							<div class="space-6"></div>
							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-coffee green"></i>
												Please Enter Your Information
											</h4>
											<div class="space-6"></div>
											<form action="/dnmanager/user/auth-login" class="login-frm" method="post" >
											<input type="hidden" id="target" name="target" value="${target}" />
												<section class="login">
													<fieldset>
														<label class="block clearfix userid">
															<span class="block input-icon input-icon-right">
																<input type="text" class="basic-txt form-control userid" name="loginId" id="loginId" title="ID" placeholder="Id" value=""/>
																<i class="ace-icon fa fa-user"></i>
															</span>
														</label>
	
														<label class="block clearfix passwd">
															<span class="block input-icon input-icon-right">
																<input type="password" class="basic-txt form-control passwd" name="password" id="password" title="PW" placeholder="Password" value="" />
																<i class="ace-icon fa fa-lock"></i>
															</span>
														</label>
	
														<div class="space"></div>
	 
														<div class="clearfix">
															<button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
																<i class="ace-icon fa fa-key"></i>
																<span class="bigger-110">Login</span>
															</button>
														</div>
	
														<div class="space-4"></div>
													</fieldset>
												</section>
											</form>
										</div><!-- /.widget-main -->
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->
							</div><!-- /.position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="/ace/assets/js/jquery-2.1.4.min.js"></script>
		<script src="/content/js/adns.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
			<script src="/ace/assets/js/jquery-1.11.3.min.js"></script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			$(function(){
 				if( Common.getQueryString("error") != null && Common.getQueryString("error") != "" ){
 					alert("회원아이디 또는 비밀번호가 다릅니다.");
 				} 	
 			}); 
			
			//you don't need this, just used for changing bawckground
			jQuery(function($) {
				$('body').attr('class', 'login-layout light-login');
				$('#id-text2').attr('class', 'grey');
				$('#id-company-text').attr('class', 'blue');
			});
			
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
	</body>
</html>

