<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../include/taglib.jsp" %>
<%@ include file="../../include/cssJsImport.jsp" %>
<%-- <security:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')"> --%>
<%-- 	<security:authentication property="principal.username" var="check" /> --%>
<%-- </security:authorize> --%>

<security:authorize access="hasAnyRole('ROLE_ADMIN')">
	<security:authentication property="principal.username" var="check" />
</security:authorize>


<!-- <sec:authorize url="/admin/abc.do"> -->
<!-- 이 부분은 지정된 URL에 대한 권한이 있는 경우에 표시됨 -->
<!-- </sec:authorize> -->

    	<div id="gnb_wrap">
   			<div class="gnb area_ct">
            	<ul class="flr">
                	<li><a href="#">홈</a></li>
					<security:authorize access="isAnonymous()">
							 <li><a href="${contextPath}/login/loginUsr.do">로그인</a></li>
							<li><a href="${contextPath}/join/UserSeChoose.do">회원가입</a></li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
							<li><a href="${contextPath}/login/actionLogout.do">logOut</a></li>
							<li><a href="${contextPath}/myInfo/myInfoView.do">내정보</a></li>
					</security:authorize>
                    <li>글자크기 <a href="javascript:zoomOut();"><img src="${contextPath}/img/font_plus.png" alt="글씨크게"></a><a href="javascript:zoomIn();"><img src="${contextPath}/img/font_minus.png" alt="글씨작게"></a><a href="javascript:zoomReset();"><img src="${contextPath}/img/font_stop.png" alt="글씨크게"></a></li>       
            	</ul>
            </div>
   		</div>
      
					<c:choose>
						<c:when test="${empty check}">
					    <!-- 일반 유저용 메뉴 구성-->	
						    <div id="gmp">
					        <div id="snavi_wrap">
					       		<div id="navi_box" class="area_ct">    
					            	<div id="logo">
											<a href="#"><img src="${contextPath}/img/logo.png"></a>
									</div>
					                <!-- navi -->
										<ul id="navi">
											<li id="depth_1" class="nav_w">
												<span class="navi_fir"><a href="#">사업소개</a></span>
												<div class="navi_sec">
													<ul style="margin-left:0;">
														<li><a href="#">사업개요</a></li>
														<li><a href="#">사업추진절차</a></li>
					                                    <li><a href="#">특성화학교현황</a></li>
					                                    <li><a href="#">특성화교과목현황</a></li>
					                                    <li><a href="#">사업보도자료</a></li>
													</ul>
												</div>
											</li>
											<li id="depth_2" class="nav_w">
												<span class="navi_fir"><a href="#">학교공간</a></span>
												<div class="navi_sec" style="margin-left:16%;">
													<ul>
														<li><a href="#">사업신청?관리</a></li>
													</ul>
												</div>
											</li>
											<li id="depth_3" class="nav_w">
												<span class="navi_fir"><a href="#">학생공간</a></span>
												<div class="navi_sec" style="margin-left:32%;">
													<ul>
														<li><a href="#">사업신청?관리</a></li>
													</ul>
												</div>
											</li>
											<li id="depth_4" class="nav_w">
												<span class="navi_fir"><a href="#">소통공간</a></span>
												<div class="navi_sec" style="margin-left:48%;">
													<ul>
														<li><a href="#">최신동향정보</a></li>
														<li><a href="#">생생현장소식</a></li>
													</ul>
												</div>
											</li>
											<li id="depth_5" class="nav_w">
												<span class="navi_fir"><a href="${contextPath}/customer/noticeList.do">고객센터</a></span>
												<div class="navi_sec" style="margin-left:64%;">
													<ul>
														<li><a href="${contextPath}/customer/noticeList.do">공지사항</a></li>
														<li><a href="#">문의?제안?신고</a></li>
					                                    <li><a href="#">서비스정책</a></li>
					                                    <li><a href="/myInfo/myInfoView.do">회원정보</a></li>
													</ul>
												</div>
											</li>
											<li id="depth_6" class="nav_w">
												<span class="navi_fir"><a href="#">진흥원소개</a></span>
												<div class="navi_sec" style="margin-left:80%">
													<ul>
														<li><a href="#">인사말</a></li>
														<li><a href="#">비전 및 목표</a></li>
					                                    <li><a href="#">CI</a></li>
					                                    <li><a href="#">전체사업소개</a></li>
					                                    <li><a href="#">연혁</a></li>
					                                    <li><a href="#">조직도</a></li>
														<li><a href="#">찾아오시는 길</a></li>
													</ul>
					                                
												</div>
											</li>
					                       
										</ul>
										<!-- // navi -->
					            </div><!-- // navi_box -->
					        </div><!-- // navi_wrap -->
					        <div id="snavi_bg">
								<div class="navi_bg_img area_ct"></div>
							</div>
					        
					        <!-- m_menu_wrap -->
									<div id="m_menu_wrap">
										<!-- m_menu -->
										<div class="m_menu">
											<!-- Moblie Menu Open -->
											<div class="m_menu_open">
												<a href="#m_depth_wrap" title="전체보기" target="_self" onclick="active_menu();return false;"><img src="${contextPath}/img/btn_open.png" alt="메뉴"/></a>
											</div>
											<!-- // Moblie Menu Open -->
											<!-- m_depth_wrap -->
											<div id="m_depth_wrap" style="display:none">
												<ul id="m_menu_box" >
													<!-- 사업소개 -->
													<li id="m_menu_link01" class="m_depth01">
														<a href="#m_menu_link01" title="사업소개"><strong>사업소개</strong></a>
														<ul class="m_depth02">
														<li><a href="#">사업개요</a></li>
														<li><a href="#">사업추진절차</a></li>
					                                    <li><a href="#">특성화학교현황</a></li>
					                                    <li><a href="#">특성화교과목현황</a></li>
					                                    <li><a href="#">사업보도자료</a></li>
														</ul>
													</li>
													<!-- // 사업소개 -->
													<!-- 학교공간 -->
													<li id="m_menu_link02" class="m_depth01">
														<a href="#m_menu_link02" title="학교공간"><strong>학교공간</strong></a>
														<ul class="m_depth02">
														<li><a href="#">사업신청?관리</a></li>
														</ul>
													</li>
													<!-- // 학교공간 -->
													<!-- 학생공간 -->
													<li id="m_menu_link03" class="m_depth01">
														<a href="#m_menu_link03" title="학생공간"><strong>학생공간</strong></a>
														<ul class="m_depth02">
														<li><a href="#">사업신청?관리</a></li>
														</ul>
													</li>
													<!-- // 학생공간 -->
													<!-- 소통공간 -->
													<li id="m_menu_link04" class="m_depth01">
														<a href="#m_menu_link04" title="소통공간"><strong>소통공간</strong></a>
														<ul class="m_depth02">
														<li><a href="#">최신동향정보</a></li>
														<li><a href="#">생생현장소식</a></li>
														</ul>
													</li>
													<!-- // 소통공간 -->
													<!-- 고객센터 -->
													<li id="m_menu_link05" class="m_depth01">
														<a href="#m_menu_link05" title="고객센터"><strong>고객센터</strong></a>
														<ul class="m_depth02">
														<li><a href="#">공지사항</a></li>
														<li><a href="#">문의?제안?신고</a></li>
					                                    <li><a href="#">서비스정책</a></li>
					                                    <li><a href="/myInfo/myInfo.do">회원정보</a></li>
														</ul>
													</li>
													<!-- // 고객센터 -->
													<!-- 진흥원소개 -->
													<li id="m_menu_link06" class="m_depth01">
														<a href="#m_menu_link06" title="진흥원소개"><strong>진흥원소개</strong></a>
														<ul class="m_depth02">
														<li><a href="#">인사말</a></li>
														<li><a href="#">비전 및 목표</a></li>
					                                    <li><a href="#">CI</a></li>
					                                    <li><a href="#">전체사업소개</a></li>
					                                    <li><a href="#">연혁</a></li>
					                                    <li><a href="#">조직도</a></li>
														<li><a href="#">찾아오시는 길</a></li>
														</ul>
													</li>
													<!-- // 진흥원소개 -->
					                                <li id="m_menu_link06" class="m_depth01">
														<a href="#m_menu_link06" title="내정보"><strong>내정보</strong></a>
														<ul class="m_depth02">
														<li><a href="#">인사말</a></li>
														</ul>
													</li>
												</ul>
											</div>
											<!-- m_depth_wrap -->
										</div>
										<!-- // m_menu -->
										<!-- all_menu_close -->
										<div id="m_menu_close" style="display:none">
											<a href="#m_menu_close" onclick="active_menu();return false;"><img src="${contextPath}/img/btn_close.png" alt="전체보기 닫기"/></a>
										</div>
										<!-- // all_menu_close -->
									</div>
									<!-- // m_menu_wrap -->
					        </div>
						</c:when>
						
						<c:otherwise>
						<!-- 관리자용 메뉴 구성-->
				        <div id="gmp">
				        <div id="snavi_wrap">
				       		<div id="navi_box" class="area_ct">    
				          	<div id="logo">
											<a href="#"><img src="${contextPath}/img/logo.png"></a>
										</div>
								<!-- navi -->
								<ul id="navi">
									<li id="depth_1" class="nav_w">
										<span class="navi_fir"><a href="#">학교공간</a></span>
										<div class="navi_sec">
											<ul style="margin-left:0;">
												<li><a href="#">사업신청?관리</a></li>
											</ul>
										</div>
									</li>
									<li id="depth_2" class="nav_w">
										<span class="navi_fir"><a href="#">학생공간</a></span>
										<div class="navi_sec" style="margin-left:16%;">
											<ul>
												<li><a href="#">사업신청?관리</a></li>
											</ul>
										</div>
									</li>
									<li id="depth_3" class="nav_w">
										<span class="navi_fir"><a href="#">위원공간</a></span>
										<div class="navi_sec" style="margin-left:32%;">
											<ul>
												<li><a href="#">위원공간-sub menu</a></li>
											</ul>
										</div>
									</li>
									<li id="depth_4" class="nav_w">
										<span class="navi_fir"><a href="#">소통공간</a></span>
										<div class="navi_sec" style="margin-left:48%;">
											<ul>
												<li><a href="#">최신동향정보</a></li>
												<li><a href="#">생생현장소식</a></li>
											</ul>
										</div>
									</li>
									<li id="depth_5" class="nav_w">
										<span class="navi_fir"><a href="${contextPath}/customer/noticeList.do">고객센터</a></span>
										<div class="navi_sec" style="margin-left:64%;">
											<ul>
												<li><a href="${contextPath}/customer/noticeList.do">공지사항</a></li>
												<li><a href="#">문의?제안?신고</a></li>
			                                    <li><a href="#">서비스정책</a></li>
			                                    <li><a href="/myInfo/myInfoView.do">회원정보</a></li>
											</ul>
										</div>
									</li>
									<li id="depth_6" class="nav_w">
										<span class="navi_fir"><a href="#">회원정보</a></span>
										<div class="navi_sec" style="margin-left:80%">
											<ul>
												<li><a href="#">공지사항 관리</a></li>
												<li><a href="#">공지사항 글쓰기</a></li>
			                                    <li><a href="#">온라인도움말 관리</a></li>
			                                    <li><a href="#">온라인도움말글쓰기</a></li>
			                                    <li><a href="#">문의?제안?신고</a></li>
											</ul>
										</div>
									</li>
								</ul>		            
				            
									<!-- // navi -->
				            </div><!-- // navi_box -->
				        </div><!-- // navi_wrap -->
				        <div id="snavi_bg">
							<div class="navi_bg_img area_ct"></div>
						</div>
				        
						</c:otherwise>
					</c:choose>
		<!-- 관리자용 메뉴 구성-->

