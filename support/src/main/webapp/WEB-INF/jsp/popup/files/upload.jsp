<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
.my_modalTable {padding:2px; border-collapse:separate; }
.my_modalTable td {vertical-align: middle;}
.table-striped>tbody>tr:nth-child(odd)>td,
.table-striped>tbody>tr:nth-child(odd)>th{background-color:#f4f4f4}
</style>
<script>
//esc 키로 모달 창을 닫는 경우 modal dialog가 정상적으로 해제 처리 되지 않아 다시 여는 경우 화면이 깨지는 현상 발생. esc키 입력을 ufn_closeModal() 수행으로 연결
var KEYCODE_ESC = 27;
$(document).ready(function(){
	$(document).keyup(function(e) {
		  if (e.keyCode == KEYCODE_ESC){
			  e.preventDefault();
			  ufn_closeModal();
		  }
	});
});

</script>
<div background>
	<form id="fileupload" method="post" action="<c:url value='/files/upload.do' />" enctype="multipart/form-data">
		<!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
		<div class="fileupload-buttonbar">
			<div class="fileupload-buttons">
				<!-- The fileinput-button span is used to style the file input field as button -->
				<span class="fileinput-button"> <span>파일추가...</span> <input type="file" name="files[]" multiple="multiple" />
				</span>
				<button type="submit" class="start">일괄업로드</button>
				<button type="reset" class="cancel">취소</button>
				<button type="button" class="delete">일괄삭제</button>
<!-- 				<button type="button" class="download">전체 다운로드</button> -->
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
		<div class="scroll_auto margin_t5" style="height: 280px;">
			<table role="presentation" style="width: 99%;"   class="my_modalTable  table-striped" >
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="20%">
					<col width="30%">
				</colgroup>
				<tbody class="files" style="vertical-align:middle;" ></tbody>
			</table>
		</div>
		<!-- // 1/24 수정 -->
		<input type="hidden" name="atchFileId"> 
	</form>
	<!-- 	 
	<div> 
		<button id="btnApply">적용</button>
		<button id="btnModalTest">ModalTest</button>
	</div>
-->
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
        <tr class="template-download fade" >
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
		//-------------------------------------------------------------------------------------------------------------------------------------- 
	    //처음 화면 로드 시 화면이 정상적으로 뜨지 않는 현상이 간헐적으로 있어.. 임시로 이런 구문을 넣어봤음.
		$(document).ready(function(){
			$(".fileupload-buttons").hide().delay(500).slideDown(400);
		});
		//--------------------------------------------------------------------------------------------------------------------------------------     
	    //갱신(입력/삭제)등이 있는 경우에 한해 창 닫기 누르면 부모창의 동기화 전용 함수 호출(향후 시스템 성능 향상을 위해 ajax형태로 데이터를 동기화가 되도록 구현)
	    var isModified = false;
	   //-------------------------------------------------------------------------------------------------------------------------------------- 
		var fileOptions = $('#fileupload').closest('div[id^=cntr]').data('options');
// 		debugger;
		var fileIds = ''; //$.cookie('fileIds');
		if (fileIds == null || fileIds == '') {
			fileIds = unescape(fileOptions.data.FileIds);
			//$.cookie('fileIds', fileIds);
		}
		//-------------------------------------------------------------------------------------------------------------------------------------- 
		// 일괄 첨부파일 등록을 위해서 서버에서 선 id 값을 발행해서 처음 등록시점에 활용. 추가 등록인 경우는 무시 처리한다.
		var serverAtchFileId = '${serverAtchFileId}';
		$('input[name=atchFileId]').val(fileOptions.data.FileIds);
		if($('input[name=atchFileId]').val() == null || $('input[name=atchFileId]').val() == ''){
			$('input[name=atchFileId]').val(serverAtchFileId);
		}
		//-------------------------------------------------------------------------------------------------------------------------------------- 	
		$('#fileupload').fileupload({
			url : '<c:url value="/files/upload.do?Category=" />' + fileOptions.data.Category + '&AtchFileId=' + $('input[name=atchFileId]').val(),
			maxFileSize : 10000000,
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
							file.thumbnailUrl =  '<c:url value="/files/imageSrc.do?path=" />'+fileOptions.data.Category  +'/thumnails&physical='  + item.streFileNm;
						}
						files.push(file);
					}
					return files;
				} else {
					return [];
				}
			},
			started : function(e, data) {
				isModified = true;
			},
			destroyed : function(e, data) {
				isModified = true;
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
					if (files[i].streFileNm != data.Data.streFileNm) {
						newFiles.push(files[i]);
					}
				}
				//setFileIds(newFiles);
				$(this).closest('.modalContainer').data('data', newFiles);
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
				var uploadedFileId = "";
				for (var i = 0; i < data.Data.length; i++) {
					uploadedFileId = data.Data[i].atchFileId;
					files.push(data.Data[i]);
				}
				//-------------------------------------------------------------------------------------------------------------------------------------- 
				//첨부파일 하나를 최초로 올린 시점에는 fileId가 없으나 성공 이후에는 fileId를 받아와 url을 갱신해줘야 추가적인 작업시 또다른 fileId가 발번되는 것을 방지할 수 있음.
				var new_url =  '<c:url value="/files/upload.do?Category=" />' + fileOptions.data.Category + '&AtchFileId=' + uploadedFileId;
				$(this).fileupload('option', 'url', new_url);
				//-------------------------------------------------------------------------------------------------------------------------------------- 
				$(this).closest('.modalContainer').data('data', files);
			}
		});

		if (fileIds != null && fileIds != '' && fileIds != 'undefined') {
			$('#fileupload').addClass('fileupload-processing');
// 			debugger;
			$.ajax({
				url : '<c:url value="/files/getFiles.do?fileIds=" />' + fileIds,
				dataType : 'json',
				context : $('#fileupload')[0],
				error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
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
			//첨부파일을 파일 DB에서 삭제 및 등록 이후 원 데이터 테이블의 fileID에 해당하는 컬럼도 갱신, 동기화 위한 메소드 호출. parent.doFinish()는 해당 화면에서 구현한다.	
			if(isModified)
				if(fileOptions.data.Type == 'img')
					parent.doJsonSync();
				else
					parent.doSync();
		}
	</script>
</div>