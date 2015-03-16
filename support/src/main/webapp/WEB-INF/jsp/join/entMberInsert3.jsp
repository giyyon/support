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
                    
                     <form:form commandName="entrprsManageVO"  id="form">    
                    <input type="hidden" name="uniqId" value = '<c:out value='${entrprsManageVO.uniqId}'/>'>
                    <input type="hidden" name="entrprsmberId" value = '<c:out value='${entrprsManageVO.entrprsmberId}'/>'>
                    <input type="hidden" id="applcntNm" name="applcntNm" value="<c:out value='${entrprsManageVO.applcntNm}'/>">
                    <input type="hidden" id="ofcpsNm" name="ofcpsNm" value="<c:out value='${entrprsManageVO.ofcpsNm}'/>">
                    <input type="hidden" id="pstinstDeptNm" name="pstinstDeptNm" value="<c:out value='${entrprsManageVO.pstinstDeptNm}'/>">
                    <input type="hidden" id="mbtlnum" name="mbtlnum" value="<c:out value='${entrprsManageVO.mbtlnum}'/>">
                    <input type="hidden" id="areaNo" name="areaNo" value="<c:out value='${entrprsManageVO.areaNo}'/>">
                   <input type="hidden" id="entrprsMiddleTelno" name="entrprsMiddleTelno" value="<c:out value='${entrprsManageVO.entrprsMiddleTelno}'/>">
                    <input type="hidden" id="entrprsEndTelno" name="entrprsEndTelno" value="<c:out value='${entrprsManageVO.entrprsEndTelno}'/>">
                    <input type="hidden" id="applcntEmailAdres" name="applcntEmailAdres" value='<c:out value='${entrprsManageVO.applcntEmailAdres}'/>' ><!-- 실무자이메일주소 -->
                    
                    <input type="hidden" id="mngEmailAdres" name="mngEmailAdres" value='' ><!-- 총괄책임자이메일주소 -->
                    <input type="hidden" id="taxEmailAdres" name="taxEmailAdres" value='' ><!-- 세무담당자이메일주소 -->
                    
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
				                                        	<dt>
				                                            </dt>
				                                            <dd class="file_sector">
				                                            	<input name="file1_text"  type="text" class="w200">
				                                            	<form:hidden path="atchImgLogoFileId" />
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
					                                        	<dt>
					                                            </dt>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<form:hidden path="atchImg1FileId" />
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
			                                        <li id="tab3">
				                                        	<dl class="pic_regist">
					                                        	<dt>
					                                            </dt>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<form:hidden path="atchImg2FileId" />
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
			                                        <li id="tab4">
				                                        	<dl class="pic_regist">
					                                        	<dt>
					                                            </dt>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<form:hidden path="atchImg3FileId" />
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
			                                        <li id="tab5">
				                                        	<dl class="pic_regist">
					                                        	<dt>
					                                            </dt>
					                                            <dd>
					                                            	<input name="file1_text"  type="text" class="w200">
					                                            	<form:hidden path="atchImg4FileId" />
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
			                                      </ul>
                                    	</div>                                  
                                    </span> 
                                </li>
                                <li><strong>요약소개</strong>
                                    <span class="con">
                                    	<textarea name="shortNotice" id="shortNotice" cols="" rows=""></textarea>
                                        <span class="con_inf2 fl100 txt11">
                                        * 주요서비스(상품)가 포함된 기관?기업소개를 간략 (100자까지)하게 입력하여 주시기 바랍니다.<br/>&nbsp;&nbsp;&nbsp;본정보는 사업신청 및 관리, 주소록 등에서 매우 많이 노출됩니다.<br/>
&nbsp;&nbsp;&nbsp;예) ○○○○는 다양한 분야와의 통섭으로 공간정보문화를 창달코자 합니다.  주요서비스로는  스마트 네비게이션, 프로그램 등이 있습니다.
										</span>
                                    </span>
                                    </span> 
                                </li>
                                <li><strong>홈페이지</strong>
                                    <span class="con"><input type="text" name='homepageUrl' id='homepageUrl'  class="long" value="http://"></span> 
                                </li>
                                <li><strong>블로그</strong>
                                    <span class="con"><input type="text" name='blogUrl'  id='blogUrl' class="long" value="http://"></span> 
                                </li>
                                 <li><strong>소셜</strong>
                                    <span class="con"><input type="text" name='socialUrl'   id='socialUrl' class="long" value="http://"></span> 
                                </li>
                                <li><strong>직원수</strong>
                                    <span class="con"><input type="text" name='empCnt'  id='empCnt'  class="long" value="0"></span> 
                                </li>
                                <li><strong>자본금</strong>
                                    <span class="con"><input type="text" name='capitalMoney'   id='capitalMoney' class="long" value="0"></span> 
                                </li>
                                <li><strong>매출액</strong>
                                    <span class="con"><input type="text" name='salesMoney'  id='salesMoney' class="long" value="0"></span> 
                                </li>
                                <li><strong>소개서</strong>
                                	<span class="con">
                                    <input name="file1_text" type="text" class="w200">
									<form:hidden path="atchReportFileId" />
									<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="5" data_category="memberAttach"  data_type="file"  alt="찾아보기"   >
                                   	<img name="btnFileDownload" src="${contextPath}/img/btn_down.png"    data_type="file"   alt="다운로드"> 
                                   	<img name="btnImgDelete" src="${contextPath}/img/btn_delete.png" alt="삭제">    
                                    <span class="con_inf txt11 fl100 fcYg">* 10M 미만의 파일만 허용됩니다.</span>
                                    </span>
                                </li>
                                <li><strong>포트폴리오</strong>
                                	<span class="con">
                                    <input name="file1_text" type="text" class="w200">
									<form:hidden path="atchPortFileId" />
									<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="5" data_category="memberAttach"  data_type="file"  alt="찾아보기"   >
                                   	<img name="btnFileDownload" src="${contextPath}/img/btn_down.png"    data_type="file"   alt="다운로드"> 
                                   	<img name="btnImgDelete" src="${contextPath}/img/btn_delete.png" alt="삭제">  
                                    <span class="con_inf txt11 fl100 fcYg">* 10M 미만의 파일만 허용됩니다.</span>
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
                                	<span class="con"><input name="mngNm" id="mngNm"  type="text" class="w100"> &nbsp;
                                    <span class="stit"><b>직위:</b><input name="mngOfcpsNm" id="mngOfcpsNm" type="text" class="w100"></span>
                                        <span class="stit"><b>부서:</b><input name="mngPstinstDeptNm"  id="mngPstinstDeptNm"  type="text" class="w100"></span>
                                    </span>
                                </li>
                                <li><strong>이메일</strong>
                                	<span class="con">
                                    <input name="mngEmailHead" id="mngEmailHead"  type="text" class="w100"><em>@</em><input name="mngEmailTail" id="mngEmailTail" type="text" class="w100">
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
                                    <input type="text" id="mngMbtlnum"  name="mngMbtlnum"  class="w200" >
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    </span> 
                                </li>
                                <li><strong>* 직통전화 </strong>
                                	<span class="con">
                                    <input name="mngAreaNo" id="mngAreaNo"  type="text" class="w30">
                                    <em>-</em><input name="mngEntrprsMiddleTelno" type="text" class="w40"><em>-</em><input name="mngEntrprsEndTelno" type="text" class="w40">
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
                                	<span class="con"><input name="taxNm" id="taxNm"  type="text" class="w100"> &nbsp;
                                    <span class="stit"><b>직위:</b><input name="taxOfcpsNm"  id="taxOfcpsNm" type="text" class="w100"></span>
                                        <span class="stit"><b>부서:</b><input name="taxPstinstDeptNm" id="taxPstinstDeptNm"  type="text" class="w100"></span>
                                    </span>
                                </li>
                                <li><strong>이메일</strong>
                                	<span class="con">
                                    <input name="taxEmailHead" id="taxEmailHead" type="text" class="w100"><em>@</em><input name="taxEmailTail" id="taxEmailTail" type="text" class="w100">
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
                                    <input type="text" id="taxMbtlnum"  name="taxMbtlnum"  class="w200" >
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    </span> 
                                </li>
                                <li><strong>* 직통전화 </strong>
                                	<span class="con">
                                    <input name="taxAreaNo" id="taxAreaNo"  type="text" class="w30">
                                    <em>-</em><input name="taxEntrprsMiddleTelno"  id="taxEntrprsMiddleTelno" type="text" class="w40"><em>-</em><input name="taxEntrprsEndTelno" id="taxEntrprsEndTelno" type="text" class="w40">
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    </span> 
                                </li>
								<li><strong>기관∙기업 개요</strong>
                                	<span class="con">
<!--                                        <textarea rows="4" cols="60" name="atte_rows" id="notice" onkeyup="resize(this)"></textarea> -->
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
		
	$("form").attr({action:"${contextPath}/join/entMberInsertSub.do", target:""});   
		
	//이메일 도메인 선택
	$( "#mngEmailAdresList" ) .change(function () {
	    																					$("#mngEmailTail").val(  $( "#mngEmailAdresList option:selected" ).val());  
	    																					$('#mngEmailAdres').val( $('#mngEmailHead').val() +"@"+ $('#mngEmailTail').val());
	                                                                                       });
	//이메일 도메인 선택
	$( "#taxEmailAdresList" ) .change(function () {
	    																					$("#taxEmailTail").val(  $( "#taxEmailAdresList option:selected" ).val());  
	    																					$('#taxEmailAdres').val( $('#taxEmailHead').val() +"@"+ $('#taxEmailTail').val());
	                                                                                       });
	//이메일 조합
	$('#mngEmailHead, #mngEmailTail').change(function(){
		$('#mngEmailAdres').val( $('#mngEmailHead').val() +"@"+ $('#mngEmailTail').val());
	});	
	//세무이메일 조합
	$('#taxEmailHead, #taxEmailTail').change(function(){
		$('#taxEmailAdres').val( $('#taxEmailHead').val() +"@"+ $('#taxEmailTail').val());
	});	
	
	//총괄책임자 선택
	$( "input[name=chkSameMnger]" ).click(function(){
		if($(this).val()=='Y'){
			$("#mngNm").val($("#applcntNm").val());
			$("#mngOfcpsNm").val($("#ofcpsNm").val());
			$("#mngPstinstDeptNm").val($("#pstinstDeptNm").val());
			
			var email = $("#applcntEmailAdres").val();
			var emailArray = email.split('@');
			$("#mngEmailHead").val(emailArray[0]);
			$("#mngEmailTail").val(emailArray[1]);
			$("#mngEmailAdres").val(email);
			
			$("#mngMbtlnum").val($("#mbtlnum").val());
			$("#mngAreaNo").val($("#areaNo").val());
			$("#mngEntrprsMiddleTelno").val($("#entrprsMiddleTelno").val());
			$("#mngEntrprsEndTelno").val($("#entrprsEndTelno").val());
		}else if($(this).val()=='N'){
			$("#mngNm").val('');
			$("#mngOfcpsNm").val('');
			$("#mngPstinstDeptNm").val('');
			$("#mngEmailHead").val('');
			$("#mngEmailTail").val('');
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
			$("#taxEmailHead").val(emailArray[0]);
			$("#taxEmailTail").val(emailArray[1]);
			$("#taxEmailAdres").val(email);
			
			$("#taxMbtlnum").val($("#mbtlnum").val());
			$("#taxAreaNo").val($("#areaNo").val());
			$("#taxEntrprsMiddleTelno").val($("#entrprsMiddleTelno").val());
			$("#taxEntrprsEndTelno").val($("#entrprsEndTelno").val());
		}else if($(this).val()=='N'){
			$("#taxNm").val('');
			$("#taxOfcpsNm").val('');
			$("#taxPstinstDeptNm").val('');
			$("#taxEmailHead").val('');
			$("#taxEmailTail").val('');
			$("#taxEmailAdres").val('');
			$("#taxMbtlnum").val('');
			$("#taxAreaNo").val('');
			$("#taxEntrprsMiddleTelno").val('');
			$("#taxEntrprsEndTelno").val('');
		}
	});
	
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
    	
		//----------------------------------------------------------------------------------------------------------------------------------------
		//첨부파일 등록하는 전용 스크립트
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
    		$fileNmme.val('');
    		var basicImg = '<c:url value="/webAttach/thumnails/" />';
    		$imgDiv.css;
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

    function replaceModalwindow(offset, currPlace) {
    	$('.ui-dialog').css('top', offset.top +'px');
    	$( 'html, body' ).animate( { scrollTop : currPlace }, 0);
    }
    	

    	function goSave(){
			$("form").submit();
    	}
 </script>