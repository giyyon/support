package support.Join.web;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import support.common.model.JsonObject;
import support.login.web.LoginController;
import support.util.JSONResponseUtil;
import support.util.SupportUtil;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.ems.service.EgovSndngMailRegistService;
import egovframework.com.cop.ems.service.SndngMailVO;
import egovframework.com.uat.uia.service.EgovLoginService;
import egovframework.com.uss.umt.service.EgovMberManageService;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.bind.annotation.CommandMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 일반회원관련 요청을  비지니스 클래스로 전달하고 처리된결과를  해당   웹 화면으로 전달하는  Controller를 정의한다
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  조재영          최초 생성
 *   2011.8.26	정진오			IncludedInfo annotation 추가
 *
 * </pre>
 */

@Controller
@RequestMapping(value = "/join")
public class JoinMberManageController {

	/** mberManageService */
	@Resource(name = "mberManageService")
	private EgovMberManageService mberManageService;

	/** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** DefaultBeanValidator beanValidator */
	@Autowired
	private DefaultBeanValidator beanValidator;

    /** EgovSndngMailRegistService */
	@Resource(name = "sndngMailRegistService")
    private EgovSndngMailRegistService sndngMailRegistService;
	
	/** EgovLoginService */
	@Resource(name = "loginService")
	private EgovLoginService loginService;
	
	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	
	/**
	 * 일반회원목록을 조회한다. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberManage
	 * @throws Exception
	 */
	@IncludedInfo(name = "일반회원관리", order = 470, gid = 50)
	@RequestMapping(value = "/uss/umt/EgovMberManage.do")
	public String selectMberList(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, ModelMap model) throws Exception {
		/** EgovPropertyService.sample */
		userSearchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		userSearchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(userSearchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(userSearchVO.getPageUnit());
		paginationInfo.setPageSize(userSearchVO.getPageSize());

		userSearchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		userSearchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		userSearchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> mberList = mberManageService.selectMberList(userSearchVO);
		model.addAttribute("resultList", mberList);

		int totCnt = mberManageService.selectMberListTotCnt(userSearchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		//일반회원 상태코드를 코드정보로부터 조회
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM013");
		List<?> mberSttus_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("entrprsMberSttus_result", mberSttus_result);//기업회원상태코드목록

		return "egovframework/com/uss/umt/EgovMberManage";
	}

	
	/**
	 * 일반회원, 기업회원 선정 화면으로 이동한다.
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/UserSeChoose.do")
	public String userSeChoose()
			throws Exception {
		return ".basic_join/userSeChoose";
	}
	
	
	/**
	 * 일반회원등록화면 - 실명확인으로 이동한다.
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/GnrMberInsertView1.do")
	public String gnrMberInsertView1( @ModelAttribute("mberManageVO") MberManageVO mberManageVO, @ModelAttribute("loginVO") LoginVO  loginVO, Model model)
			throws Exception {
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//이메일 목록
		vo.setCodeId("SUP002");
		List<?> email_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("email_result", email_result); //이메일 목록
		return ".basic_join/grnMberInsert1";
	}

	/**
	 * 일반회원등록화면 - 기초 정보 입력으로 이동한다.
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/GnrMberInsertView2.do")
	public String gnrMberInsertView2( 
			@ModelAttribute("mberManageVO") MberManageVO mberManageVO, 
			@ModelAttribute("loginVO") LoginVO  loginVO, 
			@RequestParam(value="phoneHead" ,required = false) String phoneHead,
			@RequestParam(value="phoneMiddle" ,required = false) String phoneMiddle,
			@RequestParam(value="phoneTail" ,required = false) String phoneTail,
			@RequestParam(value="emailHead" ,required = false) String emailHead,
			@RequestParam(value="emailTail" ,required = false) String emailTail,
			Model model)
			throws Exception {
		
		LOGGER.debug("loginVOgetName정보"+loginVO.getName());
		LOGGER.debug("loginVOgetEmail 정보"+loginVO.getEmail());
		LOGGER.debug("loginVOgetMbTlNum 정보"+loginVO.getMbTlNum());
		LOGGER.debug("loginVOgetBizRno 정보"+loginVO.getBizRno());
		LOGGER.debug("loginVOgetuserSe 정보"+loginVO.getUserSe());
		
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//이메일 목록
		vo.setCodeId("SUP002");
		List<?> email_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("email_result", email_result); 
		
		//직업 분야 목록
		vo.setCodeId("SUP003");
		List<?> jobArea_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("jobArea_result", jobArea_result); 

		//업종 목록
		vo.setCodeId("SUP004");
		List<?> jobType_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("jobType_result", jobType_result); 

		//직종목록
		vo.setCodeId("SUP005");
		List<?> jobClass_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("jobClass_result", jobClass_result); 
		
		model.addAttribute("phoneHead", emailHead);
		model.addAttribute("phoneMiddle", phoneMiddle);
		model.addAttribute("phoneTail", phoneTail);
		model.addAttribute("emailHead", emailHead);
		model.addAttribute("emailTail", emailTail);
			
		return ".basic_join/grnMberInsert2";
	}
	
	/**
	 * 일반회원등록화면-부가 정보으로 이동한다.
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/GnrMberInsertView3.do")
	public String gnrMberInsertView3( @ModelAttribute("mberManageVO") MberManageVO mberManageVO, @ModelAttribute("loginVO") LoginVO  loginVO, Model model)
			throws Exception {
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//이메일 목록
		vo.setCodeId("SUP002");
		List<?> email_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("email_result", email_result); //이메일 목록
		return ".basic_join/grnMberInsert3";
	}
	
	/**
	 * 일반회원등록화면-최종 저장 .
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/GnrMberInsert.do")
	public String gnrMberInsert( @ModelAttribute("mberManageVO") MberManageVO mberManageVO, @ModelAttribute("loginVO") LoginVO  loginVO, Model model)
			throws Exception {
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		
		//가입상태 초기화 A:요청, P:승인 D:삭제
		mberManageVO.setMberSttus("P");
		//그룹정보 초기화
		//mberManageVO.setGroupId("1");
		//일반회원가입신청 등록시 일반회원등록기능을 사용하여 등록한다.
		mberManageService.insertMber(mberManageVO);
		return ".basic_join/grnMberInsert4";
		
	}
	
	/**
	 * email 인증 발송1.
	 * @param vo - 아이디, 이름, 이메일주소, 비밀번호 힌트, 비밀번호 정답, 사용자구분이 담긴 LoginVO
	 * @return result - 임시비밀번호전송결과
	 * @exception Exception
	 */

	@RequestMapping(value = "/SendVerifyEmailNumber1.do")
	public ResponseEntity<String>  sendVerifyEmailNumber(
		
		@ModelAttribute LoginVO  loginVO, HttpSession session, HttpServletRequest request, Model model) throws Exception {

		LOGGER.debug("loginVOgetName정보"+loginVO.getName());
		LOGGER.debug("loginVOgetEmail 정보"+loginVO.getEmail());
		LOGGER.debug("loginVOgetMbTlNum 정보"+loginVO.getMbTlNum());
		LOGGER.debug("loginVOgetBizRno 정보"+loginVO.getBizRno());
		LOGGER.debug("loginVOgetuserSe 정보"+loginVO.getUserSe());
			
		// 1. 유사 아이디 찾기	
		List<LoginVO> listVO = loginService.searchId(loginVO);
		boolean sendMailresult = false;
		boolean isSimilarUser = false;
		
		if(listVO.size() == 0){
			// 1. email 인증 번호 생성
			String verifyEmailNumber = new SupportUtil().gererateVerifyEmailNumber();		
			
	    	// 2. 임시 비밀번호를 이메일 발송한다.(메일연동솔루션 활용)
	    	SndngMailVO sndngMailVO = new SndngMailVO();
	    	sndngMailVO.setDsptchPerson("webmaster");
	    	sndngMailVO.setRecptnPerson(loginVO.getEmail());
	    	sndngMailVO.setSj("[공간정보융복합] 회원 가입 인증번호 발송");
	    	sndngMailVO.setEmailCn("고객님의 회원 가입 위한 인증번호는 " + verifyEmailNumber + " 입니다. 10분간만 유요한 인증번호입니다.");
	    	sndngMailVO.setAtchFileId("");
	    	
	    	sendMailresult = sndngMailRegistService.insertSndngMail(sndngMailVO);	
	    	
	    	//3. 유효 시간을 비교하기 위해 10분내 입력한 경우에 한해 인증 번호 유효성 부여
	        //  long diffSec = (toDay.getTimeInMillis() - yDay.getTimeInMillis()) / 1000;       //초
	    	Calendar toDay = Calendar.getInstance();
	    	long verifyStampTime = toDay.getTimeInMillis();
	    	
	    	session.setAttribute("sendVerifyStampTime",verifyStampTime);
	    	session.setAttribute("sendVerifyEmailNumber",verifyEmailNumber);
		}else{
			isSimilarUser = true;
		}

		JsonObject jo = new JsonObject();
		// 2. 결과 리턴
		//직접 raw 데이터를 입력해서 JSON형태로 출력하는 방법.
		HashMap<String, Object> total  = new HashMap<String, Object>();
		HashMap<String, Object> data  = new HashMap<String, Object>();

		if(isSimilarUser){	
			total.put("IsSucceed", Boolean.FALSE);
			total.put("ErrorCode",  "ErrorSimilar");
			total.put("Data", listVO);	
		}else{
			if(sendMailresult){	
				total.put("IsSucceed", Boolean.TRUE);
				total.put("Message",  "회원 가입 인증번호를 발송했습니다. 해당 메일 계정으로 인증 번호 확인 후 인증번호 입력 바랍니다.");				
			}else{
				total.put("IsSucceed", Boolean.FALSE);
				total.put("ErrorCode",  "ErrorSendMail");
				total.put("Message",  "["+loginVO.getEmail() + "]메일 발송 생성에 실패했습니다. 관리자에게 문의 바랍니다.");	
			}
		}
//		return "jsonView";
//		return model;
		return JSONResponseUtil.getJSONResponse(total);
	}
	
	/**
	 * email 인증 발송1.
	 * @param vo - 아이디, 이름, 이메일주소, 비밀번호 힌트, 비밀번호 정답, 사용자구분이 담긴 LoginVO
	 * @return result - 임시비밀번호전송결과
	 * @exception Exception
	 */

	@RequestMapping(value = "/SendVerifyEmailNumber2.do")
	public ResponseEntity<String>  sendVerifyEmailNumber2(
		@RequestParam String verifyEmailNumber, HttpSession session, HttpServletRequest request, Model model) throws Exception {

		LOGGER.debug("verifyEmailNumber정보"+verifyEmailNumber);
		//3. 유효 시간을 비교하기 위해 10분내 입력한 경우에 한해 인증 번호 유효성 부여
        //  long diffSec = (toDay.getTimeInMillis() - yDay.getTimeInMillis()) / 1000;       //초
    	Calendar toDay = Calendar.getInstance();
    	long stampTime = toDay.getTimeInMillis();
    	
    	long sendVerifyStampTime = ((Number) session.getAttribute("sendVerifyStampTime")).longValue();
    	long diffSec = (stampTime - sendVerifyStampTime) / 1000;
    	String sendVerifyEmailNumber = session.getAttribute("sendVerifyEmailNumber").toString();
    	
    	LOGGER.debug("현 시간 : "+stampTime);
    	LOGGER.debug("발송된 시간 : "+sendVerifyStampTime);
    	
    	LOGGER.debug("차이 시간 초 : "+diffSec);
    	
    	LOGGER.debug("현 verifyEmailNumber : "+verifyEmailNumber);
    	LOGGER.debug("발송된 sendVerifyEmailNumber : "+sendVerifyEmailNumber);
    	
		

		// 2. 결과 리턴
		//직접 raw 데이터를 입력해서 JSON형태로 출력하는 방법.
		HashMap<String, Object> total  = new HashMap<String, Object>();
		HashMap<String, Object> data  = new HashMap<String, Object>();
		
    	if(sendVerifyEmailNumber.equals(verifyEmailNumber)){
    		if(diffSec < 600 ){
    			//성공
				total.put("IsSucceed", Boolean.TRUE);
    		}else{
    			//시간초과
    			total.put("IsSucceed", Boolean.FALSE);
				total.put("ErrorCode",  "ErrorTime");
				total.put("Message",  "시간이 초과 되어 인증 번호가 무효 되었습니다. 다시 진행하시기 바랍니다.");	
    		}
    	}else{
    		//인증키값 다름
			total.put("IsSucceed", Boolean.FALSE);
			total.put("ErrorCode",  "ErrorWrongNumber");
			total.put("Message",  "잘못된 인증 번호["+verifyEmailNumber+"]입니다. 다시 입력하시기 바랍니다.");	
   	}
		return JSONResponseUtil.getJSONResponse(total);
	}
	
	/**
	 * id 중복 검사
	 * @param vo - 아이디, 이름, 이메일주소, 비밀번호 힌트, 비밀번호 정답, 사용자구분이 담긴 LoginVO
	 * @return result - 임시비밀번호전송결과
	 * @exception Exception
	 */

	@RequestMapping(value = "/chkDuplicationId.do")
	public ResponseEntity<String>  chkDuplicationId(
			@ModelAttribute("mberManageVO") MberManageVO mberManageVO) throws Exception {

		LOGGER.debug("getMberId정보 : "+mberManageVO.getMberId());

		MberManageVO oldMberManageVO = mberManageService.selectMberById(mberManageVO.getMberId());
		
    
		// 2. 결과 리턴
		//직접 raw 데이터를 입력해서 JSON형태로 출력하는 방법.
		HashMap<String, Object> total  = new HashMap<String, Object>();
		HashMap<String, Object> data  = new HashMap<String, Object>();
		
    	if(oldMberManageVO != null ){
    		//중복된 사용자 있음
    			total.put("IsSucceed", Boolean.FALSE);
				total.put("Message",  "해당 ID로 존재합니다.");	
    	}else{
    		//중복된 사용자 있음
			total.put("IsSucceed", Boolean.TRUE);
			total.put("Message",  " 사용 가능한  ID입니다");	
    	
    	}
		return JSONResponseUtil.getJSONResponse(total);
	}
	
	/**
	 * 일반회원등록처리후 목록화면으로 이동한다.
	 * @param mberManageVO 일반회원등록정보
	 * @param bindingResult 입력값검증용 bindingResult
	 * @param model 화면모델
	 * @return forward:/uss/umt/EgovMberManage.do
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovMberInsert.do")
	public String insertMber(@ModelAttribute("entrprsManageVO") MberManageVO mberManageVO, BindingResult bindingResult, Model model) throws Exception {

		beanValidator.validate(mberManageVO, bindingResult);
		if (bindingResult.hasErrors()) {
			return "egovframework/com/uss/umt/EgovMberInsert";
		} else {
			if (mberManageVO.getGroupId().equals("")) {
				mberManageVO.setGroupId(null);
			}
			mberManageService.insertMber(mberManageVO);
			//Exception 없이 진행시 등록 성공메시지
			model.addAttribute("resultMsg", "success.common.insert");
		}
		return "forward:/uss/umt/EgovMberManage.do";
	}

	/**
	 * 일반회원정보 수정을 위해 일반회원정보를 상세조회한다.
	 * @param mberId 상세조회대상 일반회원아이디
	 * @param userSearchVO 검색조건
	 * @param model 화면모델
	 * @return uss/umt/EgovMberSelectUpdt
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovMberSelectUpdtView.do")
	public String updateMberView(@RequestParam("selectedId") String mberId, @ModelAttribute("searchVO") UserDefaultVO userSearchVO, Model model) throws Exception {

		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//패스워드힌트목록을 코드정보로부터 조회
		vo.setCodeId("COM022");
		List<?> passwordHint_result = cmmUseService.selectCmmCodeDetail(vo);

		//성별구분코드를 코드정보로부터 조회
		vo.setCodeId("COM014");
		List<?> sexdstnCode_result = cmmUseService.selectCmmCodeDetail(vo);

		//사용자상태코드를 코드정보로부터 조회
		vo.setCodeId("COM013");
		List<?> mberSttus_result = cmmUseService.selectCmmCodeDetail(vo);

		//그룹정보를 조회 - GROUP_ID정보
		vo.setTableNm("COMTNORGNZTINFO");
		List<?> groupId_result = cmmUseService.selectGroupIdDetail(vo);

		model.addAttribute("passwordHint_result", passwordHint_result); //패스워트힌트목록
		model.addAttribute("sexdstnCode_result", sexdstnCode_result); //성별구분코드목록
		model.addAttribute("mberSttus_result", mberSttus_result); //사용자상태코드목록
		model.addAttribute("groupId_result", groupId_result); //그룹정보 목록

		MberManageVO mberManageVO = mberManageService.selectMber(mberId);
		model.addAttribute("mberManageVO", mberManageVO);
		model.addAttribute("userSearchVO", userSearchVO);

		return "egovframework/com/uss/umt/EgovMberSelectUpdt";
	}

	/**
	 * 일반회원정보 수정후 목록조회 화면으로 이동한다.
	 * @param mberManageVO 일반회원수정정보
	 * @param bindingResult 입력값검증용 bindingResult
	 * @param model 화면모델
	 * @return forward:/uss/umt/EgovMberManage.do
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovMberSelectUpdt.do")
	public String updateMber(@ModelAttribute("mberManageVO") MberManageVO mberManageVO, BindingResult bindingResult, Model model) throws Exception {

		beanValidator.validate(mberManageVO, bindingResult);
		if (bindingResult.hasErrors()) {
			return "egovframework/com/uss/umt/EgovEntrprsMberSelectUpdt";
		} else {
			if (mberManageVO.getGroupId().equals("")) {
				mberManageVO.setGroupId(null);
			}
			mberManageService.updateMber(mberManageVO);
			//Exception 없이 진행시 수정성공메시지
			model.addAttribute("resultMsg", "success.common.update");
			return "forward:/uss/umt/EgovMberManage.do";
		}
	}

	/**
	 * 일반회원정보삭제후 목록조회 화면으로 이동한다.
	 * @param checkedIdForDel 삭제대상 아이디 정보
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return forward:/uss/umt/EgovMberManage.do
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovMberDelete.do")
	public String deleteMber(@RequestParam("checkedIdForDel") String checkedIdForDel, @ModelAttribute("searchVO") UserDefaultVO userSearchVO, Model model) throws Exception {
		mberManageService.deleteMber(checkedIdForDel);
		//Exception 없이 진행시 삭제성공메시지
		model.addAttribute("resultMsg", "success.common.delete");
		return "forward:/uss/umt/EgovMberManage.do";
	}

	// 탈퇴 처리 기능에 대한 예시
	@RequestMapping("/uss/umt/EgovMberWithdraw.do")
	public String withdrawMber(Model model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		String returnPage = "/"; // 탈퇴 처리 후 화면 지정

		if (!isAuthenticated) {
			model.addAttribute("resultMsg", "fail.common.delete");

			return "redirect:" + returnPage;
		}

		mberManageService.deleteMber(user.getUniqId());
		//Exception 없이 진행시 삭제성공메시지
		model.addAttribute("resultMsg", "success.common.delete");

		return "redirect:" + returnPage;
	}

	/**
	 * 일반회원가입신청 등록화면으로 이동한다.
	 * @param userSearchVO 검색조건
	 * @param mberManageVO 일반회원가입신청정보
	 * @param commandMap 파라메터전달용 commandMap
	 * @param model 화면모델
	 * @return uss/umt/EgovMberSbscrb
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovMberSbscrbView.do")
	public String sbscrbMberView(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, @ModelAttribute("mberManageVO") MberManageVO mberManageVO,
			@CommandMap Map<String, Object> commandMap, Model model) throws Exception {
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//패스워드힌트목록을 코드정보로부터 조회
		vo.setCodeId("COM022");
		List<?> passwordHint_result = cmmUseService.selectCmmCodeDetail(vo);
		//성별구분코드를 코드정보로부터 조회
		vo.setCodeId("COM014");
		List<?> sexdstnCode_result = cmmUseService.selectCmmCodeDetail(vo);

		model.addAttribute("passwordHint_result", passwordHint_result); //패스워트힌트목록
		model.addAttribute("sexdstnCode_result", sexdstnCode_result); //성별구분코드목록
		if (!"".equals((String) commandMap.get("realname"))) {
			model.addAttribute("mberNm", (String) commandMap.get("realname")); //실명인증된 이름 - 주민번호 인증
			model.addAttribute("ihidnum", (String) commandMap.get("ihidnum")); //실명인증된 주민등록번호 - 주민번호 인증
		}
		if (!"".equals((String) commandMap.get("realName"))) {
			model.addAttribute("mberNm", (String) commandMap.get("realName")); //실명인증된 이름 - ipin인증
		}

		//mberManageVO.setGroupId("DEFAULT");
		mberManageVO.setMberSttus("DEFAULT");

		return "egovframework/com/uss/umt/EgovMberSbscrb";
	}

	/**
	 * 일반회원가입신청등록처리후로그인화면으로 이동한다.
	 * @param mberManageVO 일반회원가입신청정보
	 * @return forward:/uat/uia/egovLoginUsr.do
	 * @throws Exception
	 */
	@RequestMapping("/sbscrbMber.do")
	public String sbscrbMber(@ModelAttribute("mberManageVO") MberManageVO mberManageVO) throws Exception {

		//가입상태 초기화 A:요청, P:승인 D:삭제
		mberManageVO.setMberSttus("P");
		//그룹정보 초기화
		//mberManageVO.setGroupId("1");
		//일반회원가입신청 등록시 일반회원등록기능을 사용하여 등록한다.
		mberManageService.insertMber(mberManageVO);
		return "forward:/login/egovLoginUsr.do";
	}

	/**
	 * 일반회원 약관확인
	 * @param model 화면모델
	 * @return StplatCnfirmMber
	 * @throws Exception
	 */
	@RequestMapping("/SbscrbCnfirmMber.do")
	public String sbscrbCnfirmMber(@ModelAttribute("loginVO") LoginVO loginVO, Model model, HttpSession session, HttpServletRequest request) throws Exception {
//		//일반회원용 약관 아이디 설정
//		String stplatId = "STPLAT_0000000000001";
//		//회원가입유형 설정-일반회원
//		String sbscrbTy = "USR01";
//		//약관정보 조회
//		List<?> stplatList = mberManageService.selectStplat(stplatId);
//		model.addAttribute("stplatList", stplatList); //약관정보 포함
//		model.addAttribute("sbscrbTy", sbscrbTy); //회원가입유형 포함
		
		

		return ".basic_join/sbscrbCnfirm";
	}

	/**
	 * @param model 화면모델
	 * @param commandMap 파라메터전달용 commandMap
	 * @param userSearchVO 검색조건
	 * @param mberManageVO 일반회원수정정보(비밀번호)
	 * @return uss/umt/EgovMberPasswordUpdt
	 * @throws Exception
	 */
	@RequestMapping(value = "/uss/umt/EgovMberPasswordUpdt.do")
	public String updatePassword(ModelMap model, @CommandMap Map<String, Object> commandMap, @ModelAttribute("searchVO") UserDefaultVO userSearchVO,
			@ModelAttribute("mberManageVO") MberManageVO mberManageVO) throws Exception {
		String oldPassword = (String) commandMap.get("oldPassword");
		String newPassword = (String) commandMap.get("newPassword");
		String newPassword2 = (String) commandMap.get("newPassword2");
		String uniqId = (String) commandMap.get("uniqId");

		boolean isCorrectPassword = false;
		MberManageVO resultVO = new MberManageVO();
		mberManageVO.setPassword(newPassword);
		mberManageVO.setOldPassword(oldPassword);
		mberManageVO.setUniqId(uniqId);

		String resultMsg = "";
		resultVO = mberManageService.selectPassword(mberManageVO);
		//패스워드 암호화
		String encryptPass = EgovFileScrty.encryptPassword(oldPassword);
		if (encryptPass.equals(resultVO.getPassword())) {
			if (newPassword.equals(newPassword2)) {
				isCorrectPassword = true;
			} else {
				isCorrectPassword = false;
				resultMsg = "fail.user.passwordUpdate2";
			}
		} else {
			isCorrectPassword = false;
			resultMsg = "fail.user.passwordUpdate1";
		}

		if (isCorrectPassword) {
			mberManageVO.setPassword(EgovFileScrty.encryptPassword(newPassword));
			mberManageService.updatePassword(mberManageVO);
			model.addAttribute("mberManageVO", mberManageVO);
			resultMsg = "success.common.update";
		} else {
			model.addAttribute("mberManageVO", mberManageVO);
		}
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("resultMsg", resultMsg);

		return "egovframework/com/uss/umt/EgovMberPasswordUpdt";
	}

	/**
	 * 일반회원 암호 수정 화면 이동
	 * @param model 화면모델
	 * @param commandMap 파라메터전달용 commandMap
	 * @param userSearchVO 검색조건
	 * @param mberManageVO 일반회원수정정보(비밀번호)
	 * @return uss/umt/EgovMberPasswordUpdt
	 * @throws Exception
	 */
	@RequestMapping(value = "/uss/umt/EgovMberPasswordUpdtView.do")
	public String updatePasswordView(ModelMap model, @CommandMap Map<String, Object> commandMap, @ModelAttribute("searchVO") UserDefaultVO userSearchVO,
			@ModelAttribute("mberManageVO") MberManageVO mberManageVO) throws Exception {
		String userTyForPassword = (String) commandMap.get("userTyForPassword");
		mberManageVO.setUserTy(userTyForPassword);

		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("mberManageVO", mberManageVO);
		
		return "egovframework/com/uss/umt/EgovMberPasswordUpdt";
	}

}