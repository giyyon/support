<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<form id="fileupload">
		<div class="fileupload-buttonbar">
			<div class="fileupload-buttons">
				<button class="download ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary" role="button" aria-disabled="false" type="button">
					<span class="ui-button-icon-primary ui-icon ui-icon-arrowreturnthick-1-s"></span> <span class="ui-button-text">전체 다운로드</span>
				</button>
			</div>
		</div>
		<!-- The table listing the files available for upload/download -->
		<!-- 1/24 수정 -->
		<div class="margin_t5" style="height: 200px; overflow: auto;">
			<table role="presentation" style="width: 99%;">
				<colgroup>
					<col width="25%">
					<col width="45%">
					<col width="30%">
				</colgroup>
				<tbody class="files"></tbody>
			</table>
		</div>
		<!-- // 1/24 수정 -->
	</form>
	<script type="text/javascript">
		var fileOptions = $('#fileupload').closest('div[id^=cntr]').data('options');

		fileIds = unescape(fileOptions.data.FileIds);

		if (fileIds != null && fileIds != '') {
			BIT.callAjax('<c:url value="/rpnsample/files/getFiles.do" />', 'GET', {
				fileIds : fileIds
			}, function(responseText) {
				var $body = $('.files');
				var files = responseText.Data;
				var html = '';
				for (var i = 0; i < files.length; i++) {
					var $tr = $('<tr></tr>');
					html = '   <td>';
					if (files[i].hasThumnail || files[i].hasThumnail == 'true') {
						html += '       <span class="preview">';
						html += '        <span style="cursor:pointer"><img src="<c:url value="/uploadFiles/thumnails/"/>' + files[i].virtualName + '"></span>';
						html += '       </span>';
					}
					html += '   </td>';
					html += '   <td>';
					html += '       <p class="name">';
					html += '       <a href="<c:url value="/rpnsample/files/download.do?" />' + $(files[i]).convertQueryStrings() + '" title="' + files[i].realName + '" class="fileDownload" download="' + files[i].realName + '" data-gallery>' + files[i].realName + '</a>';
					html += '       </p>';
					html += '   </td>';
					html += '   <td>';
					html += '       <span class="size">' + BIT.formatFileSize(files[i].size) + '</span>';
					html += '   </td>';
					$tr.append(html);
					$tr.data('file', files[i]);
					$body.append($tr);
				}
			});
		};

		$(".files").on("click", '.preview span', function(e) {
			var file = $(this).closest('tr').data('file');
			BIT.showImage("<c:url value='/uploadFiles/' />" + file.category + "/" + file.virtualName, file.width, file.height);
		});

		$('.download').click(function() {
			$('.fileDownload').multiDownload();
		});

		$('#div_close').click(function() {
			$.cookie('fileIds', '');
		});
	</script>
</div>
