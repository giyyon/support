<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

%>

<script type="text/javascript">

	function fn_egov_downFile(atchFileId, fileSn){
		window.open("<c:url value='/files/download.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"'/>");
	}
	$(document).ready(function(){
		var size = "("+BIT.formatFileSize($(".calSize").attr("fileSize"))+")";
		$(".calSize").append(size);;  
	});
</script>

<!--<title>파일목록</title> -->

	<table>
		<c:forEach var="fileVO" items="${fileList}" varStatus="status">
		<tr>
			<td>
					<div class="calSize"  fileSize='${fileVO.fileMg}'> <c:out value="${fileVO.orignlFileNm}"/>&nbsp; </div>
			</td>
		</tr>
		</c:forEach>
		<c:if test="${fn:length(fileList) == 0}">
			<tr>
				<td></td>
			</tr>
	    </c:if>
	</table>
