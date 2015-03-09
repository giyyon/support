<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp" %>

    <div id="container">  	
        <div class="svisual" style="background-color:#41372e;">
        </div><!--//svisual -->
        
        <div class="tit_wrap">
        	<div class="title area_ct">
            	고객센터 관리
            	<div class="depth"><a href="#"><img src="${contextPath}/img/ico_home.png" alt="home아이콘">관리자</a><img src="${contextPath}/img/space.png" alt=""><a href="#">고객센터</a><img src="${contextPath}/img/space.png" alt=""><a href="#">공지사항</a></div>
            </div>
        </div>
     	<div id="sub_container">
        	<div id="content-group">
        		<div id="lnb-group">
            		<ul id="lnb">
                	<li class="smenu2"><a href="#" class="select">공지사항 관리</a></li>
                    <li class="smenu2"><a href="#">공지사항 글쓰기</a></li>
										<li class="smenu2"><a href="#">온라인도움말 관리</a></li>
                    <li class="smenu2"><a href="#">온라인도움말 글쓰기</a></li>
                    <li class="smenu2"><a href="#">문의?제안?신고 관리</a></li>
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
								<div class="con_tit">공지사항 관리 <span>Notice Administration</span>
                	<span class="ex">(재)공간정보산업진흥원에서 전하는 공지사항 관리입니다.</span>
                </div>
								<ul class="tap4_wrp mt10">
	              	<li><a href="#" class="select">전체공지사항</a></li>
                  <li><a href="#">특성화 고등학교</a></li>
                  <li><a href="#">특성화 대학원</a></li>
                  <li><a href="#">온라인 교육센터</a></li>
                </ul>
                <div class="srh_wrap tlr mtf14">
                	<ul class="lst_m">
                    <li class="wrt"><a href="#">글쓰기</a></li>
                  </ul>
                
                  <div class="srh_wrap tlr mtf8">
      	        	<select name="searchCnd" class="select" title="검색조건선택">
										   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
										   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
										   <c:if test="${anonymous != 'true'}">
										   <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
										   </c:if>
									</select>
        	        <img src="${contextPath}/img/srp_spc.png" width="11" height="30">
        	        <input name="searchWrd" class="inp180" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35"  title="검색어 입력"><a href="#" onclick="javascript:getSearchCndList() "><img src="${contextPath}/img/btn_srh.png" alt="검색"></a>
              	</form>
                    </div>
                    
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
                				<li class="choice"><a href="#">전체공지사항</a>
								<div>
									<ul>
									<li><a href="#">사업공고</a></li>
									<li><a href="#">행사공지</a></li>
                 				 <li><a href="#">운영공지</a></li>
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
						<table class="mem_list">
              <colgroup>
                  <col width="50">
                  <col width="80">
                  <col width="80">
                  <col>
                  <col width="50">
            		  <col width="80">
            		  <col width="70">
            		  <col class="60">
              </colgroup>
              <tr>
                  <th width="8%">번호</th>
                  <th width="8%">사업</th>
                  <th width="8%">분류</th>
                  <th width="32%">제목</th>
                  <th width="6%">첨부</th>
                  <th width="14%">등록일</th>
                  <th width="9%">조회</th>
                  <th width="15%">관리 <input name="" type="checkbox" value=""><a href="#"><img src="img/btn_del.png" alt="삭제"></a></th>
              </tr>
              
             <c:forEach var="result" items="${resultList}" varStatus="status">
             <tr>
             			<td class="num"><c:out value="${result.nttId}"/></td>
									<td><span class="num"><c:out value="${result.사업유형}"/></span></td>
									<td><span class="num"><c:out value="${result.nttTyCodeNm}"/></span></td>
									
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
									<td class="t_all"><input name="submit" type="submit"  style="width:320px;border:solid 0px black;text-align:left; background-color:white;"  value="<c:out value="${result.nttSj}"/>" ></td>
									</form>		
									<td class="num2">
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
									</td>
									<td class="num2"><span class="date"><c:out value="${result.frstRegisterPnttm}"/></span></td>
									<td class="num2"><span class="hit"><c:out value="${result.inqireCo}"/></span></td>
									<td class="rmx"><a href="#"><img src="img/ico_regist.png" alt="등록"></a><a href="#"><img src="img/ico_modify.png" alt="수정"></a><a href="#"><img src="img/ico_delete.png" alt="삭제"></a><input name="" type="checkbox" value=""></td>
						</tr>
						</c:forEach>
							
          	</table>   
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
    </div><!--//container -->
    
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

