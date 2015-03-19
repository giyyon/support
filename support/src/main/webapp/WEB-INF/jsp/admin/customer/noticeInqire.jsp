<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp" %>

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
                	<li class="smenu2"><a href="/admin/noticeList.do" class="select">공지사항 관리</a></li>
                    <li class="smenu2"><a href="/admin/noticeInsertPage.do">공지사항 글쓰기</a></li>
					<li class="smenu2"><a href="#">온라인도움말 관리</a></li>
                    <li class="smenu2"><a href="#">온라인도움말 글쓰기</a></li>
                    <li class="smenu2"><a href="#">문의∙제안∙신고 관리</a></li>
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
	            	<form:form commandName="result"  id="frm" action="${contextPath}/admin/noticeInqire.do">    
	            	
	            		<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
						<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
						<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input type="hidden" name="sortType" value="<c:out value='${searchVO.sortType}'/>"/>
						<input name="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>"/>
						<input name="searchWrd" type="hidden" value="<c:out value='${searchVO.searchWrd}'/>"/>
						<input type="hidden" name="seq" value="<c:out value='${result.seq}'/>"/>											
					
								<div class="top"><a href="#"></a></div>
            		<div class="con_tit">공지사항 <span>Notice Administration</span>
                    	<span class="ex">(재)공간정보산업진흥원에서 전하는 공지사항 관리입니다.</span>
                    </div>

					<ul class="tap4_wrp mt10">	                  
	                    <li><a href= "#"  onclick=""    <c:if test="${searchVO.searchBsnsSe == '' }" > class="select"</c:if>>전체공지사항</a></li>
	                    <li><a href= "#"  onclick=""  <c:if test="${searchVO.searchBsnsSe == 'A' }"> class="select"</c:if>>특성화 고등학교</a></li>
	                    <li><a href= "#"  onclick=""  <c:if test="${searchVO.searchBsnsSe == 'B' }"> class="select"</c:if>>특성화 대학원</a></li>
	                    <li><a href= "#"  onclick=" "  <c:if test="${searchVO.searchBsnsSe == 'C' }"> class="select"</c:if>>온라인 교육센터</a></li>    	                    
	                </ul>
 
 				<!------------ 20150209추가/변경--------- -->
                    <div class="view_info_lst">
                    	
                    	<ul class="lst_m">
                        	<li class="mdfy br"><a href="javascript:goModify();">수정</a></li>
                            <li class="del br"><a href="/admin/deleteBoardArticle.do?nttId=<c:out value="${result.nttId}"/>">삭제</a></li>
                            <li class="wrt br"><a href="/admin/noticeInsertPage.do">글쓰기</a></li>
                        </ul>
                        
                        <div class="ico_box_lst">
                            <ul class="ico_box2">
                            <li class="print"><a href="#" title="프린트">프린트</a></li>
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
                            <li class="part2"><strong><span>등록자</span></strong><span><c:out value="${result.frstRegisterNm}" /></span></li>
                            <li class="part2"><strong><span>편집자</span></strong><span><c:out value="${result.lastUpdusrNm}" /></span></li>
                            <li class="part2"><strong><span>수정일</span></strong><span><c:out value="${result.lastUpdusrPnttm}" /></span></li>
                            <li class="part"><strong><span>첨부파일</span></strong>
                          		 <div class="file_bx">
                          		    <form:hidden path="atchFileId" />
                                  	<img name="btnFileDownload" src="${contextPath}/img/btn_down2.png"    data_type="file"   alt="다운로드"> 
                                   <br>
                                    <c:import url="/files/selectFileInfsAdvence.do" charEncoding="utf-8">
									<c:param name="param_atchFileId" value="${result.atchFileId}" />
								 </c:import>	 
                                   </span> 
                           	</div>                    	
                            </li>
                            <li class="part"><strong><span>참조사이트</span></strong>
                           		 <div class="file_bx">
                           		 <c:if test="${result.refrnUrl1 != null && result.refrnUrl1 != ''}"><a href='<c:out value="${result.refrnUrl1}" />'  target="_blank"><c:out value="${result.refrnUrl1}" /></a><br></c:if>
                            	<c:if test="${result.refrnUrl2 != null &&  result.refrnUrl2 != ''}"><a href='<c:out value="${result.refrnUrl2}" />'  target="_blank"><c:out value="${result.refrnUrl2}" /></a><br></c:if>
                            	<c:if test="${result.refrnUrl3 != null &&  result.refrnUrl3 != ''}"><a href='<c:out value="${result.refrnUrl3}" />'  target="_blank"><c:out value="${result.refrnUrl3}" /></a><br></c:if>
                            	<c:if test="${result.refrnUrl4 != null &&  result.refrnUrl4 != ''}"><a href='<c:out value="${result.refrnUrl4}" />'  target="_blank"><c:out value="${result.refrnUrl4}" /></a><br></c:if>
                            	<c:if test="${result.refrnUrl5 != null &&  result.refrnUrl5 != ''}"><a href='<c:out value="${result.refrnUrl5}" />'  target="_blank"><c:out value="${result.refrnUrl5}" /></a><br></c:if>
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
                        </ul>
                        
                           <div class="ico_box_lst">
                         	<ul class="ico_box2">
                            <li class="print"><a href="#" title="프린트">프린트</a></li>
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
	   $('#frm').attr('action', '${contextPath}/admin/noticeList.do'); 
	   $("#frm").submit();
   }

   
   function goModify(){
	   $('#frm').attr('action', '${contextPath}/admin/noticeModifyPage.do'); 
	   $("#frm").submit();
   }

   function goDelete(){
	   $('#frm').attr('action', '${contextPath}/admin/noticeDeletePage.do'); 
	   $("#frm").submit();
   }

   // 이전/다음 게시물 클릭
	function linkBeforeNextArticle(seq, nttId){
		$("#frm input[name=seq]").val(seq);
		$("#frm input[name=nttId]").val(nttId);
		$('#frm').attr('action', '${contextPath}/admin/noticeInqire.do'); 
		$("#frm").submit();
	}
	
	// 이전/다음 게시물 클릭
	function printPopUp(){
		$('#frm').attr('action', '${contextPath}/admin/noticeInqirePopUp.do'); 
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
    

