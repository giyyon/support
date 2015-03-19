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
									<li class="smenu2"><a href="/admin/gnrMberList.do" class="select">전체개인회원 관리</a></li>
									<li class="smenu3"><a href="/admin/gnrMberList.do">- 협약개인회원</a></li>
									<li class="smenu3"><a href="/admin/gnrMberList.do">- 운영위원</a></li>
									<li class="smenu3"><a href="/admin/gnrMberList.do">- 전문위원</a></li>
									<li class="smenu2"><a href="/admin/entMberList.do">전체기관∙기업회원 관리</a></li>
									<li class="smenu3"><a href="/admin/entMberList.do">- 협약기관∙기업회원</a></li>
               </ul>
            	</div>
            	<!--//lnb-group -->
               
            
            	<div id="contents">
                	<div class="top"><a href="#"></a></div>
            		<div class="con_tit">기관∙기업회원 관리 <span>Member Administration</span>
                    	<span class="ex">회원의 소중한 정보를 관리합니다.</span>
                    </div>

                    <ul class="tap4_wrp mt20">
	                    <li><a href= "#"  onclick="javascript:# "    <c:if test="${userSearchVO.searchBsnsSe == '' }" > class="select"</c:if>>전체개인회원</a></li>
	                    <li><a href= "#"  onclick="javascript:# "  <c:if test="${userSearchVO.searchBsnsSe == 'A' }"> class="select"</c:if>>특성화 고등학교</a></li>
	                    <li><a href= "#"  onclick="javascript:# "  <c:if test="${userSearchVO.searchBsnsSe == 'B' }"> class="select"</c:if>>특성화 대학원</a></li>
	                    <li><a href= "#"  onclick="javascript:# "  <c:if test="${userSearchVO.searchBsnsSe == 'C' }"> class="select"</c:if>>온라인 교육센터</a></li>   
                    </ul>
						
                    <div class="view_info mtf5 mb5">
                        <div class="ico_box_w">
                            <ul class="ico_box2">
                            <li class="print"><a href="#" title="프린트">프린트</a></li>
                            <li class="claim"><a href="#" title="신고하기">신고하기</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="mem_info fll txt12">
                   	입력된 정보는 변경이 완료되어야만 저장되며, 개인정보 취급방침에 따라 보호되고 있습니다. 
                    </div> 
                               
                    <form:form commandName="entrprsManageVO"  id="form">      
	                    <input type="hidden" name="uniqId" value = '<c:out value='${entrprsManageVO.uniqId}'/>'>
	                    <input type="hidden" id="applcntEmailAdres" name="applcntEmailAdres" value="<c:out value='${loginVO.email}'/>">
	                    <input type="hidden" id="reprsntEmailAdres" name="reprsntEmailAdres" value='' ><!-- 대표이메일주소 -->
	                     <input type="hidden" id="zip" name="zip" value='<c:out value='${entrprsManageVO.zip}'/>'' ><!-- 우편번호 -->
	                     <input type="hidden" id="bizrno" name="bizrno" value='<c:out value='${entrprsManageVO.bizrno}'/>'' ><!-- 사업자등록번호 -->    
	                     <input type="hidden" id="withdrawId" name="withdrawId" value='<c:out value='${entrprsManageVO.entrprsmberId}'/>' >
	                     <input type="hidden" id="userSe" name="userSe" value='GNR' >
	                     <input type='hidden' id="isNewRegister" name="isNewRegister"  value="<c:out value='${isNewRegister}'/>">
                    <!-- 회원관리정보 -->
                    <div class="mem_info_sect">
                        <p>회원관리정보</p> 
                        <div class="mem_box fl100">
                        	<ul class="info_put fl100">
                            	<li><strong>일반관리 </strong>
                                	<span class="con"> <a href="javascript:goChangPassword();"><img src="${contextPath}/img/btn_pwch.png" alt="비밀번호변경"></a> <a href="#"><img src="${contextPath}/img/btn_email.png" alt="전자메일"></a> <a href="#"><img src="${contextPath}/img/btn_sns.png" alt="문자보내기"></a> <a href="javascript:goWithdraw();"><img src="${contextPath}/img/btn_out.png" alt="강제탈퇴"></a></span>
                                </li>
                                <li><strong>사업분류  </strong>
                                	<span class="con">
	                                	<form:select path="bsnsSe" id="groupId" title="사업분류">
										    <form:options items="${bsnsSe_result}" itemValue="code" itemLabel="codeNm"/>
										</form:select>
                                    </span>
                                </li>
                                <li><strong>회원유형</strong>
                                	<span class="con">
	                                	<form:select path="entrprsMberType" id="entrprsMberType" title="회원유형">
										    <form:options items="${mberType_result}" itemValue="code" itemLabel="codeNm"/>
										</form:select>
                                    </span>
                                </li>
                                <li><strong>회원분류 </strong>
                                	<span class="con">
	                                	<form:select path="entrprsMberSe" id="entrprsMberSe" title="회원분류">
										    <form:options items="${mberSe_result}" itemValue="code" itemLabel="codeNm"/>
										</form:select>
                                    </span>
                                </li>
                               
<!--                                 <li><strong>포인트 </strong> -->
<!--                                 	<span class="con"> -->
<!--                                     	<input name="" type="text" class="w100"><a href="#"><img src="../img/btn_pointch.png" alt="포인트변경"></a>                                    </span> -->
<!--                                 </li> -->
<!--                                 <li><strong>주민번호 </strong> -->
<!--                                 	<span class="con"> -->
<!--                                     	<input name="" type="text" class="w60"><em>-</em><input name="" type="text" class="w60"> -->
<!--                                     </span> -->
<!--                                 </li> -->
<!--                                 <li><strong>계좌정보</strong> -->
<!--                                 	<span class="con"> -->
<!--                                     	은행명 <input name="" type="text" class="w100">&nbsp;&nbsp; 계좌번호 <input name="" type="text" class="w120">&nbsp;&nbsp;예금주명 <input name="" type="text" class="w60"> -->
<!--                                     </span> -->
<!--                                 </li> -->
                                <li><strong>첨부파일  </strong>
                                	<span class="con">
                                    <input name="" type="text" class="w200">
									<form:hidden path="atchManageFileId" />
									<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="5" data_category="memberAttach"  data_type="file"  alt="찾아보기"   >
									<img name="btnFileDownload" src="${contextPath}/img/btn_down2.png"   alt="다운로드"> 
<%-- 									<img name="btnImgDelete" src="${contextPath}/img/btn_delete.png" alt="삭제"> --%>
                                    <span class="con_inf txt11 fl100 fcYg">* 10M 미만의 파일만 허용됩니다.</span>
                                    <br>
                                     <c:import url="/files/selectFileInfsAdvence.do" charEncoding="utf-8">
										<c:param name="param_atchFileId" value="${entrprsManageVO.atchManageFileId}" />
									 </c:import>	 
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- //회원관리정보 -->

                   <!-- 회원기본정보 -->
                    <div class="mem_info_sect">
                        <p>회원기본정보</p>
                        
                        <div class="mem_box fl100">
                        	<ul class="info_put fl100">
                            	<li><strong>기관∙기업명</strong>
                                	<span class="con"><form:input path="cmpnyNm"   class="w200"  /><span class="chk2"><form:checkbox path="cmpnyNmOthbcAt" value="Y" label="공개(비공개시 아이디로 대체)"/>  </span></span> 
                                </li>
                                <li><strong>사업자등록번호</strong>
                                	<span class="con"><input name="bizrno1" id="bizrno1"  type="text" class="w80"   value="${fn:substring(entrprsManageVO.bizrno, 0, 3)}"><em>-</em><input id="bizrno2" name="bizrno2"  type="text" class="w80"  value="${fn:substring(entrprsManageVO.bizrno, 3, 5)}"><em>-</em><input id="bizrno3" name="bizrno3"  type="text" class="w80"  value="${fn:substring(entrprsManageVO.bizrno, 5, 10)}"><a href="#"><img src="${contextPath}/img/btn_comok.png" alt="기업인증"></a>
                                    <span class="chk2"><form:checkbox path="bizrnoOthbcAt" value="Y" label="공개"/></span>
                                    </span>
                                </li>
                                <li><strong>* 아이디</strong>
                                    <span class="con"><form:input path="entrprsmberId"   readonly="true"  class="w200"  /> (고유번호:<c:out value='${entrprsManageVO.uniqId}'/>)<label id="resultChkID" ></label> <div id="resultChkID2"></div>
                                    </span> 
                                </li>
                                <li><strong>* 현재비밀번호</strong>
                                    <span class="con"><input id="oldPassword"  name="oldPassword" type="password" class="w200">&nbsp; <input type="button" name="btn" class="btn-style" onclick="javascript:goChangPassword();" value="비밀번호 변경" /> <label id="resultChgPassword" ></label>
                                    </span> 
                                </li>
               					<li><strong>* 새비밀번호 </strong>
                                    <span class="con"><input name="entrprsMberPassword" id="entrprsMberPassword"  type="password" class="w200">
                                    <span class="con_inf txt11 fl100 fcYg">*9~16자의 영문+숫자+특수문자로 입력하여 주시기 바랍니다.</span></span> 
                                </li>
                                <li><strong>* 새비밀번호확인</strong>
                                    <span class="con"><input name="passwordChk" id="passwordChk"  type="password" class="w200"></span> 
                                </li>
                                <li><strong>* 별명 </strong>
                                	<span class="con">
                                    	<form:input path="nick"   class="w1000"  /><span class="chk"><form:checkbox path="nickOthbcAt" value="Y" label="공개"/></span><br/>
                                     	<span class="con_inf txt11 fl100 fcYg">*게시판, 토론 등 커뮤니티 활동에 사용합니다.</span>
                                        
                                    </span>
                                </li>
                                <li><strong>* 업종정보</strong>
                                	<span class="con">
	                                    <form:select path="jobArea" id="jobArea" title="분야 선택">
					                        <form:option value="" label="분야 선택"/>
					                        <form:options items="${jobArea_result}" itemValue="code" itemLabel="codeNm"/>
					                    </form:select>               
		                                 <form:select path="jobType" id="jobType" title="업종 선택">
					                        <form:option value="" label="업종 선택"/>
					                        <form:options items="${jobType_result}" itemValue="code" itemLabel="codeNm"/>
					                    </form:select>                   	
		                                 <form:select path="jobClass" id="jobClass" title="직종 선택">
					                        <form:option value="" label="직종 선택"/>
					                        <form:options items="${jobClass_result}" itemValue="code" itemLabel="codeNm"/>
					                    </form:select>    
                                    	<span class="chk"><form:checkbox path="jobOthbcAt" value="Y" label="공개"/></span>
                                    </span> 
                                </li>
                                <li><strong>* 대표자명 </strong>
                                	<span class="con"><form:input path="cxfc"   class="w200"  />
                                    <span class="chk"><form:checkbox path="cxfcOthbcAt" value="Y" label="공개"/></span>
                                    </span> 
                                </li>
                                <li><strong>* 설립일</strong>
                                	<span class="con">                                	
<%--                                     <form:select path ='establishYear' > --%>
<%--                                     <form:option value="" label="연도" /> --%>
<%-- 	                                    <c:forEach var="result" items="${year_result}" varStatus="status"> --%>
<%-- 	                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option> --%>
<%-- 	                                    </c:forEach> --%>
<%--                                     </form:select> --%>
									<form:select path="establishYear" >
									    <form:option value="" label="연도"/>
									    <form:options items="${year_result}" itemValue="code" itemLabel="codeNm"/>
									</form:select>                                    
                                    
									<form:select path="establishMonth">
									  <form:option value="" label="월" />
									  <form:option value="1" label="1" />
									  <form:option value="2" label="2" />
									  <form:option value="3" label="3" />
									  <form:option value="4" label="4" />
									  <form:option value="5" label="5" />
									  <form:option value="6" label="6" />
									  <form:option value="7" label="7" />
									  <form:option value="8" label="8" />
									  <form:option value="9" label="9" />
									  <form:option value="10" label="10" />
									  <form:option value="11" label="11" />
									  <form:option value="12" label="12" />
									</form:select>	
									
                                    <select  id ='establishDay' name="establishDay">
                                    	<option value=''> 일 </option>
	                                    <c:forEach var="result" items="${day_result}" varStatus="status">
	                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
	                                    </c:forEach>
                                    </select>  
                                    
                                        <span class="chk"><form:checkbox path="establishOthbcAt" value="Y" label="공개"/></span>
                                    </span> 
                                </li>
                                <li><strong>* 대표이메일</strong>
                                	<span class="con">
                                    <form:input path="reprsntEmailAdresHead"   class="w100"  /> <em>@</em><form:input path="reprsntEmailAdresTail"   class="w100"  />
                                   
                                    <select  id ='reprsntEmailAdresList'>
                                    	<option value=''>---선택하세요---</option>
	                                    <c:forEach var="result" items="${email_result}" varStatus="status">
	                                    	<option value='<c:out value="${result.codeNm}"/>' ><c:out value="${result.codeNm}"/></option>
	                                    </c:forEach>
                                    </select>                                    
                                    <span class="txt11 fcYg"><form:checkbox path="reprsntRecvAt" value="Y" label="이메일/SMS수신동의"/></span>
                                    <span class="chk"><form:checkbox path="reprsntEmailAdresOthbcAt" value="Y" label="공개"/></span>
                                    </span>
                                </li>
                                <li><strong>* 대표전화</strong>
                                	<span class="con">
                                    <form:input path="reprsntAreaNo"   class="w30"  />
                                    <em>-</em><form:input path="reprsntEntrprsMiddleTelno"   class="w40"  /><em>-</em><form:input path="reprsntEntrprsEndTelno"   class="w40"  />
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    <span class="chk"><form:checkbox path="telOthbcAt" value="Y" label="공개"/></span>
                                    </span> 
                                </li>
                                <li><strong>* 대표팩스</strong>
                                	<span class="con">
                                   <form:input path="fxnum"   class="w100"  />
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    <span class="chk"><form:checkbox path="fxnumOthbcAt" value="Y" label="공개"/></span>
                                    </span> 
                                </li>
                                <li><strong>* 대표주소</strong>
                                	<span class="con">
                                	<input name="zip1" id="zip1" type="text" class="w40"  value="${fn:substring(entrprsManageVO.zip, 0, 3)}"><em>-</em><input name="zip2" id="zip2" type="text"  value="${fn:substring(entrprsManageVO.zip, 3, 6)}" class="w40"><a href="#"><img src="${contextPath}/img/btn_post.png" alt="우편번호"></a>
                                    <form:input path="adres"   class="long2"  /><br/>
                                    <b>상세주소:</b><form:input path="detailAdres"   class="long"  />
                                    <span class="chk"><form:checkbox path="adresOthbcAt" value="Y" label="공개"/></span>
                                    </span> 
                                </li>
                                <li><strong>* 사업자등록증</strong>
                                	<span class="con">
                                                                        <input name="file1_text" type="text" class="w200">
                                    <form:hidden path="atchBizFileId" />
									<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="5" data_category="memberAttach"  data_type="file"  alt="찾아보기"   >
                                   	<img name="btnFileDownload" src="${contextPath}/img/btn_down2.png"    data_type="file"   alt="다운로드"> 
<%--                                    	<img name="btnImgDelete" src="${contextPath}/img/btn_delete.png" alt="삭제">     --%>
                                   	<span class="con_inf txt11 fl100 fcYg">* 5M 미만의 파일만 허용됩니다.</span>
                                    <br>
                                     <c:import url="/files/selectFileInfsAdvence.do" charEncoding="utf-8">
										<c:param name="param_atchFileId" value="${entrprsManageVO.atchBizFileId}" />
									</c:import>
                                    </span>
                                </li>
                            </ul>
                        </div><!-- // 박스 -->
                                            
                    </div>
                    <!-- //회원기본정보 -->
                    
                    <!-- 실무담당자정보 -->
                    <div class="mem_info_sect">
                        <p>실무담당자정보</p>
                        
                        <div class="mem_box fl100">
                        	<ul class="info_put fl100">
                            	<li><strong>* 담당자명</strong>
                                	<span class="con"><form:input path="applcntNm"   class="w40"  /><!--  input name="" type="text" class="w100"--> &nbsp;&nbsp;<a href="#"><img src="${contextPath}/img/btn_ipinok.png" alt="아이핀병경"></a>
                                    <span class="stit">&nbsp;&nbsp;<b>직위:</b><form:input path="ofcpsNm"   class="w100"  /></span>
                                        <span class="stit">&nbsp;&nbsp;<b>부서:</b><form:input path="pstinstDeptNm"   class="w100"  /></span>
                                    </span>
                                </li>
                                <li><strong>* 이메일</strong>
                                	<span class="con">
                                	<form:input path="applcntEmailAdresHead"   class="w100"  /> <em>@</em><form:input path="applcntEmailAdresTail"   class="w100"  />
                                   
                                    <select  id ='applcntEmailAdresList'>
                                    	<option value=''>---선택하세요---</option>
	                                    <c:forEach var="result" items="${email_result}" varStatus="status">
	                                    	<option value='<c:out value="${result.codeNm}"/>' ><c:out value="${result.codeNm}"/></option>
	                                    </c:forEach>
                                    </select>    
                                    <span class="txt11 fcYg"><form:checkbox path="reprsntRecvAt" value="Y" label="이메일/SMS수신동의"/></span>
                                    </span>
                                </li>
                                <li><strong>* 휴대폰</strong>
                                	<span class="con">
                                	<form:input path="mbtlnum"   class="w200"  /> 
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    </span> 
                                </li>
                                <li><strong>* 직통전화 </strong>
                                	<span class="con">
                                    <form:input path="areaNo"   class="w30"  />
                                    <em>-</em><form:input path="entrprsMiddleTelno"   class="w40"  /><em>-</em><form:input path="entrprsEndTelno"   class="w40"  /> 
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    </span> 
                                </li>

                            </ul>
                        </div>
                    </div>
                    <!-- //실무담당자정보 -->       

                    <!-- 회원부가정보 -->
                    <div class="mem_info_sect">
                        <p>회원부가정보</p>
                        
                        <div class="mem_box fl100">
                        	<ul class="info_put fl100">
                            	<li><strong>이미지</strong>
                                	<span class="con">
                                        
                                        <div id="tabs">
		                                        <ul class="tap_w">
		                                            <li class="select"><a href="#tab1" class="selected">로고</a></li>
		                                            <li><a href="#tab2">사진1</a></li>
		                                            <li><a href="#tab3">사진2</a></li>
		                                            <li><a href="#tab4">사진3</a></li>
		                                            <li><a href="#tab5">사진4</a></li>
		                                        </ul>
		                                        <ul class="panel">
		                                        	<li id="tab1">
			                                        	<dl class="pic_regist">
			                                        		<c:choose>
			                                        			<c:when test= "${entrprsManageVO.atchImgLogoFileId ==null || entrprsManageVO.atchImgLogoFileId ==''}">
				                                        			<dt class="img_div"  ></dt>
				                                        		</c:when>
				                                        		<c:otherwise>				                                        		
				                                        			<dt class="img_div"  style="background: url(/files/imageThumnailSrcByFileId.do?fileId=${entrprsManageVO.atchImgLogoFileId}) 0% 50% no-repeat;"></dt>
				                                        		</c:otherwise>
				                                        	</c:choose>
				                                            <dd class="file_sector">
				                                            	<input name="file1_text"  type="text" class="w200">
				                                            	<form:hidden path="atchImgLogoFileId" />
			                                            		<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="1" data_category="memberImg" data_type="img"  alt="찾아보기"   >
			                                            		<img name="btnFileDownload" src="${contextPath}/img/btn_down2.png"    data_type="file"   alt="다운로드"> 
<%-- 			                                            		<img name="btnFileDelete" src="${contextPath}/img/btn_delete.png" alt="삭제"> --%>
					                                            <span class="con_inf2 fl100">
					                                            * 일반게시판, 자기소개, 댓글 등에서 대표이미지로 사용됩니다.<br/>
																* 사진크기는 <span class="fcYg">1:1비율(90x115픽셀, 100kbyte 이하)</span>에서 최적화되어 보입니다.<br/>
																* 파일포맷은 RGB모드의 JPG, GIF가 가장 좋습니다..
																</span>
					                                        </dd>
					                                        </dl>
				                                        </li>
				                                        <li id="tab2">
				                                        	<dl class="pic_regist">
				                                        		<c:choose>
				                                        			<c:when test= "${entrprsManageVO.atchImg1FileId ==null || entrprsManageVO.atchImg1FileId ==''}">
					                                        			<dt class="img_div"  ></dt>
					                                        		</c:when>
					                                        		<c:otherwise>				                                        		
					                                        			<dt class="img_div"  style="background: url(/files/imageThumnailSrcByFileId.do?fileId=${entrprsManageVO.atchImg1FileId}) 0% 50% no-repeat;"></dt>
					                                        		</c:otherwise>
					                                        	</c:choose>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<form:hidden path="atchImg1FileId" />
			                                            			<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="1" data_category="memberImg" data_type="img"  alt="찾아보기"   >
				                                            		<img name="btnFileDownload" src="${contextPath}/img/btn_down2.png"    data_type="file"   alt="다운로드"> 
<%-- 				                                            		<img name="btnFileDelete" src="${contextPath}/img/btn_delete.png" alt="삭제"> --%>
						                                            <span class="con_inf2 fl100">
							                                            * 일반게시판, 자기소개, 댓글 등에서 대표이미지로 사용됩니다.<br/>
																		* 사진크기는 <span class="fcYg">1:1비율(90x115픽셀, 100kbyte 이하)</span>에서 최적화되어 보입니다.<br/>
																		* 파일포맷은 RGB모드의 JPG, GIF가 가장 좋습니다..
																		</span>
					                                        	</dd>
					                                        </dl>
			                                        </li>
			                                        <li id="tab3">
				                                        	<dl class="pic_regist">
				                                        		<c:choose>
				                                        			<c:when test= "${entrprsManageVO.atchImg2FileId ==null || entrprsManageVO.atchImg2FileId ==''}">
					                                        			<dt class="img_div"  ></dt>
					                                        		</c:when>
					                                        		<c:otherwise>				                                        		
					                                        			<dt class="img_div"  style="background: url(/files/imageThumnailSrcByFileId.do?fileId=${entrprsManageVO.atchImg2FileId}) 0% 50% no-repeat;"></dt>
					                                        		</c:otherwise>
					                                        	</c:choose>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<form:hidden path="atchImg2FileId" />
			                                            			<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="1" data_category="memberImg" data_type="img"  alt="찾아보기"   >
			                                            			<img name="btnFileDownload" src="${contextPath}/img/btn_down2.png"    data_type="file"   alt="다운로드"> 
<%-- 			                                            			<img name="btnFileDelete" src="${contextPath}/img/btn_delete.png" alt="삭제"> --%>
					                                            
					                                            
						                                            <span class="con_inf2 fl100">
						                                            * 일반게시판, 자기소개, 댓글 등에서 대표이미지로 사용됩니다.<br/>
																	* 사진크기는 <span class="fcYg">1:1비율(90x115픽셀, 100kbyte 이하)</span>에서 최적화되어 보입니다.<br/>
																	* 파일포맷은 RGB모드의 JPG, GIF가 가장 좋습니다..
																	</span>
					                                        </dd>
					                                        </dl>
			                                        </li>
			                                        <li id="tab4">
				                                        	<dl class="pic_regist">
				                                        		<c:choose>
				                                        			<c:when test= "${entrprsManageVO.atchImg3FileId ==null || entrprsManageVO.atchImg3FileId ==''}">
					                                        			<dt class="img_div"  ></dt>
					                                        		</c:when>
					                                        		<c:otherwise>				                                        		
					                                        			<dt class="img_div"  style="background: url(/files/imageThumnailSrcByFileId.do?fileId=${entrprsManageVO.atchImg3FileId}) 0% 50% no-repeat;"></dt>
					                                        		</c:otherwise>
					                                        	</c:choose>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<form:hidden path="atchImg3FileId" />
			                                            			<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="1" data_category="memberImg" data_type="img"  alt="찾아보기"   >
			                                            			<img name="btnFileDownload" src="${contextPath}/img/btn_down2.png"    data_type="file"   alt="다운로드"> 
<%-- 			                                            			<img name="btnFileDelete" src="${contextPath}/img/btn_delete.png" alt="삭제"> --%>
					                                            
						                                            <span class="con_inf2 fl100">
						                                            * 일반게시판, 자기소개, 댓글 등에서 대표이미지로 사용됩니다.<br/>
																	* 사진크기는 <span class="fcYg">1:1비율(90x115픽셀, 100kbyte 이하)</span>에서 최적화되어 보입니다.<br/>
																	* 파일포맷은 RGB모드의 JPG, GIF가 가장 좋습니다..
																	</span>
					                                        </dd>
					                                        </dl>
			                                        </li>
			                                        <li id="tab5">
				                                        	<dl class="pic_regist">
				                                        		<c:choose>
				                                        			<c:when test= "${entrprsManageVO.atchImg4FileId ==null || entrprsManageVO.atchImg4FileId ==''}">
					                                        			<dt class="img_div"  ></dt>
					                                        		</c:when>
					                                        		<c:otherwise>				                                        		
					                                        			<dt class="img_div"  style="background: url(/files/imageThumnailSrcByFileId.do?fileId=${entrprsManageVO.atchImg4FileId}) 0% 50% no-repeat;"></dt>
					                                        		</c:otherwise>
					                                        	</c:choose>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<form:hidden path="atchImg4FileId" />
			                                            			<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="1" data_category="memberImg" data_type="img"  alt="찾아보기"   >
			                                            			<img name="btnFileDownload" src="${contextPath}/img/btn_down2.png"    data_type="file"   alt="다운로드"> 
<%-- 			                                            			<img name="btnFileDelete" src="${contextPath}/img/btn_delete.png" alt="삭제"> --%>
					                                            	<span class="con_inf2 fl100">
						                                            * 일반게시판, 자기소개, 댓글 등에서 대표이미지로 사용됩니다.<br/>
																	* 사진크기는 <span class="fcYg">1:1비율(90x115픽셀, 100kbyte 이하)</span>에서 최적화되어 보입니다.<br/>
																	* 파일포맷은 RGB모드의 JPG, GIF가 가장 좋습니다..
																	</span>
					                                        </dd>
					                                        </dl>
			                                        </li>
			                                      </ul>
                                    	</div>                                  
                                    </span> 
                                </li>
                                <li><strong>요약소개</strong>
                                    <span class="con">
                                        <form:textarea path="shortNotice"></form:textarea>
                                        <span class="con_inf2 fl100 txt11">
                                        * 주요서비스(상품)가 포함된 기관?기업소개를 간략 (100자까지)하게 입력하여 주시기 바랍니다.<br/>&nbsp;&nbsp;&nbsp;본정보는 사업신청 및 관리, 주소록 등에서 매우 많이 노출됩니다.<br/>
&nbsp;&nbsp;&nbsp;예) ○○○○는 다양한 분야와의 통섭으로 공간정보문화를 창달코자 합니다.  주요서비스로는  스마트 네비게이션, 프로그램 등이 있습니다.
										</span>
                                    </span>
                                    </span> 
                                </li>
                                <li><strong>홈페이지</strong>
                                    <span class="con"><form:input path="homepageUrl"   class="long"  placeholder="http://  를 포함한 전체 URL을 입력바랍니다" /></span> 
                                </li>
                                <li><strong>블로그</strong>
                                    <span class="con"><form:input path="blogUrl"   class="long"  placeholder="http://  를 포함한 전체 URL을 입력바랍니다" /></span> 
                                </li>
                                 <li><strong>소셜</strong>
                                    <span class="con"><form:input path="socialUrl"   class="long"  placeholder="http://  를 포함한 전체 URL을 입력바랍니다" /></span> 
                                </li>
                                <li><strong>직원수</strong>
                                    <span class="con"><form:input path="empCnt"   class="long"  /></span> 
                                </li>
                                <li><strong>자본금</strong>
                                    <span class="con"><form:input path="capitalMoney"   class="long"  /></span> 
                                </li>
                                <li><strong>매출액</strong>
                                    <span class="con"><form:input path="salesMoney"   class="long"  /></span> 
                                </li>
                                <li><strong>소개서</strong>
                                	<span class="con">

                                    <input name="file1_text" type="text" class="w200">
									<form:hidden path="atchReportFileId" />
									<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="5" data_category="memberAttach"  data_type="file"  alt="찾아보기"   >
                                   	<img name="btnFileDownload" src="${contextPath}/img/btn_down2.png"    data_type="file"   alt="다운로드"> 
<%--                                    	<img name="btnImgDelete" src="${contextPath}/img/btn_delete.png" alt="삭제">     --%>
                                    <span class="con_inf txt11 fl100 fcYg">* 10M 미만의 파일만 허용됩니다.</span>
                                    <br>
                                     <c:import url="/files/selectFileInfsAdvence.do" charEncoding="utf-8">
										<c:param name="param_atchFileId" value="${entrprsManageVO.atchReportFileId}" />
									</c:import>
                                    </span>
                                </li>
                                <li><strong>포트폴리오</strong>
                                	<span class="con">
                                    <input name="file1_text" type="text" class="w200">
									<form:hidden path="atchPortFileId" />
									<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="5" data_category="memberAttach"  data_type="file"  alt="찾아보기"   >
                                   	<img name="btnFileDownload" src="${contextPath}/img/btn_down2.png"    data_type="file"   alt="다운로드"> 
<%--                                    	<img name="btnImgDelete" src="${contextPath}/img/btn_delete.png" alt="삭제">     --%>
                                    <span class="con_inf txt11 fl100 fcYg">* 10M 미만의 파일만 허용됩니다.</span>
                                    <br>
                                     <c:import url="/files/selectFileInfsAdvence.do" charEncoding="utf-8">
										<c:param name="param_atchFileId" value="${entrprsManageVO.atchPortFileId}" />
									</c:import>
                                    </span>
                                </li>         
                             </ul>
                        </div><!-- //약관내용 박스 -->
                                            
                    </div>
                    <!-- //회원부가정보 -->
                                                   
					<!-- 총괄책임자 -->
                    <div class="mem_info_sect">
                        <p>총괄책임자
                        	<span class="choice"><input name="chkSameMnger"  type="radio" value="Y" >실무담당자와 동일&nbsp;&nbsp;&nbsp;<input name="chkSameMnger"  type="radio" value="N">새로입력</span>
                        </p>
                        <div class="mem_box fl100">
                        	<ul class="info_put fl100">
                            	<li><strong>담당자명</strong>
                                	<span class="con"><form:input path="mngNm"   class="w100"  /> &nbsp;
                                    <span class="stit"><b>직위:</b><form:input path="mngOfcpsNm"   class="w100"  /></span>
                                        <span class="stit"><b>부서:</b><form:input path="mngPstinstDeptNm"   class="w100"  /></span>
                                    </span>
                                </li>
                                <li><strong>이메일</strong>
                                	<span class="con">
                                    <form:input path="mngEmailAdresHead"   class="w100"  /> <em>@</em><form:input path="mngEmailAdresTail"   class="w100"  />
                                    <select  id ='mngEmailAdresList'>
                                    	<option value=''>---선택하세요---</option>
	                                    <c:forEach var="result" items="${email_result}" varStatus="status">
	                                    	<option value='<c:out value="${result.codeNm}"/>' ><c:out value="${result.codeNm}"/></option>
	                                    </c:forEach>
                                    </select>    
                                    </span>
                                </li>
                                <li><strong>휴대폰</strong>
                                	<span class="con">
                                    <form:input path="mngMbtlnum"   class="w200"  /> 
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    </span> 
                                </li>
                                <li><strong>* 직통전화 </strong>
                                	<span class="con">
                                    <form:input path="mngAreaNo"   class="w30"  />
                                    <em>-</em><form:input path="mngEntrprsMiddleTelno"   class="w40"  /><em>-</em><form:input path="mngEntrprsEndTelno"   class="w40"  /> 
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    </span> 
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- //총괄책임자 -->
                    
                    <!-- 세무회계담당자 -->
                    <div class="mem_info_sect">
                        <p>세무회계담당자
                        	<span class="choice"><input name="chkSamTaxer"  type="radio" value="Y" >실무담당자와 동일&nbsp;&nbsp;&nbsp;<input name="chkSamTaxer"  type="radio" value="N">새로입력</span>
                        </p>
                        <div class="mem_box fl100">
                        	<ul class="info_put fl100">
                            	<li><strong>담당자명</strong>
                                	<span class="con"><form:input path="taxNm"   class="w100"  /> &nbsp;
                                    <span class="stit"><b>직위:</b><form:input path="taxOfcpsNm"   class="w100"  /></span>
                                        <span class="stit"><b>부서:</b><form:input path="taxPstinstDeptNm"   class="w100"  /></span>
                                    </span>
                                </li>
                                <li><strong>이메일</strong>
                                	<span class="con">
                                    <form:input path="taxEmailAdresHead"   class="w100"  /> <em>@</em><form:input path="taxEmailAdresTail"   class="w100"  />
                                    <select  id ='taxEmailAdresList'>
                                    	<option value=''>---선택하세요---</option>
	                                    <c:forEach var="result" items="${email_result}" varStatus="status">
	                                    	<option value='<c:out value="${result.codeNm}"/>' ><c:out value="${result.codeNm}"/></option>
	                                    </c:forEach>
                                    </select>    
                                    </span>
                                </li>
                                <li><strong>휴대폰</strong>
                                	<span class="con">
                                    <form:input path="taxMbtlnum"   class="w200"  /> 
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    </span> 
                                </li>
                                <li><strong>* 직통전화 </strong>
                                	<span class="con">
                                    <form:input path="taxAreaNo"   class="w30"  />
                                    <em>-</em><form:input path="taxEntrprsMiddleTelno"   class="w40"  /><em>-</em><form:input path="taxEntrprsEndTelno"   class="w40"  /> 
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    </span> 
                                </li>
                            	
                            	
								<li><strong>기관∙기업 개요</strong>
                                	<span class="con">
                                	<form:textarea path="notice"  htmlEscape="false" ></form:textarea>
                                    <script>
                                    CKEDITOR.replace(
                                 	'notice',
                                 	{
                                 		contenteditable:"false",
                                 		filebrowserImageUploadUrl : '/files/ckEditor/insertImage.do',
                                 		width : '100%', //넓이값
                                 		height : '200'      //높이값
                                 	}
                                    );
                                    </script>                              	
                                        <!--가로 665사이즈 입력폼 -->
<!--                                         <img src="../img/smart_form.png" width="665" height="328"> -->
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- //세무회계담당자 -->   
                    </form:form>
                    
                    <!-- 버튼영역 -->
                    <div class="mbtn_wrap">
                   		<a href="#"><img src="${contextPath}/img/btn_regist.png" alt="등록"  onclick="goSave();"></a><a href="#"><img src="${contextPath}/img/btn_cancle.png" alt="취소" onclick="goList();"></a></div>
                    <!-- //버튼영역 -->

            	</div>
            	<!--//contents -->
        	</div>
        	<!--//content-group -->
		</div><!--//sub_container -->
    <span class="con">
    
    </span><!--//container -->

    <script type="text/javaScript" language="javascript">
	$(function(){
 		$("form").attr({action:"${contextPath}/admin/updateEntMberInfo.do", target:""});

  		$("#tabs ul.panel li:not("+$("#tabs ul.tap_w li a.selected").attr("href")+")").hide();
		$(".tap_w li a").click(function(){
    			$("#tabs ul.tab li a").removeClass("selected");		    			
    			$("#tabs ul.tap_w li").removeClass("select");
    			
    			$(this).addClass("selected");
    			$(this).parent().addClass("select");
    			
    			
    			$("#tabs ul.panel li").hide();
    			
    			$($(this).attr("href")).show();
    			return false;
    		});
 		
		if($("#isNewRegister").val() == 'true'){
			$('#entrprsMberType').val('D01').attr('selected', 'selected');
		}
		
 		$("#resultChkID").css("float", "right");
		$("#chkDupleID").click(function(){
			chkDupleID();
        });
		//이메일 도메인 선택
		$( "#reprsntEmailAdresList" ) .change(function () {
		    																					$("#reprsntEmailAdresTail").val(  $( "#reprsntEmailAdresList option:selected" ).val());  
		    																					$('#reprsntEmailAdres').val( $('#reprsntEmailAdresHead').val() +"@"+ $('#reprsntEmailAdresTail').val());
		                                                                                       });
		//이메일 도메인 선택
		$( "#applcntEmailAdresList" ) .change(function () {
		    																					$("#applcntEmailAdresTail").val(  $( "#applcntEmailAdresList option:selected" ).val());  
		    																					$('#applcntEmailAdres').val( $('#applcntEmailAdresHead').val() +"@"+ $('#applcntEmailAdresTail').val());
		                                                                                       });
		//대표이메일 조합
		$('#reprsntEmailAdresHead, #reprsntEmailAdresTail').change(function(){
			$('#reprsntEmailAdres').val( $('#reprsntEmailAdresHead').val() +"@"+ $('#reprsntEmailAdresTail').val());
		});		
		//담당자이메일 조합
		$('#applcntEmailAdresHead, #applcntEmailAdresTail').change(function(){
			$('#applcntEmailAdres').val( $('#applcntEmailAdresHead').val() +"@"+ $('#applcntEmailAdresTail').val());
		});	
		
		//이메일 도메인 선택
		$( "#mngEmailAdresList" ) .change(function () {
		    																					$("#mngEmailAdresTail").val(  $( "#mngEmailAdresList option:selected" ).val());  
		    																					$('#mngEmailAdres').val( $('#mngEmailAdresHead').val() +"@"+ $('#mngEmailAdresTail').val());
		                                                                                       });
		//이메일 도메인 선택
		$( "#taxEmailAdresList" ) .change(function () {
		    																					$("#taxEmailAdresTail").val(  $( "#taxEmailAdresList option:selected" ).val());  
		    																					$('#taxEmailAdres').val( $('#taxEmailAdresHead').val() +"@"+ $('#taxEmailAdresTail').val());
		                                                                                       });
		
		//총괄책임자이메일 조합
		$('#mngEmailAdresHead, #mngEmailAdresTail').change(function(){
			$('#mngEmailAdres').val( $('#mngEmailAdresHead').val() +"@"+ $('#mngEmailAdresTail').val());
		});		
		//세무자이메일 조합
		$('#taxEmailAdresHead, #taxEmailAdresTail').change(function(){
			$('#taxEmailAdres').val( $('#taxEmailAdresHead').val() +"@"+ $('#taxEmailAdresTail').val());
		});	

		//총괄책임자 선택
		$( "input[name=chkSameMnger]" ).click(function(){
			if($(this).val()=='Y'){
				$("#mngNm").val($("#applcntNm").val());
				$("#mngOfcpsNm").val($("#ofcpsNm").val());
				$("#mngPstinstDeptNm").val($("#pstinstDeptNm").val());
				
				var email = $("#applcntEmailAdres").val();
				var emailArray = email.split('@');
				$("#mngEmailAdresHead").val(emailArray[0]);
				$("#mngEmailAdresTail").val(emailArray[1]);
				$("#mngEmailAdres").val(email);
				
				$("#mngMbtlnum").val($("#mbtlnum").val());
				$("#mngAreaNo").val($("#areaNo").val());
				$("#mngEntrprsMiddleTelno").val($("#entrprsMiddleTelno").val());
				$("#mngEntrprsEndTelno").val($("#entrprsEndTelno").val());
			}else if($(this).val()=='N'){
				$("#mngNm").val('');
				$("#mngOfcpsNm").val('');
				$("#mngPstinstDeptNm").val('');
				$("#mngEmailAdresHead").val('');
				$("#mngEmailAdresTail").val('');
				$("#mngEmailAdres").val('');
				$("#mngMbtlnum").val('');
				$("#mngAreaNo").val('');
				$("#mngEntrprsMiddleTelno").val('');
				$("#mngEntrprsEndTelno").val('');
			}
		});
				
		//세무담당자 선택
		$( "input[name=chkSamTaxer]" ).click(function(){
			
			if($(this).val()=='Y'){
				$("#taxNm").val($("#applcntNm").val());
				$("#taxOfcpsNm").val($("#ofcpsNm").val());
				$("#taxPstinstDeptNm").val($("#pstinstDeptNm").val());
				
				var email = $("#applcntEmailAdres").val();
				var emailArray = email.split('@');
				$("#taxEmailAdresHead").val(emailArray[0]);
				$("#taxEmailAdresTail").val(emailArray[1]);
				$("#taxEmailAdres").val(email);
				
				$("#taxMbtlnum").val($("#mbtlnum").val());
				$("#taxAreaNo").val($("#areaNo").val());
				$("#taxEntrprsMiddleTelno").val($("#entrprsMiddleTelno").val());
				$("#taxEntrprsEndTelno").val($("#entrprsEndTelno").val());
			}else if($(this).val()=='N'){
				$("#taxNm").val('');
				$("#taxOfcpsNm").val('');
				$("#taxPstinstDeptNm").val('');
				$("#taxEmailAdresHead").val('');
				$("#taxEmailAdresTail").val('');
				$("#taxEmailAdres").val('');
				$("#taxMbtlnum").val('');
				$("#taxAreaNo").val('');
				$("#taxEntrprsMiddleTelno").val('');
				$("#taxEntrprsEndTelno").val('');
			}
		});
		
		//우편번호 조합
		$('#zip1, #zip2').change(function(){
			$('#zip').val( $('#zip1').val() + $('#zip2').val());
		});		
		//사업자번호 조합
		$('#bizrno1, #bizrno2, #bizrno3').change(function(){
			$('#bizrno').val( $('#bizrno1').val() + $('#bizrno2').val()+ $('#bizrno3').val());
		});				

		$("#entrprsmberId").change(function(){ 
				$("#isDoneIDchk").val('N');
				$('#resultChkID').html('');
		});

		$('[name=btnFileUpload]').click(function(e) {
    		
    		var offset = $(this).offset();
    		var currPlace = $('body').scrollTop();
    		var thisType = $(this).attr('data_type');
    		var category = $(this).attr('data_category');
    		var fileMax = $(this).attr('data_fileMax');
    		
    		var $imgId = $(this).parent().find(':hidden');
    		var $fileNmme = $(this).parent('').find('[name=file1_text]');
    		var $imgDiv = $(this).closest('dl').find('dt');
    		
    		var params = fn_dataParamSetting(category, fileMax, thisType, $imgId.val());
    		e.preventDefault();
    				
    		var options = {
    			url : '<c:url value="/files/uploadPage.do" />',
    			width : 650,
    			height : 400,
    			closeCallback : closeCallback,
    			title : '[File upload center]',
    			data : params,
    			buttonType : 0
    		};
    		var $dialog = BIT.modalDialog(options);
    		
    		function closeCallback(returnValue) {
    			if (returnValue != null && returnValue.length > 0) {
    				var files = returnValue;
    				var fileIds = '';
    				var fileNames = '';
    				//단일 이미지 처리시에만 적용 올려진 썸네일 이미지를 리턴받아 화면상에 이미지 영역에 뿌려줌
    				var imgUrl = "";
    				
    				for (var i = 0; i < files.length; i++) {
    					if (fileIds) {
    						fileIds = files[i].atchFileId;
    						fileNames += ',' + files[i].orignlFileNm;
    					} else {
    						fileIds = files[i].atchFileId;
    						fileNames = files[i].orignlFileNm;
    						imgUrl =   '<c:url value="/files/imageSrc.do?path=" />'+files[i].category  +'/thumnails&physical=' + files[i].streFileNm;    
//	    						imgUrl =  '<c:url value="/webAttach/thumnails/" />' + files[i].streFileNm;
    					}
    				}
    				var options = {"background":"url("+imgUrl+")", 'background-repeat' : 'no-repeat', 'background-position':'center left'};
    				$imgId.val(fileIds);
    				$fileNmme.val(fileNames);
    				if(thisType == 'img'){
    					$imgDiv.css(options);
    				}
    				
    			} else {
    				$imgId.val('');
    				$fileNmme.val('');
    				if(thisType == 'img'){
    					$imgDiv.css('background', 'url(/img/noimg.png)');
    				}
    				
    			}
    		}
    	});

    	$('[name=btnFileDownload]').click(function(e) {
    		e.preventDefault();
    		var category = $(this).attr('data_category');
    		var $imgId = $(this).parent().find(':hidden');
    		COM.openFileListPopup(category, $imgId.val());
    	});

		$('[name=btnImgDelete]').click(function(e){
			$(this).parent().find(':hidden').val('');
    		$(this).parent('').find('[name=file1_text]').val('');
		});
		
		$('[name=btnFileDelete]').click(function(e){
			var $imgId = $(this).parent().find(':hidden');
    		var $fileNmme = $(this).parent('').find('[name=file1_text]');
    		var $imgDiv = $(this).closest('dl').find('dt');
			
    		$imgId.val('');
    		$fileNmme.val('')
    		var basicImg = '<c:url value="/webAttach/thumnails/" />'
    		$imgDiv.css
		});
	
});
   	function fn_dataParamSetting(category, fileMax, type, filesIds){
   		var fileExtn = '';
   		
   		if(type == "img"){
   			fileExtn = 'jpg|jpeg|png|bmp|gif';
   		} else {
   			fileExtn = '';
   		}
   		
   		var params = {
   				Category : category,
					Accept : fileExtn,
   				Max : Number(fileMax),
   				Type : type,
   				FileIds : filesIds
   			}
   		
   		return params;
   	}

    function replaceModalwindow(offset, currPlace) {
    	$('.ui-dialog').css('top', offset.top +'px');
    	$( 'html, body' ).animate( { scrollTop : currPlace }, 0);
    }
	
	function goSave(){
		var  result = isOkAllproperty() ;
		if(isOkAllproperty() == 'OK'){
			$("form").submit();
		}else{
			alert(result);
		}
	}
	
	
	function isOkAllproperty(){
		var result = '';
// 		if(!chkPassword())
// 			return '비밀번호 확인 값이 다릅니다. 확인 바랍니다.'; 
// 		if(!chkDupleIDFalg())
// 			return '아이디 중복 확인 바랍니다.'; 
// 		if(!chkZip())
// 			return '우편번호 입력바랍니다'; 
		
		return 'OK';
	}

 	function chkPassword(){
 		
        if($("#oldPassword").val() == ''||  $("#entrprsMberPassword").val() == '' ||  $("#passwordChk").val() == ''){
        	return '비밀번호를 입력하시기 바랍니다';
        }
 		if( $("#entrprsMberPassword").val() !=  $("#passwordChk").val()  ) {
 				return '변경할 비밀번호가 서로 다릅니다. 확인 바랍니다.';	
 		}
 			return 'OK';
 	}
 	
 	
 	function chkDupleIDFalg(){  
 		if($("#isDoneIDchk").val() != 'Y')
 			return false;		
		else
 			return true;
 	}

 	function chkZip(){  
 		if($("#zip").val() == '')
 			return false;		
		else
 			return true;
 	}
	
  	function goChangPassword(){      	
  		
		var chkPd = chkPassword() ;
			
		if(chkPd != 'OK'){
	    	alert(chkPd);
	    	return false;
		}
		

		$("#resultChgPassword").html('');  
		$("#resultChgPassword").css("display","block");
		var $body = $('#resultChgPassword');
		
		var formData = $("form").serialize ();
	    $.ajax({
	        url: "${contextPath}/myInfo/jsonEntPasswordChange.do",
	        type: "post",
	        dataType:"json",
			data: formData,   //             data:  "name="+ $("#name").val()+ "&"+ "email=$("#email").val()+ "&"+  "mbTlNum=""+$("#mbTlNum").val(); 
	        success: function (data, status) {
	
	        	if(data.IsSucceed){
	        		// 변경 성공
	        		html = '<p>'+data.Message+'</p>';     
	        		$body.append(html); 
	        	}else {
	        		//변경 실패
	        		html = '<p>'+data.Message+'</p>';      
	        		$body.append(html); 
	        	}          	
	       
	        	console.log("status:"+status+","+"data:"+data.Message);
	        },
	        error: function (request, status, error) {
	        	alert('에러발생');
	        	console.log("code : " + request.status + "\r\nmessage : " + request.reponseText + "\r\nerror : " + error);
	        }
	    });
	}		
  	
 	function goList(){      	
 		$("form").attr({action:"${contextPath}/admin/gnrMberList.do", target:""});
 		$("form").submit();
 	}	            
            
 	function goWithdraw(){      	
 		$("form").attr({action:"${contextPath}/admin/updateWithdraw.do", target:""});
 		$("form").submit();
 	}      
   	
	function doSync(){
		if($("#isNewRegister").val() != 'true')
			goSave();
	}
	
   	function doJsonSync(){
   		if($("#isNewRegister").val() != 'true')
  		 	goJsonSave();
 	 }

	function goJsonSave(){      	
		var params = $("form").serialize();
		BIT.callAjax('${contextPath}/admin/jsonUpdateEntInfo.do'
				, 'post'
				, params
				, function(responseText){
					return false;
				});
	}
  	
	</script>    