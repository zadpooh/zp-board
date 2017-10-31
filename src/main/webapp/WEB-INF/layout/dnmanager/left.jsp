<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<ul class="nav nav-list">
		<li class=""> 
			<a href="/dnmanager/main/config">
				<i class="menu-icon fa fa-users"></i>
				<span class="menu-text"> 메인 관리</span>
			</a>

			<b class="arrow"></b>
		</li>
		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-desktop"></i>
				<span class="menu-text"> 게시판 관리 </span>

				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow"></b>

			<ul class="submenu">
				<li class="">
					<a href="/dnmanager/board-config/list">
						<i class="menu-icon fa fa-caret-right"></i>
						게시판 설정
					</a>

					<b class="arrow"></b>
				</li>

				<%--<li class="">
					<a href="/dnmanager/category-config/request-list">
						<i class="menu-icon fa fa-caret-right"></i>
						카테고리 관리
					</a>

					<b class="arrow"></b>
				</li>--%>

				<li class="">
					<a href="/dnmanager/board/list">
						<i class="menu-icon fa fa-caret-right"></i>
						게시글 관리
					</a>

					<b class="arrow"></b>
				</li>
			</ul>
		</li>
	</ul><!-- /.nav-list -->
	
<script type="text/javascript">
var pathname = location.pathname;

$(".nav-list > li > a").each(function(){
	if( $(this).attr("href") == pathname ) {
		$(this).parent().addClass("active");
	}
});

$(".submenu > li > a").each(function(){
	if( $(this).attr("href") == pathname ) {
		$(this).parent().addClass("active");
		$(this).parent().parent().parent().addClass("active open")
	} 
});

</script>
