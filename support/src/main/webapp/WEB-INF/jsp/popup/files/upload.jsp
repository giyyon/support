<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootstrap styles -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Generic page styles -->
<link rel="stylesheet" href="http://blueimp.github.io/jQuery-File-Upload/css/style.css">
<!-- blueimp Gallery styles -->
<link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet" href="http://blueimp.github.io/jQuery-File-Upload/css/jquery.fileupload.css">
<link rel="stylesheet" href="http://blueimp.github.io/jQuery-File-Upload/css/jquery.fileupload-ui.css">
<!-- CSS adjustments for browsers with JavaScript disabled -->

<div>
	<form id="fileupload" action="http://jquery-file-upload.appspot.com/" method="POST" enctype="multipart/form-data">
        <!-- Redirect browsers with JavaScript disabled to the origin page -->
        <noscript>&lt;input type="hidden" name="redirect" value="https://blueimp.github.io/jQuery-File-Upload/"&gt;</noscript>
        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
        <div class="row fileupload-buttonbar">
            <div class="col-lg-7">
                <!-- The fileinput-button span is used to style the file input field as button -->
                <span class="btn btn-success fileinput-button">
                    <i class="glyphicon glyphicon-plus"></i>
                    <span>Add files...</span>
                    <input type="file" name="files[]" multiple="">
                </span>
                <button type="submit" class="btn btn-primary start">
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Start upload</span>
                </button>
                <button type="reset" class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel upload</span>
                </button>
                <button type="button" class="btn btn-danger delete">
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Delete</span>
                </button>
                <input type="checkbox" class="toggle">
                <!-- The global file processing state -->
                <span class="fileupload-process"></span>
            </div>
            <!-- The global progress state -->
            <div class="col-lg-5 fileupload-progress fade">
                <!-- The global progress bar -->
                <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                    <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                </div>
                <!-- The extended global progress state -->
                <div class="progress-extended">&nbsp;</div>
            </div>
        </div>
        <!-- The table listing the files available for upload/download -->
        <table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>

		<!-- // 1/24 수정 -->
		<input type="hidden" name="atchFileId"> 
	</form>

	<!-- The template to display files available for upload -->
	<script id="template-upload" type="text/x-tmpl">
    {% for (var i=0, file; file=o.files[i]; i++) { %}
        <tr class="template-upload fade">
            <td>
                <span class="preview"></span>
            </td>
            <td>
                <p class="name">{%=file.name%}</p>
                <strong class="error"></strong>
            </td>
            <td>
                <p class="size">Processing...</p>
                <div class="progress"></div>
            </td>
            <td class="right"><!-- 1/24 수정 -->
                {% if (!i && !o.options.autoUpload) { %}
                    <button class="start">업로드</button>
                {% } %}
                {% if (!i) { %}
                    <button class="cancel">취소</button>
                {% } %}
            </td>
        </tr>
    {% } %}
    </script>
	<!-- The template to display files available for download -->
	<script id="template-download" type="text/x-tmpl">
    {% for (var i=0, file; file=o.files[i]; i++) { %}
        <tr class="template-download fade">
            <td>
                <span class="preview">
                    {% if (file.thumbnailUrl) { %}
                        <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                    {% } %}
                </span>
            </td>
            <td>
                <p class="name">
                    <a href="{%=file.url%}" title="{%=file.name%}" class="fileDownload" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                </p>
                {% if (file.error) { %}
                    <div><span class="error">Error</span> {%=file.error%}</div>
                {% } %}
            </td>
            <td>
                <span class="size">{%=o.formatFileSize(file.size)%}</span>
            </td>
            <td  class="right"><!-- 1/24 수정 -->
                <button class="delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>Delete</button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            </td>
        </tr>
    {% } %}
    </script>
	<script type="text/javascript">
		var fileOptions = $('#fileupload').closest('div[id^=cntr]').data('options');
// 		debugger;
		var fileIds = ''; //$.cookie('fileIds');
		if (fileIds == null || fileIds == '') {
			fileIds = unescape(fileOptions.data.FileIds);
			//$.cookie('fileIds', fileIds);
		}

		$('#fileupload').fileupload({
			url : '<c:url value="/files/upload.do?Category=" />' + fileOptions.data.Category + '&atchFileId=' + $('[name=atchFileId]').val(),
			maxFileSize : 1000000,
			maxNumberOfFiles : parseInt(fileOptions.data.Max),
			acceptFileTypes : fileOptions.data.Accept == null ? new RegExp('') : new RegExp('(.|)(' + unescape(fileOptions.data.Accept) + ')$'),
			getFilesFromResponse : function(responseText) {
				if (responseText.result) {
					responseText = responseText.result;
				}
				if (responseText.IsSucceed) {
// 					debugger;
					var files = new Array();
					for (var i = 0; i < responseText.Data.length; i++) {
						var item = responseText.Data[i];
						var file = {
							fileRef : item,
							fileId : item.fileId,
							name : decodeURIComponent(item.orignlFileNm),
							url : '<c:url value="/files/download.do?" />' + $(item).convertQueryStrings(),
							size : parseInt(item.fileMg),
							deleteType : 'post',
							deleteUrl : '<c:url value="/files/remove.do?" />' + $(item).convertQueryStrings()
						};
						if (fileOptions.data.Type == "img") {
							file.thumbnailUrl =  '<c:url value="/webAttach/thumnails/" />' + item.streFileNm;
						}
						files.push(file);
					}
					return files;
				} else {
					return [];
				}
			},
			destroyed : function(e, data) {
// 				debugger;
				if (data.result) {
					data = data.result;
				}
				if (data.Data == null) {
					return;
				}
				var files = $(this).closest('.modalContainer').data('data');
				var newFiles = [];
				for (var i = 0; i < files.length; i++) {
					if (files[i].atchFileId != data.Data.atchFileId) {
						newFiles.push(files[i]);
					}
				}
				//setFileIds(newFiles);
				$(this).closest('.modalContainer').data('data', newFiles);
				
			parent.isDeleteFinish();
			},
			completed : function(e, data) {
// 				debugger;
				if (data.result) {
					data = data.result;
				}
				var files = $(this).closest('.modalContainer').data('data');
				if (files == null) {
					files = [];
				}
				for (var i = 0; i < data.Data.length; i++) {
					files.push(data.Data[i]);
				}
				//+setFileIds(files);
				$('[name=atchFileId]').val('');
				$(this).closest('.modalContainer').data('data', files);
			}
		});

		if (fileIds != null && fileIds != '' && fileIds != 'undefined') {
			$('#fileupload').addClass('fileupload-processing');
			$.ajax({
				url : '<c:url value="/files/getFiles.do?fileIds=" />' + fileIds,
				dataType : 'json',
				context : $('#fileupload')[0]
			}).always(function() {
				$(this).removeClass('fileupload-processing');
			}).done(function(responseText) {
				$(this).fileupload('option', 'done').call(this, $.Event('done'), responseText);
			});
		};

		function setFileIds(files) {
			var fileIds = '';
			for (var i = 0; i < files.length; i++) {
				if (i == files.length - 1) {
					fileIds += files[i].fileId;
				} else {
					fileIds += files[i].fileId + ',';
				}
			}
			//$.cookie('fileIds', fileIds);
		};

		$('#btnApply').click(function() {
			//BIT.modalDialogCloseClick('modalApply', fileOptions.data.containerId);
			//$.cookie('fileIds', '');
		});
		
		function ufn_closeModal(){
			BIT.modalDialogCloseClick('modalApply', fileOptions.data.containerId);
		}
	</script>
</div>