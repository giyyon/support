<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp" %>

        <div id="btm_gourl">
            <div class="foot">
                <div id="btm_gourl">
                    <div class="foot">
                        <div class="all_menu"><a href="#">전체메뉴</a></div>
                        <div class="urlgo_wrap">
                        	<ul>
                            	<li><select name="">
                            	    <option>특성화 고등학교 바로가기</option>
                            	    <option>특성화 고등학교 바로가기</option>
                            	    특성화 고등학교 바로가기</select>
                                </li>
                                <li><select name="">
                            	    <option>특성화 대학원 바로가기</option>
                            	    <option>고등학교 바로가기</option>
                            	    고등학교 바로가기</select>
                                </li>
                                <li><select name="">
                            	    <option>관련사이트 바로가기</option>
                            	    <option>고등학교 바로가기</option>
                            	    고등학교 바로가기</select>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="foot_area">
			<div class="foot">
            	<ul class="mark">
                	<!--<li><img src="${contextPath}/img/mark_wa.png" alt="웹접근성마크"></li> -->
                    <li><img src="${contextPath}/img/mark_qr.png" alt="qr코드"></li>
                </ul>
				<div class="logo_f"><img src="${contextPath}/img/footer_logo.png" alt="국토교통부 공간정보산업진흥원 로고"></div>
                <div class="personal"><a href="#">이용약관</a><em>ㅣ</em>개인정보처리방침<em>ㅣ</em>이메일무단수집거부</div>
				<div class="add">(339-012) 세종특별자치구 도움6로 11-6동 국토교통부<br>
				Copyright ⓒ 2015 NECGIS, All rights Reserved.
				</div>
			</div>
		</div>



<script type="text/javascript" src="${contextPath}/js/common.js"></script>
<script type="text/javascript">
$(function() {
	$("#container").addClass("main");

    $('#d-main-visual').mainslider();

//     $('#d-image-banner').bannerslider({
//         targetSelector: 'img.bann'
//     });

//     $('#d-text-banner1, #d-text-banner2, #d-text-banner3').bannerslider({
//         autoSelector: 'button',
//         moveHorizontal: false,
//         moveSync: 'd-text-banner'
//     });
    
//     goNotice();
    var tvalue = $("#titHeight").height();

    //var hvalue = 306 - ($("#titHeight").height() + 33);
    if(tvalue <= 42){
    	$("#focusHeight").removeClass("row2 row3");
    } else if(tvalue >= 43 && tvalue <=84){
    	$("#focusHeight").removeClass("row2 row3");
    	$("#focusHeight").addClass("row2");
    } else if(tvalue >= 85){
    	$("#focusHeight").removeClass("row2 row3");
        $("#focusHeight").addClass("row3");
    }
    $("a.noticeCss").focus(function(){
    	goNotice();
    });
    $("a.pressCss").focus(function(){
    	goPress();
    });

});


</script>
