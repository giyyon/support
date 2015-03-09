<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/taglib.jsp" %>

        <div class="svisual" style="background-color:#41372e;background-image:url('../img/Visual01.jpg'); background-position:center">
        </div><!--//svisual -->
        
        <div class="tit_wrap">
        	<div class="title area_ct">
            	<img src="../img/tit_customer.png" alt="고객센터"><span>Customer</span>
            	<div class="depth"><a href="#"><img src="../img/ico_home.png" alt="home아이콘"></a><img src="../img/space.png" alt=""><a href="#">고객센터</a><img src="../img/space.png" alt=""><a href="#">공지사항</a></div>
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
                    
                    <div class="view_info_lst">
                    	
                    	<ul class="lst_m">
                            <li class="minfo"><a href="#">내정보</a></li>
                        </ul>
                        
                        <div class="ico_box_lst">
                            <ul class="ico_box2">
                                <li class="print"><a href="#" title="프린트">프린트</a></li>
                            <li class="url"><a href="#" title="url">url</a></li>
                            <li class="claim"><a href="#" title="신고하기">신고하기</a></li>
                        </ul>
                        </div>
                    </div>
                    <div class="mem_img"><img src="../img/img_mem.png" alt="회원가입이미지"></div>
                    <div class="sect_hi fcBlue">
                    	<span class="hi">공간정보 창의인재 양성사업 종합관리시스템에  <br/>오신 것을 환영합니다.</span><br/>
(재)공간정보산업진흥원은 창조지식사회의 창의적인 인재수요에 부응할 수 있는 새로운 공간정보 인재양성을 위해 최선을 다하고 있습니다. 본 시스템을 통해 효율적 사업관리와 더불어 양질의 콘텐츠가 공유됨으로써 공간정보산업의 핵심적 플랫폼이 되겠습니다.
						<span class="info">
                        회원유형에 따라 가입절차에 차이가 있으므로 원하시는 유형을 선택하여 가입해 주시기 바랍니다. <br/>
회원가입시 기본정보 외의 부가정보를 입력하시면 원활한 업무처리, 회원간 소통 등에 편리합니다.<br/>
• 특성화 고등학교, 특성화 대학원 및 장학생 신청, 과제관리, 보고서관리 등에서 1회 입력으로 편리하게 사용<br/>
• 커뮤니티서비스를 이용하여 공간정보 관련업계에 기관, 기업, 개인을 홍보∙마케팅하는데 활용 가능<br/>
                        </span>
                    </div>
                    <form method="post">
                    	<input type="hidden" name="userSe" value='<c:out value="${loginVO.userSe}"/>' >
                    </form>
                    <div class="memchoice_wrap mt40 mb35">
                    	<div class="box fll">
                        	<p class="fw_b">개인회원</p>
                            <span class="fll"> <input name="is14AgeOver" type="radio" value="" > 14세 이상의 일반인</span>
                            <div class="mem_b tCW bgBu"><a href="javascript:chooseUserSe('GNR');" >개인회원 가입하기</a></div>
                        </div>
                        <div class="box2"><p class="fw_b">기관∙기업회원</p>
                        	<span class="fll"> <input name="" type="radio" value=""> 학교, 법인∙개인사업자, 비영리법인, 단체</span>
                            <div class="mem_b tCW bgBud"><a href="javascript:chooseUserSe('ENT');" >기관∙기업회원 가입하기</a></div>
                        </div>
                    </div>

            	</div>
            	<!--//contents -->
        	</div>
        	<!--//content-group -->
		</div><!--//sub_container -->
        
    <script type="text/javaScript" language="javascript">
   
	$(function(){
 		$("form").attr({action:"${contextPath}/join/SbscrbCnfirmMber.do", target:""});
	});
	
    function chooseUserSe(userSe){
    	$("input[name=userSe]").val(userSe);
    	
    	if(userSe == "GNR"){
    		if($("input[name=is14AgeOver]").is(':checked')){
    			$("form").submit();
    		}else{
    			alert("14세 미만은 회원 가입할 수 없습니다. \n14세 이상인 경우 14세 이상의 일반인을 선택하시기 바랍니다.");
    			return false;
    		}
    			
    	}else if(userSe == "ENT"){
    		$("form").submit();
    	}
    }
	</script>