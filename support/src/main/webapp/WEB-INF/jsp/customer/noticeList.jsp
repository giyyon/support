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
				     <form name="frm" id="frm"  method="post">
						<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
						<input type="hidden" name="nttId"  value="0" />
						<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
						<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
						<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input name="nttTyCode" type="hidden" value="<c:out value='${searchVO.nttTyCode}'/>"/>
						<input name="sortType" type="hidden" value="<c:out value='${searchVO.sortType}'/>"/>
						
						
 								<div class="top"><a href="#"></a></div>
            		<div class="con_tit">공지사항 <span>Notice</span>
                    	<span class="ex">(재)공간정보산업진흥원에서 전하는 공지사항입니다.</span>
                    </div>
                    
                    <ul class="tap4_wrp mt10">
                    	<li><a href= "#"  onclick="javascript:getNttTypeList('') "    <c:if test="${searchVO.nttTyCode == '' }" > class="select"</c:if>>전체공지사항</a></li>
	                    <li><a href= "#"  onclick="javascript:getNttTypeList('1') "  <c:if test="${searchVO.nttTyCode == '1' }"> class="select"</c:if>>사업공고</a></li>
	                    <li><a href= "#"  onclick="javascript:getNttTypeList('2') "  <c:if test="${searchVO.nttTyCode == '2' }"> class="select"</c:if>>행사공지</a></li>
	                    <li><a href= "#"  onclick="javascript:getNttTypeList('3') "  <c:if test="${searchVO.nttTyCode == '3' }"> class="select"</c:if>>운영공지</a></li>    
                    </ul>                    
                    
										 <!------------ 20150209추가/변경--------- -->
                    <div class="srh_wrap tlr mtf14">
                    	<ul class="lst_m">
                        	<li class="mdfy br"><a href="#">수정</a></li>
                            <li class="del br"><a href="#">삭제</a></li>
                            <li class="wrt br"><a href="#">글쓰기</a></li>
                            <li class="minfo"><a href="#">내정보</a></li>
                        </ul>
                                       
                    
                          <select name="searchCnd" class="select" title="검색조건선택">
														   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
														   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
														   <c:if test="${anonymous != 'true'}">
														   <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
														   </c:if>
													</select>      
                	        <img src="${contextPath}/img/srp_spc.png" width="11" height="30">
                	        <input name="searchWrd" class="inp180" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" ><a href="#" onclick="javascript:getSearchCndList() "><img src="${contextPath}/img/btn_srh.png" alt="검색"></a>
                    	</form>
                    </div>
                    <!------------ //20150209추가/변경--------- -->

                     <div class="list_choice">
                    
                    <!------------ 20150209추가/변경--------- -->
                    	<div class="total">총<strong>${paginationInfo.totalRecordCount}</strong>건<em>l</em>페이지 ${paginationInfo.currentPageNo}/${paginationInfo.totalPageCount}</div>
                    <!------------ //20150209추가/변경--------- -->

					<ul>
							<li class="choice"><p selectedOrderType=""><c:out value='${searchVO.sortTypeNm}'/></p>
								<div>
									<ul>
									<li><p orderType=""0>최근등록순</p></li>
									<li><p orderType="1">최근인기순</p></li>
									<li><p orderType="2">최근수정일순</p></li>
									</ul>
								</div>
							</li>	
						</ul>
					</div>
 
					<div class="pop-layer-cover">
						<div class="bg"></div>
						<div id="layer2" class="pop-layer">
							<div class="pop-container">
								<div class="pop-conts">
									<!--content //-->
									<p class="ctxt mb20"><strong><span>첨부파일</span></strong><br>
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

            <!-- 목록리스트 -->
            <div class="list_box">
            	<div class="list_head">
					<span class="Hnum">번호</span>
					<span class="Hnum">분류</span>
					<span class="Hsub">제목</span>
					<span class="Hfile">첨부</span>
					<span class="Hdate">등록일</span>
					<span class="Hhit">조회</span>
	             </div>
                        
             <c:forEach var="result" items="${resultList}" varStatus="status">
								<div class="bbs_lst">
									<span class="num"><c:out value="${result.nttId}"/></span>
									<span class="num"><em><c:out value="${result.nttTyCodeNm}"/></em></span>
									
										<form id="subForm" method="post"  action="${contextPath}/customer/noticeInqire.do" />
											<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
											<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
											<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
											<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
											<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
											<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
											<input type="hidden" name="sortType" value="<c:out value='${searchVO.sortType}'/>"/>
											<input name="nttTyCode" type="hidden" value="<c:out value='${searchVO.nttTyCode}'/>"/>
											<input name="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>"/>
											<input name="searchWrd" type="hidden" value="<c:out value='${searchVO.searchWrd}'/>"/>
											<input type="hidden" name="seq" value="<c:out value='${result.seq}'/>"/>											
									<span class="bbs_sub"><input name="submit" type="submit"  style="width:320px;border:solid 0px black;text-align:left; background-color:white;"  value="<c:out value="${result.nttSj}"/>" ></span>
											</form>		    		
									
									<span class="file">
										<c:choose>
											<c:when test="${fn:length(result.atchFileId) > 0}">
												<a href="#" class="btn-example" onclick="layer_open('layer2', '${result.atchFileId}');return false;"><img src="${contextPath}/img/ico_hwp.png" alt="아래한글"></a>
											</c:when>
											<c:otherwise>
											&nbsp;
											</c:otherwise>
										</c:choose>
									</span>
									<span class="date"><c:out value="${result.frstRegisterPnttm}"/></span>
									<span class="hit"><c:out value="${result.inqireCo}"/></span>
								</div>
						</c:forEach>

                    </div>
                    <!-- //목록리스트 -->
                    <!--pageing -->
                    
                    <div class="paginate_complex">
						<ui:pagination paginationInfo="${paginationInfo}" type="supportImage" jsFunction="linkPage" />
					</div>
					<!--//pageing -->
            	</div>
            	<!--//contents -->
        	</div>
        	<!--//content-group -->
		</div><!--//sub_container -->
    
    <script type="text/javascript" charset="utf-8">
    
	$(function(){
		$("#subForm").attr({action:"${contextPath}/customer/noticeInqire.do", target:""});
		
		$("p[orderType]").bind("click", function(){
			alert($(this).attr("orderType"));
			$("p[selectedOrderType]").text($(this).text());
			$("#frm input[name=sortType]").val($(this).attr("orderType")   ); 
			$("#subForm input[name=sortType]").val($(this).attr("orderType")   ); 
			$("#frm").submit();
			
		});
	})
	
	// 공지유형 클릭
	function getNttTypeList(nttTyCode){
		$("#frm input[name=pageIndex]").val('1'); 
		$("#frm input[name=nttTyCode]").val(nttTyCode); 
		$('#frm').attr('action', '${contextPath}/customer/noticeList.do'); 
		$("#frm").submit();
	}
	
	// 검색
	function getSearchCndList(){
		$("#frm input[name=pageIndex]").val('1'); 
		$("#frm input[name=nttTyCode]").val(''); 
		$('#frm').attr('action', '${contextPath}/customer/noticeList.do'); 
		$("#frm").submit();
	}
	
	// 네비게시이션 이동
	function linkPage(pageNo){
		$("#frm input[name=pageIndex]").val(pageNo); 
		$('#frm').attr('action', '${contextPath}/customer/noticeList.do'); 
		$("#frm").submit();
	}
	 
	function callAjax() {
	    var AjaxHTML = $.ajax({
	        url: "${contextPath}/customer/noticeArticle.do", 
	        type: "POST",
	        dataType: "html",
	        async: false
	     }).responseText;
	     $('#idName').html(AjaxHTML);
	} 
	</script>
	
<script type="text/javascript">
	function layer_open(el, fileId){

		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.pop-layer-cover').fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
		}else{
			temp.fadeIn();
		}

		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');
		
		//$(".layerContent").load("${contextPath}/cmm/fms/selectFileInfs.do"+"?param_atchFileId"+fileId);

		// 요래 하면 여러가지 다양한 ajax 옵션을 줄수 있어서 개인적으로 더 선호한다.
		$.ajax({
		    url : "${contextPath}/cmm/fms/selectFileInfs.do",
		    dataType : "html",
		    type : "post",  // post 또는 get
		    data : { param_atchFileId:fileId},   // 호출할 url 에 있는 페이지로 넘길 파라메터
		    success : function(result){
		        $(".layerContent").html(result);
		    }
		});
		
		
		temp.find('a.cbtn').click(function(e){
			if(bg){
				$('.pop-layer-cover').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			}else{
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.pop-layer-cover .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.pop-layer-cover').fadeOut();
			e.preventDefault();
		});

	}				
</script>


	
