<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />

    <title>공간정보 융복합 핵심인재 양성사업 종합관리시스템</title>
	<script language="javascript">
 		function clear1() {
  		self.idText.value = "";
 		}
		function clear2() {
  		self.pwText.value = "";
 		}

</script>

    <link href="${contextPath}/css/necgis.css" rel="stylesheet" type="text/css" />

</head>
<body>
<form id="loginForm" action ="<c:url value='/login/actionLogin.do'/>" method="post">
	<div id="login_wrp">
	    
	    <div class="logo"><img src="${contextPath}/img/login_l.png" alt="공간정보 창의인재 양성사업 종합관리시스템"></div>
	    <li>
	    	<span class="con">
			<input name="rdoSlctUsr" type="radio" value="GNR"  checked> 일반회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input name="rdoSlctUsr" type="radio" value="ENT"> 기업회원
			<input name="userSe" type="hidden">
			</span>
		</li>
	    
	    <div class="form_wrp">
	    	<div class="tit">아이디</div><input id ="id" name="id" type="text" class="idbox" value="" >
	    	<div class="tit">비밀번호</div><input id="password" type="password" name="password" class="pwbox" >
	        <div class="btn_login">
	        	<span class="log"><a href="#"><img src="${contextPath}/img/btn_keylogin.png" id="login-img" alt="로그인버튼"></a></span><span><a href="#"><img src="${contextPath}/img/btn_keyipn.png" alt="공인인증서"></a></span>
	        </div>
	    </div>
	    <div class="ban_wrp"><img src="${contextPath}/img/m_banner.png" width="300" height="147"></div>
	    <ul class="login_add">
	        <li><a href="javascript:join()">회원가입</a></li><li><a href="javascript:findId()">아이디/비밀번호 찾기</a></li>
	    </ul>
	    <div class="login_ex">
	    (재)공간정보산업진흥원에서 운영하고 있는 공간정보 창의인재 양성사업관련 종합관리시스템은 통합아이디 하나로 간편하게 로그인할 수 있도록 단일 로그인 서비스를 시행합니다.<br>
	-공간정보 융복합 핵심인재 종합관리시스템 &nbsp;-공간정보 특성화고등학교 종합관리시스템
	    </div>
	    <div class="login_foot">Copyright ⓒ 2015 NECGIS, All rights Reserved.
	
	    </div>
	</div>
</form>
</body>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javaScript" language="javascript">
	$(function(){
		$("#loginForm").attr({action:"${contextPath}/login/actionLogin.do", target:""});
		$("#loginForm input[name=userSe]").val("GNR");
		
		$("#loginForm input:radio").bind("click", function(){
			$("#loginForm input[name=userSe]").val($(this).val()); ;
		});
		
		$("#login-img").bind("click", function(){
			if($("#loginForm #id").val() == ""){
				 alert("아이디를 입력하세요");
			}else if($("#loginForm #password").val() == ""){				
				alert("비밀번호를 입력하세요");
			} else{
				$("#loginForm").submit();
			}
		});
	});
	
	function join() {
		var $flag = $("#loginForm input[name=userSe]").val();
	    // 일반회원
	    if ($flag == "GNR") {
	    	$("#loginForm").attr({action:"${contextPath}/join/UserSeChoose.do", target:""});
	    	$("#loginForm").submit();
	    // 기업회원
	    } else if ($flag == "ENT") {
	    	$("#loginForm").attr({action:"${contextPath}/join/UserSeChoose.do", target:""});
	    	$("#loginForm").submit();
	    // 업무사용자
	    } else if (userSe == "USR") {

	    }
	}
	
	function findId() {
		$("#loginForm").attr({action:"${contextPath}/login/findId.do", target:""});
		$("#loginForm").submit();
	}
</script>
