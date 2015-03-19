<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp" %>

        <div class="svisual" style="background-color:#41372e;background-image:url('${contextPath}/img/Visual01.jpg'); background-position:center">
        </div><!--//svisual -->
        
        <div class="tit_wrap">
        	<div class="title area_ct">
            	<img src="${contextPath}/img/tit_customer.png" alt="고객센터"><span>Customer</span>
            	<div class="depth"><a href="#"><img src="${contextPath}/img/ico_home.png" alt="home아이콘"></a><img src="${contextPath}/img/space.png" alt=""><a href="#">고객센터</a><img src="${contextPath}/img/space.png" alt=""><a href="#">공지사항</a></div>
            </div>
        </div>
     	<div id="sub_container">
        	<div id="content-group">
        		<div id="lnb-group">
            		<ul id="lnb">
                	<li><a href="#" class="select">공지사항</a></li>
					<li><a href="#">뉴스레터</a></li>
					<li><a href="#">문의∙제안∙신고</a></li>
                    <li><a href="#">온라인도움말</a></li>
					<li><a href="#">서비스정책</a></li>
					<li><a href="#">회원정보</a></li>
                	</ul>
                    
                    <ul class="quick">
                	<li class="q1"><a href="#" title="사업소개"></a></li>
                    <li class="q2"><a href="#" title="운영메뉴얼"></a></li>
                    <li class="q3"><a href="#" title="운영지침"></a></li>
                    <li class="q4"><a href="#" title="운영서식"></a></li>
               	 	</ul>
            	</div>
            	<!--//lnb-group -->
            	
            	<div id="contents" class="bg_cs">
            		<form:form commandName="result"  id="frm" action="${contextPath}/customer/noticeInqire.do">    
	            		<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
						<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
						<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input type="hidden" name="sortType" value="<c:out value='${searchVO.sortType}'/>"/>
						<input name="nttTyCode" type="hidden" value="<c:out value='${searchVO.nttTyCode}'/>"/>
						<input name="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>"/>
						<input name="searchWrd" type="hidden" value="<c:out value='${searchVO.searchWrd}'/>"/>
						<input type="hidden" name="seq" value="<c:out value='${result.seq}'/>"/>											
								<div class="top"><a href="#"></a></div>
            		<div class="con_tit">공지사항 <span>Notice</span>
                    	<span class="ex">(재)공간정보산업진흥원에서 전하는 공지사항입니다.</span>
                    </div>

                   <ul class="tap4_wrp mt10">
                    	<li><a href="#" class="select">전체공지사항</a></li>
                        <li><a href="#">사업공고</a></li>
                        <li><a href="#">행사공지</a></li>
                        <li><a href="#">운영공지</a></li>
                    </ul>
 
 				<!------------ 20150209추가/변경--------- -->
                    <div class="view_info_lst">
                    	
                    	<ul class="lst_m">
						<c:choose>
						<c:when test="${empty isAdminRole}">
                        	<li class="mdfy br"><a href='javascript:alert("관리자만 수정할 수 있습니다.");'>수정</a></li>
                            <li class="del br"><a href='javascript:alert("관리자만  삭제할 수 있습니다.");'>삭제</a></li>
                            <li class="wrt br"><a href='javascript:alert("관리자만 삭제할 수 있습니다.");'>글쓰기</a></li>
                            <li class="minfo"><a href="#">내정보</a></li>
						</c:when>						
						<c:otherwise>
                        	<li class="mdfy br"><a href="/admin/noticeModifyPage.do?nttId=<c:out value="${result.nttId}"/>">수정</a></li>
                            <li class="del br"><a href="/admin/deleteBoardArticle.do?nttId=<c:out value="${result.nttId}"/>">삭제</a></li>
                            <li class="wrt br"><a href="#">글쓰기</a></li>
                            <li class="minfo"><a href="#">내정보</a></li>
						</c:otherwise>
						</c:choose>
                        </ul>
                        
                        <div class="ico_box_lst">
                            <ul class="ico_box">
                            <li class="face"><a href="#" title="페이스북">페이스북</a></li>
                            <li class="twitter"><a href="#" title="트위터">트위터</a></li>
                            <li class="mail"><a href="#" title="메일">메일</a></li>
                            </ul>
                            <ul class="ico_box2">
                            <li class="print"><a href="#" title="프린트">프린트</a></li>
                            <li class="url"><a href="#" title="url">url</a></li>
                            <li class="claim"><a href="#" title="신고하기">신고하기</a></li>
                            </ul>
                        </div>
                    </div>
										<div class="etc_info">
										  No.<c:out value="${result.nttNo}"/><em>|</em>Hits.<c:out value="${result.inqireCo}"/><em>|</em><c:out value="${result.frstRegisterPnttm}"/>
                    </div>
                    <!------------ //20150209추가/변경--------- -->
                    
                    <div class="bview_box">
                    	<ul>
                            <li class="full"><strong><span>제목</span></strong><span class="fcR_B"><c:out value="${result.nttSj}" /></span></li>
                            <li class="full"><strong><span>등록자</span></strong><span>관리자</span></li>
                            <li class="part"><strong><span>첨부파일</span></strong>
                           		 <div class="file_bx">
                          		    <form:hidden path="atchFileId" />
                                  	<img name="btnFileDownload" src="${contextPath}/img/btn_down2.png"    data_type="file"   alt="다운로드"> 
                                   <br>
                                    <c:import url="/files/selectFileInfsAdvence.do" charEncoding="utf-8">
									<c:param name="param_atchFileId" value="${result.atchFileId}" />
								 </c:import>	  
                            	</div>                    	
                            </li>
                            <li class="part"><strong><span>참조사이트</span></strong>
                           		 <div class="file_bx">
                            	<a href="<c:out value="${result.refrnUrl1}" />"  target="_blank"><c:out value="${result.refrnUrl1}" /></a><br>
                            	<a href="<c:out value="${result.refrnUrl2}" />" target="_blank"><c:out value="${result.refrnUrl2}" /></a><br>
                            	<a href="<c:out value="${result.refrnUrl3}" />" target="_blank"><c:out value="${result.refrnUrl3}" /></a><br>
                            	<a href="<c:out value="${result.refrnUrl4}" />" target="_blank"><c:out value="${result.refrnUrl4}" /></a><br>
                            	<a href="<c:out value="${result.refrnUrl5}" />" target="_blank"><c:out value="${result.refrnUrl5}" /></a>	<br>    
                            	</div>                    	
                            </li>
                            
                        </ul>
                        <div class="cont">
                            <p><c:out value="${result.nttCn}" escapeXml="false" /></p>
                        </div>	
                    </div>

                    <!-- //뷰 -->
 
                    
                    <!-- 뷰 -->
                    
                  <!------------ 20150209추가/변경--------- -->
                    <div class="view_info">
                    	
                    	<ul class="lst_m">
                        	<li class="mdfy br"><a href="#">수정</a></li>
                            <li class="del br"><a href="#">삭제</a></li>
                            <li class="wrt br"><a href="#">글쓰기</a></li>
                            <li class="minfo"><a href="#">내정보</a></li>
                        </ul>
                        
                        <div class="ico_box_lst">
                            <ul class="ico_box">
                            <li class="face"><a href="#" title="페이스북">페이스북</a></li>
                            <li class="twitter"><a href="#" title="트위터">트위터</a></li>
                            <li class="mail"><a href="#" title="메일">메일</a></li>
                            </ul>
                            <ul class="ico_box2">
                            <li class="print"><a href="javascript:printPopUp();" title="프린트">프린트</a></li>
                            <li class="url"><a href="#" title="url">url</a></li>
                            <li class="claim"><a href="#" title="신고하기">신고하기</a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <!--이전글다음글 -->
                    <ul class="wrt_box">
                    	<li class="prev"><strong>이전글</strong><a href='javascript:linkBeforeNextArticle(${resultBefore.seq}, ${resultBefore.nttId})'><c:out value="${resultBefore.nttSj}" /></a></li>
                        <li class="next"><strong>다음글</strong><a href='javascript:linkBeforeNextArticle(${resultNext.seq}, ${resultNext.nttId})'><c:out value="${resultNext.nttSj}" /></a></li>
                    </ul>
                    <!--// 이전글다음글 -->
   
            	     <div class="btn_wrap">
                    	<a href="javascript:linkListPage()"><img id="showNotice" src="${contextPath}/img/btn_list.png" alt="목록"></a>
                    </div>
					</form:form>
            	</div>
            	<!--//contents -->
        	</div>
        	<!--//content-group -->
		</div><!--//sub_container -->
  <script> 

   function linkListPage(){
	   $('#frm').attr('action', '${contextPath}/customer/noticeList.do'); 
	   $("#frm").submit();
   }
	// 이전/다음 게시물 클릭
	function linkBeforeNextArticle(seq, nttId){
		$("#frm input[name=seq]").val(seq);
		$("#frm input[name=nttId]").val(nttId);
		$('#frm').attr('action', '${contextPath}/customer/noticeInqire.do'); 
		$("#frm").submit();
	}
	
	// 이전/다음 게시물 클릭
	function printPopUp(){
		$('#frm').attr('action', '${contextPath}/customer/noticeInqirePopUp.do'); 
		$('#frm').attr('target', '_popUp');
		$("#frm").submit();
		$('#frm').attr('target', '_self');
	}
	
	$('[name=btnFileDownload]').click(function(e) {
		e.preventDefault();
		var category = $(this).attr('data_category');
		var $imgId = $(this).parent().find(':hidden');
		COM.openFileListPopup(category, $imgId.val());
	});
  </script>
    

