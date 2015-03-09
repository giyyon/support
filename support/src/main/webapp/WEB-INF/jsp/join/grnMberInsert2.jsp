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
                   입력된 정보는 가입이 완료되어야만 저장되며, 개인정보 처리방침에 따라 보호되고 있습니다.
                    </div>        
                               
                    <form:form commandName="mberManageVO"  id="form">      
                    <input type="hidden" id="mberNm" name="mberNm" value="<c:out value='${loginVO.name}'/>">
                    <input type="hidden" id="mberEmailAdres" name="mberEmailAdres" value="<c:out value='${loginVO.email}'/>">
                    <input type="hidden" id="ihidnum" name="ihidnum" > <!--주민번호 -->
                    <input type="hidden" id="userSe" name="userSe" value="<c:out value='${loginVO.userSe}'/>">
                     <input type="hidden" id="zip" name="zip" value='' ><!-- 우편번호 -->
                     <input type="hidden" id="isDoneIDchk" name="isDoneIDchk"  value='N'>
                      <input type="hidden" id="progressStauts" name="progressStauts"  value=''>
                    
                    
                    
                    <!-- 회원인증 및 가입확인 -->
                    <div class="mem_info_sect">
                        <p>회원기본정보</p>
                        
                        <div class="mem_box fl100">
                        	<ul class="info_put fl100">
                            	<li><strong>성명</strong>
                                	<span class="con"><c:out value='${loginVO.name}'/><span class="chk2"><input name="nmOthbcAt"  id="nmOthbcAt"  type="checkbox" value="Y" > 공개(비공개시 아이디로 대체) </span></span> 
                                </li>
                                <li><strong>아이핀번호</strong><span class="con"></span> </li>
                                <li><strong>* 아이디</strong>
                                    <span class="con"><input id="mberId" name="mberId" type="text" class="w200"><a href="javascript:;" id='chkDupleID'><img src="${contextPath}/img/btn_idchk.png" alt="중복확인"></a><label id="resultChkID" ></label> <div id="resultChkID2"></div>
                                    	<span class="con_inf txt11 fl100 fcYg">*4~12자의 영문, 숫자 조합으로 입력하여 주시기 바랍니다.</span>
                                    </span> 
                                </li>
                                <li><strong>* 비밀번호</strong>
                                    <span class="con"><input id="password"  name="password" type="password" class="w200"></a>
                                    	<span class="con_inf txt11 fl100 fcYg">*9~16자의 영문+숫자+특수문자로 입력하여 주시기 바랍니다.</span>
                                    </span> 
                                </li>
                                <li><strong>* 비밀번호 확인</strong>
                                    <span class="con"><input id="passwordChk" name="passwordChk" type="password" class="w200"></a></span> 
                                </li>
                                <li><strong>* 생일</strong>
                                	<span class="con">
                                        <select name="birthYear" id="birthYear">
                                            <option>-연도-</option>
											<option value='2009'>2009</option>
											<option value='2008'>2008</option>
											<option value='2007'>2007</option>
											<option value='2006'>2006</option>
											<option value='2005'>2005</option>
											<option value='2004'>2004</option>
											<option value='2003'>2003</option>
											<option value='2002'>2002</option>
											<option value='2001'>2001</option>
											<option value='2000'>2000</option>
											<option value='1999'>1999</option>
											<option value='1998'>1998</option>
											<option value='1997'>1997</option>
											<option value='1996'>1996</option>
											<option value='1995'>1995</option>
											<option value='1994'>1994</option>
											<option value='1993'>1993</option>
											<option value='1992'>1992</option>
											<option value='1991'>1991</option>
											<option value='1990'>1990</option>
											<option value='1989'>1989</option>
											<option value='1988'>1988</option>
											<option value='1987'>1987</option>
											<option value='1986'>1986</option>
											<option value='1985'>1985</option>
											<option value='1984'>1984</option>
											<option value='1983'>1983</option>
											<option value='1982'>1982</option>
											<option value='1981'>1981</option>
											<option value='1980'>1980</option>
											<option value='1979'>1979</option>
											<option value='1978'>1978</option>
											<option value='1977'>1977</option>
											<option value='1976'>1976</option>
											<option value='1975'>1975</option>
											<option value='1974'>1974</option>
											<option value='1973'>1973</option>
											<option value='1972'>1972</option>
											<option value='1971'>1971</option>
											<option value='1970'>1970</option>
											<option value='1969'>1969</option>
											<option value='1968'>1968</option>
											<option value='1967'>1967</option>
											<option value='1966'>1966</option>
											<option value='1965'>1965</option>
											<option value='1964'>1964</option>
											<option value='1963'>1963</option>
											<option value='1962'>1962</option>
											<option value='1961'>1961</option>
											<option value='1960'>1960</option>
											<option value='1959'>1959</option>
											<option value='1958'>1958</option>
											<option value='1957'>1957</option>
											<option value='1956'>1956</option>
											<option value='1955'>1955</option>
											<option value='1954'>1954</option>
											<option value='1953'>1953</option>
											<option value='1952'>1952</option>
											<option value='1951'>1951</option>
											<option value='1950'>1950</option>
											<option value='1949'>1949</option>
											<option value='1948'>1948</option>
											<option value='1947'>1947</option>
											<option value='1946'>1946</option>
											<option value='1945'>1945</option>
											<option value='1944'>1944</option>
											<option value='1943'>1943</option>
											<option value='1942'>1942</option>
											<option value='1941'>1941</option>
											<option value='1940'>1940</option>
                                        </select>
                                    <select  id ='birthMonth' name="birthMonth">
                                    	<option value=''> - 월 - </option>
	                                    <c:forEach var="result" items="${month_result}" varStatus="status">
	                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
	                                    </c:forEach>
                                    </select>
                                     <select  id ='birthDay' name="birthDay">
                                    	<option value=''> - 일 - </option>
	                                    <c:forEach var="result" items="${day_result}" varStatus="status">
	                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
	                                    </c:forEach>
                                    </select>
                                        <select name="sunLunar" id="sunLunar">
                                            <option value='1'>양력</option>
                                            <option value='2'>음력</option>
                                        </select>
                                        <span class="chk"><input name="birthOthbcAt" type="checkbox" value="Y"> 공개</span>
                                    </span> 
                                </li>
                                <li><strong>* 성별</strong>
                                	<span class="con">
                                    <input name="sexdstnCode" type="radio" value="M" checked> 남성 &nbsp;<input name="sexdstnCode" type="radio" value="F"> 여성
                                    <span class="chk"><input name="sexdstnOthbcAt" type="checkbox" value="Y"> 공개</span>
                                    </span>
                                </li>
                                <li><strong>* 이메일 </strong>
                                	<span class="con">
                                    <input name="emailHead" id="emailHead" type="text" class="w100" readonly="readonly"  value="<c:out value='${emailHead}'/>"><em>@</em><input name="emailTail"  id="emailTail"   type="text" readonly="readonly"  class="w100" value="<c:out value='${emailTail}'/>">
                                   
<!--                                     <select  id ='mberEmailAdresList'> -->
<!--                                     	<option value=''>---선택하세요---</option> -->
<%-- 	                                    <c:forEach var="result" items="${email_result}" varStatus="status"> --%>
<%-- 	                                    	<option value='<c:out value="${result.codeNm}"/>' ><c:out value="${result.codeNm}"/></option> --%>
<%-- 	                                    </c:forEach> --%>
<!--                                     </select> -->
                                    
<%--                                     <form:select path="mailDomain" id="mberEmailAdresList" title="이메일"> --%>
<%-- 				                        <form:option value="" label="--선택하세요--"/> --%>
<%-- 				                        <form:options items="${email_result}" itemValue="codeNm" itemLabel="codeNm"/> --%>
<%-- 				                    </form:select> --%>
                                    <span class="txt11 fcYg"><input name="recvAt" type="checkbox" value=""> 이메일/SMS수신동의</span>
                                    <span class="chk"><input name="mberEmailAdresOthbcAt" type="checkbox" value=""> 공개</span>
                                    </span>
                                </li>
                                <li><strong>휴대폰</strong>
                                	<span class="con">
                                	 <input type="text" id="moblphonNo"  name="moblphonNo"  class="w200" value="<c:out value='${loginVO.mbTlNum}'/>">
                                    <span class="con_inf txt11 fl100 fcYg">*휴대폰이 없을 경우, 반드시 이메일 주소를 입력바랍니다.</span>
                                    </span> 
                                </li>
                                <li><strong>* 별명 </strong>
                                	<span class="con">
                                    	<input name="nick" type="text" class="w100"><span class="chk"><input name="nickOthbcAt" type="checkbox" value="Y"> 공개</span><br/>
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
                                    	<span class="chk"><input name="jobOthbcAt" type="checkbox" value="Y"> 공개</span>
                                    </span> 
                                </li>
                                <li><strong>* 소속명</strong>
                                    <span class="con"><input name="pstinst" type="text" class="long3"><br/>
                                    	<span class="stit"><b>부서(학과):</b><input name="pstinstDeptNm" type="text" class="w100"></span>
                                        <span class="stit"><b>직위(학년):</b><input name="ofcpsNm"  type="text" class="w100"></span>
                                        <span class="chk"><input name="pstinstOthbcAt" type="checkbox" value="Y"> 공개</span>
                                    </span> 
                                </li>
                                <li><strong>* 소속연락처</strong>
                                	<span class="con">
                                    <select name="areaNo">
                                        <option>02</option>
                                    </select>
                                    <em>-</em><input name="middleTelno" type="text" class="w40"><em>-</em><input name="endTelno" type="text" class="w40">
                                    <span class="chk"><input name="contacOthbcAt" type="checkbox" value="Y"> 공개</span>
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    </span> 
                                </li>
                                <li><strong>* 소속주소</strong>
                                	<span class="con">
                                    <input name="zip1" id="zip1" type="text" class="w40"><em>-</em><input name="zip2" id="zip2" type="text" class="w40"><a href="#"><img src="${contextPath}/img/btn_post.png" alt="우편번호"></a>
                                    <input name="adres" type="text" class="long2"><br/>
                                    <b>상세주소:</b><input name="detailAdres" type="text" class="long">
                                    <span class="chk"><input name="adresOthbcAt" type="checkbox" value="Y"> 공개</span>
                                    </span> 
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- //회원소속정보 -->
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
                   		<a href='javascript:goSave("H");'><img src="${contextPath}/img/btn_info.png" alt="부가정보"></a><a href='javascript:goSave("F");' ><img src="${contextPath}/img/btn_nextf.png" alt="다음단계"></a><a href="#"><img src="${contextPath}/img/btn_cancle.png" alt="취소"></a></div>
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
 		$("form").attr({action:"${contextPath}/join/gnrMberInsertMain.do", target:""});

 		$("#resultChkID").css("float", "right");
		$("#chkDupleID").click(function(){
			chkDupleID();
        });
		
// 		$( "#mberEmailAdresList" ) .change(function () {
// 		    																					$("#emailTail").val(  $( "#mberEmailAdresList option:selected" ).val());  
// 		                                                                                       });
		$('#zip1, #zip2').change(function(){
			$('#zip').val( $('#zip1').val() + $('#zip2').val());
		});
		
		$( "#birthYear,#birthMonth, #birthDay" ) .change(function () {
		    																					$("#ihidnum").val(  $( "#birthYear option:selected" ).val() + '.' + $( "#birthMonth option:selected" ).val() + '.' + $( "#birthDay option:selected" ).val() );                                                                                   
		});
		

		$("#mberId").change(function(){ 
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
		if(!chkPassword())
			return '비밀번호 확인 값이 다릅니다. 확인 바랍니다.'; 
		if(!chkDupleIDFalg())
			return '아이디 중복 확인 바랍니다.'; 
		if(!chkZip())
			return '우편번호 입력바랍니다'; 
		
		return 'OK';
	}
	
 	function chkPassword(){
 		if( $("#password").val() == null  ||  $("#password").val() == ''  ||  $("#password").val()  != $("#passwordChk").val()) {
 				return false;	
 		}else{
 			return true;
 		}
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
	
  	function chkDupleID(){      	
        if($("#mberId").val() == ''){
        	alert('id를 입력하시기 바랍니다');
        	return false;
        }
    	$("#resultChkID").html('');  
    	$("#resultChkID").css("display","block");
    	var $body = $('#resultChkID');
		
    	var formData = $("form").serialize ();
        $.ajax({
            url: "${contextPath}/join/chkDuplicationGnrId.do",
            type: "post",
            dataType:"json",
			data: "mberId="+ $("#mberId").val(),   //             data: { "name" : $("#name").val(),  "email" : $("#email").val(), "mbTlNum" : $("#mbTlNum").val() },
            success: function (data, status) {

            	if(data.IsSucceed){
            		//중복 없음
            		html = '<p>'+data.Message+'</p>';     
            		$body.append(html); 
            		$("#isDoneIDchk").val('Y');
            	}else {
            		//중복 있음
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