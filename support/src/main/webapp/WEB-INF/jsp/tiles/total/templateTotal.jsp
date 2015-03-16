<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>  
<html lang="ko">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />   
	    <meta charset="utf-8" />
	    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
	
	    <!-- SEO -->
	    <title>공간정보 융복합 핵심인재 양성사업 종합관리시스템</title>
	</head>
	<body>
	<div class="wrap">
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		<div id="container">
			<!-- tiles:insertAttribute name="menu" /-->
			<tiles:insertAttribute name="body" />
		</div>
		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>	
	<div class="mng"><div class="cont">
	</body>
</html>