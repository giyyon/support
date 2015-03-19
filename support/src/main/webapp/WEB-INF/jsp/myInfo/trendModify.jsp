<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp" %>
<link href="${contextPath}/css/necgis.css" rel="stylesheet" type="text/css" />

        <div class="svisual" style="background-color:#41372e;background-image:url('${contextPath}/img/Visual01.jpg'); background-position:center">
        </div><!--//svisual -->
        
        <div class="tit_wrap">
        	<div class="title area_ct">
            	<img src="${contextPath}/img/tit_myinfo.png" alt="내정보"><span>Myinfo</span>
            	<div class="depth"><a href="#"><img src="${contextPath}/img/ico_home.png" alt="home아이콘"></a><img src="${contextPath}/img/space.png" alt=""><a href="#">고객센터</a><img src="${contextPath}/img/space.png" alt=""><a href="#">내정보</a><img src="${contextPath}/img/space.png" alt=""><a href="#">최신동향정보</a>
            	</div>
            </div>
        </div>
     	<div id="sub_container">
        	<div id="content-group">
        		<div id="lnb-group">
            		<ul id="lnb">
                	<li class="smenu2"><a href="/myInfo/myInfoView.do" >회원정보 관리</a></li>
                    <li class="smenu2"><a href="#">문의∙제안∙신고 관리</a></li>
					<li class="smenu2"><a href="/myInfo/trendList.do"  class="select"">최신동향정보 관리 </a></li>
                    <li class="smenu2"><a href="#">생생현장소식 관리</a></li>
                	</ul>
                    
                    <ul class="quick">
                	<li class="q1"><a href="#" title="사업소개"></a></li>
                    <li class="q2"><a href="#" title="운영메뉴얼"></a></li>
                    <li class="q3"><a href="#" title="운영지침"></a></li>
                    <li class="q4"><a href="#" title="운영서식"></a></li>
               	 	</ul>
            	</div>
            	<!--//lnb-group -->
               
            
            	<div id="contents" class="bg_com">
            		<form:form commandName="result"  id="frm">   
						<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
						<input type="hidden" name="nttId"  value="<c:out value='${result.nttId}'/>" />
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input name="sortType" type="hidden" value="<c:out value='${searchVO.sortType}'/>"/>
						<input name="frstRegisterId" type="hidden" value="<c:out value='${searchVO.frstRegisterId}'/>"/>
						<input name="ntcrId" type="hidden" value="<c:out value='${result.ntcrId}'/>"/>
						<input name="ntcrNm" type="hidden" value="<c:out value='${result.ntcrNm}'/>"/>
						<input name="nttSttusCode" id="nttSttusCode" type="hidden" value="<c:out value='${result.nttSttusCode}'/>"/>
						<input name="bsnsSeShare" id="bsnsSeShare" type="hidden" value="<c:out value='${result.bsnsSeShare}'/>"/>
                	<div class="top"><a href="#"></a></div>
            		<div class="con_tit">최신동향정보 <span>Latest News</span>
                    	<span class="ex">국내외 공간정보산업 관련 동향정보를 소개합니다.</span>
                    </div>
                    
                    <ul class="tap2_wrp mt10">
                    	<li><a href="/myInfo/trendList.do" class="select">내 게시글</a></li>
                        <li><a href="/myInfo/trendScrapList.do">스크랩</a></li>
                    </ul>

                    <div class="view_info_lst">	
                    	<ul class="lst_m">
                            <li class="wrt br"><a href="/myInfo/trendModify.do">글쓰기</a></li>
                            <li class="minfo"><a href="/myInfo/myInfoView.do">내정보</a></li>
                        </ul>
                        
                        <div class="ico_box_lst">
                            <ul class="ico_box">
                            <li class="face"><a href="#" title="페이스북">페이스북</a></li>
                            <li class="twitter"><a href="#" title="트위터">트위터</a></li>
                            <li class="mail"><a href="#" title="메일">메일</a></li>
                            </ul>
                            <ul class="ico_box2">
                            <li class="print"><a href="#" title="프린트">프린트</a></li>
                            <li class="url"><a href="#" title="url">url</a></li>
                            <li class="claim"><a href="#" title="신고하기">신고하기</a></li>
                            </ul>
                        </div>
                    </div>
					
					<div class="wrt_info fll txt12 mt5">
                   서로의 정보를 나누고 소통하는 소중한 공간입니다! 타인에게 피해를 주는 글은 삼가하여 주시기 바랍니다. 
                    </div>

					<div class="bview_box2">
                    	<ul>
                            <li class="full"><strong><span>*정보분류</span></strong>
                            	 <form:select path="trndSe"   title="최신동향정보분류코드">
								    <form:option value="" label="최신동향정보 분류선택 "/>
								    <form:options items="${trendSe_result}" itemValue="code" itemLabel="codeNm"/>
								</form:select>
                            </li>
                            <li class="part"><strong><span>작성자</span></strong><div class="file_bx"><c:out value="${result.frstRegisterNm}" /></div></li>
                            <li class="part"><strong>최초등록일 </span></strong><div class="file_bx"><c:out value="${result.frstRegisterPnttm}" /></div></li>
                        </ul>
                    </div>
                    
                    <div class="mem_info_sect mt0">
                        <div class="mem_box fl100">
                            <ul class="info_put fl100">
                                <li><strong>*제목 </strong><span class="con"><form:input path="nttSj"   class="long"  /></span> </li>
                                <li><strong>*저작권자 </strong>
                                    <span class="con">
                                    <form:input path="cpyrhtEr"   class="w200"  />
                                    </span>
                                </li>
                                <li><strong>*원문URL</strong>
                                    <span class="con">
                                    <form:input path="refrnUrl1"   class="long"  placeholder="http://  를 포함한 전체 URL을 입력바랍니다" /><a href="javascript:eraseURL()"><img src="${contextPath}/img/btn_delete.png" alt="삭제"></a>
                                    </span>
                                </li>
                                <li><strong>대표이미지 </strong>
 										<span class="con">
                                         	<input name="file1_text"  type="text" class="w200">
                                         	<form:hidden path="atchFileId" />
                                 			<img name="btnFileUpload" src="${contextPath}/img/btn_find.png" data_fileMax="1" data_category="trendImg" data_type="img"  alt="찾아보기"   >
                                 			<img name="btnFileDownload" src="${contextPath}/img/btn_down2.png"    data_type="file"   alt="다운로드"> 
                                         <span class="con_inf txt11 fl100 fcYg">*180x120픽셀로 최적화되며, 10M 미만의 파일만 허용됩니다.</span>
                                    </span>
                                </li>
                                <li><strong>요약내용</strong>
                                    <span class="con">
                                        <span class="con_inf txt11 fl100 fcYg">*요약내용은 150자까지 가능합니다.</span>
                                    	<form:textarea path="nttCn"  class="text_w"></form:textarea>
                                     </span>
                                </li>
                                <li><strong>키워드</strong>
                                    <span class="con">
                                    	<form:hidden path="keyword"   />
                                        <input name="keywordPart" type="text" class="w100">&nbsp;
	                                    <input name="keywordPart" type="text" class="w100">&nbsp;
	                                    <input name="keywordPart" type="text" class="w100">&nbsp;
	                                    <input name="keywordPart" type="text" class="w100">&nbsp;
	                                    <input name="keywordPart" type="text" class="w100">                                   
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- //뷰 -->
                    <div class="mbtn_wrap">
                    	<a href="javascript:goPost('02');"><img src="${contextPath}/img/btn_regist.png" alt="등록"></a><a href="javascript:linkListPage()"><img src="${contextPath}/img/btn_cancle.png" alt="취소"></a>
                        <div class="tmp">
                        <a href="javascript:goPost('01');"><img src="${contextPath}/img/btn_tmps.png" alt="임시저장"></a></div>
                    </div>
				</form:form>
            	</div>
            	<!--//contents -->
        	</div>
        	<!--//content-group -->
		</div><!--//sub_container -->

    <script type="text/javascript" charset="utf-8">
    var bsnsSe = "${result.bsnsSe}";
    
	$(function(){
		$("#subForm").attr({action:"${contextPath}/myInfo/trendModify.do", target:""});
		
		var keywordArray = $("input[name=keyword]").val().split('@');
		$("input[name=keywordPart]").each(function(index){
			$(this).val(keywordArray[index+1]);
		});
		
		if($("#bsnsSeShare").val().substring(0,1) == '1')
			$("#bsnsSeShareRangeA").prop('checked',true);
		if($("#bsnsSeShare").val().substring(1,2) == '1')
			$("#bsnsSeShareRangeB").prop('checked',true);
		if($("#bsnsSeShare").val().substring(2,3) == '1')
			$("#bsnsSeShareRangeC").prop('checked',true);
		
		$('#bsnsSeShareRangeAll').on("click", function(e){
			$("input[name=bsnsSeShareRange]").prop('checked',$(this).is(':checked'));
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
	})
	
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
    
    function linkListPage(){
 	   $('#frm').attr('action', '${contextPath}/myInfo/trendList.do'); 
 	   $("#frm").submit();
    }
    
   	function doSync(){
//    		goPost();
    	}
    function doJsonSync(){
// 		 goJsonPost();
 	}    
    
  	function goJsonSave(){      	
      	
		var formData = $("form").serialize ();
		
		
		var params = $("form").serialize();
		BIT.callAjax('${contextPath}/myInfo/insertTrendArticle.do'
				, 'post'
				, params
				, function(responseText){
					return false;
				});
  	}
	
	
   function goPost(nttSttusCode){
	   var validate = isOkAllproperty();
	   if(validate == 'OK'){
		   $('#frm').attr('action', '${contextPath}/myInfo/insertTrendArticle.do'); 
		   $("#nttSttusCode").val(nttSttusCode);
		   
		   var keyword = "";
			$('input[name=keywordPart').each(function(){
				keyword = keyword +'@'+ $(this).val();
			})
			$("input[name=keyword]").val(  keyword );
		   
		   $("#frm").submit();  
	   }else{
		   alert(validate);
	   }
	}
	
	   function isOkAllproperty(){
		   
		   if($('select[name=trndSe] option:selected').val() == '')
			   return '최신동향정보 분류를 선택하시기 바랍니다';
		   return 'OK';
	   }


	</script>
