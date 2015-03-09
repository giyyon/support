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
                    <ul class="step_wrap">
                    	<li><img src="${contextPath}/img/step01.png" alt="약관동의"></li>
                        <li class="select"><img src="${contextPath}/img/step02_on.png" alt="2.실명확인"></li>
                        <li><img src="${contextPath}/img/step03.png" alt="3. 회원정보입력"></li>
                        <li class="end"><img src="${contextPath}/img/step04.png" alt="4. 가입완료"></li>
                    </ul>
                    
                    <div class="mem_info fll txt12">
                    	<ul>
                            <li>아래의 이메일인증 또는 아이핀인증을 이용하여, 중복가입여부와 극소수 익명 사용자의 아이디, 허위정보 남용 등으로 발생되는 피해를 방지하기 위해 본인임을 확인합니다</li>
                            <li>인증은 회원가입시 1회에 한하여 적용되며, 정부지원사업 참여를 위해서는 아이핀인증이 필요합니다.</li>
                            <li>타인의 정보 및 주민등록번호를 부정하게 사용하는 경우 3년이하의 징역 또는 1천만원 이하의 벌금에 처해지게 됩니다. (관련법률_주민등록법 제37조 (벌칙) 제10호)</li>
                            <li>회원님의 소중한 개인정보는 서비스 정책 등에 따른 명백한 동의 없이 공개 또는 제3자에게 제공되지 않습니다.</li>
                        </ul>
                    </div>                   
                    
                    <!-- 회원인증 및 가입확인 -->
                    <div class="mem_info_sect">
                        <p>회원인증 및 가입확인</p>
                        
                        <div class="mem_box fl100">
                        	<div class="txt txt11">- 입력된 정보는 다음단계의 회원정보입력시 변경할 수 없으므로, 정확히 입력하여 주시기 바랍니다.<br/>
- 기존 회원일 경우, 인증버튼 클릭시 가입여부가 노출되므로 아이디찾기, 비밀번호찾기를 이용해 로그인하여 주시기 바랍니다. <br/>&nbsp;&nbsp;단, 개인정보보호를 위해 일부정보는 암호화되어 표기됩니다. 
							</div>
							<form:form commandName="mberManageVO"  id="form">
                        	<ul class="info_put fl100">
                            	<li><strong>성명(실명)</strong><span class="con"><input name="name" type="text" class="w200"></span> </li>
                                <li><strong>휴대폰</strong>
                                	<span class="con">
                                	<input name="mbTlNum" type="text" class="w200"></span>
                                	</span> 
                                </li>
                                
                                <li><strong>이메일 </strong>
                                	<span class="con">
                                    <input name="emailHead" id="emailHead" type="text" class="w100"><em>@</em><input name="emailTail" id="emailTail" type="text" class="w100">
                                    <form:select path="mberEmailAdres" id="mberEmailAdres" title="이메일">
				                        <form:option value="" label="--선택하세요--"/>
				                        <form:options items="${email_result}" itemValue="codeNm" itemLabel="codeNm"/>
				                    </form:select>
                                    </span>
                                </li>
                                
                                <li class="end"><strong>인증번호 </strong>
                                	<span class="con">
                                    <input name="verifyEmailNumber" id="verifyEmailNumber"  type="text" class="w100">
                                    <span class="con_inf txt11 fl100 fcYg">* 인증번호를 입력하여 주시기 바랍니다. 발송된 인증번호는 10분간 유효합니다.</span>
                                    </span>
                                </li>
                            </ul>
                            <input type="hidden" name="email" id="email" value="">
                            <input type="hidden" name="userSe" value='${loginVO.userSe}'>
                            </form:form>
                            
                            
                            
                    	</div><!-- //약관내용 박스 -->
                        
                        <div class="fl100 mt35">
                            <div class="mem_btn">
                                <div class="btn_nxt" id="verifyEmailFirst" ><a href="javascript:;">이메일 인증 요청</a></div><div class="btn_ipin" id="verifyIPinFirst"><a href='javascript:'>아이핀(i-PIN) 인증 </a></div>
                            </div>
                        </div>                        
	                    <div class="pop_mem fl100" id="div-similar">
	                    </div>                        
                                     
                    </div>
                    <!-- //회원인증 및 가입확인 -->
                    
                    <div class="ipin">
                   		<dl>
                        	<dt>&nbsp;
                            </dt>
                            <dd>
                            <img src="${contextPath}/img/ipin_tit.png" alt="아이핀(i-PIN) 인증이란?"> <br/>
                            아이핀은 주민등록번호를 노출하지 않고도 본인임을 확인시킬 수 있는 주민등록번호 대체 수단입니다.<br/>
아이핀 계정이 있으신 분은 바로 회원가입이 가능하며, 없을 경우 아래의 발급절차에 따라 <a href="#" class="link1">공공 i-PIN센터</a>(행정자치부)에서 발급받은 후 회원가입하여 주시기 바랍니다. <br/>
<a href="#" class="link2">한국신용평가정보㈜</a> 등의 타기관에서 발급받은 아이핀도 사용가능합니다. 단, 아이디/비밀번호찾기는 아이핀 발급기관에서만 확인이 가능합니다.

                            </dd>
                        </dl>
						<ul class="process">
                        	<li>01<br/>
                            <a href="#" class="link1">공공 i-PIN센터</a> 클릭<br/>(새창에서 열기 )

                            </li>
                            <li>02<br/>
                            공공 I-PIN센터<br/>
                            (신규발급)
                            </li>
                            <li>03<br/>
                           개인정보입력<br/>(ID, 비밀번호, 이메일 등)
                            </li>
                            <li>04<br/>
                            신원확인<br/>(공인인증서, 신용카드 등)
                            </li>
                            <li>05<br/>
                            아이핀 발급<br/>(본인 확인 활용)
                            </li>
                        </ul>
                    </div>
                    
                    <!-- 버튼영역 --><!-- //버튼영역 -->

            	</div>
            	<!--//contents -->
        	</div>
        	<!--//content-group -->
		</div><!--//sub_container -->
    </div>
    <span class="con">
    
 <script type="text/javaScript" language="javascript">
    $("#div-similar").css("display","none");
    
    $("#verifyEmailFirst").attr({onclick:"javascript:requestVerifyNumber1()"});
    
    $('#verifyIPinFirst').bind("click", function(){
    	$('#verifyIPinFirst a').text('눌렀음');
	});
    
	$( "#mberEmailAdres" ) .change(function () {
		$("#emailTail").val(  $( "#mberEmailAdres option:selected" ).val());  
   });
    
    function goFirstStep(){
    	window.location = "${contextPath}/join/UserSeChoose.do";
    }
    
    function requestVerifyNumber1(){   
        $('#email').val($('#emailHead').val()+'@'+$('#emailTail').val());
              
    	$("#div-similar").html('');  
    	
    	$("#div-similar").css("display","block");
    	var $body = $('#div-similar');
		var html = '<p>메일 발송 작업 중입니다. 결과 응답때까지 잠시만 기다리세요.</p>';
		$body.append(html); 
		
    	var formData = $("form").serialize ();
        $.ajax({
            url: "${contextPath}/join/SendVerifyEmailNumber1.do",
            type: "post",
            dataType:"json",
			data: formData,   //             data: { "name" : $("#name").val(),  "email" : $("#email").val(), "mbTlNum" : $("#mbTlNum").val() },
            success: function (data, status) {
            	$body.html('');
            	if(data.IsSucceed){
            		//인증 메일 발송 성공
            		html = '<p>'+data.Message+'</p>';      
            		$body.append(html); 
            		
            		$('#verifyEmailFirst a').text('이메일 인증 하기');
            		$("#verifyEmailFirst").attr({onclick:"javascript:requestVerifyNumber2()"});
            	}else {
            		if(data.ErrorCode == "ErrorSimilar"){            			
        				var list = data.Data;	
        				html = '<p>유사한 정보로 '+ list.length + '개의 아이디가 등록되어 있습니다. </p>';
        				$body.append(html);                       
        				for (var i = 0; i < list.length; i++) {
        					var $div = $('<div class="intxt"></div>');       
        					var subhtml = '아이디 : '+list[i].id.substring(0,3)+'***' + '<br>성명 : '+ list[i].name.substring(0,3)+'***' +' <br>가입일 : '+ list[i].sbscrbDe +' <br>이메일 : '+ list[i].email.substring(0,3)+'***' +' <br>휴대폰 : '+ list[i].mbTlNum.substring(0,3)+'***' ;
        					$div.html(subhtml);     
        					$body.append($div); 	
        				}
            		}else if(data.ErrorCode == "ErrorSendMail"){
        				html = '<p>'+data.Message+'</p>';
        				$body.append(html); 
            		}
            	}          	
            	$("#div-similar").css("display","block");
            	console.log("status:"+status+","+"data:"+data.email);
            },
            error: function (request, status, error) {
            	alert('에러발생');
            	console.log("code : " + request.status + "\r\nmessage : " + request.reponseText + "\r\nerror : " + error);
            }
        });
    }
    function requestVerifyNumber2(){   
    	$("#div-similar").html('');
    	$("#div-similar").css("display","block");
    	
    	var formData = $("form").serialize();
        $.ajax({
            url: "${contextPath}/join/SendVerifyEmailNumber2.do",
            type: "post",
            dataType:"json",
			data: formData,
            success: function (data, status) {
            	var $body = $('#div-similar');
            	$body.html('');
				var html = '';
            	if(data.IsSucceed){
            		//인증 성공
            		html = '<p>인증 성공</p>';
        			$body.append(html);    
            		$("form").attr({action:"${contextPath}/join/gnrMberInsertView2.do", target:""});	
            		$("form").submit();
            	}else {
            		
            		if(data.ErrorCode == "ErrorTime"){            			
        				html = '<p>'+data.Message+'</p>';
        				$body.append(html);     
        				
        				$('#verifyEmailFirst a').text('이메일 인증 재요청');
        				$("#verifyEmailFirst").attr({onclick:"javascript:requestVerifyNumber1()"});

        				
            		}else if(data.ErrorCode == "ErrorWrongNumber"){
        				html = '<p>'+data.Message+'<input type="button"  onClick="goFirstStep();" value="처음부터 다시"></p>';
        				$body.append(html); 
        				
            		}           		
        		}
        	},
            error: function (request, status, error) {
            	alert('에러발생');
            	console.log("code : " + request.status + "\r\nmessage : " + request.reponseText + "\r\nerror : " + error);
            }
        });
    }
  </script>