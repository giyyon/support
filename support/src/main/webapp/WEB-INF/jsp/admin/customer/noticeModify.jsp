<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp" %>

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
                	<li class="smenu2"><a href="/admin/noticeList.do" class="select">공지사항 관리</a></li>
                    <li class="smenu2"><a href="/admin/noticeInsertPage.do">공지사항 글쓰기</a></li>
					<li class="smenu2"><a href="#">온라인도움말 관리</a></li>
                    <li class="smenu2"><a href="#">온라인도움말 글쓰기</a></li>
                    <li class="smenu2"><a href="#">문의∙제안∙신고 관리</a></li>
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
            	<form:form commandName="result"  id="frm">    
	            		<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
						<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
						<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input type="hidden" name="sortType" value="<c:out value='${searchVO.sortType}'/>"/>
						<input name="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>"/>
						<input name="searchWrd" type="hidden" value="<c:out value='${searchVO.searchWrd}'/>"/>
						<input name="nttSttusCode" id="nttSttusCode" type="hidden" value="<c:out value='${result.nttSttusCode}'/>"/>
						<input name="bsnsSeShare" id="bsnsSeShare" type="hidden" value="<c:out value='${result.bsnsSeShare}'/>"/>
						<input type="hidden" name="seq" value="<c:out value='${result.seq}'/>"/>											

					<div class="top"><a href="#"></a></div>
            		<div class="con_tit">공지사항 <span>Notice Administration</span>
                    	<span class="ex">(재)공간정보산업진흥원에서 전하는 공지사항 관리입니다.</span>
                    </div>

					<ul class="tap4_wrp mt10">	                  
	                    <li><a href= "#"  onclick=""    <c:if test="${searchVO.searchBsnsSe == '' }" > class="select"</c:if>>전체공지사항</a></li>
	                    <li><a href= "#"  onclick=""  <c:if test="${searchVO.searchBsnsSe == 'A' }"> class="select"</c:if>>특성화 고등학교</a></li>
	                    <li><a href= "#"  onclick=""  <c:if test="${searchVO.searchBsnsSe == 'B' }"> class="select"</c:if>>특성화 대학원</a></li>
	                    <li><a href= "#"  onclick=" "  <c:if test="${searchVO.searchBsnsSe == 'C' }"> class="select"</c:if>>온라인 교육센터</a></li>    	                    
	                </ul>
	                
									<div class="bview_box mt15">
                    	<ul>
                            <li class="full"><strong><span>사업분류</span></strong>
                            	<span>
                            	<input type="checkbox" name="bsnsSeShareRangeAll" id="bsnsSeShareRangeAll" value="all"> 전체
                                &nbsp;&nbsp;&nbsp;<input type="checkbox" name="bsnsSeShareRange"  id="bsnsSeShareRangeA"  value="A" > 특성화 대학원
                                &nbsp;&nbsp;&nbsp;<input type="checkbox" name="bsnsSeShareRange"  id="bsnsSeShareRangeB"  value="B" > 특성화 고등학교
                                &nbsp;&nbsp;&nbsp;<input type="checkbox" name="bsnsSeShareRange"  id="bsnsSeShareRangeC" value="C" > 온라인 교육센터
                            	</span>
                            </li>
                            <li class="full"><strong><span>정보분류 </span></strong><span>
	                            <form:select path="nttTyCode"   title="게시유형코드">
								    <form:option value="" label="공지사항 분류선택 "/>
								    <form:options items="${nttTyCode_result}" itemValue="code" itemLabel="codeNm"/>
								</form:select>
                            </span></li>
                            <li class="partl"><strong><span>작성자</span></strong><c:out value="${result.frstRegisterNm}" /></li>
                            <li class="partl"><strong>최초등록일 </span></strong><c:out value="${result.frstRegisterPnttm}" /></li>
                			<li class="partl"><strong><span>편집자 </span></strong><c:out value="${result.lastUpdusrNm}" /></li>
                            <li class="partl"><strong>최종수정일 </span></strong><c:out value="${result.lastUpdusrPnttm}" /></li>
                            <li class="full"><strong><span>게시물등록</span></strong><span><a href="javascript:goPost('01');"><img src="${contextPath}/img/btn_wtmps.png" alt="임시등록"></a><a href="javascript:goPost('02');"><img src="${contextPath}/img/btn_wregist.png" alt="등록"></a><a href="javascript:linkListPage()"><img src="${contextPath}/img/btn_wcancle.png" alt="취소"></a></span></li>
                        </ul>
                    </div>
                    
										<div class="mem_info_sect">
                        <div class="mem_box fl100">
                            <ul class="info_put fl100">
                                <li><strong>*제목 </strong><span class="con"><form:input path="nttSj"   class="w400" /></span> </li>
                                <li><strong>첨부파일</strong>
                                    <span class="con">
									<form:hidden path="atchFileId" />
									<input name="file1_text" type="text" class="w400">
									<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="1" data_category="memberAttach"  data_type="file"  alt="찾아보기"   >
                                   	<img name="btnFileDownload" src="${contextPath}/img/btn_down.png"    data_type="file"   alt="다운로드"> 
                                   	<img name="btnImgDelete" src="${contextPath}/img/btn_delete.png" alt="삭제">    
                                    <span class="con_inf txt11 fl100 fcYg">* 10M 미만의 파일만 허용됩니다.</span>
                                    <br>
                                     <c:import url="/files/selectFileInfsAdvence.do" charEncoding="utf-8">
										<c:param name="param_atchFileId" value="${result.atchFileId}" />
									 </c:import>	 
                                    </span>
                                </li>
                                <li><strong>참조사이트</strong>
                                    <span class="con">
                                    	<form:input path="refrnUrl1"   class="w400"  /><br>
                                    	<form:input path="refrnUrl2"   class="w400"  /><br>
                                    	<form:input path="refrnUrl3"   class="w400"  /><br>
                                    	<form:input path="refrnUrl4"   class="w400"  /><br>
                                    	<form:input path="refrnUrl5"   class="w400"  />
                                    </span>
                                </li>
                                <li><strong>내용</strong>
                                        <span class="con">
                                    <form:textarea path="nttCn"  htmlEscape="false" ></form:textarea>
                                    <script>
                                    CKEDITOR.replace(
                                 	'nttCn',
                                 	{
                                 		contenteditable:"false",
                                 		filebrowserImageUploadUrl : '/files/ckEditor/insertImage.do',
                                 		width : '100%', //넓이값
                                 		height : '200'      //높이값
                                 	}
                                    );
                                    </script>  </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    </form:form>
                        
                    <div class="mbtn_wrap">
                    	<a href="javascript:goPost('02');"><img src="${contextPath}/img/btn_regist.png" alt="등록"></a><a href="javascript:linkListPage()"><img src="${contextPath}/img/btn_cancle.png" alt="취소"></a>
                        <div class="tmp">
                        <a href="javascript:goPost('01');"><img src="${contextPath}/img/btn_tmps.png" alt="임시저장"></a></div>
                    </div>
            	</div>
            	<!--//contents -->
        	</div>
        	<!--//content-group -->
		</div><!--//sub_container -->
 
  <script> 
	var bsnsSe = "${result.bsnsSe}";
	
  	$(document).ready(function(){
  		var bsnsSeShare = "${result.bsnsSeShare}";
  		setDefaultBsnsSe();
  		
  		$("form").attr({action:"${contextPath}/admin/noticeInqire.do", target:""});   	
  		
		if($("#bsnsSeShare").val().substring(0,1) == '1')
			$("#bsnsSeShareRangeA").prop('checked',true);
		if($("#bsnsSeShare").val().substring(1,2) == '1')
			$("#bsnsSeShareRangeB").prop('checked',true);
		if($("#bsnsSeShare").val().substring(2,3) == '1')
			$("#bsnsSeShareRangeC").prop('checked',true);
	  	
  	});
    
	$('#bsnsSeShareRangeAll').on("click", function(e){
		if($(this).prop("checked")){
			$("input[name=bsnsSeShareRange]").prop('checked',true);
		}else{
			$("input[name=bsnsSeShareRange]").prop('checked',false);
		}
		setDefaultBsnsSe();
		setBsnsSeShare();
	});
	
	$('input[name=bsnsSeShareRange]').on("change", function(e){
		setDefaultBsnsSe();
		setBsnsSeShare();
	});
	
	function setDefaultBsnsSe(){
		if(bsnsSe == 'A')
			$("#bsnsSeShareRangeA").prop('checked',true);
		else if(bsnsSe == 'B')
			$("#bsnsSeShareRangeB").prop('checked',true);
		else if(bsnsSe == 'C')
			$("#bsnsSeShareRangeC").prop('checked',true);
	}
	
	function setBsnsSeShare(){
		var a = $("#bsnsSeShareRangeA").is(":checked")?'1':'0'  ;
		var b = $("#bsnsSeShareRangeB").is(":checked")?'1':'0'  ;
		var c = $("#bsnsSeShareRangeC").is(":checked")?'1':'0'  ;
		$("#bsnsSeShare").val(a+b+c);		
	}
	
   function linkListPage(){
	   $('#frm').attr('action', '${contextPath}/admin/noticeList.do'); 
	   $("#frm").submit();
   }
   
   function goPost(nttSttusCode){
	   if(isOkAllproperty){
		   $('#frm').attr('action', '${contextPath}/admin/insertNoticeBoardArticle.do'); 
		   $("#nttSttusCode").val(nttSttusCode);
		   $("#frm").submit();  
	   }
	}
   
   function isOkAllproperty(){
	   
   }
   
   function goDelete(){
	   $('#frm').attr('action', '${contextPath}/admin/noticeDeletePage.do'); 
	   $("#frm").submit();
   }
   
 	$(document).ready(function(){
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
	// 						imgUrl =  '<c:url value="/webAttach/thumnails/" />' + files[i].streFileNm;
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
		$fileNmme.val('')
		var basicImg = '<c:url value="/webAttach/thumnails/" />'
		$imgDiv.css
	});

});

	function replaceModalwindow(offset, currPlace) {
		$('.ui-dialog').css('top', offset.top +'px');
		$( 'html, body' ).animate( { scrollTop : currPlace }, 0);
	}

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
	
   	function doSync(){
//		 goJsonSave();
   		goPost('01');
	}

// 	function goJsonSave(){      	
// 	var formData = $("form").serialize ();
// 	var params = $("form").serialize();
// 	BIT.callAjax('${contextPath}/myInfo/jsonUpdateGnrSubMyInfo.do'
// 			, 'post'
// 			, params
// 			, function(responseText){
// 				return false;
// 			});
// 	}

  </script>
    

