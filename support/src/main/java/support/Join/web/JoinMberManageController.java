package support.Join.web;

import java.util.ArrayList;
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
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import support.common.model.JsonObject;
import support.login.web.LoginController;
import support.util.JSONResponseUtil;
import support.util.SupportUtil;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.ems.service.EgovSndngMailRegistService;
import egovframework.com.cop.ems.service.SndngMailVO;
import egovframework.com.sec.rgm.service.AuthorGroup;
import egovframework.com.sec.rgm.service.EgovAuthorGroupService;
import egovframework.com.uat.uia.service.EgovLoginService;
import egovframework.com.uss.umt.service.EgovMberManageService;
import egovframework.com.uss.umt.service.MberManageAwardVO;
import egovframework.com.uss.umt.service.MberManageCareerVO;
import egovframework.com.uss.umt.service.MberManageDegreeVO;
import egovframework.com.uss.umt.service.MberManagePaperVO;
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
//@SessionAttributes("mberManageVO")
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
	
    @Resource(name = "egovAuthorGroupService")
    private EgovAuthorGroupService egovAuthorGroupService;
    
	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

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
	@RequestMapping("/gnrMberInsertView1.do")
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
	@RequestMapping("/gnrMberInsertView2.do")
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
		LOGGER.debug("loginVOgetBizRno 정보"+loginVO.getBizrno());
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
		
				
		//년도목록
		vo.setCodeId("SUP901");
		List<?> year_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("year_result", year_result); 
		//월목록
		vo.setCodeId("SUP900");
		List<?> month_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("month_result", month_result); 
		//일목록
		vo.setCodeId("SUP902");
		List<?> day_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("day_result", day_result); 
		
		
		model.addAttribute("phoneHead", emailHead);
		model.addAttribute("phoneMiddle", phoneMiddle);
		model.addAttribute("phoneTail", phoneTail);
		model.addAttribute("emailHead", emailHead);
		model.addAttribute("emailTail", emailTail);
			
		return ".basic_join/grnMberInsert2";
	}
	
	/**
	 * 일반회원등록화면-부가 정보.  이 화면은 사용자가 직접 오지 못하고 insertMain을 거친 redirect Url이다. 세션에서 사용자 정보를 꺼내와 세팅이 필요하다
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/gnrMberInsertView3.do")
	public String gnrMberInsertView3( HttpServletRequest  request, Model model)
			throws Exception {
		
		MberManageVO mberManageVO = (MberManageVO)request.getSession().getAttribute("mberManageVO");
		model.addAttribute("mberManageVO", mberManageVO);
		
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		
		//수료상태 목록
		vo.setCodeId("SUP006");
		List<?> complete_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("complete_result", complete_result); 
		
		//경력상태 목록
		vo.setCodeId("SUP007");
		List<?> work_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("work_result", work_result); 

		//자격상태 목록
		vo.setCodeId("SUP008");
		List<?> award_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("award_result", award_result); 

		//논문목록
		vo.setCodeId("SUP009");
		List<?> paper_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("paper_result", paper_result); 
		
		//년도목록
		vo.setCodeId("SUP901");
		List<?> year_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("year_result", year_result); 
		//월목록
		vo.setCodeId("SUP900");
		List<?> month_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("month_result", month_result); 
		
		return ".basic_join/grnMberInsert3";
	}
	
	
	/**
	 * 일반회원등록화면- 완료된 페이지로 이동한다.
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/gnrMberInsertView4.do")
	public String gnrMberInsertView4( HttpServletRequest request, Model model)
			throws Exception {

		MberManageVO mberManageVO = (MberManageVO)request.getSession().getAttribute("mberManageVO");
		model.addAttribute("mberManageVO", mberManageVO);
		return ".basic_join/grnMberInsert4";
	}
	
	@RequestMapping("/test.do")
//	@RequestMapping("gnrMberInsertSub.do")
	public String test( HttpServletRequest request, Model model)
			throws Exception {


		return "redirect:/join/GnrMberInsertView3.do";
	}
	
	
	
	/**
	 * 일반회원등록화면-최종 저장 .
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return F : .basic_join/grnMberInsert4, H : .basic_join/grnMberInsert3
	 * @throws Exception
	 */
	@RequestMapping("/gnrMberInsertMain.do")
	public String gnrMberInsertMain( @ModelAttribute("mberManageVO") MberManageVO mberManageVO, 
					                                                @ModelAttribute("loginVO") LoginVO  loginVO, 
					                                                @RequestParam("progressStauts") String progressStauts,
//					                                                SessionStatus status,
					                                                HttpServletRequest request,
					                                                Model model)
			throws Exception {
			ComDefaultCodeVO vo = new ComDefaultCodeVO();
			
			mberManageVO.setOldPassword(mberManageVO.getPassword());
			//가입상태 초기화 A:요청, P:승인 D:삭제
			mberManageVO.setMberSttus("P");
			//그룹정보 초기화
			//mberManageVO.setGroupId("1");
			//일반회원가입신청 등록시 일반회원등록기능을 사용하여 등록한다.
			mberManageService.insertMber(mberManageVO);
			
			//권한 부여
			MberManageVO afterMberManageVO = mberManageService.selectMberById(mberManageVO.getMberId());
			AuthorGroup authorGroup = new AuthorGroup();
			authorGroup.setUniqId(afterMberManageVO.getUniqId());
			authorGroup.setAuthorCode("ROLE_USER");
			authorGroup.setMberTyCode("USR01");
			
			egovAuthorGroupService.insertAuthorGroup(authorGroup);
        
//		LOGGER.debug("회원 가입 후 자동 로그인 처리 프로세스 진행....");
//
//		HttpSession session = request.getSession();
//		
//		session.setAttribute("isRequstForAfterJoin", "true");
//		session.setAttribute("id", mberManageVO.getMberId());
//		session.setAttribute("password", mberManageVO.getOldPassword());
//		session.setAttribute("userSe", loginVO.getUserSe());
//             
//        session.setAttribute("reDirectUrl", "/join/GnrMberInsertView4.do");
//        
//        return "redirect:" + "/login/actionLogin.do";
        
			HttpSession sesseion = request.getSession();
			sesseion.setAttribute("mberManageVO", afterMberManageVO);
			
			sesseion.setAttribute("joinUserNm", mberManageVO.getMberNm());
			sesseion.setAttribute("joinUserId", mberManageVO.getMberId());
			sesseion.setAttribute("joinUserPw", mberManageVO.getOldPassword());
			
        String target = "";
        if("F".equals(progressStauts)){
//        	status.setComplete();
        	return  ".basic_join/grnMberInsert4";
    			
        }else if("H".equals(progressStauts)){
//        	model.addAttribute("redirectUrl", "/join/GnrMberInsertView3.do");
//            target = "redirectUrl";
			return "redirect:/join/gnrMberInsertView3.do";
        }
		return "";
	}
	
	/**
	 * 일반회원등록화면-  부가정보 저장 .
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return .basic_join/grnMberInsert4
	 * @throws Exception
	 */
	@RequestMapping("/gnrMberInsertSub.do")
	public String gnrMberInsertSub( 
			                                                       @ModelAttribute("mberManageVO") MberManageVO mberManageVO, 
					                                                @ModelAttribute("loginVO") LoginVO  loginVO, 
					                                                
					                                                @RequestParam(value="compltCd", required=false) List<String> compltCd,
					                                                @RequestParam(value="enterYear", required=false) List<String> enterYear,
					                                                @RequestParam(value="enterMonth", required=false) List<String> enterMonth,
					                                                @RequestParam(value="grdYear", required=false) List<String> grdYear,
					                                                @RequestParam(value="grdMonth", required=false) List<String> grdMonth,					                                                
					                                                @RequestParam(value="school", required=false) List<String> school,
					                                                @RequestParam(value="major", required=false) List<String> major,
					                                                
					                                                @RequestParam(value="careerCd", required=false) List<String> careerCd,
					                                                @RequestParam(value="joinEnterYear", required=false) List<String> joinEnterYear,
					                                                @RequestParam(value="joinEnterMonth", required=false) List<String> joinEnterMonth,
					                                                @RequestParam(value="outYear", required=false) List<String> outYear,					                                                
					                                                @RequestParam(value="outMonth", required=false) List<String> outMonth,
					                                                @RequestParam(value="commpany", required=false) List<String> commpany,
					                                                @RequestParam(value="position", required=false) List<String> position,
					                                                @RequestParam(value="task", required=false) List<String> task,
					                                                
					                                                @RequestParam(value="awardCd", required=false) List<String> awardCd,					                                                
					                                                @RequestParam(value="awardYear", required=false) List<String> awardYear,
					                                                @RequestParam(value="awardNm", required=false) List<String> awardNm,
					                                                @RequestParam(value="awardOrg", required=false) List<String> awardOrg,
					                                                
					                                                @RequestParam(value="paperCd", required=false) List<String> paperCd,
					                                                @RequestParam(value="paperYear", required=false) List<String> paperYear,
					                                                @RequestParam(value="paperMonth", required=false) List<String> paperMonth,
					                                                @RequestParam(value="paperNm", required=false) List<String> paperNm,
					                                                @RequestParam(value="paperOrg", required=false) List<String> paperOrg,					                                                
					                                                
//					                                                SessionStatus status,
					                                                HttpServletRequest request,
					                                                Model model)
			throws Exception {

		//일반회원가입신청 등록시 부가 정보만을 등록한다.
		
		//수상기록
		List<MberManageAwardVO> mberManageAwardVOList = new ArrayList<MberManageAwardVO>();
		if(compltCd == null || compltCd.size() == 0 ){

		}else{
			LOGGER.debug("수상기록 갯수"+compltCd.size());
			MberManageAwardVO mberManageAwardVO = new MberManageAwardVO();
			for(int i =  0 ;  i < compltCd.size() ; i++){
				mberManageAwardVO.setMberId(mberManageVO.getMberId());
				mberManageAwardVO.setAwardCd( (String)compltCd.get(i) );
				mberManageAwardVO.setAwardSn(i+"");
				mberManageAwardVO.setAwardYear((String)awardYear.get(i) );
				mberManageAwardVO.setAwardNm( (String)awardNm.get(i) );
				mberManageAwardVO.setAwardOrg((String)awardOrg.get(i) );		
				mberManageAwardVOList.add(mberManageAwardVO);
			}		
		}

		List<MberManageCareerVO> mberManageCareerVOList = new ArrayList<MberManageCareerVO>();
		if(careerCd == null || careerCd.size() == 0 ){

		}else{
			LOGGER.debug("경력기록 갯수"+careerCd.size());
			//경력기록
			MberManageCareerVO mberManageCareerVO = new MberManageCareerVO();
			for(int i =  0 ;  i < careerCd.size() ; i++){
				mberManageCareerVO.setMberId(mberManageVO.getMberId());			
				mberManageCareerVO.setCareerCd( (String)careerCd.get(i) );
				mberManageCareerVO.setCareerSn(i+"");
				mberManageCareerVO.setJoinEnterYear((String)joinEnterYear.get(i) );
				mberManageCareerVO.setJoinEnterMonth( (String)joinEnterMonth.get(i) );
				mberManageCareerVO.setOutYear((String)outYear.get(i) );		
				mberManageCareerVO.setOutMonth((String)outMonth.get(i) );		
				mberManageCareerVO.setCommpany((String)commpany.get(i) );		
				mberManageCareerVO.setPosition((String)position.get(i) );		
				mberManageCareerVO.setTask((String)task.get(i) );		
				mberManageCareerVOList.add(mberManageCareerVO);
			}
		}
				

		List<MberManageDegreeVO> mberManageDegreeVOList = new ArrayList<MberManageDegreeVO>();

		if(compltCd == null || compltCd.size() == 0 ){

		}else{
			LOGGER.debug("학위기록 갯수"+compltCd.size());
			//학위기록
			MberManageDegreeVO mberManageDegreeVO = new MberManageDegreeVO();
			for(int i =  0 ;  i < compltCd.size() ; i++){
				mberManageDegreeVO.setMberId(mberManageVO.getMberId());		
				mberManageDegreeVO.setCompltCd( (String)compltCd.get(i) );
				mberManageDegreeVO.setDegreeSn(i+"");
				mberManageDegreeVO.setEnterYear((String)enterYear.get(i) );
				mberManageDegreeVO.setEnterMonth( (String)enterMonth.get(i) );
				mberManageDegreeVO.setGrdYear((String)grdYear.get(i) );		
				mberManageDegreeVO.setGrdMonth((String)grdMonth.get(i) );		
				mberManageDegreeVO.setSchool((String)school.get(i) );		
				mberManageDegreeVO.setMajor((String)major.get(i) );		
				mberManageDegreeVOList.add(mberManageDegreeVO);
			}
		}
		
		List<MberManagePaperVO> mberManagePaperVOList = new ArrayList<MberManagePaperVO>();
		if(paperCd == null || paperCd.size() == 0 ){

		}else{
			LOGGER.debug("논문기록 갯수"+paperCd.size());
			//논문
			MberManagePaperVO mberManagePaperVO = new MberManagePaperVO();
			for(int i =  0 ;  i < paperCd.size() ; i++){
				mberManagePaperVO.setMberId(mberManageVO.getMberId());			
				mberManagePaperVO.setPaperCd( (String)paperCd.get(i) );
				mberManagePaperVO.setPaperSn(i+"");
				mberManagePaperVO.setPaperYear((String)paperYear.get(i) );
				mberManagePaperVO.setPaperMonth( (String)paperMonth.get(i) );
				mberManagePaperVO.setPaperNm((String)paperNm.get(i) );		
				mberManagePaperVO.setPaperOrg((String)paperOrg.get(i) );
				mberManagePaperVOList.add(mberManagePaperVO);
			}
		}

				
		mberManageVO.setMberManageAwardVOList(mberManageAwardVOList);
		mberManageVO.setMberManageCareerVOList(mberManageCareerVOList);
		mberManageVO.setMberManageDegreeVOList(mberManageDegreeVOList);
		mberManageVO.setMberManagePaperVOList(mberManagePaperVOList);
		
		mberManageService.updateMberSub(mberManageVO);		
		
		mberManageVO = mberManageService.selectMberById(mberManageVO.getMberId());
		
		model.addAttribute("mberManageVO", mberManageVO);

		return  ".basic_join/grnMberInsert4";
		
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
		LOGGER.debug("loginVOgetBizRno 정보"+loginVO.getBizrno());
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

	@RequestMapping(value = "/chkDuplicationGnrId.do")
	public ResponseEntity<String>  chkDuplicationGnrId(
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
}