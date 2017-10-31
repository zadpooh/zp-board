<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<tiles:insertAttribute name="header" />
	</head>

	<body class="no-skin">
		
		<div id="navbar" class="navbar navbar-default          ace-save-state">
			<tiles:insertAttribute name="top" />	
		</div>

		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>

			<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
				<tiles:insertAttribute name="left" />
			</div>

			<div class="main-content">
				<tiles:insertAttribute name="body" />
			</div><!-- /.main-content -->

			<div class="footer">
				<tiles:insertAttribute name="bottom" />
			</div>
			
			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

	<!-- basic scripts -->

	<script type="text/javascript">
		if('ontouchstart' in document.documentElement) document.write("<script src='/ace/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
	</script>
	<script src="/ace/assets/js/bootstrap.min.js"></script>
	<script src="/ace/assets/js/jquery.dataTables.min.js"></script>
	<script src="/ace/assets/js/jquery.dataTables.bootstrap.min.js"></script>
	<script src="/ace/assets/js/dataTables.buttons.min.js"></script>
	<script src="/ace/assets/js/dataTables.select.min.js"></script>

	<!-- page specific plugin scripts -->

	<!--[if lte IE 8]>
	  <script src="/ace/assets/js/excanvas.min.js"></script>
	<![endif]-->

	<!-- ace scripts -->
	<script src="/ace/assets/js/ace-elements.min.js"></script>
	<script src="/ace/assets/js/ace.min.js"></script>
	</body>
</html>

