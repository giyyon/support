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
                   입력된 정보는 가입이 완료되어야만 저장되며, 개인정보 처리방침에 따라 보호되고 있습니다.
                    </div>        
                               
                    <form:form commandName="entrprsManageVO"  id="form">      
                    <input type="hidden" id="applcntNm" name="applcntNm" value="<c:out value='${loginVO.name}'/>">
                    <input type="hidden" id="applcntEmailAdres" name="applcntEmailAdres" value="<c:out value='${loginVO.email}'/>">
                    <input type="hidden" id="reprsntEmailAdres" name="reprsntEmailAdres" value='' ><!-- 대표이메일주소 -->
                    <input type="hidden" id="userSe" name="userSe" value="<c:out value='${loginVO.userSe}'/>">
                     <input type="hidden" id="zip" name="zip" value='' ><!-- 우편번호 -->
                     <input type="hidden" id="bizrno" name="bizrno" value='' ><!-- 사업자등록번호 -->                     
                     <input type="hidden" id="isDoneIDchk" name="isDoneIDchk"  value='N'>
                      <input type="hidden" id="progressStauts" name="progressStauts"  value=''>
                    
                    <!-- 회원기본정보 -->
                    <div class="mem_info_sect">
                        <p>회원기본정보</p>
                        
                        <div class="mem_box fl100">
                        	<ul class="info_put fl100">
                            	<li><strong>기관∙기업명</strong>
                                	<span class="con"><input name="cmpnyNm"  id="cmpnyNm"  type="text" class="w200"><span class="chk2">
                                	                                    <input name="cmpnyNmOthbcAt"  id="cmpnyNmOthbcAt"  type="checkbox" value="Y"> 공개(비공개시 아이디로 대체) </span></span> 
                                </li>
                                <li><strong>사업자등록번호</strong>
                                	<span class="con"><input name="bizrno1" id="bizrno1"  type="text" class="w80"><em>-</em><input id="bizrno2" name="bizrno2"  type="text" class="w80"><em>-</em><input id="bizrno3" name="bizrno3"  type="text" class="w80"><a href="#"><img src="${contextPath}/img/btn_comok.png" alt="기업인증"></a>
                                    <span class="chk2"><form:checkbox path="bizrnoOthbcAt" value="Y" label="공개"/> </span>
                                    </span>
                                </li>
                                <li><strong>* 아이디</strong>
                                    <span class="con"><input id="entrprsmberId" name="entrprsmberId" type="text" class="w200"><a href="javascript:;" id='chkDupleID'><img src="${contextPath}/img/btn_idchk.png" alt="중복확인"></a><label id="resultChkID" ></label> <div id="resultChkID2"></div>
                                    	<span class="con_inf txt11 fl100 fcYg">*4~12자의 영문, 숫자 조합으로 입력하여 주시기 바랍니다.</span>
                                    </span> 
                                </li>
                                <li><strong>* 비밀번호</strong>
                                    <span class="con"><input id="entrprsMberPassword"  name="entrprsMberPassword" type="password" class="w200"></a>
                                    	<span class="con_inf txt11 fl100 fcYg">*9~16자의 영문+숫자+특수문자로 입력하여 주시기 바랍니다.</span>
                                    </span> 
                                </li>
                                <li><strong>* 비밀번호 확인</strong>
                                    <span class="con"><input id="passwordChk" name="passwordChk" type="password" class="w200"></a></span> 
                                </li>
                                <li><strong>* 별명 </strong>
                                	<span class="con">
                                    	<input name="nick" type="text" class="w100"><span class="chk"><input name="nickOthbcAt" type="checkbox" value="Y"> 공개</span><br/>
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
                                    	<span class="chk"><input name="jobOthbcAt" type="checkbox" value="Y"> 공개</span>
                                    </span> 
                                </li>
                                <li><strong>* 대표자명 </strong>
                                	<span class="con"><input name="cxfc" id="cxfc"  type="text" class="w200">
                                    	<span class="chk"><input name="cxfcOthbcAt"  id="cxfcOthbcAt"  type="checkbox" value="Y"> 공개</span>
                                    </span> 
                                </li>
                                <li><strong>* 설립일</strong>
                                	<span class="con">                                	
                                    <select  id ='establishYear' name="establishYear">
                                    	<option value=''> 연도 </option>
	                                    <c:forEach var="result" items="${year_result}" varStatus="status">
	                                    	<option value='<c:out value="${result.code}"/>' ><c:out value="${result.codeNm}"/></option>
	                                    </c:forEach>
                                    </select>    
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
                                    
                                        <span class="chk"><input name="establishOthbcAt"  id="establishOthbcAt" type="checkbox" value="Y"> 공개</span>
                                    </span> 
                                </li>
                                <li><strong>* 대표이메일</strong>
                                	<span class="con">
                                    <input name="reprsntEmailHead" id="reprsntEmailHead" type="text" class="w100" value=""><em>@</em><input name="reprsntEmailTail"  id="reprsntEmailTail"   type="text" class="w100" value="">
                                   
                                    <select  id ='reprsntEmailAdresList'>
                                    	<option value=''>---선택하세요---</option>
	                                    <c:forEach var="result" items="${email_result}" varStatus="status">
	                                    	<option value='<c:out value="${result.codeNm}"/>' ><c:out value="${result.codeNm}"/></option>
	                                    </c:forEach>
                                    </select>                                    
                                    <span class="txt11 fcYg"><input name="reprsntRecvAt"  id="reprsntRecvAt"  type="checkbox" value="Y"> 이메일/SMS수신동의</span>
                                    <span class="chk"><input name="reprsntEmailAdresOthbcAt" id="reprsntEmailAdresOthbcAt"  type="checkbox" value="Y"> 공개</span>
                                    </span>
                                </li>
                                <li><strong>* 대표전화</strong>
                                	<span class="con">
                                    <input name="reprsntAreaNo" type="text" class="w30">
                                    <em>-</em><input name="reprsntEntrprsMiddleTelno" type="text" class="w40"><em>-</em><input name="reprsntEntrprsEndTelno" type="text" class="w40">
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    <span class="chk"><input name="telOthbcAt" type="checkbox" value="Y"> 공개</span>
                                    </span> 
                                </li>
                                <li><strong>* 대표팩스</strong>
                                	<span class="con">
                                   <input name="fxnum" type="text" class="w100">
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    <span class="chk"><input name="fxnumOthbcAt" type="checkbox" value="Y"> 공개</span>
                                    </span> 
                                </li>
                                <li><strong>* 대표주소</strong>
                                	<span class="con">
                                    <input name="zip1" id="zip1"  type="text" class="w40"><em>-</em><input name="zip2" id="zip2" type="text" class="w40"><a href="#"><img src="${contextPath}/img/btn_post.png" alt="우편번호"></a>
                                    <input name="adres" type="text" class="long2"><br/>
                                    <b>상세주소:</b><input name="detailAdres" type="text" class="long">
                                    <span class="chk"><input name="adresOthbcAt" type="checkbox" value="Y"> 공개</span>
                                    </span> 
                                </li>
                                <li><strong>* 사업자등록증</strong>
                                	<span class="con">
                                    <input name="file1_text" type="text" class="w200">
                                    <form:hidden path="atchBizFileId" />
									<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="1" data_category="memberAttach"  data_type="file"  alt="찾아보기"   >
                                   	<img name="btnFileDownload" src="${contextPath}/img/btn_down.png"    data_type="file"   alt="다운로드"> 
                                   	<img name="btnImgDelete" src="${contextPath}/img/btn_delete.png" alt="삭제">    
                                    
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
                                	<span class="con"><c:out value='${loginVO.name}'/><!--  input name="" type="text" class="w100"--> &nbsp;&nbsp;<a href="#"><img src="${contextPath}/img/btn_ipinok.png" alt="아이핀병경"></a>
                                    <span class="stit">&nbsp;&nbsp;<b>직위:</b><input name="ofcpsNm" type="text" class="w100"></span>
                                        <span class="stit">&nbsp;&nbsp;<b>부서:</b><input name="pstinstDeptNm" type="text" class="w100"></span>
                                    </span>
                                </li>
                                <li><strong>* 이메일</strong>
                                	<span class="con">
                                	<input name="applcntEmailHead" id="applcntEmailHead" type="text"  readonly="readonly" class="w100" value="<c:out value='${emailHead}'/>"><em>@</em><input name="applcntEmailTail"  id="applcntEmailTail"   type="text"  readonly="readonly" class="w100" value="<c:out value='${emailTail}'/>">
                                   
<!--                                     <select  id ='applcntEmailAdresList'> -->
<!--                                     	<option value=''>---선택하세요---</option> -->
<%-- 	                                    <c:forEach var="result" items="${email_result}" varStatus="status"> --%>
<%-- 	                                    	<option value='<c:out value="${result.codeNm}"/>' ><c:out value="${result.codeNm}"/></option> --%>
<%-- 	                                    </c:forEach> --%>
<!--                                     </select>     -->
                                    <span class="txt11 fcYg"><input name="reprsntRecvAt" type="checkbox" value="Y"> 이메일/SMS수신동의</span>
                                    </span>
                                </li>
                                <li><strong>* 휴대폰</strong>
                                	<span class="con">
									<input type="text" id="mbtlnum"  name="mbtlnum"  class="w200" readonly="readonly"  value="<c:out value='${loginVO.mbTlNum}'/>">
                                    <span class="con_inf txt11 fl100 fcYg">*긴급상황 발생시 활용할 수 있습니다.</span>
                                    </span> 
                                </li>
                                <li><strong>* 직통전화 </strong>
                                	<span class="con">
                                    <input name="areaNo" type="text" class="w30">
                                    <em>-</em><input name="entrprsMiddleTelno" type="text"  class="w40"><em>-</em><input name="entrprsEndTelno" type="text" class="w40">
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
                   		<a href='javascript:goSave("H");'><img src="${contextPath}/img/btn_info.png" alt="부가정보"></a><a href='javascript:goSave("F");' ><img src="${contextPath}/img/btn_nextf.png" alt="다음단계"></a><a href="#"><img src="${contextPath}/img/btn_cancle.png" alt="취소"></a></div>
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
 		$("form").attr({action:"${contextPath}/join/entMberInsertMain.do", target:""});

 		$("#resultChkID").css("float", "right");
		$("#chkDupleID").click(function(){
			chkDupleID();
        });
		//이메일 도메인 선택
		$( "#reprsntEmailAdresList" ) .change(function () {
		    																					$("#reprsntEmailTail").val(  $( "#reprsntEmailAdresList option:selected" ).val());  
		    																					$('#reprsntEmailAdres').val( $('#reprsntEmailHead').val() +"@"+ $('#reprsntEmailTail').val());
		                                                                                       });
		//이메일 도메인 선택
// 		$( "#applcntEmailAdresList" ) .change(function () {
// 		    																					$("#applcntEmailTail").val(  $( "#applcntEmailAdresList option:selected" ).val());  
// 		                                                                                       });
		//대표이메일 조합
		$('#reprsntEmailHead, #reprsntEmailTail').change(function(){
			$('#reprsntEmailAdres').val( $('#reprsntEmailHead').val() +"@"+ $('#reprsntEmailTail').val());
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
		if(!chkPassword())
			return '비밀번호 확인 값이 다릅니다. 확인 바랍니다.'; 
		if(!chkDupleIDFalg())
			return '아이디 중복 확인 바랍니다.'; 
		if(!chkZip())
			return '우편번호 입력바랍니다'; 
		
		return 'OK';
	}
	
 	function chkPassword(){
 		if( $("#entrprsMberPassword").val() == null  ||  $("#entrprsMberPassword").val() == ''  ||  $("#entrprsMberPassword").val()  != $("#passwordChk").val()) {
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
        if($("#entrprsmberId").val() == ''){
        	alert('id를 입력하시기 바랍니다');
        	return false;
        }
    	$("#resultChkID").html('');  
    	$("#resultChkID").css("display","block");
    	var $body = $('#resultChkID');
		
    	var formData = $("form").serialize ();
        $.ajax({
            url: "${contextPath}/join/chkDuplicationEntId.do",
            type: "post",
            dataType:"json",
			data: "entrprsmberId="+ $("#entrprsmberId").val(),   //             data: { "name" : $("#name").val(),  "email" : $("#email").val(), "mbTlNum" : $("#mbTlNum").val() },
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
  	
	$(document).ready(function(){
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
  	
  	
  	
  	
	</script>