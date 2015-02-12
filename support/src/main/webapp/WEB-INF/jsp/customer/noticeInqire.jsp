<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp" %>

    <div id="container">  	
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
               
            	
           		<div class="layer">
					<div class="bg"></div>
					<div id="layer2" class="pop-layer">
						<div class="pop-container">
							<div class="pop-conts">
								<!--content //-->
								<p class="ctxt mb20"><strong><span></span></strong><br>
								</p>
								<div class="layerContent"></div>
								<div class="btn-r">
									<a href="#" class="cbtn">Close</a>
								</div>
								<!--// content-->
							</div>
						</div>
					</div>
				</div>
            	
            	
            	<div id="contents" class="bg_cs">
	            	<form id="frm" method="post"  action="${contextPath}/customer/noticeInqire.do"/>
	            		<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
						<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
						<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input type="hidden" name="sortType" value="<c:out value='${searchVO.sortType}'/>"/>
						<input name="nttTyCode" type="hidden" value="<c:out value='${searchVO.nttTyCode}'/>"/>
						<input name="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>"/>
						<input name="searchWrd" type="hidden" value="<c:out value='${searchVO.searchWrd}'/>"/>
						<input type="hidden" name="seq" value="<c:out value='${result.seq}'/>"/>											
					</form>
            		<div class="con_tit">공지사항 <span>Notice</span>
                    	<span class="ex">공간정보산업진흥원에서 전하는 공지사항입니다.</span>
                    </div>

                    
                    <!-- 뷰 -->
                    <div class="view_info mtf5 mb5">
                    	No.<c:out value="${result.nttId}"/><em>|</em>Hits.<c:out value="${result.inqireCo}"/><em>|</em><c:out value="${result.frstRegisterPnttm}"/>
                        <div class="ico_box_w">
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
                    <div class="bview_box">
                    	<ul>
                            <li class="full"><strong><span>제목</span></strong><span><b><c:out value="${result.nttSj}" /></b> </span></li>
                
                            <li class="full"><strong><span>등록자</span></strong><span>관리자</span></li>
                            <li class="full"><strong><span>첨부파일</span></strong>
	                            <c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
									<c:param name="param_atchFileId" value="${result.atchFileId}" />
								</c:import>			
                            </li>
                            <li class="full"><strong><span>참조사이트</span></strong>
                            	<span><a href="<c:out value="${result.refrnUrl1}" />"  target="_blank"><c:out value="${result.refrnUrl1}" /></a></span>
                            	<span><a href="<c:out value="${result.refrnUrl2}" />" target="_blank"><c:out value="${result.refrnUrl2}" /></a></span>
                            	<span><a href="<c:out value="${result.refrnUrl3}" />" target="_blank"><c:out value="${result.refrnUrl3}" /></a></span>
                            	<span><a href="<c:out value="${result.refrnUrl4}" />" target="_blank"><c:out value="${result.refrnUrl4}" /></a></span>
                            	<span><a href="<c:out value="${result.refrnUrl5}" />" target="_blank"><c:out value="${result.refrnUrl5}" /></a></span>
                            	
                            </li>
                            
                        </ul>
                        <div class="cont">
                            <p><c:out value="${result.nttCn}" escapeXml="false" /></p>
                        </div>	
                    </div>

                    <!-- //뷰 -->
                    <!--ico_box -->
                    <div class="view_info mtf5 mb5">
                        <div class="ico_box_w">
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
                    </div><!--//ico_box -->
                    
                    <!--이전글다음글 -->
                    <ul class="wrt_box">
                    	<li class="prev"><strong>이전글</strong><a href='javascript:linkBeforeNextArticle(${resultBefore.seq}, ${resultBefore.nttId})'><c:out value="${resultBefore.nttSj}" /></a></li>
                        <li class="next"><strong>다음글</strong><a href='javascript:linkBeforeNextArticle(${resultNext.seq}, ${resultNext.nttId})'><c:out value="${resultNext.nttSj}" /></a></li>
                    </ul>
                    <!--// 이전글다음글 -->
            	</div>
            	<!--//contents -->
            	     <div class="btn_wrap">
                    	<a href="javascript:linkListPage()"><img id="showNotice" src="${contextPath}/img/btn_list.png" alt="목록"></a>
                    </div>
        	</div>
        	<!--//content-group -->
		</div><!--//sub_container -->
    </div><!--//container -->
 
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
		
		
// 		var htmlString = $( "#contents" ).html();
// 		$( "#contents_print" ).html( htmlString );
		  
		//$("#contents_print").html($("#contents").html()); 
		//$("#frm").submit();
		
		
	}
  </script>
    

