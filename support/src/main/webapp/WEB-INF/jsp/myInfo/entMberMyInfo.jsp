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
                    
                    <div class="mem_info fll txt12">
                   입력된 정보는 가입이 완료되어야만 저장되며, 개인정보 처리방침에 따라 보호되고 있습니다.
                    </div>        
                               
                    <form:form commandName="entrprsManageVO"  id="form">      
                    <input type="hidden" name="uniqId" value = '<c:out value='${entrprsManageVO.uniqId}'/>'>
                    <input type="hidden" id="applcntEmailAdres" name="applcntEmailAdres" value="<c:out value='${loginVO.email}'/>">
                    <input type="hidden" id="reprsntEmailAdres" name="reprsntEmailAdres" value='' ><!-- 대표이메일주소 -->
                    <input type="hidden" id="userSe" name="userSe" value="<c:out value='${loginVO.userSe}'/>">
                     <input type="hidden" id="zip" name="zip" value='<c:out value='${entrprsManageVO.zip}'/>'' ><!-- 우편번호 -->
                     <input type="hidden" id="bizrno" name="bizrno" value='<c:out value='${entrprsManageVO.bizrno}'/>'' ><!-- 사업자등록번호 -->                     
                     <input type="hidden" id="isDoneIDchk" name="isDoneIDchk"  value='N'>
                      <input type="hidden" id="progressStauts" name="progressStauts"  value=''>
                      
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
                                    <span class="con"><form:input path="entrprsmberId"   readonly="true"  class="w200"  /><label id="resultChkID" ></label> <div id="resultChkID2"></div>
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
                                    <input name="atchBizFileId" type="text" class="w200"><a href="#"><img src="${contextPath}/img/btn_find.png" alt="찾아보기"></a><a href="#"><img src="${contextPath}/img/btn_delete.png" alt="삭제"></a>
                                    <span class="con_inf txt11 fl100 fcYg">* 5M 미만의 파일만 허용됩니다.</span>
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
                    </form:form>                    
                    
                    <!-- 부가정보입력 요청 -->
                    <div class="mem_info_sect">
                        <p>부가정보입력 요청</p>
                        <div class="mem_box fl100">
                        	<div class="txt2"><span class="inf">기본정보 외의 부가정보를 입력하시면 원활한 업무처리, 회원간 소통 및 홍보 등에 편리합니다.</span>
<span class="txt12">• 특성화 고등학교, 특성화 대학원 및 장학생 신청, 과제관리, 보고서관리 등에서 1회 입력으로 편리하게 사용<br/>
• 커뮤니티서비스를 이용하여 공간정보 관련업계에 기관, 기업, 개인을 홍보∙마케팅하는데 활용 가능<br/>
• (재)공간정보산업진흥원의 관련사업 진행시 전문가, 기관 등으로 연계 가능</span>

							</div>
                        </div>
                    </div>
                    
                    <!-- 버튼영역 -->
                    <div class="mbtn_wrap">
                   		<a href='javascript:goSave("H");'><img src="${contextPath}/img/btn_info.png" alt="부가정보"></a><a href='javascript:goSave("F");' ><img src="${contextPath}/img/btn_regist.png" alt="등록단계"></a><a href="#"><img src="${contextPath}/img/btn_cancle.png" alt="취소"></a></div>
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
	$(function(){
 		$("form").attr({action:"${contextPath}/myInfo/updateEntMyInfo.do", target:""});

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

    });
	
	function goSave(status){
		var  result = isOkAllproperty() ;
		if(isOkAllproperty() == 'OK'){
			$('#progressStauts').val(status);
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
	</script>