<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="page" 	tagdir="/WEB-INF/tags/page"%>

<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li> 
					<i class="ace-icon glyphicon glyphicon-edit"></i>
					<a href="#">게시판 관리</a>
				</li> 
			</ul><!-- /.breadcrumb -->
		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					게시판 관리 리스트
				</h1>
			</div><!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
			</div><!-- /.row -->
		</div><!-- /.page-content --> 
	</div> 
</div><!-- /.main-content -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>

<script type="text/javascript">
$(document).ready(function() {
	
    Common.layoutPopup(".dtl,#createBtn");
    Common.modalReload("#myModal","N");

    $(".deleteBtn").on("click", function(){
    	if(confirm("데이터를 삭제 하시겠습니까?")){
			var data = {
				"boardId" : $(this).data("boardId")
			}

			$.post("/adnsmanager/board/delete-action", data, function(resp){
				if( resp == "SUCCESS" ){
					alert("데이터가 삭제 되었습니다.");
					location.reload();
				}
			});
    	}
    });

});
</script>
