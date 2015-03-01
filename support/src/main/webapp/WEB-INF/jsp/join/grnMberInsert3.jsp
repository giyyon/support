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
               
            
            	<div id="contents" class="bg_cs">
<!--                 	<div class="top"><a href="#"></a></div> -->
<!--             		<div class="con_tit">회원정보 <span>Membership</span> -->
<!--                     	<span class="ex">고객님의 소중한 정보를 관리합니다.</span> -->
<!--                     </div> -->
                    
<!--                     <ul class="tap4_wrp mt10"> -->
<!--                     	<li><a href="#" class="select">회원가입</a></li> -->
<!--                         <li><a href="#">아이디 찾기</a></li> -->
<!--                         <li><a href="#">비밀번호 찾기</a></li> -->
<!--                         <li><a href="#">내정보 바로가기</a></li> -->
<!--                     </ul> -->
						<%@ include file="../include/joinMenu.jsp" %>
						
                    <div class="view_info mtf5 mb5">
                        <div class="ico_box_w">
                            <ul class="ico_box2">
                            <li class="print"><a href="#" title="프린트">프린트</a></li>
                            <li class="url"><a href="#" title="url">url</a></li>
                            <li class="claim"><a href="#" title="신고하기">신고하기</a></li>
                            </ul>
                        </div>
                    </div>
                    <ul class="step_wrap">
                    	<li><img src="${contextPath}/img/step01.png" alt="약관동의"></li>
                        <li><img src="${contextPath}/img/step02.png" alt="2.실명확인"></li>
                        <li class="select"><img src="${contextPath}/img/step03_on.png" alt="3. 회원정보입력"></li>
                        <li class="end"><img src="${contextPath}/img/step04.png" alt="4. 가입완료"></li>
                    </ul>
                    
                    <div class="mem_info fll txt12">
                   	본정보는 아래와 같이 활용할 수 있습니다. <br/>
                   	<ul>
                    	<li>사업신청, 과제관리, 보고서관리, 채용, 인재 등의 개인정보입력시 자동등록됩니다.</li>
                        <li>(재)공간정보산업진흥원의 관련사업 진행시 전문가, 기관 등을 선정하는 기초자료로 활용될 수 있습니다.</li>
                        <li>공간정보 관련업계에 기관, 기업, 개인을 홍보∙마케팅하는데 적극적으로 활용할 수 있습니다.</li>
                    </ul>
                    <span class="all_b"><input name="allChk" type="checkbox" value="a" checked>위의 내용에 동의하며, 부가정보를 공개합니다</span>
                    </div>                   
                    
                     <form:form commandName="mberManageVO"  id="form">    
                    <input type="hidden" name="uniqId" value = '<c:out value='${mberManageVO.uniqId}'/>'>
                    <input type="hidden" name="mberId" value = '<c:out value='${mberManageVO.mberId}'/>'>
                    
                    <!-- 회원부가정보 -->
                    <div class="mem_info_sect">
                        <p>회원부가정보</p>
                        
                        <div class="mem_box fl100">
                        	<ul class="info_put fl100">
                            	 <li><strong>영문명</strong>
                                    <span class="con"><input name="mberEngNm"  type="text" class="w200"></span> 
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
				                                        	<dt>
				                                            </dt>
				                                            <dd class="file_sector">
				                                            	<input name="file1_text"  type="text" class="w200">
				                                            	<input type="hidden" name="ATCH_IMG_MAIN_FILE_ID" />
			                                            		<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" alt="찾아보기"   >
			                                            		<a href="#"><img src="${contextPath}/img/btn_delete.png" alt="삭제"></a>
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
					                                        	<dt>
					                                            </dt>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<input type="hidden" name="ATCH_IMG_JOB_FILE_ID" />
			                                            			<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" alt="찾아보기"   >
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
					                                        	<dt>
					                                            </dt>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<input type="hidden" name="ATCH_IMG_MAN_FILE_ID" />
			                                            			<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" alt="찾아보기"  />
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
					                                        	<dt>
					                                            </dt>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<input type="hidden" name="ATCH_IMG_1_FILE_ID" />
			                                            			<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" alt="찾아보기"  />
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
					                                        	<dt>
					                                            </dt>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<input type="hidden" name="ATCH_IMG_2_FILE_ID" />
			                                            			<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" alt="찾아보기"  />
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
                                    	<textarea name="shortNotice" cols="" rows=""></textarea>
                                        <span class="con_inf2 fl100 txt11">
                                         * 관심분야가 포함된 자기소개를 간략 (100자까지)하게 입력하여 주시기 바랍니다. <br/>&nbsp;&nbsp;&nbsp;본정보는 사업신청, 채용·인재, 주소록 등에서 매우 많이 노출됩니다.<br/>
예) OO대 OO학과를 졸업한 10년차 공간정보인입니다.  공간정보의 내비게이션, 온라인 지도 등에 관심이 많습니다. 언제나 긍정적인 생각을 가지고 최선을 다합니다. 많은 관심 부탁드립니다.
										</span>
                                    </span>
                                    </span> 
                                </li>
                                <li><strong>홈페이지</strong>
                                    <span class="con"><input type="text" id='homepageUrl' class="long" value="http://"></span> 
                                </li>
                                <li><strong>블로그</strong>
                                    <span class="con"><input type="text" id='blogUrl' class="long" value="http://"></span> 
                                </li>
                                 <li><strong>소셜</strong>
                                    <span class="con"><input type="text" id='socialUrl'  class="long" value="http://"></span> 
                                </li>
                                <li><strong>자택전화</strong>
                                	<span class="con">
                                    <select name="homeAreaNo">
                                        <option>02</option>
                                    </select>
                                    <em>-</em><input name="homeMiddleTelno" type="text" class="w40"><em>-</em><input name="homeEndTelno" type="text" class="w40">
									<span class="con_inf txt11 fl100 fcYg">* 긴급상황 발생시 활용할 수 있습니다.</span>
                                    </span> 
                                </li>
                                <li><strong>자택주소</strong>
                                	<span class="con">
                                    <input name="homeZip1" type="text" class="w40"><em>-</em><input name="homeZip2" type="text" class="w40"><a href="#"><img src="${contextPath}/img/btn_post.png" alt="우편번호"></a>
                                    <input name="homeAdres" type="text" class="long2"><br/>
                                    <b>상세주소:</b><input name="homeDetailAdres" type="text" class="long">
                                    </span> 
                                </li>
                                <li><strong>우편물</strong>
                                	<span class="con">
                                    <input name="mailSendTarget" type="radio" value="H" checked> 자택 &nbsp;<input name="mailSendTarget"  type="radio" value="C"> 직장
                                    </span>
                                </li>
                                <li><strong>학교</strong>
                                	<span class="con">
                                    	<span class="add_b" ><img name="addSch"  src="${contextPath}/img/btn_addsch.png" alt="학교추가"></span>
                                    	
                                    	<div id="school_info_root">
	                                    	<ul>
		                                    	<li>
				                                    	<div class="school_info">
				                                    	
					                                    <select  id ='compltCd'  class='headerLine'>
					                                    	<option value='NaN'>수료상태</option>
						                                    <c:forEach var="result" items="${complete_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>
				                                        &nbsp;
				                                        <span class="stit">입학
					                                    <select  id ='enterYear'>
					                                    	<option value=''>년도</option>
						                                    <c:forEach var="result" items="${year_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>
					                                    <select  id ='enterMonth'>
					                                    	<option value=''>월</option>
						                                    <c:forEach var="result" items="${month_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>
				                                        </span>
				                                        
				                                        <span class="stit">졸업
					                                    <select  id ='grdYear'>
					                                    	<option value=''>년도</option>
						                                    <c:forEach var="result" items="${year_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>
					                                    <select  id ='grdMonth'>
					                                    	<option value=''>월</option>
						                                    <c:forEach var="result" items="${month_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>
				                                        </span>
				                                        <span class="stit">학교
				                                            <input name="school" type="text" class="w80">
				                                        </span>
				                                        <span class="stit">학과
				                                            <input name="major" type="text" class="w90">
				                                        </span>
				                                      	<span class="del"><img src="${contextPath}/img/btn_mdel.png" class="sch_row_delete"  alt="삭제"></span>  
				                                        </div>
		                                    	</li>
	                                    	</ul>
	                                   </div>
                                    	
                                        
                                     </span> 
                                </li><!--//학교 --> 
                                
                                <li><strong>경력</strong>
                                	<span class="con">
                                    	<span class="add_b" ><img name="addCareer" src="${contextPath}/img/btn_addcareer.png" alt="경력추가"></a></span>
   
                                   	<div id="career_info_root">
	                                    	<ul>
		                                    	<li>
   
			                                        <div class="school_info">
					                                    <select  id ='careerCd'  class='headerLine'>
					                                    	<option value='NaN'>수료상태</option>
						                                    <c:forEach var="result" items="${work_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>&nbsp;
			                                            <span class="stit">입사
					                                    <select  id ='joinEnterYear'>
					                                    	<option value=''>년도</option>
						                                    <c:forEach var="result" items="${year_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>
					                                    <select  id ='joinEnterMonth'>
					                                    	<option value=''>월</option>
						                                    <c:forEach var="result" items="${month_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>
			                                            </span>    
			                                            <span class="stit">퇴사
					                                    <select  id ='outYear'>
					                                    	<option value=''>년</option>
						                                    <c:forEach var="result" items="${year_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>
					                                    <select  id ='outMonth'>
					                                    	<option value=''>월</option>
						                                    <c:forEach var="result" items="${month_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>
			                                            </span>
			                                            <span class="stit">소속명
			                                            <input name="commpany" type="text" class="w40">
			                                            </span>
			                                            <span class="stit">직위
			                                                <input name="position" type="text" class="w30">
			                                            </span>
			                                            <span class="stit">업무
			                                            <input name="task" type="text" class="w60">
			                                            </span>
			                                            <span class="del"><img src="${contextPath}/img/btn_mdel.png"  class="car_row_delete" alt="삭제"></span>  
			                                            </div>
		                                    	</li>
	                                    	</ul>
	                                   </div>			                                            
                                            
                                     </span> 
                                </li><!--//경력 --> 
                                
                                <li><strong>자격수상</strong>
                                	<span class="con">
                                    	<span class="add_b" ><img name="addAward" src="${contextPath}/img/btn_addaward.png" alt="자격수상추가"></span>
                                   	<div id="award_info_root">
	                                    	<ul>
		                                    	<li>		                                    	
			                                    	<div class="school_info">
					                                    <select  id ='awardCd'  class='headerLine'>
					                                    	<option value='NaN' >수료상태</option>
						                                    <c:forEach var="result" items="${award_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>
			                                            &nbsp;
					                                    <select  id ='awardYear'>
					                                    	<option value=''>월</option>
						                                    <c:forEach var="result" items="${month_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>
			                                        	&nbsp;
			                                               
			                                            <span class="stit">자격∙수상명 <input name="awardNm" type="text" class="w180"></span>
			                                            <span class="stit"> 발행기관 <input name="awardOrg" type="text" class="w175"></span>
			                                            <span class="del"><img src="${contextPath}/img/btn_mdel.png"  class="award_row_delete"  alt="삭제"></span>  
			                                        </div>
		                                    	</li>
	                                    	</ul>
	                                   </div>					                                        
												</span>           
			                                </li><!--//자격수상 --> 
			                                
	                                <li><strong>논문 및 저서</strong>
	                                	<span class="con">
	                                    	<span class="add_b" ><img name="addPaper" src="${contextPath}/img/btn_addpaper.png" alt="논문 및 저서 "></span>
	                                   	<div id="paper_info_root">
		                                    	<ul>
			                                    	<li>	
			                                    	<div class="school_info">
					                                    <select  id ='paperCd'  class='headerLine'>
					                                    	<option value='NaN'>수료상태</option>
						                                    <c:forEach var="result" items="${paper_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>&nbsp;
			                                       
					                                    <select  id ='paperYear'>
					                                    	<option value=''>년</option>
						                                    <c:forEach var="result" items="${year_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>
					                                    <select  id ='paperMonth'>
					                                    	<option value=''>월</option>
						                                    <c:forEach var="result" items="${month_result}" varStatus="status">
						                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
						                                    </c:forEach>
					                                    </select>&nbsp;    
			                                            <span class="stit">논문∙저서명 <input name="paperNm" type="text" class="w150"></span>
			                                            <span class="stit">게재∙발행처 <input name="paperOrg" type="text" class="w143"></span>
			                                            <span class="del"><img src="${contextPath}/img/btn_mdel.png"  class="paper_row_delete"  alt="삭제"></span>  
			                                        </div>
		                                    	</li>
	                                    	</ul>
	                                   </div>			
									</span>           
                                </li><!--//논문 및 저서  --> 
                                
                                <li><strong>이력서</strong>
                                	<span class="con">
                                		<input name="file1_text" type="text" class="w200">
										<input type="hidden" name="ATCH_IMG_MAIN_FILE_ID" />
										<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" alt="찾아보기"   >
                                    	<img name="btnImgDelete" src="${contextPath}/img/btn_delete.png" alt="삭제">
                                    <span class="con_inf txt11 fl100 fcYg">* 10M 미만의 파일만 허용됩니다.</span>
                                    </span>
                                </li>
                                <li><strong>포트폴리오</strong>
                                	<span class="con">
                                    	<input name="file1_text" type="text" class="w200">
										<input type="hidden" name="ATCH_IMG_MAIN_FILE_ID" />
										<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" alt="찾아보기"   >
                                    	<img name="btnImgDelete" src="${contextPath}/img/btn_delete.png" alt="삭제">
                                    <span class="con_inf txt11 fl100 fcYg">* 10M 미만의 파일만 허용됩니다.</span>
                                    </span>
                                </li>
                                
                                <li><strong>자기소개</strong>
                                	<span class="con">
                                	<textarea rows="4" cols="60" name="atte_rows" id="notice" onkeyup="resize(this)"></textarea>
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
    </div>
    <span class="con">
    
    </span><!--//container -->
  
    
<script type="text/javaScript" language="javascript">
		
	$("form").attr({action:"${contextPath}/join/gnrMberInsertSub.do", target:""});   
		
		
    $(document).ready(function () { 	
    		
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
	    		var $imgId = $(this).parent().find(':hidden');
	    		var $fileNmme = $(this).parent('').find('[name=file1_text]');
	    		
	    		e.preventDefault();
	    			
	    		var options = {
	    			url : '<c:url value="/files/uploadPage.do" />',
	    			width : 510,
	    			height : 300,
	    			closeCallback : closeCallback,
	    			title : 'Files',
	    			data : {
	    				Category : 'Sample',
	    				Accept : 'jpg|jpeg|png|bmp|gif',
	    				Max : 1,
	    				FileIds : $imgId.val()
	    			},
	    			buttonType : 0
	    		};
	    		var $dialog = BIT.modalDialog(options);
	    		
	    		//모달창의 위치를 재조정
	    		replaceModalwindow(offset, currPlace);
	    		function closeCallback(returnValue) {
	    			if (returnValue != null && returnValue.length > 0) {
	    				debugger;
	    				var files = returnValue;
	    				var fileIds = '';
	    				var fileNames = '';
	    				for (var i = 0; i < files.length; i++) {
	    					if (fileIds) {
	    						fileIds += ',' + files[i].fileId;
	    						fileNames += ',' + files[i].realName;
	    					} else {
	    						fileIds = files[i].fileId;
	    						fileNames = files[i].realName;
	    					}
	    				}
	    				$imgId.val(fileIds);
	    				$fileNmme.val(fileNames);
	    			} else {
	    				$imgId.val('');
	    				$fileNmme.val('');
	    			}
	    		}
	    	});

	    	$('#btnFileDownload').click(function(e) {
	    		e.preventDefault();
	    		COM.openFileListPopup('Sample', $('#fileIds').val());
	    	});
	
		$('[name=btnImgDelete]').click(function(e){
			$(this).parent().find(':hidden').val('');
    		$(this).parent('').find('[name=file1_text]').val('');
		});
    });
    
    function replaceModalwindow(offset, currPlace) {
    	$('.ui-dialog').css('top', offset.top +'px');
    	$( 'html, body' ).animate( { scrollTop : currPlace }, 0);
    }

     //학교추가
    var fn_addSch = function()
    {
    	var $e = $("#school_info_root ul li:last").clone();
    	$e.find("input").val('');
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
        	var $e = $("#career_info_root ul li:last").clone();
        	$e.find("input").val('');
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
        	var $e = $("#award_info_root ul li:last").clone();
        	$e.find("input").val('');
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
        	var $e = $("#paper_info_root ul li:last").clone();
        	$e.find("input").val('');
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
 </script>