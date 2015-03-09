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
                        <li><img src="${contextPath}/img/step02.png" alt="2.실명확인"></li>
                        <li><img src="${contextPath}/img/step03.png" alt="3. 회원정보입력"></li>
                        <li class="end select"><img src="${contextPath}/img/step04_on.png" alt="4. 가입완료"></li>
                    </ul>
                    
                    <div class="sect_tk fcBlue">
                    	<span class="hi"><span class="fcBlue"><c:out value='${sessionScope.joinUserNm}'/> 님</span>의 회원가입을 축하드립니다.</span><br/>
회원님의 가입에 감사드리며, 등록하신 정보는 아래와 같습니다. <br/>
다양한 서비스를 편리하게 이용하기 위해서는 부가정보 입력 및 서비스도움말 확인이 필요합니다.
						
                    </div>
                    <div class="memok_wrap mt40 mb20">
                    	<div class="box fll">
                        	<p class="fw_b alc">아이디<em>/</em><c:out value='${sessionScope.joinUserId}'/></p>
                        </div>
                        <div class="box2">
                        	<p class="fw_b alc">비밀번호<em>/</em>  <c:out value='${fn:substring(sessionScope.joinUserPw, 0, 3)}'/>***</p>
                       	</div>
                    </div>
                    <div class="txt11 tlin20 les3 fcGy2">
                    - (재)공간정보산업진흥원은 창조지식사회의 창의적인 인재수요에 부응할 수 있는 새로운 공간정보 인재양성을 위해 최선을 다하고 있습니다. <br>
- 본 시스템을 통해 효율적 사업관리와 더불어 양질의 콘텐츠가 공유됨으로써 공간정보산업의 핵심적 플랫폼이 될 수 있도록 최선을 다하겠습니다.
                    </div>
                    
                    <div class="sect_goInfo fl100 mt60">
                    	<ul>
                        	<li class="s1">
                            	<dl>
                                <dt><img src="${contextPath}/img/ico_goInfo1.png" alt=""></dt>
                                <dd><p>사업소개</p>
                                공간정보 창의인재 양성사업 중 세부사업에 대한 전반적 정보서비스 제공
                                </dd>
                                </dl>
                            </li>
                            <li class="s2">
                            	<dl>
                                <dt><img src="${contextPath}/img/ico_goInfo2.png" alt=""></dt>
                                <dd><p>양성사업신청</p>
                                공간정보 창의인재 양성사업 참여를 위한 특성화 대학원 신청, 장학생 신청서비스 제공
                                </dd>
                                </dl>
                            </li>
                            <li class="s3">
                            	<dl>
                                <dt><img src="${contextPath}/img/ico_goInfo3.png" alt=""></dt>
                                <dd><p>전문가∙위원등록</p>
                                (재)공간정보산업진흥원 관련사업 연계를 원하는 전문가등록, 위원등록 서비스 제공
                                </dd>
                                </dl>
                            </li>
                            <li class="s4">
                            	<dl>
                                <dt><img src="${contextPath}/img/ico_goInfo4.png" alt=""></dt>
                                <dd><p>소통공간</p>
                                공간정보관련 보도자료, 생생한 현장소식,  Q&A 등의 회원간 정보공유서비스 제공
                                </dd>
                                </dl>
                            </li>
                            <li class="s5">
                            	<dl>
                                <dt><img src="${contextPath}/img/ico_goInfo5.png" alt=""></dt>
                                <dd><p>진흥원 소개</p>
                                (재)공간정보산업진흥원의 현황정보를 비롯한 브이월드, 연구사업 등에 대한 정보서비스 제공
                                </dd>
                                </dl>
                            </li>
                            <li class="s6">
                            	<dl>
                                <dt><img src="${contextPath}/img/ico_goInfo6.png" alt=""></dt>
                                <dd><p>고객센터</p>
                                종합관리시스템의 효율적 활용을 위해 공지사항, 서비스도움말, 문의 등의 고객서비스 제공
                                </dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
					<span class="txt12"><input name="" type="checkbox" value=""  onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://hg.test.com');"> 종합관리시스템을 시작페이지로 설정</span>
                    
                    <!-- 버튼영역 -->
                    <div class="mbtn_wrap">
                   		<a href="/"><img src="${contextPath}/img/btn_home.png" alt="홈"></a><a href="#"><img src="${contextPath}/img/btn_service.png" alt="서비스도움말"></a></div>
                    <!-- //버튼영역 -->
            	</div>
            	<!--//contents -->
        	</div>
        	<!--//content-group -->
		</div><!--//sub_container -->
    </div><!--//container -->
 
    
    <script type="text/javaScript" language="javascript">
	$(function(){
 		$("form").attr({action:"${contextPath}/join/actionLogin.do", target:""});
 		

		$("#chkAll").click(function(){
            var chk = $(this).is(':checked');
            
            if(chk){
            	$(".check").prop('checked', true);
            }else{
            	$(".check").prop('checked', false);
            }            
        });
    });
	</script>