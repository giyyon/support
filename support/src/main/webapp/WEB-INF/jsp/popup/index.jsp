<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/taglib.jsp" %>
<p>
	<a href="<c:url value='/rpnsample/account/loginPage.do'/>"> 로그인 페이지 </a>
</p>
<p>
	<a href="<c:url value='/rpnsample/validator/index.do'/>"> Validator Sample </a>
</p>
<p>
	<a id="btnFileUpload" href="#"> FileUpload </a>
</p>
<p>
	filename <input type="text" id="fileNames" value="" disabled="disabled"> fileId <input type="text" id="fileIds" value="" disabled="disabled">
	<!-- filename <input type="text" id="fileName" value="test1.jpg,test2.jpg,test3.jpg,test4.jpg" > fileId <input type="text" id="fileIds" value="1,2,3,4" > -->
</p>
<p>
	<a id="btnFileDownload" href="#"> FileDownload </a>
</p>
<p>
	<a href="<c:url value='/rpnsample/exceldownload/index.do'/>"> ExselDown Sample </a>
</p>
<p>
	<a href="<c:url value='/rpnsample/errorLog/errorLogList.do'/>"> ErrorLogList Sample </a>
</p>
<p>
	<a href="<c:url value='/rpnsample/doubleSubmit/doubleSubmit.do'/>"> Double Submit </a>
</p>

<script type="text/javascript">
	$('#btnFileUpload').click(function(e) {
		e.preventDefault();
		var options = {
			url : '<c:url value="/files/uploadPage.do" />',
			width : 510,
			height : 300,
			closeCallback : closeCallback,
			title : 'Files',
			data : {
				Category : 'Sample',
				Accept : 'jpg|jpeg|png|bmp|gif',
				Max : 10,
				FileIds : $('#fileIds').val()
			},
			buttonType : 0
		};
		var $dialog = BIT.modalDialog(options);
		function closeCallback(returnValue) {
			if (returnValue != null && returnValue.length > 0) {
				var files = returnValue;
				var fileIds = '';
				var fileNames = '';
				for (var i = 0; i < files.length; i++) {
					if (fileIds) {
						fileIds += ',' + files[i].fileId;
						fileNames += ',' + files[i].realName;
					} else {
						fileIds = files[i].fileId;
						fileNames = files[i].realName;
					}
				}
				$('#fileIds').val(fileIds);
				$('#fileNames').val(fileNames);
			} else {
				$('#fileIds').val('');
				$('#fileNames').val('');
			}
		}
	});

	$('#btnFileDownload').click(function(e) {
		e.preventDefault();
		COM.openFileListPopup('Sample', $('#fileIds').val());
	});
</script>