<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">메인관리</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    메인관리 슬라이더 관리
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class="page-content">
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="widget-box">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div>
                                                <div class="filebox preview-image">
                                                </div>
                                                <label for="boardTitle">
                                                    내용:
                                                </label>
                                                <input type="text" id="boardTitle" placeholder="Title" class="form-control" class="form-control col-xs-10 col-sm-5" value="${boardDetail.boardTitle}" />
                                            </div>
                                            <hr />
                                            <div>
                                                <label for="input-file">
                                                    파일
                                                </label>
                                                <input type="file" id="input-file" class="upload-hidden" name="uploadFile" accept="image/*">
                                            </div>
                                            <hr />

                                            <div class="form-actions center">
                                                <button  class="btn btn-info" type="button" id="process">
                                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                                    저장
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="widget-box">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div>
                                                <div class="filebox preview-image">
                                                </div>
                                                <label for="boardTitle">
                                                    내용:
                                                </label>
                                                <input type="text" id="boardTitle" placeholder="Title" class="form-control" class="form-control col-xs-10 col-sm-5" value="${boardDetail.boardTitle}" />
                                            </div>
                                            <hr />
                                            <div>
                                                <label for="input-file">
                                                    파일
                                                </label>
                                                <input type="file" id="input-file" class="upload-hidden" name="uploadFile" accept="image/*">
                                            </div>
                                            <hr />

                                            <div class="form-actions center">
                                                <button  class="btn btn-info" type="button" id="process">
                                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                                    저장
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="widget-box">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div>
                                                <div class="filebox preview-image">
                                                </div>
                                                <label for="boardTitle">
                                                    내용:
                                                </label>
                                                <input type="text" id="boardTitle" placeholder="Title" class="form-control" class="form-control col-xs-10 col-sm-5" value="${boardDetail.boardTitle}" />
                                            </div>
                                            <hr />
                                            <div>
                                                <label for="input-file">
                                                    파일
                                                </label>
                                                <input type="file" id="input-file" class="upload-hidden" name="uploadFile" accept="image/*">
                                            </div>
                                            <hr />

                                            <div class="form-actions center">
                                                <button  class="btn btn-info" type="button" id="process">
                                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                                    저장
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- PAGE CONTENT ENDS -->
                </div><!-- /.col -->
            </div><!-- /.row -->
            <div class="page-header">
                <h1>
                    메인관리 이미지 관리
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class="page-content">
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="widget-box">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div>
                                                <div class="filebox preview-image">
                                                </div>
                                                <label for="boardTitle">
                                                    내용:
                                                </label>
                                                <input type="text" id="boardTitle" placeholder="Title" class="form-control" class="form-control col-xs-10 col-sm-5" value="${boardDetail.boardTitle}" />
                                            </div>
                                            <hr />
                                            <div>
                                                <label for="input-file">
                                                    파일
                                                </label>
                                                <input type="file" id="input-file" class="upload-hidden" name="uploadFile" accept="image/*">
                                            </div>
                                            <hr />

                                            <div class="form-actions center">
                                                <button  class="btn btn-info" type="button" id="process">
                                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                                    저장
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- PAGE CONTENT ENDS -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<%--<form enctype="multipart/form-data" name="form">
    <div class="widget-box">
        <div class="widget-body">
            <div class="widget-main">
                <div>
                    <div class="filebox preview-image">
                    </div>
                    <label for="boardTitle">
                        내용:
                    </label>
                    <input type="text" id="boardTitle" placeholder="Title" class="form-control" class="form-control col-xs-10 col-sm-5" value="${boardDetail.boardTitle}" />
                </div>
                <hr />
                <div>
                    <label for="input-file">
                        파일
                    </label>
                    <input type="file" id="input-file" class="upload-hidden" name="uploadFile" accept="image/*">
                </div>
                <hr />

                <div class="form-actions center">
                    <button  class="btn btn-info" type="button" id="process">
                        <i class="ace-icon fa fa-check bigger-110"></i>
                        저장
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>--%>

<script type="text/javascript">
    $(function(){

        var imgTarget = $('.upload-hidden');

        imgTarget.on('change', function(){
            console.log("A");
            /* var parent = $(this).parent();
             parent.children('.upload-display').remove(); */
            var parent = $(".preview-image");
            if(window.FileReader){
                //image 파일만
                //if (!$(this)[0].files[0].type.match(/image\//)) return;
                var reader = new FileReader();
                reader.onload = function(e){
                    var src = e.target.result;
                    parent.html('<div class="upload-display" style="width:100%; height: 200px;"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb" width="100%" height="200px" /></div></div>');
                }

                reader.readAsDataURL($(this)[0].files[0]);
            } else {

                $(this)[0].select();
                $(this)[0].blur();
                var imgSrc = document.selection.createRange().text;

                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
                var img = $(this).siblings('.upload-display').find('img');
                img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";
            }
        });

        function showErrorAlert (reason, detail) {
            var msg='';
            if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
            else {
                //console.log("error uploading file", reason, detail);
            }
            $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+
                '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
        }

    });

</script>