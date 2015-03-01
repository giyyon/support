<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<form id="fileupload" method="post" action="<c:url value='/files/upload.do' />" enctype="multipart/form-data">
		<!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
		<div class="fileupload-buttonbar">
			<div class="fileupload-buttons">
				<!-- The fileinput-button span is used to style the file input field as button -->
				<span class="fileinput-button"> <span>파일추가...</span> <input type="file" name="files[]" multiple="multiple" />
				</span>
				<button type="submit" class="start">업로드</button>
				<button type="reset" class="cancel">취소</button>
				<button type="button" class="delete">삭제</button>
				<button type="button" class="download">전체 다운로드</button>
				<input type="checkbox" class="toggle" />
				<!-- The global file processing state -->
				<span class="fileupload-process"></span>
			</div>
			<!-- The global progress state -->
			<div class="fileupload-progress fade" style="display: none">
				<!-- The global progress bar -->
				<div class="progress" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
				<!-- The extended global progress state -->
				<div class="progress-extended">&nbsp;</div>
			</div>
		</div>
		<!-- The table listing the files available for upload/download -->
		<!-- form 내부에 있어야 함. -->
		<div class="scroll_auto margin_t5" style="height: 145px;">
			<table role="presentation" style="width: 99%;">
				<colgroup>
					<col width="25%">
					<col width="35%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<tbody class="files"></tbody>
			</table>
		</div>
		<!-- // 1/24 수정 -->
	</form>
	<!-- 	 -->
	<div> 
		<button id="btnApply">적용</button>
		<button id="btnModalTest">ModalTest</button>
	</div>

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

		var fileIds = $.cookie('fileIds');
		if (fileIds == null || fileIds == '') {
			fileIds = unescape(fileOptions.data.FileIds);
			$.cookie('fileIds', fileIds);
		}
		
		$('#btnModalTest').click(function(e) {
			e.preventDefault();
			COM.openFileListPopup('Sample', $.cookie('fileIds'));
		});

		$('#fileupload').fileupload({
			url : '<c:url value="/files/upload.do?Category=" />' + fileOptions.data.Category,
			maxFileSize : 1000000,
			maxNumberOfFiles : parseInt(fileOptions.data.Max),
			acceptFileTypes : fileOptions.data.Accept == null ? new RegExp('') : new RegExp('(.|)(' + unescape(fileOptions.data.Accept) + ')$'),
			getFilesFromResponse : function(responseText) {
				if (responseText.result) {
					responseText = responseText.result;
				}
				if (responseText.IsSucceed) {
					var files = new Array();
					for (var i = 0; i < responseText.Data.length; i++) {
						var item = responseText.Data[i];
						debugger;
						var file = {
							fileRef : item,
							fileId : item.fileId,
							name : decodeURIComponent(item.realName),
							url : '<c:url value="/files/download.do?" />' + $(item).convertQueryStrings(),
							size : parseInt(item.size),
							deleteType : 'post',
							deleteUrl : '<c:url value="/files/remove.do?" />' + $(item).convertQueryStrings()
						};
						if (item.hasThumnail) {
							file.thumbnailUrl =  '<c:url value="/webAttach/thumnails/" />' + item.virtualName;
						}
						files.push(file);
					}
					return files;
				} else {
					return [];
				}
			},
			destroyed : function(e, data) {
				if (data.result) {
					data = data.result;
				}
				if (data.Data == null) {
					return;
				}
				var files = $(this).closest('.modalContainer').data('data');
				var newFiles = [];
				for (var i = 0; i < files.length; i++) {
					if (files[i].fileId != data.Data.fileId) {
						newFiles.push(files[i]);
					}
				}
				setFileIds(newFiles);
				$(this).closest('.modalContainer').data('data', newFiles);
			},
			completed : function(e, data) {
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
				setFileIds(files);
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
			$.cookie('fileIds', fileIds);
		};

		$('#btnApply').click(function() {
			BIT.modalDialogCloseClick('modalApply', fileOptions.data.containerId);
			$.cookie('fileIds', '');
		});
	</script>
</div>