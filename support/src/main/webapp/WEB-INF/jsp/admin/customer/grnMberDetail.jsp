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
                               
                    <form:form commandName="mberManageVO"  id="form">      
	                    <input type="hidden" id="mberEmailAdres" name="mberEmailAdres" value="<c:out value='${mberManageVO.mberEmailAdres}'/>">
	                    <input type="hidden" id="moblphonNo"  name="moblphonNo"  value="<c:out value='${mberManageVO.moblphonNo}'/>">
	                    <input type="hidden" id="ihidnum" name="ihidnum" > <!--주민번호 -->
	                    <input type="hidden" id="zip" name="zip" value='' ><!-- 우편번호 -->
	                    <input type="hidden" name="uniqId" value = '<c:out value='${mberManageVO.uniqId}'/>'>
	                     
                    <!-- 회원관리정보 -->
                    <div class="mem_info_sect">
                        <p>회원관리정보</p> 
                        <div class="mem_box fl100">
                        	<ul class="info_put fl100">
                            	<li><strong>일반관리 </strong>
                                	<span class="con"> <a href="javascript:goChangPassword();"><img src="${contextPath}/img/btn_pwch.png" alt="비밀번호변경"></a> <a href="#"><img src="${contextPath}/img/btn_email.png" alt="전자메일"></a> <a href="#"><img src="${contextPath}/img/btn_sns.png" alt="문자보내기"></a> <a href="#"><img src="${contextPath}/img/btn_out.png" alt="강제탈퇴"></a></span>
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
	                                	<form:select path="mberType" id="mberType" title="회원유형">
										    <form:options items="${mberType_result}" itemValue="code" itemLabel="codeNm"/>
										</form:select>
                                    </span>
                                </li>
                                <li><strong>회원분류 </strong>
                                	<span class="con">
	                                	<form:select path="mberSe" id="mberSe" title="회원분류">
										    <form:options items="${mberSe_result}" itemValue="code" itemLabel="codeNm"/>
										</form:select>
                                    </span>
                                </li>
                                <li><strong>활동분류 </strong>
                                	<span class="con">
                             		<c:forEach items="${activeTy_result}" var="result" varStatus="status">
                               			<input name="activeTyCd"  id="activeTyCd${ status.index}"  type="checkbox"  value="${result.code }"  >
                                		<label  for="activeTyCd${ status.index}">${result.codeNm }</label>
                                	</c:forEach>
                             		<c:forEach items="${mberManageVO.mberManageActiveTyVOList }" var="result_active" varStatus="status">
                               			<input name="chkActiveTyCd"   type="hidden"  value="${result_active.activeTyCd }"  >
                                	</c:forEach>

                                    </span>
                                </li>
                                <li><strong>포인트 </strong>
                                	<span class="con">
                                    	<input name="" type="text" class="w100"><a href="#"><img src="../img/btn_pointch.png" alt="포인트변경"></a>                                    </span>
                                </li>
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
									<img name="btnFileDownload" src="${contextPath}/img/btn_down.png"   alt="다운로드"> 
									<img name="btnImgDelete" src="${contextPath}/img/btn_delete.png" alt="삭제">
                                    <span class="con_inf txt11 fl100 fcYg">* 10M 미만의 파일만 허용됩니다.</span>
                                    <br>
                                     <c:import url="/files/selectFileInfsAdvence.do" charEncoding="utf-8">
										<c:param name="param_atchFileId" value="${mberManageVO.atchManageFileId}" />
									 </c:import>	 
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- //회원관리정보 -->

	                     
                     <!-- 회원기본정보 -->
                    <div class="mem_info_sect">
                        <p>회원관리정보</p>
                        
                        <div class="mem_box fl100">
                        	<ul class="info_put fl100">
                            	<li><strong>성명</strong>
                                	<span class="con">
                                	<c:out value='${mberManageVO.mberNm}'/>
                                	<span class="chk2">
                                	<form:checkbox path="nmOthbcAt" value="Y"  label="공개(비공개시 아이디로 대체) "/>
                                	 </span></span> 
                                </li>
                                <li><strong>아이핀번호</strong><span class="con"><a href="#">비인증<!-- img src="../img/btn_ipinch.png" alt="아이핀병경">--></a></span> </li>
                                <li><strong>* 아이디</strong>
                                    <span class="con"><c:out value='${mberManageVO.mberId}'/>
                                     </span> 
                                </li>
                                <li><strong>* 현재비밀번호</strong>
                                    <span class="con"><input id="oldPassword"  name="oldPassword" type="password" class="w200">&nbsp; <input type="button" name="btn" class="btn-style" onclick="javascript:goChangPassword();" value="비밀번호 변경" /> <label id="resultChgPassword" ></label>
                                    </span> 
                                </li>
               									<li><strong>* 새비밀번호 </strong>
                                    <span class="con"><input name="password" id="password"  type="password" class="w200">
                                    <span class="con_inf txt11 fl100 fcYg">*9~16자의 영문+숫자+특수문자로 입력하여 주시기 바랍니다.</span></span> 
                                </li>
                                <li><strong>* 새비밀번호확인</strong>
                                    <span class="con"><input name="passwordChk" id="passwordChk"  type="password" class="w200"></span> 
                                </li>
                                <li><strong>* 생일</strong>
                                	<span class="con">
						              <form:select path="birthYear" >
						                     <form:option value="" label="연도" />
											<form:option value='2009' label="2009" />
											<form:option value='2008' label="2008" />
											<form:option value='2007' label="2007" />
											<form:option value='2006' label="2006" />
											<form:option value='2005' label="2005" />
											<form:option value='2004' label="2004" />
											<form:option value='2003' label="2003" />
											<form:option value='2002' label="2002" />
											<form:option value='2001' label="2001" />
											<form:option value='2000' label="2000" />
											<form:option value='1999' label="1999" />
											<form:option value='1998' label="1998" />
											<form:option value='1997' label="1997" />
											<form:option value='1996' label="1996" />
											<form:option value='1995' label="1995" />
											<form:option value='1994' label="1994" />
											<form:option value='1993' label="1993" />
											<form:option value='1992' label="1992" />
											<form:option value='1991' label="1991" />
											<form:option value='1990' label="1990" />
											<form:option value='1989' label="1989" />
											<form:option value='1988' label="1988" />
											<form:option value='1987' label="1987" />
											<form:option value='1986' label="1986" />
											<form:option value='1985' label="1985" />
											<form:option value='1984' label="1984" />
											<form:option value='1983' label="1983" />
											<form:option value='1982' label="1982" />
											<form:option value='1981' label="1981" />
											<form:option value='1980' label="1980" />
											<form:option value='1979' label="1979" />
											<form:option value='1978' label="1978" />
											<form:option value='1977' label="1977" />
											<form:option value='1976' label="1976" />
											<form:option value='1975' label="1975" />
											<form:option value='1974' label="1974" />
											<form:option value='1973' label="1973" />
											<form:option value='1972' label="1972" />
											<form:option value='1971' label="1971" />
											<form:option value='1970' label="1970" />
											<form:option value='1969' label="1969" />
											<form:option value='1968' label="1968" />
											<form:option value='1967' label="1967" />
											<form:option value='1966' label="1966" />
											<form:option value='1965' label="1965" />
											<form:option value='1964' label="1964" />
											<form:option value='1963' label="1963" />
											<form:option value='1962' label="1962" />
											<form:option value='1961' label="1961" />
											<form:option value='1960' label="1960" />
											<form:option value='1959' label="1959" />
											<form:option value='1958' label="1958" />
											<form:option value='1957' label="1957" />
											<form:option value='1956' label="1956" />
											<form:option value='1955' label="1955" />
											<form:option value='1954' label="1954" />
											<form:option value='1953' label="1953" />
											<form:option value='1952' label="1952" />
											<form:option value='1951' label="1951" />
											<form:option value='1950' label="1950" />
											<form:option value='1949' label="1949" />
											<form:option value='1948' label="1948" />
											<form:option value='1947' label="1947" />
											<form:option value='1946' label="1946" />
											<form:option value='1945' label="1945" />
											<form:option value='1944' label="1944" />
											<form:option value='1943' label="1943" />
											<form:option value='1942' label="1942" />
											<form:option value='1941' label="1941" />
											<form:option value='1940' label="1940" />
                                        </form:select>                              	
                                
										<form:select path="birthMonth">
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
                                        
											<form:select path="birthDay" >
											<form:option value=""   label="일" />
											<form:option value="1"  label="1" />
											<form:option value="2"  label="2" />
											<form:option value="3"  label="3" />
											<form:option value="4"  label="4" />
											<form:option value="5"  label="5" />
											<form:option value="6"  label="6" />
											<form:option value="7"  label="7" />
											<form:option value="8"  label="8" />
											<form:option value="9"  label="9" />
											<form:option value="10" label="10" />
											<form:option value="11" label="11" />
											<form:option value="12" label="12" />
											<form:option value="13" label="13" />
											<form:option value="14" label="14" />
											<form:option value="15" label="15" />
											<form:option value="16" label="16" />
											<form:option value="17" label="17" />
											<form:option value="18" label="18" />
											<form:option value="19" label="19" />
											<form:option value="20" label="20" />
											<form:option value="21" label="21" />
											<form:option value="22" label="22" />
											<form:option value="23" label="23" />
											<form:option value="24" label="24" />
											<form:option value="25" label="25" />
											<form:option value="26" label="26" />
											<form:option value="27" label="27" />
											<form:option value="28" label="28" />
											<form:option value="29" label="29" />
											<form:option value="30" label="30" />
											<form:option value="31" label="31" />
											</form:select>
                                        <form:select  path="sunLunar" >
                                            <form:option value='1'  label="양력" />
                                            <form:option value='2'  label="음력" />
                                        </form:select>
                                        <span class="chk"><form:checkbox path="birthOthbcAt" value="Y" /> 공개</span>
                                    </span> 
                                </li>
                                <li><strong>* 성별</strong>
                                	<span class="con"> <form:radiobutton path="sexdstnCode"  value="M"  label="남성" /> &nbsp; <form:radiobutton  path="sexdstnCode"  value="F"  label="여성" /> 
                                    <span class="chk"><form:checkbox path="sexdstnOthbcAt"  value="Y"/> 공개</span>
                                    </span>
                                </li>
                                <li><strong>* 이메일 </strong>
                                	<span class="con">
                                	 <form:input path="emailHead" class="w100" /><em>@</em> <form:input path="emailTail" class="w100" />                                   
                                    <select  id ='mberEmailAdresList'>
                                    	<option value=''>---선택하세요---</option>
	                                    <c:forEach var="result" items="${email_result}" varStatus="status">
	                                    	<option value='<c:out value="${result.codeNm}"/>' ><c:out value="${result.codeNm}"/></option>
	                                    </c:forEach>
                                    </select>

                                    <span class="txt11 fcYg"><form:checkbox path="recvAt" value="Y"  label="이메일/SMS수신동의"/></span>
                                    <span class="chk"></span><form:checkbox path="mberEmailAdresOthbcAt" value="Y"  label="공개"/></span>
                                    </span>
                                </li>
                                <li><strong>휴대폰</strong>
                                	<span class="con">
                                	 <form:input path="moblphonNo" class="w200" />
                                    <span class="con_inf txt11 fl100 fcYg">*휴대폰이 없을 경우, 반드시 이메일 주소를 입력바랍니다.</span>
                                    </span> 
                                </li>
                                <li><strong>* 별명 </strong>
                                	<span class="con">
                                    	 <form:input path="nick" class="w100" /><span class="chk"><form:checkbox path="nickOthbcAt" value="Y"  label="공개"/></span><br/>
                                     	<span class="con_inf txt11 fl100 fcYg">*게시판, 토론 등 커뮤니티 활동에 사용합니다.</span>
                                    </span>
                                </li>
                            </ul>
                        </div><!-- //약관내용 박스 -->
                                            
                    </div>
                    <!-- //회원인증 및 가입확인 -->
                    
                    <!-- 회원소속정보 -->
                    <div class="mem_info_sect">
                        <p>회원소속정보</p>
                        
                        <div class="mem_box fl100">
                        	<ul class="info_put fl100">
                            	<li><strong>* 직업정보</strong>
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
                                    	<span class="chk"><form:checkbox path="jobOthbcAt" value="Y"  label="공개"/> </span>
                                    </span> 
                                </li>
                                <li><strong>* 소속명</strong>
                                    <span class="con"> <form:input path="pstinst" class="long3" /><br/>
                                    	<span class="stit"><b>부서(학과):</b> <form:input path="pstinstDeptNm"  class="w100"   /> </span>
                                        <span class="stit"><b>직위(학년):</b> <form:input path="ofcpsNm"  class="w100"   /></span>
                                        <span class="chk"><form:checkbox path="pstinstOthbcAt" value="Y"  label="공개"/></span>
                                    </span> 
                                </li>
                                <li><strong>* 소속연락처</strong>
                                	<span class="con">
                                	<form:select path="areaNo" >
										<form:option value="02" label="02" />
									</form:select>
                                    <em>-</em> <form:input path="middleTelno"   class="w40"  /> <em>-</em> <form:input path="endTelno"   class="w40"  /> 
                                    <span class="chk"><form:checkbox path="contacOthbcAt" value="Y"  label="공개"/></span>
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    </span> 
                                </li>
                                <li><strong>* 소속주소</strong>
                                	<span class="con">
                                    <input name="zip1" id="zip1" type="text" class="w40"  value="${fn:substring(mberManageVO.zip, 0, 3)}"><em>-</em><input name="zip2" id="zip2" type="text"  value="${fn:substring(mberManageVO.zip, 3, 6)}" class="w40"><a href="#"><img src="${contextPath}/img/btn_post.png" alt="우편번호"></a>
                                    <form:input path="adres"   class="long2"  /><br/>
                                    <b>상세주소:</b><form:input path="detailAdres"   class="long"  />
                                    <span class="chk"><form:checkbox path="adresOthbcAt" value="Y"  label="공개"/></span>
                                    </span> 
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- //회원소속정보 -->
                    
                     <!-- 회원부가정보 -->
                    <div class="mem_info_sect">
                        <p>회원부가정보</p>
                        
                        <div class="mem_box fl100">
                        	<ul class="info_put fl100">
                            	 <li><strong>영문명</strong>
                                    <span class="con"><form:input path="mberEngNm" class="w200" /></span> 
                                </li>
                            	<li><strong>회원사진</strong>
                                	<span class="con">
                                        
                                        <div id="tabs">
		                                        <ul class="tap_w">
		                                            <li class="select"><a href="#tab1" class="selected">대표사진</a></li>
		                                            <li><a href="#tab2">이력제출용</a></li>
		                                            <li><a href="#tab3">인물사전용</a></li>
		                                            <li><a href="#tab4">사진1</a></li>
		                                            <li><a href="#tab5">사진2</a></li>
		                                        </ul>
		                                        <ul class="panel">
		                                        	<li id="tab1">
			                                        	<dl class="pic_regist">
			                                        		<c:choose>
			                                        			<c:when test= "${mberManageVO.atchImgMainFileId ==null || mberManageVO.atchImgMainFileId ==''}">
				                                        			<dt class="img_div"  ></dt>
				                                        		</c:when>
				                                        		<c:otherwise>				                                        		
				                                        			<dt class="img_div"  style="background: url(/files/imageSrcByFileId.do?fileId=${mberManageVO.atchImgMainFileId}) 0% 50% no-repeat;"></dt>
				                                        		</c:otherwise>
				                                        	</c:choose>
				                                        	
				                                            <dd class="file_sector">
				                                            	<input name="file1_text"  type="text" class="w200">
				                                            	<form:hidden path="atchImgMainFileId"/>
			                                            		<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="1" data_category="memberImg" data_type="img"  alt="찾아보기"   >
			                                            		<img name="btnFileDownload" src="${contextPath}/img/btn_down.png"    data_type="file"   alt="다운로드"> 
			                                            		<img name="btnFileDelete" src="${contextPath}/img/btn_delete.png" alt="삭제">
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
			                                        			<c:when test= "${mberManageVO.atchImgJobFileId ==null || mberManageVO.atchImgJobFileId ==''}">
				                                        			<dt class="img_div"  ></dt>
				                                        		</c:when>
				                                        		<c:otherwise>				                                        		
				                                        			<dt class="img_div"  style="background: url(/files/imageSrcByFileId.do?fileId=${mberManageVO.atchImgJobFileId}) 0% 50% no-repeat;"></dt>
				                                        		</c:otherwise>
				                                        	</c:choose>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<form:hidden path="atchImgJobFileId"/>
			                                            			<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="1" data_category="memberImg" data_type="img"  alt="찾아보기"   >
					                                            	<img name="btnFileDownload" src="${contextPath}/img/btn_down.png"    data_type="file"   alt="다운로드"> 
			                                            			<img src="${contextPath}/img/btn_delete.png" alt="삭제"></a>
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
			                                        			<c:when test= "${mberManageVO.atchImgManFileId ==null || mberManageVO.atchImgManFileId ==''}">
				                                        			<dt class="img_div"  ></dt>
				                                        		</c:when>
				                                        		<c:otherwise>				                                        		
				                                        			<dt class="img_div"  style="background: url(/files/imageSrcByFileId.do?fileId=${mberManageVO.atchImgManFileId}) 0% 50% no-repeat;"></dt>
				                                        		</c:otherwise>
				                                        	</c:choose>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<form:hidden path="atchImgManFileId" />
			                                            			<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="1" data_category="memberImg" data_type="img"  alt="찾아보기"  />
					                                            	<img name="btnFileDownload" src="${contextPath}/img/btn_down.png"    data_type="file"   alt="다운로드"> 
			                                            			<img src="${contextPath}/img/btn_delete.png" alt="삭제"></a>
					                                            
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
			                                        			<c:when test= "${mberManageVO.atchImg1FileId ==null || mberManageVO.atchImg1FileId ==''}">
				                                        			<dt class="img_div"  ></dt>
				                                        		</c:when>
				                                        		<c:otherwise>				                                        		
				                                        			<dt class="img_div"  style="background: url(/files/imageSrcByFileId.do?fileId=${mberManageVO.atchImg1FileId}) 0% 50% no-repeat;"></dt>
				                                        		</c:otherwise>
				                                        	</c:choose>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<form:hidden path="atchImg1FileId" />
			                                            			<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="1" data_category="memberImg" data_type="img"  alt="찾아보기"  />
			                                            			<img name="btnFileDownload" src="${contextPath}/img/btn_down.png"    data_type="file"   alt="다운로드"> 
			                                            			<img src="${contextPath}/img/btn_delete.png" alt="삭제"></a>
					                                            
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
			                                        			<c:when test= "${mberManageVO.atchImg2FileId ==null || mberManageVO.atchImg2FileId ==''}">
				                                        			<dt class="img_div"  ></dt>
				                                        		</c:when>
				                                        		<c:otherwise>				                                        		
				                                        			<dt class="img_div"  style="background: url(/files/imageSrcByFileId.do?fileId=${mberManageVO.atchImg2FileId}) 0% 50% no-repeat;"></dt>
				                                        		</c:otherwise>
				                                        	</c:choose>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<form:hidden path="atchImg2FileId" />
			                                            			<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="1" data_category="memberImg"  data_type="img"  alt="찾아보기"  />
			                                            			<img name="btnFileDownload" src="${contextPath}/img/btn_down.png"    data_type="file"   alt="다운로드"> 
			                                            			<img src="${contextPath}/img/btn_delete.png" alt="삭제"></a>
					                                            
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
                                    	<form:textarea  path="shortNotice" cols="" rows=""  ></form:textarea>
                                        <span class="con_inf2 fl100 txt11">
                                         * 관심분야가 포함된 자기소개를 간략 (100자까지)하게 입력하여 주시기 바랍니다. <br/>&nbsp;&nbsp;&nbsp;본정보는 사업신청, 채용·인재, 주소록 등에서 매우 많이 노출됩니다.<br/>
예) OO대 OO학과를 졸업한 10년차 공간정보인입니다.  공간정보의 내비게이션, 온라인 지도 등에 관심이 많습니다. 언제나 긍정적인 생각을 가지고 최선을 다합니다. 많은 관심 부탁드립니다.
										</span>
                                    </span>
                                    </span> 
                                </li>
                                <li><strong>홈페이지</strong>
                                    <span class="con"><form:input path="homepageUrl" class="long" /> </span> 
                                </li>
                                <li><strong>블로그</strong>
                                    <span class="con"><form:input path="blogUrl" class="long"/></span> 
                                </li>
                                 <li><strong>소셜</strong>
                                    <span class="con"><form:input path="socialUrl" class="long"/></span> 
                                </li>
                                <li><strong>자택전화</strong>
                                	<span class="con">
                                	<form:select path="homeAreaNo" >
										<form:option value="02" label="02" />
									</form:select>
                                    
                                    <em>-</em><form:input path="homeMiddleTelno"   class="w40"  /> <em>-</em> <form:input path="homeEndTelno"   class="w40"  /> 
									<span class="con_inf txt11 fl100 fcYg">* 긴급상황 발생시 활용할 수 있습니다.</span>
                                    </span> 
                                </li>
                                <li><strong>자택주소</strong>
                                	<span class="con">
                                	<input name="homeZip1" id="homeZip1" type="text" class="w40"  value="${fn:substring(mberManageVO.homeZip, 0, 3)}">
                                    <em>-</em>
                                    <input name="homeZip2" id="homeZip2" type="text"  value="${fn:substring(mberManageVO.homeZip, 3, 6)}" class="w40">
                                    <a href="#"><img src="${contextPath}/img/btn_post.png" alt="우편번호"></a>
                                   <form:input path="homeAdres"   class="long2"  /><br/>
                                    <b>상세주소:</b><form:input path="homeDetailAdres"   class="long"  />
                                    </span> 
                                </li>
                                <li><strong>우편물</strong>
                                	<span class="con">
                                    <form:radiobutton path="mailSendTarget"  value="H"  label="자택" /> &nbsp; <form:radiobutton  path="mailSendTarget"  value="C"  label="직장" /> 
                                    </span>
                                </li>
                                <li><strong>학교</strong>
                                	<span class="con">
                                    	<span class="add_b" ><img name="addSch"  src="${contextPath}/img/btn_addsch.png" alt="학교추가"></span>
                                    	
                                    	<div id="school_info_root">
	                                    	<ul>
		                                    	<c:forEach var="schoolResult" items="${mberManageVO.mberManageDegreeVOList} " varStatus="statusA">    
							                    <li>
				                                        <div class="school_info">
							                                    <select  name ='compltCd'  class='headerLine'>
							                                    	<option value='NaN'>수료상태</option>
								                                    <c:forEach var="result" items="${complete_result}" varStatus="status">
								                                    	<option value='<c:out value="${result.code}"/>'   ${result.code == mberManageVO.mberManageDegreeVOList[statusA.index].compltCd ? 'selected': '' }  > <c:out value="${result.codeNm}"/></option>
								                                    </c:forEach>
							                                    </select>
						                                        &nbsp;
						                                        <span class="stit">입학.
							                                    <select  name ='enterYear'>
							                                    	<option value=''>년도</option>
								                                    <c:forEach var="result" items="${year_result}" varStatus="status">
								                                    	<option value='<c:out value="${result.code}"/>'  ${result.code == mberManageVO.mberManageDegreeVOList[statusA.index].enterYear ? 'selected': '' } ><c:out value="${result.codeNm}"/></option>
								                                    </c:forEach>
							                                    </select>
							                                    <select  name ='enterMonth'>
							                                    	<option value=''>월</option>
								                                    <c:forEach var="result" items="${month_result}" varStatus="status">
								                                    	<option value='<c:out value="${result.code}"/>'  ${result.code == mberManageVO.mberManageDegreeVOList[statusA.index].enterMonth ? 'selected': '' } ><c:out value="${result.codeNm}"/></option>
								                                    </c:forEach>
							                                    </select>
						                                        </span>
						                                        
						                                        <span class="stit">졸업
							                                    <select  name ='grdYear'>
							                                    	<option value=''>년도</option>
								                                    <c:forEach var="result" items="${year_result}" varStatus="status">
								                                    	<option value='<c:out value="${result.code}"/>'  ${result.code == mberManageVO.mberManageDegreeVOList[statusA.index].grdYear ? 'selected': '' } ><c:out value="${result.codeNm}"/></option>
								                                    </c:forEach>
							                                    </select>
							                                    <select  name='grdMonth'>
							                                    	<option value=''>월</option>
								                                    <c:forEach var="result" items="${month_result}" varStatus="status">
								                                    	<option value='<c:out value="${result.code}"/>'  ${result.code == mberManageVO.mberManageDegreeVOList[statusA.index].grdMonth ? 'selected': '' } ><c:out value="${result.codeNm}"/></option>
								                                    </c:forEach>
							                                    </select>
						                                        </span>
						                                        <span class="stit">학교
						                                            <input type="text" name="school" value="${mberManageVO.mberManageDegreeVOList[statusA.index].school }"  class="w80"  >
						                                        </span>
						                                        <span class="stit">학과
						                                            <input type="text" name="major" value="${mberManageVO.mberManageDegreeVOList[statusA.index].major }"  class="w80"  >
						                                        </span>
						                                      	<span class="del"><img src="${contextPath}/img/btn_mdel.png" class="sch_row_delete"  alt="삭제"></span>  
						                                </div>
		                                    	</li>
						                    </c:forEach>

	                                    	</ul>
	                                   </div>
                                    	
                                        
                                     </span> 
                                </li><!--//학교 --> 
                                
                                <li><strong>경력</strong>
                                	<span class="con">
                                    	<span class="add_b" ><img name="addCareer" src="${contextPath}/img/btn_addcareer.png" alt="경력추가"></a></span>
   
                                   	<div id="career_info_root">
	                                    	<ul> 
			                                        <c:forEach var="schoolResult" items="${mberManageVO.mberManageCareerVOList} " varStatus="statusA">    
									                    <li>
		   						                        <div class="school_info">
									                                    <select  name ='careerCd'  class='headerLine'>
									                                    	<option value='NaN'>수료상태</option>
										                                    <c:forEach var="result" items="${work_result}" varStatus="status">
										                                    	<option value='<c:out value="${result.code}"/>'  ${result.code == mberManageVO.mberManageCareerVOList[statusA.index].careerCd ? 'selected': '' } ><c:out value="${result.codeNm}"/></option>
										                                    </c:forEach>
									                                    </select>&nbsp;
							                                            <span class="stit">입사
									                                    <select  name ='joinEnterYear'>
									                                    	<option value=''>년도</option>
										                                    <c:forEach var="result" items="${year_result}" varStatus="status">
										                                    	<option value='<c:out value="${result.code}"/>'   ${result.code == mberManageVO.mberManageCareerVOList[statusA.index].joinEnterYear ? 'selected': '' } ><c:out value="${result.codeNm}"/></option>
										                                    </c:forEach>
									                                    </select>
									                                    <select  name ='joinEnterMonth'>
									                                    	<option value=''>월</option>
										                                    <c:forEach var="result" items="${month_result}" varStatus="status">
										                                    	<option value='<c:out value="${result.code}"/>'   ${result.code == mberManageVO.mberManageCareerVOList[statusA.index].joinEnterMonth ? 'selected': '' } ><c:out value="${result.codeNm}"/></option>
										                                    </c:forEach>
									                                    </select>
							                                            </span>    
							                                            <span class="stit">퇴사
									                                    <select  name ='outYear'>
									                                    	<option value=''>년</option>
										                                    <c:forEach var="result" items="${year_result}" varStatus="status">
										                                    	<option value='<c:out value="${result.code}"/>'   ${result.code == mberManageVO.mberManageCareerVOList[statusA.index].outYear ? 'selected': '' } ><c:out value="${result.codeNm}"/></option>
										                                    </c:forEach>
									                                    </select>
									                                    <select  name ='outMonth'>
									                                    	<option value=''>월</option>
										                                    <c:forEach var="result" items="${month_result}" varStatus="status">
										                                    	<option value='<c:out value="${result.code}"/>'   ${result.code == mberManageVO.mberManageCareerVOList[statusA.index].outMonth ? 'selected': '' } ><c:out value="${result.codeNm}"/></option>
										                                    </c:forEach>
									                                    </select>
							                                            </span>
							                                            <span class="stit">소속명
							                                              <input type="exxt" name="commpany"   class="w40"  value="${mberManageVO.mberManageCareerVOList[statusA.index].commpany }" >
							                                            </span>
							                                            <span class="stit">직위
							                                                 <input type="exxt" name="position"   class="w30"  value="${mberManageVO.mberManageCareerVOList[statusA.index].position }">
							                                            </span>
							                                            <span class="stit">업무
							                                              <input type="exxt" name="task"   class="w60"    value="${mberManageVO.mberManageCareerVOList[statusA.index].task }">
							                                            </span>
							                                            <span class="del"><img src="${contextPath}/img/btn_mdel.png"  class="car_row_delete" alt="삭제"></span>  
					                                            </div>
				                                    	</li>
			                                            </c:forEach>
	                                    	</ul>
	                                   </div>			                                            
                                            
                                     </span> 
                                </li><!--//경력 --> 
                                
                                <li><strong>자격수상</strong>
                                	<span class="con">
                                    	<span class="add_b" ><img name="addAward" src="${contextPath}/img/btn_addaward.png" alt="자격수상추가"></span>
                                   	<div id="award_info_root">
	                                    	<ul>
		                                    		
			                                    	<c:forEach var="schoolResult" items="${mberManageVO.mberManageAwardVOList} " varStatus="statusA">    
							                        <li>		                                    	
				                                        <div class="school_info">
							                                    <select  name ='awardCd'  class='headerLine'>
							                                    	<option value='NaN' >수료상태</option>
								                                    <c:forEach var="result" items="${award_result}" varStatus="status">
								                                    	<option value='<c:out value="${result.code}"/>'  ${result.code == mberManageVO.mberManageAwardVOList[statusA.index].awardCd ? 'selected': '' }><c:out value="${result.codeNm}"/></option>
								                                    </c:forEach>
							                                    </select>
					                                            &nbsp;
							                                    <select  name ='awardYear'>
							                                    	<option value=''>년도</option>
								                                    <c:forEach var="result" items="${year_result}" varStatus="status">
								                                    	<option value='<c:out value="${result.code}"/>'  ${result.code == mberManageVO.mberManageAwardVOList[statusA.index].awardYear ? 'selected': '' }><c:out value="${result.codeNm}"/></option>
								                                    </c:forEach>
							                                    </select>
					                                        	&nbsp;
					                                               
					                                            <span class="stit">자격∙수상명  <input type="exxt" name="awardNm"   class="w180"   value="${mberManageVO.mberManageAwardVOList[statusA.index].awardNm }"> </span>
					                                            <span class="stit"> 발행기관  <input type="exxt" name="awardOrg"   class="w15"    value="${mberManageVO.mberManageAwardVOList[statusA.index].awardOrg }"> </span>
					                                            <span class="del"><img src="${contextPath}/img/btn_mdel.png"  class="award_row_delete"  alt="삭제"></span>  
					                                    </div>
		                                    		</li>
					                                </c:forEach>
			                                       
	                                    	</ul>
	                                   </div>					                                        
												</span>           
			                                </li><!--//자격수상 --> 
			                                
	                                <li><strong>논문 및 저서</strong>
	                                	<span class="con">
	                                    	<span class="add_b" ><img name="addPaper" src="${contextPath}/img/btn_addpaper.png" alt="논문 및 저서 "></span>
	                                   	<div id="paper_info_root">
		                                    	<ul>

			                                    	<c:forEach var="schoolResult" items="${mberManageVO.mberManagePaperVOList} " varStatus="statusA">    
			                                    	<li>	
							                        <div class="school_info">
			                                    	            <select  name ='paperCd'  class='headerLine'>
							                                    	<option value='NaN'>수료상태</option>
								                                    <c:forEach var="result" items="${paper_result}" varStatus="status">
								                                    	<option value='<c:out value="${result.code}"/>'  ${result.code == mberManageVO.mberManagePaperVOList[statusA.index].paperCd ? 'selected': '' }><c:out value="${result.codeNm}"/></option>
								                                    </c:forEach>
							                                    </select>&nbsp;
					                                       
							                                    <select  name ='paperYear'>
							                                    	<option value=''>년</option>
								                                    <c:forEach var="result" items="${year_result}" varStatus="status">
								                                    	<option value='<c:out value="${result.code}"/>'  ${result.code == mberManageVO.mberManagePaperVOList[statusA.index].paperYear ? 'selected': '' }><c:out value="${result.codeNm}"/></option>
								                                    </c:forEach>
							                                    </select>
							                                    <select  name ='paperMonth'>
							                                    	<option value=''>월</option>
								                                    <c:forEach var="result" items="${month_result}" varStatus="status">
								                                    	<option value='<c:out value="${result.code}"/>'  ${result.code == mberManageVO.mberManagePaperVOList[statusA.index].paperMonth ? 'selected': mberManageVO.mberManagePaperVOList[statusA.index].paperMonth }><c:out value="${result.codeNm}"/></option>
								                                    </c:forEach>
							                                    </select>&nbsp;    
					                                            <span class="stit">논문∙저서명  <input type="exxt" name="paperNm"   class="w150"     value="${mberManageVO.mberManagePaperVOList[statusA.index].paperNm }"> </span>
					                                            <span class="stit">게재∙발행처   <input type="exxt" name="paperOrg"   class="w143"     value="${mberManageVO.mberManagePaperVOList[statusA.index].paperOrg }"> </span>
					                                            <span class="del"><img src="${contextPath}/img/btn_mdel.png"  class="paper_row_delete"  alt="삭제"></span>  
					                                </div>
		                                    	</li>
					                            </c:forEach>
	                                    	</ul>
	                                   </div>			
									</span>           
                                </li><!--//논문 및 저서  --> 
                                
                                <li><strong>이력서</strong>
                                	<span class="con">
                                    <input name="file1_text" type="text" class="w200">
									<form:hidden path="atchHistFileId"  mark="hist" />
									<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="5" data_category="memberAttach"  data_type="file"  alt="찾아보기"   >
                                   	<img name="btnFileDownload" mark="hist" src="${contextPath}/img/btn_down.png"    data_type="file"   alt="다운로드"> 
                                   	<img name="btnImgDelete" src="${contextPath}/img/btn_delete.png" alt="삭제">                                   
                                    <span class="con_inf txt11 fl100 fcYg">* 10M 미만의 파일만 허용됩니다.</span>
                                    <br>
                                     <c:import url="/files/selectFileInfsAdvence.do" charEncoding="utf-8">
										<c:param name="param_atchFileId" value="${mberManageVO.atchHistFileId}" />
									</c:import>	 
                                    </span>
                                </li>
                                <li><strong>포트폴리오</strong>
                                	<span class="con">
                                    <input name="file1_text" type="text" class="w200">
									<form:hidden path="atchPortFileId" mark="port" />
									<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="5" data_category="memberAttach"  data_type="file"  alt="찾아보기"   >
                                   	<img name="btnFileDownload" mark="port" src="${contextPath}/img/btn_down.png"   alt="다운로드"> 
                                   	<img name="btnImgDelete" src="${contextPath}/img/btn_delete.png" alt="삭제">    
                                    <span class="con_inf txt11 fl100 fcYg">* 10M 미만의 파일만 허용됩니다.</span>
                                    <br>
                                     <c:import url="/files/selectFileInfsAdvence.do" charEncoding="utf-8">
										<c:param name="param_atchFileId" value="${mberManageVO.atchPortFileId}" />
									 </c:import>	 
                                    </span>
                                </li>
                                
                                <li><strong>자기소개</strong>
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
<!--                                 	<textarea rows="4" cols="60" name="atte_rows" id="notice"  onkeyup="resize(this)"> -->
<!--                                 	</textarea> -->
                                    <!--가로 665사이즈 입력폼 -->
<%--                                     <img src="${contextPath}/img/smart_form.png" width="665" height="328">  --%>
                                    </span>
                                </li>
                            </ul>
                        </div><!-- //약관내용 박스 -->
                                            
                    </div>
                    <!-- //회원부가정보 -->    
                    </form:form>
                    
                    <!-- 버튼영역 -->
                    <div class="mbtn_wrap">
                   		<a href="#"><img src="${contextPath}/img/btn_regist.png" alt="등록"  onclick="goSave();"></a><a href="#"><img src="${contextPath}/img/btn_cancle.png" alt="취소"></a></div>
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
 		$("form").attr({action:"${contextPath}/admin/updateGnrMberInfo.do", target:""});

 		$("#resultChgPassword").css("float", "right");
		
		$( "#mberEmailAdresList" ) .change(function () {
		    																					$("#emailTail").val(  $( "#mberEmailAdresList option:selected" ).val());  
		                                                                                       });
		$('#zip1, #zip2').change(function(){
			$('#zip').val( $('#zip1').val() + $('#zip2').val());
		});
		
		$( "#birthYear,#birthMonth, #birthDay" ) .change(function () {
		    																					$("#ihidnum").val(  $( "#birthYear option:selected" ).val() + '.' + $( "#birthMonth option:selected" ).val() + '.' + $( "#birthDay option:selected" ).val() );                                                                                   
		});
		
		
		$('input[name=chkActiveTyCd]').each(function(){
			var chkValue = $(this).val();
			$('input[name=activeTyCd]').each(function(){
				var activeTyValue = $(this).val();
				if(chkValue == activeTyValue)
					$(this).prop('checked', true);
			});
		});
		
    	//탭 메뉴 구성. 탭을 누를때마다 해당 div 영역만 display되는 방식
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
    	
    	//학교 행추가 이벤트 
		$("[name=addSch]").click(function(){
			fn_addSch();
		}); 
    	
    	//학교 행삭제 이벤트 
    	$('#school_info_root').on('click', '.sch_row_delete', function () {
    		sch_row_delete($(this));
    	});
    	
    	//경력 행추가 이벤트 
		$("[name=addCareer]").click(function(){
			fn_addCareer();
		}); 
	
    	//경력행삭제 이벤트 
    	$('#career_info_root').on('click', '.car_row_delete', function () {
    		car_row_delete($(this));
    	});
    
    	//수상 행추가 이벤트 
		$("[name=addAward]").click(function(){
			fn_addAward();
		}); 
	
    	//수상 행삭제 이벤트 
    	$('#award_info_root').on('click', '.award_row_delete', function () {
    		award_row_delete($(this));
    	});
    
    	//논문 행추가 이벤트 
		$("[name=addPaper]").click(function(){
			fn_addPaper();
		}); 
	
    	//논문행삭제 이벤트 
    	$('#paper_info_root').on('click', '.paper_row_delete', function () {
    		paper_row_delete($(this));
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
    		var markValue = $(this).attr('mark');
    		alert(markValue);
    		
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
	
	function replaceModalwindow(offset, currPlace) {
    	$('.ui-dialog').css('top', offset.top +'px');
    	$( 'html, body' ).animate( { scrollTop : currPlace }, 0);
    }

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

     //학교추가
    var fn_addSch = function()
    {
    	 //항목 복사
    	var $e = $("#school_info_root ul li:last").clone();
    	//초기화 처리
    	 $e.find("input").val('');
    	$e.find("select ").find('option:first').attr('selected', 'selected');
    	//복사할 위치 지정
    	$("#school_info_root ul").append($e);
    }
     
    //학교 삭제
    function sch_row_delete(obj) {
    	if($('#school_info_root ul li').size() > 1){
    		$(obj).parent().parent().parent().remove();
    	}
    	else {
    		alert('마지막 데이터는 삭제 불가합니다.');
    		return false;
    	}
    }
    //경력추가
    var fn_addCareer = function()
    {        	
   	 //항목 복사
    	var $e = $("#career_info_root ul li:last").clone();
    	//초기화 처리
    	 $e.find("input").val('');
    	$e.find("select ").find('option:first').attr('selected', 'selected');
    	//복사할 위치 지정
    	$("#career_info_root ul").append($e);
    }
     
    //경력삭제
    function car_row_delete(obj) {
    	if($('#career_info_root ul li').size() > 1){
    		$(obj).parent().parent().parent().remove();
    	}
    	else {
    		alert('마지막 데이터는 삭제 불가합니다.');
    		return false;
    	}	
}
    
    //수상추가
    var fn_addAward = function()
    {
      	 //항목 복사
    	var $e = $("#award_info_root ul li:last").clone();
    	//초기화 처리
    	 $e.find("input").val('');
    	$e.find("select ").find('option:first').attr('selected', 'selected');
    	//복사할 위치 지정
    	$("#award_info_root ul").append($e);
    }
     
    //수상삭제
    function award_row_delete(obj) {
    	if($('#award_info_root ul li').size() > 1){
    		$(obj).parent().parent().parent().remove();
    	}
    	else {
    		alert('마지막 데이터는 삭제 불가합니다.');
    		return false;
    	}	
}
    //논문추가
    var fn_addPaper = function()
    {
     	 //항목 복사
    	var $e = $("#paper_info_root ul li:last").clone();
    	//초기화 처리
    	 $e.find("input").val('');
    	$e.find("select ").find('option:first').attr('selected', 'selected');
    	//복사할 위치 지정
    	$("#paper_info_root ul").append($e);
    }
     
    //논문삭제
    function paper_row_delete(obj) {
    	if($('#paper_info_root ul li').size() > 1){
    		$(obj).parent().parent().parent().remove();
    	}
    	else {
    		alert('마지막 데이터는 삭제 불가합니다.');
    		return false;
    	}	
}
	function goSave(){
		
		$(".headerLine option:selected").each(
			function(){
				if($(this).val()=='NaN' ){
					$(this).parent().parent().remove();
				}
			});
		$("form").submit();
	}
	
	function settingFormName() { 
		 $('#addClerks tbody tr').each(function (i) {
	            $(this).find('input').each(function () {
	                $(this).attr('name', 'CustomerClerk[' + i + '].' + $(this).attr('name'));
	            });
	            $(this).find('select').each(function () {
	                $(this).attr('name', 'CustomerClerk[' + i + '].' + $(this).attr('name'));
	            });
	        });
	}
	
	function doSync(){
//		 goJsonSave();
		goSave();
	}
	
   	function doJsonSync(){
  		 goJsonSave();
 	 }

	function goJsonSave(){      	
	var formData = $("form").serialize ();
	var params = $("form").serialize();
	BIT.callAjax('${contextPath}/myInfo/jsonUpdateGnrSubMyInfo.do'
			, 'post'
			, params
			, function(responseText){
				return false;
			});
	}
	
	function isOkAllproperty(){
// 		var result = '';
// 		if(!chkPassword())
// 			return '비밀번호 확인 값이 다릅니다. 확인 바랍니다.'; 
// 		if(!chkZip())
// 			return '우편번호 입력바랍니다'; 
		
		return 'OK';
	}
	
 	function chkPassword(){
 		
        if($("#oldPassword").val() == ''||  $("#password").val() == '' ||  $("#passwordChk").val() == ''){
        	return '비밀번호를 입력하시기 바랍니다';
        }
 		if( $("#password").val() !=  $("#passwordChk").val()  ) {
 				return '변경할 비밀번호가 서로 다릅니다. 확인 바랍니다.';	
 		}
 			return 'OK';
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
            url: "${contextPath}/myInfo/jsonGnrPasswordChange.do",
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

	</script>