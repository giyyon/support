<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp" %>
<link href="${contextPath}/css/necgis.css" rel="stylesheet" type="text/css" />

        <div class="svisual" style="background-color:#41372e;background-image:url('${contextPath}/img/Visual01.jpg'); background-position:center">
        </div><!--//svisual -->
        
        <div class="tit_wrap">
        	<div class="title area_ct">
            	<img src="${contextPath}/img/tit_community.png" alt="소통공간"><span>Community</span>
            	<div class="depth"><a href="#"><img src="${contextPath}/img/ico_home.png" alt="home아이콘"></a><img src="${contextPath}/img/space.png" alt=""><a href="#">소통공간</a><img src="${contextPath}/img/space.png" alt=""><a href="#">최신동향정보
				</a></div>
            </div>
        </div>
     	<div id="sub_container">
        	<div id="content-group">
        		<div id="lnb-group">
            		<ul id="lnb">
                	<li><a href="/community/trendList.do" class="select">최신동향정보</a></li>
					<li><a href="#">생생현장소식</a></li>
                	</ul>
                    
                    <ul class="quick">
                	<li class="q1"><a href="#" title="사업소개"></a></li>
                    <li class="q2"><a href="#" title="운영메뉴얼"></a></li>
                    <li class="q3"><a href="#" title="운영지침"></a></li>
                    <li class="q4"><a href="#" title="운영서식"></a></li>
               	 	</ul>
            	</div>
            	<!--//lnb-group -->
               
            
            	<div id="contents" class="bg_com">
            		<form name="frm" id="frm"  method="post">
						<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
						<input type="hidden" name="nttId"  value="0" />
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input name="trndSe" type="hidden" value="<c:out value='${searchVO.trndSe}'/>"/>
						<input name="sortType" type="hidden" value="<c:out value='${searchVO.sortType}'/>"/>
                	<div class="top"><a href="#"></a></div>
            		<div class="con_tit">최신동향정보 <span>Latest News</span>
                    	<span class="ex">국내외 공간정보산업 관련 동향정보를 소개합니다.</span>
                    </div>
                    
                    <ul class="tap4_wrp mt10">
                    	<li><a href= "#"  onclick="javascript:getTrendSeList('') "    <c:if test="${searchVO.trndSe == '' }" > class="select"</c:if>>전체동향정보</a></li>
	                    <li><a href= "#"  onclick="javascript:getTrendSeList('01') "  <c:if test="${searchVO.trndSe == '01' }"> class="select"</c:if>>사업관련보도자료</a></li>
	                    <li><a href= "#"  onclick="javascript:getTrendSeList('02') "  <c:if test="${searchVO.trndSe == '02' }"> class="select"</c:if>>일반보도자료</a></li>
	                    <li><a href= "#"  onclick="javascript:getTrendSeList('03') "  <c:if test="${searchVO.trndSe == '03' }"> class="select"</c:if>>일반동향정보</a></li>    
                    </ul>
                    
                    <div class="srh_wrap tlr mtf14">
                    	<ul class="lst_m">
                            <li class="wrt br" ><a href="/community/trendModify.do">글쓰기</a></li>
                            <li class= "minfo"><a href="#">내정보</a></li>
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
                    	<div class="list_head">
                        	<span class="Hpicinf">사진정보</span><span class="Hpntinf">요약정보</span>
                        </div>
                        <c:forEach var="result" items="${resultList}" varStatus="status">
						<form id="subForm" method="post"  action="${contextPath}/customer/noticeInqire.do" />
							<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
							<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
							<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
							<input type="hidden" name="sortType" value="<c:out value='${searchVO.sortType}'/>"/>
							<input name="trndSe" type="hidden" value="<c:out value='${searchVO.trndSe}'/>"/>
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
                                    <li class="num">No.<c:out value="${result.nttNo}"/><span class="hits">
                                    <em>｜</em>Hits.<c:out value="${result.inqireCo}"/></span>
                                    <em>｜</em><c:out value="${result.frstRegisterPnttm}"/>
									<security:authorize access="isAuthenticated()">
				                                    <em>｜</em>
				                                    <a href="#" class="btn-example" style="float: right;"  onclick="layer_open('layer2', '<c:out value='${result.nttId}'/>' , '<c:out value='${result.nttSj}' />'); return false;"><img src="/img/bullet_all.png">스크랩하기</a>
									</security:authorize>
                                    </li>
                                </ul>
                            </span>
						</div>
						</form>
                        </c:forEach>
                    </div>
                    
                    <!--pageing -->                    
                    <div class="paginate_complex">
						<ui:pagination paginationInfo="${paginationInfo}" type="supportImage" jsFunction="linkPage" />
					</div>
					<!--//pageing -->
					
					<!--//팝업 레이어 -->
					<div class="pop-layer-cover">
						<div class="bg"></div>
						<div id="layer2" class="pop-layer">
							<div class="pop-container">
								<div class="pop-conts">
									<!--//content -->
									<p class="ctxt mb20"><strong><span>스크랩 하기</span></strong><br>
									</p>
									<div class="layerContent">
										<form name = "popupForm" >
											<input type="hidden"  name="nttId">
											<div id="targetText"></div><br>
											<input type="button" id="popupBtn" class="btn-style"  value="스크랩 하기">
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
            	<!--//contents -->
        	</div>
        	<!--//content-group -->
		</div><!--//sub_container -->

    <script type="text/javascript" charset="utf-8">
    
	$(function(){
		$("#subForm").attr({action:"${contextPath}/community/trendModify.do", target:""});
		
		$("p[orderType]").bind("click", function(){
			$("p[selectedOrderType]").text($(this).text());
			$("#frm input[name=sortType]").val($(this).attr("orderType")   ); 
			$("#subForm input[name=sortType]").val($(this).attr("orderType")   ); 
			$("#frm").submit();
		});
	})
	
	// 공지유형 클릭
	function getTrendSeList(trndSe){
		$("#frm input[name=pageIndex]").val('1'); 
		$("#frm input[name=trndSe]").val(trndSe); 
		$('#frm').attr('action', '${contextPath}/community/trendList.do'); 
		$("#frm").submit();
	}
	
	// 검색
	function getSearchCndList(){
		$("#frm input[name=pageIndex]").val('1'); 
		$("#frm input[name=nttTyCode]").val(''); 
		$('#frm').attr('action', '${contextPath}/community/trendList.do'); 
		$("#frm").submit();
	}
	
	// 네비게시이션 이동
	function linkPage(pageNo){
		$("#frm input[name=pageIndex]").val(pageNo); 
		$('#frm').attr('action', '${contextPath}/community/trendList.do'); 
		$("#frm").submit();
	}
	</script>

	<script type="text/javascript">
	function layer_open(el, targetId, targetSubject){

		$(".layerContent_result").hide();
		$(".layerContent").show();
		
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
		
		$("#targetText").html("["+targetSubject+"] <br>본 최신 동향 글을 스크랩 하시겠습니까?");
		$("form[name=popupForm] input[name=nttId]").val(targetId);
		
		

		temp.find('#popupBtn').bind('click', function() {
			doSubmit();  
		  });

			 
		var doSubmit = function(){
			temp.find('#popupBtn').unbind('click');
			var infoData = $("form[name=popupForm]").serialize();
	 		$.ajax({
			    url : "${contextPath}/myInfo/jsonInsertTrendScrapArticle.do",
			    dataType : "json",
			    type : "post",  // post 또는 get
			    data :infoData,   // 호출할 url 에 있는 페이지로 넘길 파라메터
			    success : function(result){
			        $(".layerContent_result").html(result.Message);
			        $(".layerContent").hide();
			        $(".layerContent_result").show();
			    }
			});
			e.preventDefault();
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