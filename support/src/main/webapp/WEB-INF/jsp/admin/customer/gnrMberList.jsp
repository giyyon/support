<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp" %>

        <div class="svisual" style="background-color:#41372e;background-image:url('${contextPath}/img/Visual01.jpg'); background-position:center">
        </div><!--//svisual -->
        
        <div class="tit_wrap">
        	<div class="title area_ct">회원정보 관리
          	<div class="depth">
	         		<a href="#"><img src="${contextPath}/img/ico_home.png" alt="home아이콘"> 관리자</a>
	            						<img src="${contextPath}/img/space.png" alt=""><a href="#">회원정보</a>
	            						<img src="${contextPath}/img/space.png" alt=""><a href="#">전체개인회원
							</a>
						</div>
          </div>
        </div>
     		<div id="sub_container">
        	<div id="content-group">
        		<div id="lnb-group">
            		<ul id="lnb">
									<li class="smenu2"><a href="#" class="select">전체개인회원 관리</a></li>
									<li class="smenu3"><a href="#">- 협약개인회원</a></li>
									<li class="smenu3"><a href="#">- 운영위원</a></li>
									<li class="smenu3"><a href="#">- 전문위원</a></li>
									<li class="smenu2"><a href="#">전체기관∙기업회원 관리</a></li>
									<li class="smenu3"><a href="#">- 협약기관∙기업회원</a></li>
               </ul>
            	</div>
            	<!--//lnb-group -->
               
            
            	<div id="contents">
                	<div class="top"><a href="#"></a></div>
            		<div class="con_tit">개인회원 관리 <span>Member Administration</span>
                    	<span class="ex">회원의 소중한 정보를 관리합니다.</span>
                    </div>

                    <ul class="tap4_wrp mt20">
	                    <li><a href= "#"  onclick="javascript:getBsnsSeList('') "    <c:if test="${userSearchVO.searchBsnsSe == '' }" > class="select"</c:if>>전체개인회원</a></li>
	                    <li><a href= "#"  onclick="javascript:getBsnsSeList('A') "  <c:if test="${userSearchVO.searchBsnsSe == 'A' }"> class="select"</c:if>>특성화 고등학교</a></li>
	                    <li><a href= "#"  onclick="javascript:getBsnsSeList('B') "  <c:if test="${userSearchVO.searchBsnsSe == 'B' }"> class="select"</c:if>>특성화 대학원</a></li>
	                    <li><a href= "#"  onclick="javascript:getBsnsSeList('C') "  <c:if test="${userSearchVO.searchBsnsSe == 'C' }"> class="select"</c:if>>온라인 교육센터</a></li>   
                    </ul>
                    <div class="srh_wrap tlr mtf14">
                    	<ul class="lst_m">
                            <li class="minfo"><a href="#">비회원등록</a></li>
                        </ul>
                        
                    	<form name="frm" id="frm"  method="post">
                    	<input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
						<input name="searchBsnsSe" type="hidden" value="<c:out value='${userSearchVO.searchBsnsSe}'/>"/>
						<input name="sortType" type="hidden" value="<c:out value='${userSearchVO.sortType}'/>"/>
						<input name="searchActiveTyCd" type="hidden" value="<c:out value='${userSearchVO.searchActiveTyCd}'/>"/>
						<input name="searchActiveTyCdNm" type="hidden" value="<c:out value='${userSearchVO.searchActiveTyCdNm}'/>"/>
						<input name="searchMberSe" type="hidden" value="<c:out value='${userSearchVO.searchMberSe}'/>"/>
						<input name="searchMberSeNm" type="hidden" value="<c:out value='${userSearchVO.searchMberSeNm}'/>"/>
						<input name="searchMberType" type="hidden" value="<c:out value='${userSearchVO.searchMberType}'/>"/>
						<input name="searchMberTypeNm" type="hidden" value="<c:out value='${userSearchVO.searchMberTypeNm}'/>"/>
						<input type="hidden" name="mberId"  value="test"/>	

	                  	<select name="searchCnd" class="select" title="검색조건선택">
						   <option value="0" <c:if test="${userSearchVO.searchCnd == '0'}">selected="selected"</c:if> >아이디</option>
						   <option value="1" <c:if test="${userSearchVO.searchCnd == '1'}">selected="selected"</c:if> >성명</option>
						</select>
											<img src="${contextPath}/img/srp_spc.png" width="11" height="30">
                            <input name="searchWrd" class="inp180" type="text" size="35" value='<c:out value="${userSearchVO.searchWrd}"/>' maxlength="35"  title="검색어 입력"><a href="#" onclick="javascript:getSearchCndList() "><img src="${contextPath}/img/btn_srh.png" alt="검색"></a>
                    	</form>
                    </div>
       

                    <div class="list_choice">
                    	<div class="total">총<strong>${paginationInfo.totalRecordCount}</strong>건<em>l</em>페이지 ${paginationInfo.currentPageNo}/${paginationInfo.totalPageCount}</div>
						<ul>
								<li class="choice"><p selectedOrderType=""><c:out value='${userSearchVO.sortTypeNm}'/></p>
									<div>
										<ul>
										<li><p orderType="0">최근가입일순</p></li>
										<li><p orderType="1">최근수정일순</p></li>
										<li><p orderType="2">최근접속일순</p></li>
										</ul>
									</div>
								</li>

                				<li class="choice"><p selectedSearchActiveTy=""><c:out value='${userSearchVO.searchActiveTyCdNm}'/></p>
									<div>
										<ul>
											<li><p searchActiveTyCd="">전체활동분류</p></li>
						                      <c:forEach var="result" items="${activeTy_result}" varStatus="status">
						                      	<li><p searchActiveTyCd='<c:out value="${result.code}"/>'><c:out value="${result.codeNm}"/></p></li>
						                      </c:forEach>
										</ul>
									</div>
								</li>
               					<li class="choice"><p selectedSearchMberSe=""><c:out value='${userSearchVO.searchMberSeNm}'/></p>
									<div>
										<ul>
											<li><p searchMberSe="">전체회원분류</p></li>
						                      <c:forEach var="result" items="${mberSe_result}" varStatus="status">
						                      	<li><p searchMberSe='<c:out value="${result.code}"/>'><c:out value="${result.codeNm}"/></p></li>
						                      </c:forEach>
										</ul>
									</div>
								</li>
                				<li class="choice"><p selectedSearchMberType=""><c:out value='${userSearchVO.searchMberTypeNm}'/></p>
									<div>
										<ul>
											<li><p searchMberType="">전체회원유형</p></li>
					                      <c:forEach var="result" items="${mberType_result}" varStatus="status">
					                      	<li><p searchMberType='<c:out value="${result.code}"/>'><c:out value="${result.codeNm}"/></p></li>
					                      </c:forEach>
										</ul>
									</div>
								</li>			
						</ul>
					</div><!--list_choice -->
                    
                    <!-- 목록리스트 -->
                    <div class="list_box">
                    	<table class="mem_list">
                            <colgroup>
                                <col width="55">
                                <col width="40">
                                <col width="120">
                                <col width="70">
                                <col width="140">
                                <col width="80">
                                <col>
                                <col width="75">
                                <col width="110">
                            </colgroup>
                            <tr>
                                <th>구분</th>
                                <th>사진<br></th>
                                <th>아이디<br>회원분류</th>
                                <th>성명<br>생일</th>
                                <th>휴대폰<br>이메일</th>
                                <th>소속전화<br>소속팩스</th>
                                <th>소속명<br>소속위치</th>
                                <th>가입일<br>접속일</th>
                                <th>상세</th>
                            </tr>
                            <form id="subForm"    method="post"  action="${contextPath}/admin/gnrMberDetail.do" >
                           		<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
				             	<input type="hidden" name="sortType" value="<c:out value='${userSearchVO.sortType}'/>"/>
				             	<input type="hidden"name="searchCnd"     value="<c:out value='${userSearchVO.searchCnd}'/>"/>
				             	<input type="hidden"name="searchWrd"     value="<c:out value='${userSearchVO.searchWrd}'/>"/>
								<input name="searchActiveTyCd" type="hidden" value="<c:out value='${userSearchVO.searchActiveTyCd}'/>"/>
								<input name="searchActiveTyCdNm" type="hidden" value="<c:out value='${userSearchVO.searchActiveTyCdNm}'/>"/>
								<input name="searchMberSe" type="hidden" value="<c:out value='${userSearchVO.searchMberSe}'/>"/>
								<input name="searchMberSeNm" type="hidden" value="<c:out value='${userSearchVO.searchMberSeNm}'/>"/>
								<input name="searchMberType" type="hidden" value="<c:out value='${userSearchVO.searchMberType}'/>"/>
								<input name="searchMberTypeNm" type="hidden" value="<c:out value='${userSearchVO.searchMberTypeNm}'/>"/>
				             	<input type="hidden" name="seq" value="<c:out value='${result.seq}'/>"/>	
				             	<input type="hidden" name="mberId"  value="test"/>	
            			     <c:forEach var="result" items="${resultList}" varStatus="status">
					          <tr>
									<td class="num"><a href="#" class="tip">고유번호 <p><c:out value='${result.uniqId}'/></p></a><br><span><c:if test='${result.mberType == "C01" }'>탈퇴</c:if></span></td>
	                                <td><div class="photo">
	                              								 <c:choose>
				                                        			<c:when test= "${result.atchImgMainFileId ==null || result.atchImgMainFileId ==''}">
					                                        			<img src="${contextPath}/img/noimg.png">
					                                        		</c:when>
					                                        		<c:otherwise>		
					                                        			<img src="${contextPath}/files/imageSrcByFileId.do?fileId=${result.atchImgMainFileId}"  style="height: auto; 0% 50% no-repeat;">		                                        		
	<%-- 				                                        			<dt class="img_div"  style="background: url(${contextPath}/files/imageSrcByFileId.do?fileId=${result.atchImgMainFileId}) 0% 50% no-repeat;"></dt> --%>
					                                        		</c:otherwise>
					                                        	</c:choose>
	                                
	                                		</div>
	                                </td>
	                                <td>
	                                    <c:out value='${result.mberId}'/><br><span class="mem"><img src="${contextPath}/img/admin/ico_mem_ok.png" alt="정회원">
	                                    <c:choose>
	                                    	<c:when test="${result.mberType == 'D01'}">비</c:when>
	                                    	<c:otherwise>정</c:otherwise>
	                                    </c:choose>_<c:out value='${result.mberSeNm}'/></span>
	                                </td>
	                                <td class="txt11_space"><c:out value='${result.userNm}'/><br><c:out value='${result.ihidnum}'/></td>
	                                <td class="num2"><c:out value='${result.moblphonNo}'/><br><a href="#"><c:out value='${result.emailAdres}'/></a></td>
	                                <td class="num2"><c:out value='${result.areaNo}'/>-<c:out value='${result.middleTelno}'/>-<c:out value='${result.endTelno}'/><br><c:out value='${result.mberFxnum}'/></td>
	                                <td><c:out value='${result.pstinst}'/><br><a href="#" class="tip_long"><c:out value='${fn:substring(result.adres,0,10)}'/> <p><c:out value='${result.adres}'/></p></td>
	                                <td class="num2"><c:out value='${result.sbscrbDe}'/><br><c:out value='${result.loginDe}'/></td>
	                                <td class="m_ch">
	                                <p onclick='goMberDetail("${result.mberId}")'  style="cursor:pointer"><img src="${contextPath}/img/admin/ico_detail.png" alt="회원상세정보" >  회원상세정보</p>
<%-- 	                                <a href="javascript:goMberDetail('<c:out value='${result.mberId}'/>');"> --%>
<%-- 	                                <img src="${contextPath}/img/admin/ico_detail.png" alt="회원상세정보" > 회원상세정보 --%>
<!-- 	                                </a> -->
<!-- 	                                <br> -->
	                                <a href="#" class="btn-example" onclick="layer_open('layer2', '<c:out value='${result.mberId}'/>', '<c:out value='${result.uniqId}' />');return false;"><img src="${contextPath}/img/admin/ico_pw.png" alt="비밀번호변경"> 비밀번호변경</a></td>
        						
        						</tr> 
						</c:forEach>
						</form>
                    	</table>
                    </div>
                    <!-- //목록리스트 -->
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
									<p class="ctxt mb20"><strong><span>비밀번호 변경</span></strong><br>
									</p>
									<div class="layerContent">
										<form name = "passwordForm" action="${contextPath}/admin/setDefaultPassword.do"">
											<input type="hidden" value="111111" name="password">
											<input type="hidden" name="mberId">
											<input type="hidden"  name="uniqId">
											<div id="targetText"></div><br>
											<input type="button" id="passwordBtn" class="btn-style"  value="비밀번호 변경">
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
		
		$("p[orderType]").bind("click", function(){
			$("p[selectedOrderType]").text($(this).text());
			$("#frm input[name=sortType]").val($(this).attr("orderType")   ); 
			$("#subForm input[name=sortType]").val($(this).attr("orderType")   ); 
			$("#frm").attr({action:"${contextPath}/admin/gnrMberList.do", target:""});
			$("#frm").submit();
		});

		$("p[searchMberType]").bind("click", function(){			
			$("p[selectedSearchMberType]").text($(this).text());
			$("#frm input[name=searchMberType]").val($(this).attr("searchMberType")   ); 
			$("#frm input[name=searchMberTypeNm]").val($(this).text()   ); 
			$("#subForm input[name=searchMberType]").val($(this).attr("searchMberType")   ); 
			$("#subForm input[name=searchMberTypeNm]").val($(this).text()   ); 
			$("#frm").attr({action:"${contextPath}/admin/gnrMberList.do", target:""});
			$("#frm").submit();
		});
		
		$("p[searchMberSe]").bind("click", function(){			
			$("p[selectedSearchMberSe]").text($(this).text());
			$("#frm input[name=searchMberSe]").val($(this).attr("searchMberSe")   ); 
			$("#frm input[name=searchMberSeNm]").val($(this).text()   ); 
			$("#subForm input[name=searchMberSe]").val($(this).attr("searchMberSe")   ); 
			$("#subForm input[name=searchMberSeNm]").val($(this).text()   ); 
			$("#frm").attr({action:"${contextPath}/admin/gnrMberList.do", target:""});
			$("#frm").submit();
		});
		
		$("p[searchActiveTyCd]").bind("click", function(){
			$("p[selectedSearchActiveTyCd]").text($(this).text());
			$("#frm input[name=searchActiveTyCd]").val($(this).attr("searchActiveTyCd")   ); 
			$("#frm input[name=searchActiveTyCdNm]").val($(this).text()   ); 
			$("#subForm input[name=searchActiveTyCd]").val($(this).attr("searchActiveTyCd")   ); 
			$("#subForm input[name=searchActiveTyCdNm]").val($(this).text()   ); 
			$("#frm").attr({action:"${contextPath}/admin/gnrMberList.do", target:""});
			$("#frm").submit();
		});
		
	})
	
	// 사업유형 클릭
	function getBsnsSeList(bsnsSe){
		$("#frm input[name=pageIndex]").val('1'); 
		$("#frm input[name=searchBsnsSe]").val(bsnsSe); 
		$('#frm').attr('action', '${contextPath}/admin/gnrMberList.do'); 
		$("#frm").submit();
	}
	
	// 검색
	function getSearchCndList(){
		$("#frm input[name=pageIndex]").val('1'); 
		$("#frm input[name=nttTyCode]").val(''); 
		$('#frm').attr('action', '${contextPath}/admin/gnrMberList.do'); 
		$("#frm").submit();
	}
	
	// 상세조회 이동
	function goMberDetail(mberId){
		mberId
		$("#frm input[name=mberId]").val(mberId);
		$('#frm').attr('action', '${contextPath}/admin/gnrMberDetail.do'); 
		$("#frm").submit();
	}
	
	// 네비게시이션 이동
	function linkPage(pageNo){
		$("#frm input[name=pageIndex]").val(pageNo); 
		$('#frm').attr('action', '${contextPath}/admin/gnrMberList.do'); 
		$("#frm").submit();
	}
	
	
	</script>
	
<script type="text/javascript">
	function layer_open(el, targetId, targetUniqId){

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
		
		
		$("#targetText").text("["+targetId+"]님의 비밀번호를 111111로 변경하시겠습니까?”");
		$("input[name=uniqId]").val(targetUniqId);
		//$(".layerContent").load("${contextPath}/cmm/fms/selectFileInfs.do"+"?param_atchFileId"+fileId);

		temp.find('div.cbtn').click(function(e){
			if(bg){
				$('.pop-layer-cover').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			}else{
				temp.fadeOut();
			}
			e.preventDefault();
		});
		
		temp.find('#passwordBtn').click(function(e){
				var infoData = $("form[name=passwordForm]").serialize();
		 		$.ajax({
				    url : "${contextPath}/admin/jsonGnrDefaultPasswordChange.do",
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
		});
		
		
		//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
		$('.pop-layer-cover .bg').click(function(e){	
			$('.pop-layer-cover').fadeOut();
			e.preventDefault();
		});
	}				
</script>
