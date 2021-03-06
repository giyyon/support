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
                    	<li class="select"><img src="../img/step01_on.png" alt="약관동의"></li>
                        <li><img src="../img/step02.png" alt="2.실명확인"></li>
                        <li><img src="../img/step03.png" alt="3. 회원정보입력"></li>
                        <li class="end"><img src="../img/step04.png" alt="4. 가입완료"></li>
                    </ul>
                    
                    <div class="mem_info fll txt12">
                    회원가입을 원하실 경우, 반드시 아래의 서비스 이용약관, 개인정보 수집 및 이용에 대한 안내를 읽고 동의하여 주시기 바랍니다. 
                    </div>
                    <span class="all_a"><input name="chkAll" id="chkAll" type="checkbox" value="a">이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</span>
                    
                    
                    <!-- 이용약관 -->
                    <div class="agree_sect">
                        <p>이용약관</p>
                        <div class="agreement_bx mb10">
                                        <div class="title">제 1 조 (약관의 목적)</div>
                                        <div class="section"> 본 약관은 (재)공간정보산업진흥원(이하 “진흥원”)이 국토교통부로부터 위탁을 받아 운영하는 공간정보 창의인재 양성사업 종합관리시스템(이하 “서비스”)의 이용과 관련하여 진흥원과 회원과의 권리, 의무 및 책임사항, 서비스 이용의 조건 및 절차를 규정함을 목적으로 합니다. </div>
                                        <div class="title">제 2 조 (용어의 정의)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① 본 약관에서 사용하는 용어의 정의는 아래와 같습니다.
                                                    <ul>
                                                        <li>“회원”이라 함은 서비스에 개인정보를 제공하여 “진흥원”과 이용계약을 체결하고, “진흥원”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.</li>
                                                        <li>“계정(ID)”이라 함은 “회원”의 식별과 서비스 이용을 위하여 “회원”이 선정하고 “진흥원”이 승인하는 문자와 숫자의 조합을 말합니다.</li>
                                                        <li>“비밀번호”라 함은 “회원”이 부여받은 계정과 일치된 “회원”임을 확인하고, “회원”의 권익보호를 위하여 “회원” 스스로 정한 문자와 숫자의 조합을 말합니다. </li>
                                                        <li>“게시물”이라 함은 “회원”이 “서비스”를 이용함에 있어 “서비스 상”에 게시한 글, 사진, 동영상 등의 각종 파일과 링크 등을 말합니다. </li>
                                                        <li>“이용자”라 함은 진흥원과 이용계약을 체결하지 않고 서비스를 이용하는 자를 말합니다. </li>
                                                    </ul>
                                                </li>
                                                <li>② 본 약관에서 정의하지 않은 용어는 서비스별 약관 또는 안내 및 관련법에서 정하는 바에 따르며, 그 외에는 일반 관례에 따릅니다. </li>
                                            </ol>
                                        </div>
                                        <div class="title">제 3 조 (약관의 효력)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① “진흥원”은 본 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 초기화면(전면)에 게시합니다. 다만, 약관의 내용을 회원이 연결화면을 통하여 볼 수 있도록 할 수 있습니다. </li>
                                                <li>② “진흥원”은 개별 서비스에 대해서 별도의 이용약관을 둘 수 있으며, 해당 내용이 본 약관과 상충할 경우에는 개별 서비스 약관이 우선하여 적용됩니다.</li>
                                                <li>③ 특정 조항이 실행 불가능한 경우라도 그 것이 다른 조항에 영향을 미치지는 않습니다.</li>
                                                <li>④ 본 약관 및 개별 서비스 약관에 명시되지 않은 사항에 대해서는 관련법에 의하고, 법에 명시되지 않은 사항에 대하여는 관습에 의합니다.</li>
                                            </ol>
                                        </div>
                                        <div class="title">제 4 조 (약관의 변경)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① “진흥원”은 서비스의 개선과 효율적인 운영을 위해 관련법을 위배하지 않는 범위에서 본 약관을 변경할 수 있습니다. </li>
                                                <li>② “진흥원”은 약관의 변경이 있을 경우 적용일자 및 변경사유를 명시하여 현행 약관과 함께 서비스 홈페이지를 통해 적용일 7일 이전부터 최소한 적용일자 전일까지는 미리 공지하여야합니다. 다만, 회원에게 불리하게 약관 내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지 외에 일정기간 서비스내에 전자우편, 로그인시 동의창 등의 전자적 수단을 이용하여 명확히 통지하도록 합니다. 이 경우 “진흥원”은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 회원이 알기 쉽도록 표시합니다. </li>
                                                <li>③ “진흥원”은 전항에 따라 개정약관을 공지 또는 통지하였음에도 “회원”이 명시적으로 거부의 의사표시를 하지 아니한 경우 “회원”이 개정약관에 동의한 것으로 봅니다. </li>
                                                <li>④ “회원”이 개정약관에 동의하지 않을 경우 “진흥원”은 개정약관을 적용할 수 없으며, 이 경우 “회원”은 이용계약을 해지할 수 있습니다. 다만, 개정 약관의 적용이 불가피할 경우 “진흥원”은 “회원”과의 이용계약을 해지할 수 있습니다. </li>
                                            </ol>
                                        </div>
                                        <div class="title">제 5 조 (이용계약 체결)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① 이용계약은 “회원”이 되고자 하는 자가 약관의 내용에 대하여 동의한다는 의사표시를 한 다음 회원가입 신청을 하고 “진흥원”이 신청에 대해 승낙함으로써 체결됩니다. </li>
                                                <li>② 이용계약의 성립 시기는 “진흥원”이 가입완료를 신청절차 상에서 표시한 시점으로 합니다.</li>
                                                <li>③ “진흥원”은 전문기관을 통해 회원가입 신청자의 실명확인 및 본인인증을 요청할 수 있으며, “진흥원”이 필요하다고 인정하는 경우 별도의 서류 제출을 요청할 수 있습니다.</li>
                                                <li>④ “회원”은 회원가입 신청 또는 변경 시 요구되는 정보를 정확하게 기입하여야하며 다른 사람의 명의를 도용하거나 허위내용을 등록하여서는 안 됩니다.</li>
                                                <li>⑤ 이용자는 회원가입 신청 시 아래 각 호에 해당하는 계정을 신청해서는 안 됩니다.
                                                    <ul>
                                                        <li>반사회적 또는 미풍양속에 어긋나는 계정</li>
                                                        <li>“진흥원”의 운영자로 오인의 우려가 있는 계정</li>
                                                        <li>개인정보 유출의 우려가 있는 계정</li>
                                                    </ul>
                                                </li>
                                                <li>⑥ “진흥원”은 원칙적으로 모든 이용자의 가입신청을 승낙합니다. 다만 아래 각 호에 해당하는 경우 회원가입의 승낙을 유보할 수 있습니다.
                                                    <ul>
                                                        <li>서비스 관련설비에 현실적인 여유가 없는 경우</li>
                                                        <li>서비스 제공에 기술적, 업무적으로 문제가 있다고 판단되는 경우</li>
                                                        <li>회원가입 신청서 제출 이외에 별도의 자료 제출이 요구되는 경우</li>
                                                        <li>기타 “진흥원”이 필요하다고 인정하는 경우</li>
                                                    </ul>
                                                </li>
                                                <li>⑦ “진흥원”은 회원가입 신청자가 아래 각 호에 해당하는 경우 “회원”가입 신청을 거절할 수 있습니다.
                                                    <ul>
                                                        <li>회원가입 신청과 관련한 규정을 준수하지 않은 경우</li>
                                                        <li>제6조제1항에 의하여 강제퇴출로 회원자격을 상실한 적이 있는 경우, 단 “진흥원”의 회원 재가입 승낙을 얻은 경우에는 예외로 함</li>
                                                    </ul>
                                                </li>
                                                <li>⑧ “진흥원”은 회원가입 승낙을 유보하거나 거절한 경우, 이를 그 사유와 함께 회원가입 신청자에게 알립니다. </li>
                                            </ol>
                                        </div>
                                        <div class="title">제 6 조 (이용제한 및 탈퇴)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① 아래 각 호에 해당하는 사유가 발생한 경우에 “진흥원”은 “회원”의 서비스 이용을 제한하거나 이용계약을 해지할 수 있습니다.
                                                    <ul>
                                                        <li>관련법, 본 약관, 모든 개별 서비스 약관의 의무를 위반하거나 정책, 이용안내 및 공지사항 등을 준수하지 않은 경우</li>
                                                        <li>“진흥원”의 임직원이나 관계자를 사칭한 경우</li>
                                                        <li>6개월 이상 계속해서 로그인하지 않는 경우</li>
                                                        <li>“회원” 기본정보가 변경되어 “회원”과 연락이 불가능한 경우</li>
                                                        <li>“진흥원”이 허용하는 접근방식 이외의 다른 방법을 이용하여 접근을 시도하는 행위</li>
                                                        <li>“회원”의 고의 여부와 관계없이 서비스 설비에 과도한 부하를 일으키는 행위</li>
                                                        <li>기타 불법적이거나 부당한 행위를 한 경우</li>
                                                    </ul>
                                                </li>
                                                <li>② “진흥원”은 “회원”이 1항 5호 및 6호에 해당하는 행위를 할 경우에는 1항의 조치와는 별도로 해당 “회원”의 서비스 접속을 차단할 수 있습니다.</li>
                                                <li>③ “회원”의 서비스 이용을 제한하거나 이용계약을 해지할 경우 “진흥원”은 이를 해당 “회원”에게 통지하고, “회원”은 “진흥원”의 통지를 받은 날로부터 30일 이내에 이의신청을 할 수 있습니다. </li>
                                                <li>④ “회원”은 언제든지 서비스를 통해 회원탈퇴를 요청할 수 있으며, “진흥원”은 회원탈퇴 요청이 있을 경우 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.</li>
                                            </ol>
                                        </div>
                                        <div class="title">제 7 조 (계정 및 비밀번호 관리)</div>
                                        <div class="section">
                                            <ol>
                                                <li>①“회원”의 계정과 비밀번호에 관한 모든 관리의 책임은 “회원”에게 있습니다.</li>
                                                <li>②“회원”은 타인에게 본인의 계정과 비밀번호를 알려주어서는 안 되며, 계정 및 비밀번호가 도용되거나 제3자가 사용하고 있음을 발견한 경우 즉시 본인의 비밀번호를 수정하는 등의 조치를 취하고, “진흥원”에 신고하여 안내를 따라야 합니다.</li>
                                                <li>③ 전항의 경우에 해당 “회원”이 “진흥원”에 그 사실을 신고하지 않거나, 신고한 경우에도 “진흥원”의 안내에 따르지 않아 발생한 불이익에 대한 모든 책임은 “회원” 본인에게 있습니다.</li>
                                                <li>④ “회원”은 서비스 이용이 완료되었을 때 확실히 로그아웃을 하여야 하며, 정확히 로그아웃을 하지 않음으로써 발생하는 손해에 대한 책임은 “회원” 본인에게 있습니다.</li>
                                                <li>⑤“진흥원”은 보안 및 계정 정책, 서비스의 원활한 제공 등과 같은 이유로 “회원”의 계정 및 비밀번호 변경을 요구하거나 변경 할 수 있습니다. </li>
                                            </ol>
                                        </div>
                                        <div class="title">제 8 조 (회원정보의 관리 및 보호)</div>
                                        <div class="section">
                                            <ol>
                                                <li>①“회원”은 개인정보의 관리 및 보호를 위하여 개인정보 관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 계정, 실명 등은 수정이 불가능합니다. </li>
                                                <li>② “회원”은 “진흥원”이 관리하는 개인정보에 변경사항이 발생하였을 경우 즉시 개인정보를 수정하여야하며, 개인정보에 대한 변경사항을 수정하지 않아 발생한 불이익에 대한 책임은 “회원” 본인에게 있습니다.</li>
                                                <li>③ “진흥원”은 “회원”의 개인정보를 보호하기 위해 노력하며, 개인정보의 보호 및 이용에 대해서는 관련법 및 “진흥원”의 “개인정보 처리방침”이 적용됩니다. 다만 “진흥원” 공식 사이트 이외의 링크된 사이트에서는 “진흥원”의 “개인정보 처리방침”이 적용되지 않습니다.</li>
                                                <li></li>
                                                <li>④ “회원”은 다른 “회원”의 개인정보 보호를 위해 아래 각 호에 해당하는 행위를 하여서는 안 됩니다.
                                                    <ul>
                                                        <li>다른 “회원”의 계정 및 비밀번호를 도용하여 부당하게 서비스를 이용하는 행위</li>
                                                        <li>다른 “회원”의 개인정보를 동의 없이 수집, 저장, 공개하는 행위</li>
                                                    </ul>
                                                </li>
                                            </ol>
                                        </div>
                                        <div class="title">제 9 조 (서비스의 제공 및 운영)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① “진흥원”은 다음과 같은 업무를 수행합니다.
                                                    <ul>
                                                        <li>공간정보 창의인재 양성사업 종합관리 제반 활동</li>
                                                        <li>국가공간정보에 대한 정보 제공</li>
                                                        <li>“회원”의 “종합관리시스템” 활용을 지원하기 위한 제반 활동</li>
                                                        <li>기타 “진흥원”이 정하는 업무</li>
                                                    </ul>
                                                </li>
                                                <li>② “진흥원”은 계속적이고 안정적인 서비스를 제공하기 위하여 최선을 다하여 노력하며, 이를 위해 유지, 점검, 복구 등의 조치를 성실히 이행 합니다.</li>
                                                <li>③ 서비스 이용시간은 연중무휴 1일 24시간으로 함을 원칙으로 합니다. 다만, 서비스 특성에 따라 서비스를 특정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 이러한 경우에는 그 내용을 사전에 공지합니다. </li>
                                                <li>④ “진흥원”은 “회원”에 대해 “진흥원”의 정책에 따라 “회원”을 등급별로 구분하여 이용시간, 이용횟수, 서비스 기능 등을 세분하여 이용에 차등을 둘 수 있습니다.</li>
                                            </ol>
                                        </div>
                                        <div class="title">제 10 조 (서비스의 중단)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① “진흥원”은 최선의 서비스 운영을 위해 아래 각 호에 해당하는 경우 서비스를 일시 중단할 수 있습니다.
                                                    <ul>
                                                        <li>설비의 점검, 보수 또는 교체로 인하여 부득이한 경우</li>
                                                        <li>서비스를 제공함에 있어 기술적 결함이 발견된 경우</li>
                                                        <li>신규 서비스를 추가하는 경우</li>
                                                        <li>그밖에 “진흥원”의 업무상 또는 기술상 필요한 경우</li>
                                                    </ul>
                                                </li>
                                                <li>② 또한 “진흥원”의 의도와 관계없이 아래와 같은 이유로 서비스가 갑자기 중단될 수도 있으며, 이러한 상황이 발생할 경우 “진흥원”은 신속히 서비스의 재개가 가능하도록 조치하여야 합니다.
                                                    <ul>
                                                        <li>기간통신사업자가 별도의 통지 없이 전기통신 서비스를 중지했을 경우</li>
                                                        <li>서비스 이용의 폭주 또는 설비의 장애 등이 발생한 경우</li>
                                                        <li>국가비상사태, 천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우</li>
                                                    </ul>
                                                </li>
                                                <li>③ “진흥원”은 서비스 중단 계획이 있을 경우 그 사유 및 중지기간 등을 “회원”에게 사전에 공지합니다. 다만, “진흥원”이 사전에 공지할 수 없는 부득이한 사유가 있는 경우 사후에 공지할 수 있습니다. </li>
                                            </ol>
                                        </div>
                                        <div class="title">제 11 조 (서비스의 변경 및 폐지)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① “진흥원”은 운영상, 기술상의 필요에 따라 서비스를 폐지하거나 아래와 같은 내용으로 서비스를 변경할 수 있습니다.
                                                    <ul>
                                                        <li>기능의 추가, 변경 또는 제거</li>
                                                        <li>서비스 이용 제한의 추가 또는 제거</li>
                                                        <li>그 밖의 서비스와 관련한 변경 사항</li>
                                                    </ul>
                                                </li>
                                                <li>② 서비스를 변경 또는 폐지할 경우에는 사유, 내용 및 적용일자 등을 사전에 공지합니다. </li>
                                                <li>③ 제2항에도 불구하고, 서비스에 적용된 소프트웨어에 대한 새로운 버전이나 기능이 제공되는 즉시 소프트웨어가 자동으로 업데이트될 수 있습니다.</li>
                                                <li>④ “진흥원”은 서비스의 일부 또는 전부를 “진흥원”의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 "회원"에게 별도의 보상을 하지 않습니다.</li>
                                            </ol>
                                        </div>
                                        <div class="title">제 12 조 (정보의 제공 및 통지)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① “진흥원”은 “회원”이 서비스 이용 중 필요하다고 인정되는 다양한 정보를 공지사항, 게시판, 전자우편 등의 방법으로 “회원”에게 제공할 수 있습니다. </li>
                                                <li>② “회원”은 전자우편 등 개인적인 매체로 전달되는 정보에 대해서는 언제든지 수신을 거절할 수 있습니다.</li>
                                                <li>③ “진흥원”이 “회원”에 대한 통지를 하는 경우 기본적으로 서비스 내의 공지사항을 이용하며, 특별한 경우 “회원”의 전자우편 등으로 통지할 수 있습니다.</li>
                                            </ol>
                                        </div>
                                        <div class="title">제 13 조 (서비스의 사용)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① “회원”은 서비스를 오용하지 않고 올바르게 이용하여야 하며, 서비스 이용에 있어 아래 각 호에 해당하는 행위를 해서는 안 됩니다.
                                                    <ul>
                                                        <li>“진흥원”의 업무를 방해하는 행위</li>
                                                        <li>서비스의 정상적인 운영을 고의 또는 과실로 방해한 경우</li>
                                                        <li>“진흥원”이 제공하는 소프트웨어 등을 개작하거나 역공학 하는 행위</li>
                                                        <li>“진흥원”의 동의 없이 영리를 목적으로 서비스를 이용하는 행위</li>
                                                        <li>사회적 공익을 저해할 목적으로 서비스를 이용하는 행위</li>
                                                        <li>다른 “회원”의 서비스 이용을 방해하는 행위</li>
                                                        <li>“진흥원” 및 제3자의 명예를 손상시키거나 불이익을 주는 행위</li>
                                                    </ul>
                                                </li>
                                                <li>② “회원”은 이용권한, 기타 이용계약상 지위를 타인과 거래하거나 양도 및 증여 할 수 없으며 이를 담보로 제공할 수 없습니다.</li>
                                                <li>③ “회원”은 서비스 이용과 관련하여 의견이나 불만사항을 제기할 수 있으며, “진흥원”은 이러한 내용이 정당하다고 인정할 경우에는 이를 신속히 처리하여야 합니다. 또한 “진흥원”은 의견이나 불만사항의 처리과정 및 결과를 “회원”에게 통지하여야 합니다.</li>
                                            </ol>
                                        </div>
                                        <div class="title">제 14 조 (게시물의 관리)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① “회원”은 게시물을 정확하고 올바르게 등록하여야 하며, “회원”이 게시한 정보 또는 자료에 대한 신뢰도, 정확성 등에 관한 책임은 “회원” 본인에게 있습니다.</li>
                                                <li>② “회원”의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 해당 “회원”이 부담하여야 합니다.</li>
                                                <li>③ “회원”은 아래 각 호에 해당하는 사항을 게시하여서는 안 되며, 게시물 내용이 아래 각 호에 해당한다고 판단되는 경우에는 사전 통보 없이 게시물 삭제 등을 실시할 수 있습니다.
                                                    <ul>
                                                        <li>국가안전이나 보안에 위배되는 경우</li>
                                                        <li>선거와 관련된 내용 또는 정치적 목적이나 성향이 있는 경우</li>
                                                        <li>특정기관, 단체, 부서를 근거 없이 비난하는 경우</li>
                                                        <li>특정인을 비방하거나 명예훼손의 우려가 있는 경우</li>
                                                        <li>영리목적의 상업적 광고</li>
                                                        <li>저작권을 침해하는 경우</li>
                                                        <li>욕설. 음란물 등 불건전한 내용</li>
                                                        <li>연습, 장난, 오류의 내용</li>
                                                        <li>기타 관련법에 위배된다고 판단되는 경우</li>
                                                    </ul>
                                                </li>
                                            </ol>
                                        </div>
                                        <div class="title">제 15 조 (저작권)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① 서비스에서 사용하는 소프트웨어, 이미지, 마크, 서비스명칭, 정보 등과 관련된 지적재산권 및 기타 권리는 “진흥원”에 있으며, “회원”은 “진흥원”이 정한 이용조건에 따라 서비스 이용권만을 가집니다.</li>
                                                <li>② “회원”은 “진흥원”의 서비스 및 브랜드를 모방하거나 도용하는 행위를 해서는 안됩니다.</li>
                                                <li>③ “회원”이 서비스 내에 게시한 게시물의 저작권은 해당 게시물의 저작자에게 있습니다. 다만, “진흥원”은 서비스 운영에 필요한 범위 내에서 해당 게시물을 편집 또는 가공하여 사용할 수 있습니다.</li>
                                                <li>④ “회원”은 서비스를 이용하여 얻는 정보를 사전 승낙 없이 복사, 복제, 변경, 번역, 출판, 방송, 기타 등의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.</li>
                                                <li>⑤ “회원”은 “진흥원”과 제3자의 저작권 등 지적재산권에 대한 침해 행위를 하여서는 안됩니다.</li>
                                            </ol>
                                        </div>
                                        <div class="title">제 16 조 (손해배상 등)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① “회원”이 제15조의 저작권 관련 의무를 위반함으로써 발생한 손해에 대하여 “진흥원”은 “회원”에게 손해배상을 청구할 수 있습니다.</li>
                                                <li>② “회원”이 본 약관에 규정한 “회원”의 의무를 위반한 경우, “진흥원”은 관련법에 의거하여 “회원”에게 손해배상을 청구할 수 있습니다.</li>
                                            </ol>
                                        </div>
                                        <div class="title">제 17 조 (면책조항)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① “진흥원”은 제10조제2항의 경우와 같이 불가항력의 사유로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.</li>
                                                <li>② “진흥원”은 “회원”간 또는 “회원”과 제3자간에 서비스를 매개로 하여 물품거래 또는 금전적 거래 등을 하였을 경우 이로 인해 발생하는 어떠한 책임도 지지 않습니다.</li>
                                                <li>③ “진흥원”은 “회원”이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 지지 않으며, 무료로 제공되는 서비스와 관련하여 “회원”에게 어떠한 손해가 발생하더라도 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 지지 않습니다.</li>
                                                <li>④ “진흥원”은 “회원”이 게시물이나 댓글 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임을 지지 않습니다.</li>
                                                <li>⑤ “진흥원”은 고의가 아닌 이상 운영상의 문제로 게시물이 삭제되거나, 전송되지 못한 경우에 대해 책임을 지지 않습니다.</li>
                                            </ol>
                                        </div>
                                        <div class="title">제 18 조 (관할법원)</div>
                                        <div class="section">
                                            <ol>
                                                <li>① 서비스 이용과 관련하여 “진흥원”과 “회원” 사이에 분쟁이 발생한 경우, “진흥원”과 “회원”은 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.</li>
                                                <li>② 전항의 규정에도 불구하고 서비스 이용으로 발생한 분쟁에 대하여 소송이 제기될 경우 관할법원은 “진흥원” 소재지를 관할하는 법원으로 합니다. </li>
                                            </ol>
                                        </div>
                                        <div class="title">
                                            <부칙>
                                        </div>
                                        <div class="section">
                                            <ol>
                                                <li>① 본 약관은 2015년 03월 01일부터 시행됩니다.</li>
                                            </ol>
                                        </div>
                        </div><!-- //약관내용 박스 -->
                        <span class="txt11 fcYg"><input name="checks" id="chkA" class="check" type="checkbox" value=""> 위의 개인정보 수집 및 이용에 대한 안내에 동의합니다  </span>                      
                    </div>
                    <!-- //이용약관 -->
                    
                    
                    <!-- 개인정보 수집 및 이용에 대한 안내 -->
                    <div class="agree_sect">
                        <p>개인정보 수집 및 이용에 대한 안내<span class="allview txt11"><a href="#">-개인정보 처리방침 전문 보기</a></span></p>
                        <div class="agreement_bx  mb25"> 
                            <div class="title">수집하는 개인정보의 항목</div>
                            “진흥원”이 개인정보 보호법 제15조에 따라 서비스를 통해 수집하는 개인정보는 다음과 같습니다.<br><br>
                            <div class="section">
                                <ol>
                                    <li>① 서비스 및 정부지원사업의 원활한 운영을 위해 회원가입, 정부사업신청, 전자협약, 성과관리, 심사, 평가, 서비스 이용문의시 개인정보를 수집합니다.
                                        <ul>
                                            <li>개인회원기본정보 : 성명, 아이디, 생일, 성별, 이메일, 휴대폰번호, 별명</li>
                                            <li>개인회원소속정보 : 직업정보, 소속명, 소속연락처, 소속주소</li>
                                            <li>개인회원부가정보 : 영문명, 회원사진, 요약소개, 홈페이지, 블로그, 소셜, 자택전화, 자택주소, 우편물수령지, 경력, 자격수상, 논문 및 저서, 이력서, 포트폴리오, 자기소개</li>
                                            <li>기관·기업회원담당자정보 : 성명, 소속, 부서, 직위, 휴대폰번호, 이메일, 직통전화</li>
                                            <li>기관·기업회원대표자정보 : 성명, 생일</li>
                                        </ul>
                                    </li>
                                    <li>② 서비스 이용과정이나 처리과정에서 검색어, 서비스 이용 기록, 접속 아이피(IP) 정보, 접속 로그(Log), 쿠키(Cookie) 등의 정보들이 생성되어 수집될 수 있습니다.</li>
                                </ol>
                            </div>                                
                    	</div> 
                    <!-- //개인정보 수집 및 이용에 대한 안내 -->
                    
                    <div class="agreement_bx  mb25"> 
                            <div class="title">개인정보의 수집 및 이용목적</div>
                            “진흥원”은 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전 동의를 구할 예정입니다.<br><br>
                            <div class="section">
                                <ol>
                                    <li>① 홈페이지 회원가입 및 관리
                                        <ul>
                                            <li>회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 각종 고지·통지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.</li>
                                        </ul>
                                    </li>
                                    <li>② 민원사무 및 정부지원사업 처리
                                    	<ul>
                                            <li>민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.</li>
                                            <li>신청(지원)기업의 대표자 및 관련자 · 위원 · 전문가 등의 관리, 회원의 신청 · 선정 · 협약 등에 필요한 자격(의무사항 불이행, 참여제한, 참여율 등)여부 확인, 보고 · 사후관리·통계, 전문가 선정을 위한 회원이력확인 등의 목적으로 개인정보를 처리합니다.</li>
                                        </ul>
                                    </li>
                                    <li>③ 서비스 변경사항 고지 및 이벤트 알림
                                    	<ul>
                                            <li>종합관리시스템을 통해 제공되는 서비스 변경사항 또는 이벤트에 대한 소식 전달을 목적으로 이메일, SMS 등의 개인정보를 처리합니다.</li>
                                        </ul>
                                    </li>
                                    <li>④ 신규 서비스 개발 및 제공
                                    	<ul>
                                            <li>신규 서비스 개발 및 개선을 위한 사용자 분석, 이용 통계 분석 등을 목적으로 개인정보를 처리합니다.</li>
                                        </ul>
                                    </li>
                                </ol>
                            </div>                                
                    	</div>
                        
                        <div class="agreement_bx2 mb10"> 
                            <div class="title">개인정보의 보유 및 이용기간</div>
                            <div class="section">
                                <ol>
                                    <li>① “진흥원”은 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유 및 이용기간 내에서 처리하며, 개인정보보호법 등 관련법령에서 정한 보유기간을 준용하고 있습니다.</li>
                                    <li>② “진흥원”은 원칙적으로 보유기간이 경과하였거나 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. </li>
                                </ol>
                            </div>                                
                    	</div>
                         <span class="txt11 fcYg"><input name="checks" id="chkB"  class="check" type="checkbox" value=""> 위의 개인정보 수집 및 이용에 대한 안내에 동의합니다  </span>  
                   
                    
                    
                    <div class="ex_txt">
                    회원님께서는 상기 동의를 거부할 수 있습니다. 다만 동의하지 않을 경우에는 종합관리시스템 이용에 제한이 있음을 알려드립니다.

                    </div>
                    
                    <!-- 버튼영역 -->
                    <form method="post">
                    	<input type="hidden" name="userSe" value="<c:out value="${loginVO.userSe}"/>" >
                    </form>
                    <div class="mbtn_wrap">
                   		<a href="javascript:nextStep();"><img src="../img/btn_nextf.png" alt="다음단계"></a><a href="#"><img src="../img/btn_memcancle.png" alt="가입취소"></a></div>
                    <!-- //버튼영역 -->
				</div>
				<!-- //개인 정보 -->
            	</div>
            	<!--//contents -->
        	</div>
        	<!--//content-group -->
		</div><!--//sub_container -->
    
    <script type="text/javaScript" language="javascript">
    function nextStep(){
    	if( !$("#chkA").prop("checked") ||  !$("#chkB").prop("checked")){
    		alert("이용약관, 개인정보 수집 및 이용에 모두 동의 하시기 바랍니다.");
    	}else{
    		var userSe = $("input[name=userSe]").val();
        	if(userSe == 'GNR')
        		$("form").attr({action:"${contextPath}/join/gnrMberInsertView1.do", target:""});
        	else if(userSe == 'ENT')
        		$("form").attr({action:"${contextPath}/join/entMberInsertView1.do", target:""});
        	$("form").submit();
    	}
    }
    //약관에 모두 동의 기능 부여
	$(function(){
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