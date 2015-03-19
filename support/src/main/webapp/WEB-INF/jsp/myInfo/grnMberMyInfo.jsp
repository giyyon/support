<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/taglib.jsp" %>

        <div class="svisual" style="background-color:#41372e;background-image:url('${contextPath}/img/Visual01.jpg'); background-position:center">
        </div><!--//svisual -->
        
        <div class="tit_wrap">
        	<div class="title area_ct">
            	<img src="${contextPath}/img/tit_myinfo.png" alt="내정보"><span>Myinfo</span>
            	<div class="depth"><a href="#"><img src="${contextPath}/img/ico_home.png" alt="home아이콘"></a><img src="${contextPath}/img/space.png" alt=""><a href="#">고객센터</a><img src="${contextPath}/img/space.png" alt=""><a href="#">공지사항</a></div>
            </div>
        </div>
     	<div id="sub_container">
        	<div id="content-group">
        		<div id="lnb-group">
            		<ul id="lnb">
               	    <li><a href="/myInfo/myInfoView.do" class="select">회원정보 관리</a></li>
					<li><a href="#">문의∙제안∙신고 관리</a></li>
					<li><a href="/myInfo/trendList.do">최신동향정보 관리</a></li>
                    <li><a href="#">생생현장소식 관리 </a></li>
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
                    <div class="mem_info fll txt12 mt5">
                   입력된 정보는 변경이 완료되어야만 저장되며, 개인정보 취급방침에 따라 보호되고 있습니다.
                    </div> 
                               
                    <form:form commandName="mberManageVO"  id="form">      
	                    <input type="hidden" id="mberEmailAdres" name="mberEmailAdres" value="<c:out value='${loginVO.email}'/>">
<%-- 	                    <input type="hidden" id="moblphonNo"  name="moblphonNo"  value="<c:out value='${loginVO.mbTlNum}'/>"> --%>
	                    <input type="hidden" id="ihidnum" name="ihidnum" > <!--주민번호 -->
	                    <input type="hidden" id="userSe" name="userSe" value="<c:out value='${loginVO.userSe}'/>">
	                    <input type="hidden" id="zip" name="zip" value='' ><!-- 우편번호 -->
	                    <input type="hidden" name="uniqId" value = '<c:out value='${mberManageVO.uniqId}'/>'>
	                     <input type="hidden" id="progressStauts" name="progressStauts" value='' >
                    
                    
                    
                     <!-- 회원기본정보 -->
                    <div class="mem_info_sect">
                        <p>회원기본정보</p>
                        
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
                    </form:form>
                    <!-- 부가정보입력 요청 -->
                    <div class="mem_info_sect">
                        <p>부가정보입력 요청</p>
                        <div class="mem_box fl100">
                        	<div class="txt2"><span class="inf">기본정보 외의 부가정보를 입력하시면 원활한 업무처리, 회원간 소통 및 홍보 등에 편리합니다.</span>
<span class="txt12">? 특성화 고등학교, 특성화 대학원 및 장학생 신청, 과제관리, 보고서관리 등에서 1회 입력으로 편리하게 사용<br/>
? 커뮤니티서비스를 이용하여 공간정보 관련업계에 기관, 기업, 개인을 홍보?마케팅하는데 활용 가능<br/>
? (재)공간정보산업진흥원의 관련사업 진행시 전문가, 기관 등으로 연계 가능</span>

							</div>
                        </div>
                    </div>
                    
                    <!-- 버튼영역 -->
                    <div class="mbtn_wrap">
                   		<a href="javascript:goSave('H');"><img src="${contextPath}/img/btn_info.png" alt="부가정보"></a><a href="javascript:goSave('F');"><img src="${contextPath}/img/btn_regist.png" alt="등록단계"></a><a href="#"><img src="${contextPath}/img/btn_cancle.png" alt="취소"></a></div>
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
 		$("form").attr({action:"${contextPath}/myInfo/updateGnrMyInfo.do", target:""});

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