<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp" %>

        <div class="svisual" style="background-color:#41372e;background-image:url('${contextPath}/img/Visual01.jpg'); background-position:center">
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
                	<li class="smenu2"><a href="/admin/noticeList.do" class="select">공지사항 관리</a></li>
                    <li class="smenu2"><a href="/admin/noticeInsertPage.do">공지사항 글쓰기</a></li>
					<li class="smenu2"><a href="#">온라인도움말 관리</a></li>
                    <li class="smenu2"><a href="#">온라인도움말 글쓰기</a></li>
                    <li class="smenu2"><a href="#">문의∙제안∙신고 관리</a></li>
                	</ul>
                 </div>
            	<!--//lnb-group -->
               
            
            	<div id="contents" class="bg_cs">
				    <div class="top"><a href="#"></a></div>
					<div class="con_tit">공지사항 관리 <span>Notice Administration</span>
                		<span class="ex">(재)공간정보산업진흥원에서 전하는 공지사항 관리입니다.</span>
                	</div>
					<ul class="tap4_wrp mt10">	                  
	                    <li><a href= "#"  onclick="javascript:getBsnsSeList('') "    <c:if test="${searchVO.searchBsnsSe == '' }" > class="select"</c:if>>전체공지사항</a></li>
	                    <li><a href= "#"  onclick="javascript:getBsnsSeList('A') "  <c:if test="${searchVO.searchBsnsSe == 'A' }"> class="select"</c:if>>특성화 고등학교</a></li>
	                    <li><a href= "#"  onclick="javascript:getBsnsSeList('B') "  <c:if test="${searchVO.searchBsnsSe == 'B' }"> class="select"</c:if>>특성화 대학원</a></li>
	                    <li><a href= "#"  onclick="javascript:getBsnsSeList('C') "  <c:if test="${searchVO.searchBsnsSe == 'C' }"> class="select"</c:if>>온라인 교육센터</a></li>    	                    
	                </ul>
	                <div class="srh_wrap tlr mtf14">
	                	<ul class="lst_m">
	                    	<li class="wrt"><a href="/admin/noticeInsertPage.do">글쓰기</a></li>
	                 	</ul>
                <form name="frm" id="frm"  method="post">
						<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
						<input type="hidden" name="nttId"  value="0" />
						<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
						<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
						<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input name="searchBsnsSe" type="hidden" value="<c:out value='${searchVO.searchBsnsSe}'/>"/>
						<input name="searchNttTy" type="hidden" value="<c:out value='${searchVO.searchNttTy}'/>"/>
						<input name="sortType" type="hidden" value="<c:out value='${searchVO.sortType}'/>"/>
					
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
										<li><p orderType="0">최근등록순</p></li>
										<li><p orderType="1">최근인기순</p></li>
										<li><p orderType="2">최근수정일순</p></li>
										</ul>
									</div>
								</li>
                				<li class="choice"><p selectedSearchNttTy=""><c:out value='${searchVO.searchNttTyNm}'/></p>
								<div>
									<ul>
									<li><p searchNttTy="">전체공지사항</li>
									<li><p searchNttTy="1">사업공고</li>
									<li><p searchNttTy="2">행사공지</li>
                 				    <li><p searchNttTy="3">운영공지</li>
									</ul>
								</div>
							</li>					
						</ul>
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
		                  <th width="15%">관리 <input name="chkAll" id="chkAll" type="checkbox" value="a"><a href="javascript:goDeleteArray();"><img src="${contextPath}/img/btn_del.png" alt="삭제"></a></th>
		              </tr>
              
            			  <form id="subForm" method="post"  action="${contextPath}/admin/noticeInqire.do" />
			             <c:forEach var="result" items="${resultList}" varStatus="status">
			             <tr>
			             		<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
								<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
								<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
								<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
								<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
								<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
								<input type="hidden" name="sortType" value="<c:out value='${searchVO.sortType}'/>"/>
								<input type="hidden"name="nttTyCode"     value="<c:out value='${searchVO.nttTyCode}'/>"/>
								<input type="hidden"name="searchCnd"     value="<c:out value='${searchVO.searchCnd}'/>"/>
								<input type="hidden"name="searchNttTy"   value="<c:out value='${searchVO.searchNttTy}'/>"/>
								<input type="hidden"name="searchBsnsSe"  value="<c:out value='${searchVO.searchBsnsSe}'/>"/>
								<input type="hidden"name="searchWrd"     value="<c:out value='${searchVO.searchWrd}'/>"/>
								<input type="hidden" name="seq" value="<c:out value='${result.seq}'/>"/>	
		             			<td class="num"><c:out value="${result.nttId}"/></td>
								<td><span class="num"><c:out value="${result.bsnsSeNm}"/></span></td>
								<td><span class="num"><c:out value="${result.nttTyCodeNm}"/></span></td>
								<td class="t_all"><p onclick='goNoticeInquire("${result.nttId}")'  style="cursor:pointer"><c:out value="${result.nttSj}"/></p></td>
										
								<td class="num2">
									<span class="file">
										<c:choose>
											<c:when test="${fn:length(result.atchFileId) > 0}">
												<input type="hidden"name="atchFileId"  value="<c:out value='${result.atchFileId}'/>"/>
												<img name="btnFileDownload"  data_type="file"   src="${contextPath}/img/ico_hwp.png" alt="아래한글">
											</c:when>
											<c:otherwise>
											&nbsp;
											</c:otherwise>
										</c:choose>
									</span>
								</td>
								<td class="num2"><span class="date"><c:out value="${result.frstRegisterPnttm}"/></span></td>
								<td class="num2"><span class="hit"><c:out value="${result.inqireCo}"/></span></td>
								<td class="rmx">
																<c:choose>
																	<c:when test="${result.nttSttusCode == '01'}">
																		<a href="javacript:#"  ><img src="${contextPath}/img/admin/ico_ing.png" alt="등록"   data="02"  onclick="javascript:layer_open( '<c:out value='${result.nttId}'/>' , '<c:out value='${result.nttSj}' />'  , $(this)  )" ></a>
																	</c:when>
																	<c:otherwise>
																	<a href="javacript:#"  ><img src="${contextPath}/img/ico_regist.png" alt="등록"   data="01" onclick="javascript:layer_open('<c:out value='${result.nttId}'/>' , '<c:out value='${result.nttSj}' />'  , $(this)  )" ></a>
																	</c:otherwise>
																</c:choose>
								                               <a href="/admin/noticeModifyPage.do?nttId=<c:out value="${result.nttId}"/>"><img src="${contextPath}/img/ico_modify.png" alt="수정"></a>
								                               <a href="/admin/deleteBoardArticle.do?nttId=<c:out value="${result.nttId}"/>"><img src="${contextPath}/img/ico_delete.png" alt="삭제"></a>
								                               <input name="delChk" class="check" type="checkbox" value="<c:out value="${result.nttId}"/>"></td>
						</tr>
						</c:forEach>
						</form>
							
          	</table>   
          	<!--//팝업 레이어 -->
					<div class="pop-layer-cover">
						<div class="bg"></div>
						<div id="layer2" class="pop-layer">
							<div class="pop-container">
								<div class="pop-conts">
									<!--//content -->
									<p class="ctxt mb20"><strong><span>게시 상태 변경</span></strong><br>
									</p>
									<div class="layerContent">
										<form name = "popupForm" >
											<input type="hidden" name="bbsId" value="BBSMSTR_000000000001" >
											<input type="hidden"  name="nttSttusCode" > 
											<input type="hidden"  name="nttId">
											<div id="targetText"></div><br>
											<input type="button" id="popupBtn" class="btn-style"  value="게시 상태 변경 ">
										</form>
									</div>
									<div class="layerContent_result">
									</div>
									<div class="btn-r">
										<div  class="cbtn">Close</div>
									</div>
									<!--//content -->
								</div>
							</div>
						</div>
					</div>
					<!--//팝업 레이어 -->			
          	
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
		
		$("#subForm").attr({action:"${contextPath}/admin/noticeInqire.do", target:""});
		
		$("p[orderType]").bind("click", function(){
			$("p[selectedOrderType]").text($(this).text());
			$("#frm input[name=sortType]").val($(this).attr("orderType")   ); 
			$("#subForm input[name=sortType]").val($(this).attr("orderType")   ); 
			$("#frm").attr({action:"${contextPath}/admin/noticeList.do", target:""});
			$("#frm").submit();
		});

		$("p[searchNttTy]").bind("click", function(){
			$("p[selectedSearchNttTy]").text($(this).text());
			$("#frm input[name=searchNttTy]").val($(this).attr("searchNttTy")   ); 
			$("#subForm input[name=searchNttTy]").val($(this).attr("searchNttTy")   ); 
			$("#frm").attr({action:"${contextPath}/admin/noticeList.do", target:""});
			$("#frm").submit();
		});
		
	})
	
	// 사업유형 클릭
	function getBsnsSeList(bsnsSe){
		$("#frm input[name=pageIndex]").val('1'); 
		$("#frm input[name=searchBsnsSe]").val(bsnsSe); 
		$('#frm').attr('action', '${contextPath}/admin/noticeList.do'); 
		$("#frm").submit();
	}
	
	// 검색
	function getSearchCndList(){
		$("#frm input[name=pageIndex]").val('1'); 
		$("#frm input[name=nttTyCode]").val(''); 
		$('#frm').attr('action', '${contextPath}/admin/noticeList.do'); 
		$("#frm").submit();
	}
	
	// 상세조회 이동
	function goNoticeInquire(nttId){
		$("#frm input[name=nttId]").val(nttId);
		$('#frm').attr('action', '${contextPath}/admin/noticeInqire.do'); 
		$("#frm").submit();
	}
	
	// 네비게시이션 이동
	function linkPage(pageNo){
		$("#frm input[name=pageIndex]").val(pageNo); 
		$('#frm').attr('action', '${contextPath}/admin/noticeList.do'); 
		$("#frm").submit();
	}
	 
    //일괄 삭제 체크 기능 부여
	$(function(){
		$("#chkAll").click(function(){
            	$(".check").prop('checked', $(this).is(':checked'));
        });
    });

	function goDeleteArray(){
		if(confirm("선택된 항목이 일괄 삭제 됩니다. \n 일괄 삭제하시겠습니까?")){
			$("#subForm").attr({action:"${contextPath}/admin/deleteCheckedNoticeList.do"});
			$("#subForm").submit();
		}
	}
	
	$('[name=btnFileDownload]').click(function(e) {
		e.preventDefault();
		var category = $(this).attr('data_category');
		var $imgId = $(this).parent().find(':hidden');
		COM.openFileListPopup(category, $imgId.val());
	});
	</script>
	
	<script type="text/javascript">
	function layer_open( targetId, targetSubject, $Object){
		var nttSttusCode = $Object.attr('data'); 
		var nttSttusCodeNm =($Object.attr('data') == '01')?'임시':'등록';
 		
		
		
		$(".layerContent_result").hide();
		$(".layerContent").show();
		
		var temp = $('#layer2');
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
		
		$("#targetText").html("["+targetSubject+"] <br>본글의 게시 상태를 ["+nttSttusCodeNm+"]상태 변경하시겠습니까?");
		$("form[name=popupForm] input[name=nttSttusCode]").val(nttSttusCode);
		$("form[name=popupForm] input[name=nttId]").val(targetId);
		
		temp.find('#popupBtn').bind('click', function() {
			doSubmit();  
		  });
			 
		var doSubmit = function(){
			temp.find('#popupBtn').unbind('click');
			var infoData = $("form[name=popupForm]").serialize();
	 		$.ajax({
			    url : "${contextPath}/admin/jsonUpdateBoardNttSttusCode.do",
			    dataType : "json",
			    type : "post",  // post 또는 get
			    data :infoData,   // 호출할 url 에 있는 페이지로 넘길 파라메터
			    success : function(result){
			        $(".layerContent_result").html("정상적으로 변경 처리 되었습니다.");
			        $(".layerContent").hide();
			        $(".layerContent_result").show();
			        if(nttSttusCode == '01'){
			        	$Object.attr("src","/img/admin/ico_ing.png");
			        	$Object.attr("data", "02");
			        }
			        else{
			        	$Object.attr("src","/img/ico_regist.png");
			        	$Object.attr("data", "01");
			        }
			    }
			});
		};	
			
		temp.find('div.cbtn').click(function(e){
			if(bg){
				$('.pop-layer-cover').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			}else{
				temp.fadeOut();
			}
			e.preventDefault();
		});
		
		//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
		$('.pop-layer-cover .bg').click(function(e){	
			$('.pop-layer-cover').fadeOut();
			e.preventDefault();
		});
	}
</script>
