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
                	<li><a href="${contextPath}/customer/noticeList.do">공지사항</a></li>
					<li><a href="#">뉴스레터</a></li>
					<li><a href="#">문의∙제안∙신고</a></li>
                    <li><a href="#">온라인도움말</a></li>
					<li><a href="/customer/terms.do" class="select">서비스정책</a></li>
					<li><a href="/myInfo/myInfoView.do">회원정보</a></li>
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
                	<div class="top"><a href="#"></a></div>
            		<div class="con_tit">서비스정책 <span>Notice</span>
                    	<span class="ex">(재)공간정보산업진흥원에서 전하는 공지사항입니다.</span>
                    </div>
                    
                    <ul class="tap3_wrp mt10">
                    	<li><a href="/customer/terms.do" >회원이용약관</a></li>
                        <li><a href="/customer/privateInfoPolicy.do" class="select">개인정보 처리방침</a></li>
                        <li><a href="/customer/emailInfoPolicy.do">이메일주소 무단수집거부</a></li>
                    </ul>
                    
					<div class="view_info_lst">
                        <div class="ico_box_lst">
                            <ul class="ico_box2">
                            <li class="print"><a href="#" title="프린트">프린트</a></li>
                            <li class="url"><a href="#" title="url">url</a></li>
                            <li class="claim"><a href="#" title="신고하기">신고하기</a></li>
                            </ul>
                        </div>
                    </div>
                    
					<div class="policy_index">
                        <ul>
                        <li><a href="#a1" class="chapter_tit2">제 1 조 (개인정보의 처리 목적)</a></li>
                        <li><a href="#a2" class="chapter_tit2">제 2 조 (개인정보의 수집)</a></li>
                        <li><a href="#a3" class="chapter_tit2">제 3 조 (개인정보의 보유 및 이용기간)</a></li>
                        <li><a href="#a4" class="chapter_tit2">제 4 조 (동의 거부권리 및 동의 거부에 따른 불이익)</a></li>
                        <li><a href="#a5" class="chapter_tit2">제 5 조 (쿠키의 운용)</a></li>
                        <li><a href="#a6" class="chapter_tit2">제 6 조 (개인정보의 제3자 제공)</a></li>
                        <li><a href="#a7" class="chapter_tit2">제 7 조 (개인정보처리 위탁)</a></li>
                        <li><a href="#a8" class="chapter_tit2">제 8 조 (정보주체의 권리, 의무 및 그 행사방법)</a></li>
                        <li><a href="#a9" class="chapter_tit2">제 9 조 (개인정보의 파기)</a></li>
                        <li><a href="#a10" class="chapter_tit2">제 10 조 (개인정보의 안전성 확보 조치)</a></li>
                        <li><a href="#a11" class="chapter_tit2">제 11 조 (개인정보 보호책임자)</a></li>
                        <li><a href="#a12" class="chapter_tit2">제 12 조 (개인정보 처리방침 변경)</a></li>
                        <li><a href="#a13" class="chapter_tit2">시행</a></li>
                        </ul>
                    </div>
                    <!--//policy_index -->
                    <div class="policy_content">
                    
                    	<div class="title"><a id="a1">제 1 조 (개인정보의 처리 목적)</a></div>
                                        <div class="section">
                                        <span class="in">“진흥원”은 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전 동의를 구할 예정입니다.</span>
                                        	<ol>
                                                <li class="num1">홈페이지 회원가입 및 관리
                                                    <ul>
                                                        <li class="dash">회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 각종 고지·통지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.</li>
                                                    </ul>
                                                </li>
                                                <li class="num2">민원사무 및 정부지원사업 처리
                                                    <ul>
                                                        <li class="dash">민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.</li>
                                                        <li class="dash">신청(지원)기업의 대표자 및 관련자 · 위원 · 전문가 등의 관리, 회원의 신청 · 선정 · 협약 등에 필요한 자격(의무사항 불이행, 참여제한, 참여율 등)여부 확인, 보고 · 사후관리·통계, 전문가 선정을 위한 회원이력확인 등의 목적으로 개인정보를 처리합니다.</li>
                                                    </ul>
                                                </li>
                                                <li class="num3">서비스 변경사항 고지 및 이벤트 알림
                                                    <ul>
                                                        <li class="dash">종합관리시스템을 통해 제공되는 서비스 변경사항 또는 이벤트에 대한 소식 전달을 목적으로 이메일, SMS 등의 개인정보를 처리합니다.</li>
                                                    </ul>
                                                </li>
                                                <li class="num4">신규 서비스 개발 및 제공
                                                    <ul>
                                                        <li class="dash">신규 서비스 개발 및 개선을 위한 사용자 분석, 이용 통계 분석 등을 목적으로 개인정보를 처리합니다.</li>
                                                    </ul>
                                                </li>
                                            </ol>
										</div>
                                        <div class="title"><a id="a2">제 2 조 (개인정보의 수집)</a></div>
                                        <div class="section">
                                        <span class="in">“진흥원”이 개인정보 보호법 제15조에 따라 서비스를 통해 수집하는 개인정보는 다음과 같습니다.</span>
                                            <ol>
                                                <li class="num1">서비스 및 정부지원사업의 원활한 운영을 위해 회원가입, 정부사업신청, 전자협약, 성과관리, 심사, 평가, 서비스 이용문의시 개인정보를 수집합니다.
                                                    <ul>
                                                        <li class="dash">개인회원기본정보 : 성명, 아이디, 생일, 성별, 이메일, 휴대폰번호, 별명</li>
                                                        <li class="dash">개인회원소속정보 : 직업정보, 소속명, 소속연락처, 소속주소</li>
                                                        <li class="dash">개인회원부가정보 : 영문명, 회원사진, 요약소개, 홈페이지, 블로그, 소셜, 자택전화, 자택주소, 우편물수령지, 경력, 자격수상, 논문 및 저서, 이력서, 포트폴리오, 자기소개</li>
                                                        <li class="dash">기관·기업회원담당자정보 : 성명, 소속, 부서, 직위, 휴대폰번호, 이메일, 직통전화</li>
                                                        <li class="dash">기관·기업회원대표자정보 : 성명, 생일</li>
                                                    </ul>
                                                </li>
                                                <li class="num2">서비스 이용과정이나 처리과정에서 검색어, 서비스 이용 기록, 접속 아이피(IP) 정보, 접속 로그(Log), 쿠키(Cookie) 등의 정보들이 생성되어 수집될 수 있습니다.
                                                </li>
                                            </ol>
                                        </div>
                                        <div class="title"><a id="a3">제 3 조 (개인정보의 보유 및 이용기간)</a></div>
                                        <div class="section">
                                            <ol>
                                                <li class="num1"> “진흥원”은 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유 및 이용기간 내에서 처리하며, 개인정보보호법 등 관련법령에서 정한 보유기간을 준용하고 있습니다. </li>
                                                <li class="num2"> “진흥원”은 원칙적으로 보유기간이 경과하였거나 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. </li>
                                            </ol>
                                        </div>
                                        <div class="title"><a id="a4">제 4 조 (동의 거부권리 및 동의 거부에 따른 불이익)</a></div>
                                        <div class="section">
                                            <ol>
                                                <li class="num1"> 개인정보보호법 제15조(개인정보의 수집·이용 동의)에 의거하여 개인정보 수집 동의를 거부할 권리는 있으나, 동의 거부시 회원가입 및 일부 서비스를 제공받지 못하실 수 있습니다.</li>
                                            </ol>
                                        </div>
                                        <div class="title"><a id="a5">제 5 조 (쿠키의 운용)</a></div>
                                        <div class="section">
                                            <ol>
                                                <li class="num1"> “진흥원”은 회원 및 이용자 정보를 수시로 저장하고 불러오는 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 서비스를 운영하는데 이용되는 서버가 회원 및 이용자의 브라우저에 보내는 아주 작은 텍스트 파일로서 회원 및 이용자의 컴퓨터 하드디스크에 저장됩니다. “진흥원” 다음과 같은 목적을 위해 쿠키를 사용합니다.
													<ul>
                                                        <li>회원 및 이용자들이 구성한 서비스화면 상태를 저장하여 화면이 초기화 되는 것을 방지합니다.</li>
                                                        <li>개인에 따른 맞춤 서비스를 제공할 수 있습니다.</li>
                                                        <li>그 밖의 회원 및 이용자 환경설정을 유지합니다.</li>
                                                    </ul>
												</li>
                                                <li class="num2"> 회원 및 이용자는 쿠키의 저장 여부에 대한 선택권을 가지고 있으며, 웹브라우저에서 옵션을 설정함으로써 모든 쿠키의 저장을 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수 있습니다. 아래는 인터넷 익스플로러의 경우 쿠키 처리를 설정하는 방법입니다.
                                                	<ul>
                                                        <li>웹 브라우저 상단의 도구 메뉴 > 인터넷 옵션 메뉴 선택</li>
                                                        <li>화면의 개인정보 탭 > 고급 버튼 선택</li>
                                                        <li>쿠키 처리 설정</li>
                                                    </ul>
												</li>
                                                <li class="num3"> 쿠키 저장을 거부하였을 경우 서비스가 제대로 작동하지 않을 수 있어, 회원 및 이용자의 서비스 사용에 문제가 있을 수 있습니다..</li>
                                                </ol>
                                        </div>
                                        <div class="title"><a id="a6">제 6 조 (개인정보의 제3자 제공)</a></div>
                                        <div class="section">
                                        	<span class="in">“진흥원”은 원칙적으로 정보주체의 개인정보를 수집·이용 목적으로 명시한 범위 내에서 처리하며, 아래의 경우를 제외하고는 정보주체의 사전 동의 없이는 본래의 목적 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다.
</span>
                                            <ol>
                                                <li class="num1">정보주체로부터 별도의 동의를 받은 경우</li>
                                                <li class="num2">법률에 특별한 규정이 있는 경우</li>
                                                <li class="num3"> 정보주체 또는 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우</li>
                                                <li class="num4"> 통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정 개인을 알아 볼 수 없는 형태로 개인정보를 제공하는 경우</li>
                                                <li class="num5">개인정보를 목적 외의 용도로 이용하거나 이를 제3자에게 제공하지 아니하며 다른 법률에서 정하는 소관 업무를 수행할 수 없는 경우로서 보호위원회의 심의·의결을 거친 경우
 </li>
                                                <li class="num6"> 조약, 그 밖의 국제협정의 이행을 위하여 외국정보 또는 국제기구에 제공하기 위하여 필요한 경우
</li>
                                                <li class="num7"> 범죄의 수사와 공소의 제기 및 유지를 위하여 필요한 경우
</li>
                                                <li class="num8"> 법원의 재판업무 수행을 위하여 필요한 경우
</li>
                                                <li class="num9"> 형 및 감호, 보호처분의 집행을 위하여 필요한 경우
</li>
                                            </ol>
                                        </div>
                                        <div class="title"><a id="a7">제 7 조 (개인정보처리 위탁)</a></div>
                                        <div class="section">
                                            <ol>
                                                <li class="num1">“진흥원”은 서비스의 원활한 운영을 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
                                                	<ul>
                                                        <li>위탁처리 기관
                                                            <ul>
                                                            <li class="dash">위탁기관명　: (재)공간정보산업진흥원</li>
                                                            <li class="dash">주소 : 경기도 성남시 분당구 판교로 244(삼평동 688-1), 엠텍IT타워 801호</li>
                                                            <li class="dash">전화 : 070-4492-0913</li>
                                                            <li class="dash">근무시간 : 09:00 - 18:00</li>
                                                            </ul>
                                                        </li>
                                                        <li>위탁처리 수행업체
                                                        	<ul>
                                                        	<li class="dash">수탁업체명 : 랜트주식회사</li>
                                                            <li class="dash">주소 : 경기도 고양시 일산동구 무궁화로 20-38, 경기벤처빌딩 고양센터 521-B호</li>
                                                            <li class="dash">전화 : 031-932-3122</li>
                                                            <li class="dash">근무시간 : 09:00 - 18:00</li>
                                                            </ul>
                                                        </li>
                                                        <li>위탁내용
                                                        	<ul>
                                                            <li class="dash">시스템 운영 및 유지보수 업무 수행에 따른 개인정보 취급에 관한 기술적 조치 이행</li>
															</ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="num2">“진흥원”은 위탁계약 체결시 개인정보 보호법 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적?관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리?감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</li>
                                                <li class="num3"> 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체 없이 본 “개인정보 처리방침”을 통하여 공개합니다.</li>
                                            </ol>
                                        </div>
                                        <div class="title"><a id="a8">제 8 조 (정보주체의 권리, 의무 및 그 행사방법)</a></div>
                                        <div class="section">
                                        	<span class="in">“진흥원”에서 운영하는 서비스 회원 및 이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.</span>
                                            <ol>
                                                <li class="num1">정보주체는 “진흥원”에 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
                                                	<ul>
                                                        <li>개인정보 열람요구</li>
                                                        <li>오류 등이 있을 경우 정정 요구</li>
                                                        <li>삭제요구</li>
                                                        <li>처리정지 요구</li>
                                                    </ul>
                                                </li>
                                                <li class="num2"> 제1항에 따른 권리 행사는 “진흥원”에 대해 개인정보 보호법 시행규칙 별지 제8호 서식에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며, “진흥원”과 “수탁업체”는 이에 대해 지체 없이 조치하겠습니다.</li>
                                                <li class="num3"> 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 “진흥원”과 “수탁업체”는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.</li>
                                                <li></li>
                                                <li class="num4"> 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하여야 합니다.</li>
                                            </ol>
                                        </div>
                                        <div class="title"><a id="a9">제 9 조 (개인정보의 파기)</a></div>
                                        <div class="section">
                                            <ol>
                                                <li class="num1"> “진흥원”은 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체 없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.
                                                    <ul>
                                                        <li>파기절차
                                                        	<ul>
                                                        	<li class="dash">회원 및 이용자가 입력한 정보는 목적 달성 후 즉시 파기됩니다.</li>
                                                            </ul>
                                                        </li>
                                                        <li>파기기한
                                                        	<ul>
                                                        	<li class="dash">회원 및 이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.</li>
                                                            </ul>
                                                        </li>
                                                        <li>파기방법
                                                        	<ul>
                                                        	<li class="dash">전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.
</li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ol>
                                        </div>
                                        <div class="title"><a id="a10">제 10 조 (개인정보의 안전성 확보 조치)</a></div>
                                        <div class="section">
                                            <ol>
                                                <li class="num1"> “진흥원”은 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
                                                    <ul>
                                                        <li>개인정보 취급 직원의 최소화 및 교육
                                                        	<ul>
                                                        	<li class="dash">개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.</li>
                                                            </ul>
                                                        </li>
                                                        <li>내부관리계획의 수립 및 시행
                                                        	<ul>
                                                        	<li class="dash">개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.</li>
                                                            </ul>
                                                        </li>
                                                        <li>개인정보의 암호화
                                                        	<ul>
                                                        	<li class="dash">회원 및 이용자의 개인정보중 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</li>
                                                            </ul>
                                                        </li>
                                                        <li>해킹 등에 대비한 기술적 대책
                                                        	<ul>
                                                        	<li class="dash">해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.</li>
                                                            </ul>
                                                        </li>
                                                        <li>개인정보에 대한 접근 제한
                                                        	<ul>
                                                        	<li class="dash">개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통하여 개인정보에 대한 접근통제를 위하여 필요 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</li>
                                                            </ul>
                                                        </li>
                                                        <li>비인가자에 대한 출입 통제
                                                        	<ul>
                                                        	<li class="dash">개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.</li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ol>
                                        </div>
                                        <div class="title"><a id="a11">제 11 조 (개인정보 보호책임자)</a></div>
                                        <div class="section">
                                            <ol>
                                                <li class="num1">“진흥원”은 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
                                                    <ul>
                                                        <li>개인정보 보호책임자 : 김태현</li>
                                                        <li>개인정보 보호담당자 : 김교민
                                                        	<ul>
                                                        	<li class="dash">연락처 : 070-4492-0921 </li>
                                                            <li class="dash">이메일 : km.kim@spaceN.or.kr</li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="num2"> 정보주체는 “진흥원”의 서비스를 이용하면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. “진흥원”은 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</li>
                                            </ol>
                                        </div>
                                        <div class="title"><a id="a12">제 12 조 (개인정보 처리방침 변경)</a></div>
                                        <div class="section">
                                            <ol>
                                                <li class="num1"> 이 “개인정보 처리방침”은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지합니다. 다만, 개인정보의 수집 및 활용, 제3자 제공 등과 같이 이용자 권리의 중요한 변경이 있을 경우에는 최소 30일 전에 고지합니다.</li>
                                            </ol>
                                        </div>
                                        <div class="title"><a id="a13">시행</a></div>
                                        <div class="section">
                                            <ol>
                                                <li class="num1"> 본 방침은 2015년 03월 01일부터 시행됩니다.</li>
                                            </ol>
                                        </div>



            	</div>
            	<!--//contents -->
        	</div>
        	<!--//content-group -->
		</div><!--//sub_container -->

