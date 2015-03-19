<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp" %>

        <div class="svisual" style="background-color:#41372e;background-image:url('${contextPath}/img/Visual01.jpg'); background-position:center">
        </div><!--//svisual -->
        
        <div class="tit_wrap">
        	<div class="title area_ct">소통공간 관리<div class="depth"><a href="#"><img src="${contextPath}/img/ico_home.png" alt="home아이콘"> 관리자</a><img src="${contextPath}/img/space.png" alt=""><a href="#">커뮤니티</a><img src="${contextPath}/img/space.png" alt=""><a href="#">최신동향정보
				</a></div>
            </div>
        </div>
     	<div id="sub_container">
        	<div id="content-group">
        		<div id="lnb-group">
            		<ul id="lnb">
                	<li class="smenu2"><a href="/admin/trendList.do" class="select">최신동향정보 관리 </a></li>
                    <li class="smenu2"><a href="/admin/trendModify.do">최신동향정보 글쓰기</a></li>
					<li class="smenu2"><a href="#">생생현장소식 관리 </a></li>
                    <li class="smenu2"><a href="#">생생현장소식 글쓰기</a></li>
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
					<ul class="tap4_wrp mt10">	                  
	                    <li><a href= "#"  onclick="javascript:getBsnsSeList('') "    <c:if test="${searchVO.searchBsnsSe == '' }" > class="select"</c:if>>전체동향정보</a></li>
	                    <li><a href= "#"  onclick="javascript:getBsnsSeList('A') "  <c:if test="${searchVO.searchBsnsSe == 'A' }"> class="select"</c:if>>특성화 고등학교</a></li>
	                    <li><a href= "#"  onclick="javascript:getBsnsSeList('B') "  <c:if test="${searchVO.searchBsnsSe == 'B' }"> class="select"</c:if>>특성화 대학원</a></li>
	                    <li><a href= "#"  onclick="javascript:getBsnsSeList('C') "  <c:if test="${searchVO.searchBsnsSe == 'C' }"> class="select"</c:if>>온라인 교육센터</a></li>    	                    
	                </ul>                    
                    
                    <div class="srh_wrap tlr mtf14">
                    	<ul class="lst_m">
                            <li class="wrt br" ><a href="/admin/trendModify.do">글쓰기</a></li>
                        </ul>
                        
                          <select name="searchCnd" class="select" title="검색조건선택">
							   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
							   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
<%-- 							   <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option> --%>
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
                    
						<div class="list_head">
                        	<span class="Hpicinf">사진정보</span>
                        	<span class="Hpntinf2">요약정보</span>
                        	<span class="Admin_con"><input name="chkAll" id="chkAll" type="checkbox" value="a"><a href="javascript:goDeleteArray();"><img src="${contextPath}/img/btn_del.png" alt="삭제"></a></span>
                        </div>
                        
                        <c:forEach var="result" items="${resultList}" varStatus="status">
							<form id="subForm" method="post"  action="${contextPath}/customer/noticeInqire.do" />
								<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
								<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
								<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
								<input type="hidden" name="sortType" value="<c:out value='${searchVO.sortType}'/>"/>
								<input name="trndSe" type="hidden" value="<c:out value='${searchVO.trndSe}'/>"/>
								<input type="hidden"name="searchBsnsSe"  value="<c:out value='${searchVO.searchBsnsSe}'/>"/>
								<input name="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>"/>
								<input name="searchWrd" type="hidden" value="<c:out value='${searchVO.searchWrd}'/>"/>
								<input type="hidden" name="seq" value="<c:out value='${result.seq}'/>"/>											
                            
							<div class="bbs_lst">
								<span class="picinf">
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
	                            </span>
	                            <span class="pntinf">
		                            	<p><a href="<c:out value="${result.refrnUrl1}"/>" target="_blank"  ><c:out value="${result.nttSj}"/></a><span class="viw"><a href="<c:out value="${result.refrnUrl1}"/>" target="_blank"  >원문보기</a></span></p>
		                                <span class="stxt"><a href="<c:out value="${result.refrnUrl1}"/>" target="_blank"  ><c:out value="${result.nttCn}" escapeXml="false" /></a></span>
									<ul class="fl100">
		                                	<li>저작권자 : <a href="<c:out value="${result.refrnUrl1}"/>" target="_blank"  ><c:out value="${result.cpyrhtEr}"/></a></li>
		                                    <li class="num">No.<c:out value="${result.nttNo}"/><span class="hits"><em>｜</em>Hits.<c:out value="${result.inqireCo}"/></span><em>｜</em><c:out value="${result.frstRegisterPnttm}"/></li>
	                                </ul>
	                                <div class="control">
										<c:choose>
											<c:when test="${result.nttSttusCode == '01'}">
												<a href="javacript:#"  ><img src="${contextPath}/img/admin/ico_ing.png" alt="등록"   data="02"  onclick="javascript:layer_open( '<c:out value='${result.nttId}'/>' , '<c:out value='${result.nttSj}' />'  , $(this)  )" ></a>
											</c:when>
											<c:otherwise>
											<a href="javacript:#"  ><img src="${contextPath}/img/ico_regist.png" alt="등록"   data="01" onclick="javascript:layer_open('<c:out value='${result.nttId}'/>' , '<c:out value='${result.nttSj}' />'  , $(this)  )" ></a>
											</c:otherwise>
										</c:choose>
		                                <a href="/admin/trendModify.do?nttId=<c:out value="${result.nttId}"/>"><img src="${contextPath}/img/ico_modify.png" alt="수정"></a>
		                                <a href="/admin/deleteTrendArticle.do?nttId=<c:out value="${result.nttId}"/>"><img src="${contextPath}/img/ico_delete.png" alt="삭제"></a>
		                                <input name="delChk" class="check" type="checkbox" value="<c:out value="${result.nttId}"/>">
	                                </div>
	                            </span>
							</div>      
							</form>
	                        </c:forEach>
                    </div>
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
											<input type="hidden" name="bbsId" value="BBSMSTR_000000000002" >
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
		$("#subForm").attr({action:"${contextPath}/admin/trendModify.do", target:""});
		
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
	
	// 사업유형 클릭
	function getBsnsSeList(bsnsSe){
		$("#frm input[name=pageIndex]").val('1'); 
		$("#frm input[name=searchBsnsSe]").val(bsnsSe); 
		$('#frm').attr('action', '${contextPath}/admin/trendList.do'); 
		$("#frm").submit();
	}
	
	function goDeleteArray(){
		if( $('input[name=delChk]:checked').length == 0){
			alert('체크된 항목이 없습니다. \n일괄 삭제할 항목을 선택하시기 바랍니다.');
			return false;
		}
		
		if(confirm("선택된 항목이 일괄 삭제 됩니다. \n 일괄 삭제하시겠습니까?")){
			$("#subForm").attr({action:"${contextPath}/admin/deleteCheckedTrendList.do"});
			$("#subForm").submit();
		}
	}	

	// 검색
	function getSearchCndList(){
		$("#frm input[name=pageIndex]").val('1'); 
		$("#frm input[name=nttTyCode]").val(''); 
		$('#frm').attr('action', '${contextPath}/admin/trendList.do'); 
		$("#frm").submit();
	}
	
	// 네비게시이션 이동
	function linkPage(pageNo){
		$("#frm input[name=pageIndex]").val(pageNo); 
		$('#frm').attr('action', '${contextPath}/admin/trendList.do'); 
		$("#frm").submit();
	}
	
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

