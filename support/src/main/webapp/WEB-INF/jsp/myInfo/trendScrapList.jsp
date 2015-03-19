<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp" %>

        <div class="svisual" style="background-color:#41372e;background-image:url('${contextPath}/img/Visual01.jpg'); background-position:center">
        </div><!--//svisual -->
        

        <div class="tit_wrap">
        	<div class="title area_ct">
            	<img src="${contextPath}/img/tit_community.png" alt="소통공간"><span>Community</span>
        		<div class="depth"><a href="#"><img src="${contextPath}/img/ico_home.png" alt="home아이콘"></a><img src="${contextPath}/img/space.png" alt=""><a href="#">고객센터</a><img src="${contextPath}/img/space.png" alt=""><a href="#">내정보</a><img src="${contextPath}/img/space.png" alt=""><a href="#">최신동향정보</a>
            	</div>
            </div>
        </div>
        
     	<div id="sub_container">
        	<div id="content-group">
        		<div id="lnb-group">
            		<ul id="lnb">
                	<li class="smenu2"><a href="/myInfo/myInfoView.do" >회원정보 관리</a></li>
                    <li class="smenu2"><a href="#">문의∙제안∙신고 관리</a></li>
					<li class="smenu2"><a href="/myInfo/trendList.do"  class="select"">최신동향정보 관리 </a></li>
                    <li class="smenu2"><a href="#">생생현장소식 관리</a></li>
                	</ul>
                    <ul class="quick">
                	<li class="q1"><a href="#" title="사업소개"></a></li>
                    <li class="q2"><a href="#" title="운영메뉴얼"></a></li>
                    <li class="q3"><a href="#" title="운영지침"></a></li>
                    <li class="q4"><a href="#" title="운영서식"></a></li>
               	 	</ul>
            	</div>
            	<!--//lnb-group -->
               
            
            	<div id="contents" >
            		<form name="frm" id="frm"  method="post">
						<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
						<input type="hidden" name="nttId"  value="0" />
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input name="trndSe" type="hidden" value="<c:out value='${searchVO.trndSe}'/>"/>
						<input name="sortType" type="hidden" value="<c:out value='${searchVO.sortType}'/>"/>
						<input name="searchBsnsSe" type="hidden" value="<c:out value='${searchVO.searchBsnsSe}'/>"/>
                	<div class="top"><a href="#"></a></div>
            		<div class="con_tit">최신동향정보 <span>Latest News</span>
                    	<span class="ex">국내외 공간정보산업 관련 동향정보를 소개합니다.</span>
                    </div>
                    
                    <ul class="tap2_wrp mt10">
                    	<li><a href="/myInfo/trendList.do" >내 게시글</a></li>
                        <li><a href="/myInfo/trendScrapList.do" class="select">스크랩</a></li>
                    </ul>

                    <div class="srh_wrap tlr mtf14">	
                    	<ul class="lst_m">
                            <li class="wrt br"><a href="/myInfo/trendModify.do">글쓰기</a></li>
                            <li class="minfo"><a href="/myInfo/myInfoView.do">내정보</a></li>
                        </ul>
                        
                          <select name="searchCnd" class="select" title="검색조건선택">
							   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
							   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
							   <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
							</select>      
                	        <img src="${contextPath}/img/srp_spc.png" width="11" height="30">
                	        <input name="searchWrd" class="inp180" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" ><a href="#" onclick="javascript:getSearchCndList() "><img src="${contextPath}/img/btn_srh.png" alt="검색"></a>
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
									<li><p orderType="0">최근등록순</p></li>
									<li><p orderType="1">최근인기순</p></li>
									<li><p orderType="2">최근수정일순</p></li>
									</ul>
								</div>
							</li>	
						</ul>
					</div>
                    
                    <!-- 목록리스트 -->
                    <div class="list_box">
                    
                    
                    	<table class="mem_list">
                            <colgroup>
                            <col width="130"><col><col width="160">
                            </colgroup>
                            <tr>
                                <th>사진정보</th>
                                <th>요약정보</th>
                                <th width="15%">관리 <input name="chkAll" id="chkAll" type="checkbox" value="a"><a href="javascript:goDeleteArray();"><img src="${contextPath}/img/btn_del.png" alt="삭제"></a></th>
                            </tr>
	                        <c:forEach var="result" items="${resultList}" varStatus="status">
							<form id="subForm" method="post"   />
								<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
								<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
								<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
								<input type="hidden" name="sortType" value="<c:out value='${searchVO.sortType}'/>"/>
								<input name="trndSe" type="hidden" value="<c:out value='${searchVO.trndSe}'/>"/>
								<input type="hidden"name="searchBsnsSe"  value="<c:out value='${searchVO.searchBsnsSe}'/>"/>
								<input name="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>"/>
								<input name="searchWrd" type="hidden" value="<c:out value='${searchVO.searchWrd}'/>"/>
								<input type="hidden" name="seq" value="<c:out value='${result.seq}'/>"/>											
                            
	                            <tr>
	                                <td>
	                                	<div class="picimg">
			              					<c:choose>
			                           			<c:when test= "${result.atchFileId ==null || result.atchFileId ==''}">
			                            			<img src="${contextPath}/img/noimg.png">
			                            		</c:when>
			                            		<c:otherwise>		
			                            			<img src="${contextPath}/files/imageThumnailSrcByFileId.do?fileId=${result.atchFileId}"  style="width: auto ; height: 76px; % 50% no-repeat;">		                                        		
			                            		</c:otherwise>
			                            	</c:choose>
	                                	</div>
	                                </td>
	                                <td>
		                                <span class="pntinf">
		                            	<p><a href="<c:out value="${result.refrnUrl1}"/>" target="_blank"  ><c:out value="${result.nttSj}"/></a><span class="viw"><a href="<c:out value="${result.refrnUrl1}"/>" target="_blank"  >원문보기</a></span></p>
		                                <span class="stxt"><a href="<c:out value="${result.refrnUrl1}"/>" target="_blank"  ><c:out value="${result.nttCn}" escapeXml="false" /></a></span>
										<ul class="fl100">
		                                	<li>저작권자 : <a href="<c:out value="${result.refrnUrl1}"/>" target="_blank"  ><c:out value="${result.cpyrhtEr}"/></a></li>
		                                    <li class="num">No.<c:out value="${result.nttNo}"/><span class="hits"><em>｜</em>Hits.<c:out value="${result.inqireCo}"/></span><em>｜</em><c:out value="${result.frstRegisterPnttm}"/></li>
		                                </ul>
		                            	</span>
	                                </td>
                          			<td class="rmx">
	                          			<a href="/myInfo/deleteTrendScrapArticle.do?scrapId=<c:out value="${result.scrapId}"/>"><img src="${contextPath}/img/ico_delete.png" alt="삭제"></a>
		                                <input name="delChk" class="check" type="checkbox" value="<c:out value="${result.scrapId}"/>">
		                            </td>
	        					</tr>
							</form>
	                        </c:forEach>
                    	</table>                    
                    </div>
                    
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
		$("#subForm").attr({action:"${contextPath}/myInfo/trendScarpModify.do", target:""});
		
		$("p[orderType]").bind("click", function(){
			$("p[selectedOrderType]").text($(this).text());
			$("#frm input[name=sortType]").val($(this).attr("orderType")   ); 
			$("#subForm input[name=sortType]").val($(this).attr("orderType")   ); 
			$("#frm").submit();
		});
		
	    //일괄 삭제 체크 기능 부여
		$(function(){
			$("#chkAll").click(function(){
	            	$(".check").prop('checked', $(this).is(':checked'));
	        });
	    });
	})
	
	function goDeleteArray(){
		if( $('input[name=delChk]:checked').length == 0){
			alert('체크된 항목이 없습니다. \n일괄 삭제할 항목을 선택하시기 바랍니다.');
			return false;
		}
		
		if(confirm("선택된 항목이 일괄 삭제 됩니다. \n 일괄 삭제하시겠습니까?")){
			$("#subForm").attr({action:"${contextPath}/myInfo/deleteCheckedTrendScrapList.do"});
			$("#subForm").submit();
		}
	}	
	
	
	// 검색
	function getSearchCndList(){
		$("#frm input[name=pageIndex]").val('1'); 
		$("#frm input[name=nttTyCode]").val(''); 
		$('#frm').attr('action', '${contextPath}/myInfo/trendScrapList.do'); 
		$("#frm").submit();
	}
	
	// 네비게시이션 이동
	function linkPage(pageNo){
		$("#frm input[name=pageIndex]").val(pageNo); 
		$('#frm').attr('action', '${contextPath}/myInfo/trendScrapList.do'); 
		$("#frm").submit();
	}
	
	</script>
