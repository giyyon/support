package support.myInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import support.common.model.JsonObject;
import support.login.web.LoginController;
import support.util.JSONResponseUtil;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.ems.service.EgovSndngMailRegistService;
import egovframework.com.sec.rgm.service.EgovAuthorGroupService;
import egovframework.com.uat.uia.service.EgovLoginService;
import egovframework.com.uss.umt.service.EgovEntrprsManageService;
import egovframework.com.uss.umt.service.EgovMberManageService;
import egovframework.com.uss.umt.service.EntrprsManageVO;
import egovframework.com.uss.umt.service.MberManageAwardVO;
import egovframework.com.uss.umt.service.MberManageCareerVO;
import egovframework.com.uss.umt.service.MberManageDegreeVO;
import egovframework.com.uss.umt.service.MberManagePaperVO;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 일반회원관련 요청을  비지니스 클래스로 전달하고 처리된결과를  해당   웹 화면으로 전달하는  Controller를 정의한다
 * @author 박세은
 * @since 215.2
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2015.02.          최초 생성
 *
 * </pre>
 */


@Controller
@RequestMapping(value = "/myInfo")
@SessionAttributes(types=SessionVO.class)
public class MyInfoController {

	/** mberManageService */
	@Resource(name = "mberManageService")
	private EgovMberManageService mberManageService;
	
    /** entrprsManageService */
    @Resource(name = "entrprsManageService")
    private EgovEntrprsManageService entrprsManageService;

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
	 * 일반회원 정보 화면으로 이동한다.
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/myInfoView.do")
	public String myInfoView( 
			Model model)
			throws Exception {
		LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		LOGGER.debug("loginVOgetid정보"+loginVO.getId());
		LOGGER.debug("loginVOgetuserSe 정보"+loginVO.getUserSe());
		
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		String returnpage = "";
		
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
		
		//일목록
		vo.setCodeId("SUP902");
		List<?> day_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("day_result", day_result); 
		
		//일반 회원
		if(loginVO.getUserSe().equals("GNR")){			
			MberManageVO mberManageVO = mberManageService.selectMberById(loginVO.getId());
			model.addAttribute("mberManageVO", mberManageVO);
			returnpage =  ".basic_myInfo/grnMberMyInfo";			
		}else if(loginVO.getUserSe().equals("ENT")){
			EntrprsManageVO entrprsManageVO = entrprsManageService.selectEntrprsmberById(loginVO.getId());
			model.addAttribute("entrprsManageVO", entrprsManageVO);
			returnpage =  ".basic_myInfo/entMberMyInfo";
		}
			 
		return returnpage;
		
		
	}
	
	/**
	 * 일반회원 부가 정보 화면으로 이동한다.
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/myInfoSubView.do")
	public String myInfoSubView( 
			HttpServletRequest request,
			Model model)
			throws Exception {
		LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		LOGGER.debug("loginVOgetid정보"+loginVO.getId());
		LOGGER.debug("loginVOgetuserSe 정보"+loginVO.getUserSe());
		
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		
		String returnpage = "";
		//일반 회원
		if(loginVO.getUserSe().equals("GNR")){
			
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
			
			MberManageVO mberManageVO = mberManageService.selectMberById(loginVO.getId());
			
			model.addAttribute("mberManageVO", mberManageVO);
			
			returnpage =  ".basic_myInfo/grnMberMyInfoSub";
			
		}else if(loginVO.getUserSe().equals("ENT")){
			//이메일 목록
			vo.setCodeId("SUP002");
			List<?> email_result = cmmUseService.selectCmmCodeDetail(vo);
			model.addAttribute("email_result", email_result); 
			
			EntrprsManageVO entrprsManageVO = entrprsManageService.selectEntrprsmberById(loginVO.getId());
			model.addAttribute("entrprsManageVO", entrprsManageVO);
			
			returnpage =  ".basic_myInfo/entMberMyInfoSub";
		}
			 
		return returnpage;
		
		
	}
	

	/**
	 * @param mberManageVO 일반회원수정정보(비밀번호)
	 * @return ResponseEntity
	 * @throws Exception
	 */
	@RequestMapping(value = "/jsonGnrPasswordChange.do")
	public ResponseEntity<String>  jsonGnrPasswordChange(
			@ModelAttribute("mberManageVO") MberManageVO mberManageVO) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		LOGGER.debug("getPassword정보 : "+mberManageVO.getPassword());
		LOGGER.debug("getOldPassword정보 : "+mberManageVO.getOldPassword());
		boolean isCorrectPassword = false;
	
		MberManageVO resultVO = mberManageService.selectPassword(mberManageVO);
		//패스워드 암호화
		String encryptPass = EgovFileScrty.encryptPassword(mberManageVO.getOldPassword());
		if (encryptPass.equals(resultVO.getPassword())) {
			isCorrectPassword = true;
		} else {
			//비밀번호 오류.
			isCorrectPassword = false;
		}

		// 2. 결과 리턴
		//직접 raw 데이터를 입력해서 JSON형태로 출력하는 방법.
		HashMap<String, Object> total  = new HashMap<String, Object>();
		
    	if(isCorrectPassword  ){
			mberManageVO.setPassword(EgovFileScrty.encryptPassword(mberManageVO.getPassword()));
			mberManageService.updatePassword(mberManageVO);
    		
    		//비밀번호 일치
			total.put("IsSucceed", Boolean.TRUE);
			total.put("Message",  "비밀번호가 성공적으로 변경되었습니다.");	
    	}else{
    		//비밀번호 불일치
			total.put("IsSucceed", Boolean.FALSE);
			total.put("Message",  "저장된 비밀번호와 일치하지 않습니다.");	
    	
    	}
		return JSONResponseUtil.getJSONResponse(total);
	}	
	

	/**
	 * @param mberManageVO 기업회원수정정보(비밀번호)
	 * @return ResponseEntity
	 * @throws Exception
	 */
	@RequestMapping(value = "/jsonEntPasswordChange.do")
	public ResponseEntity<String>  jsonEntPasswordChange(
			@ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		LOGGER.debug("getPassword정보 : "+entrprsManageVO.getEntrprsMberPassword());
		LOGGER.debug("getOldPassword정보 : "+entrprsManageVO.getOldPassword());
		
		entrprsManageVO.setUniqId(user.getUniqId());

		boolean isCorrectPassword = false;
	
		EntrprsManageVO resultVO = entrprsManageService.selectPassword(entrprsManageVO);
		//패스워드 암호화
		String encryptPass = EgovFileScrty.encryptPassword(entrprsManageVO.getOldPassword());
		if (encryptPass.equals(resultVO.getEntrprsMberPassword())) {
			isCorrectPassword = true;
		} else {
			//비밀번호 오류.
			isCorrectPassword = false;
		}

		// 2. 결과 리턴
		//직접 raw 데이터를 입력해서 JSON형태로 출력하는 방법.
		HashMap<String, Object> total  = new HashMap<String, Object>();
		
    	if(isCorrectPassword  ){
    		entrprsManageVO.setEntrprsMberPassword(EgovFileScrty.encryptPassword(entrprsManageVO.getEntrprsMberPassword()));
    		entrprsManageService.updatePassword(entrprsManageVO);
    		
    		//비밀번호 일치
			total.put("IsSucceed", Boolean.TRUE);
			total.put("Message",  "비밀번호가 성공적으로 변경되었습니다.");	
    	}else{
    		//비밀번호 불일치
			total.put("IsSucceed", Boolean.FALSE);
			total.put("Message",  "저장된 비밀번호와 일치하지 않습니다.");	
    	
    	}
		return JSONResponseUtil.getJSONResponse(total);
	}	
	

	/**
	 * 일반회원정보 수정
	 * @param mberId 상세조회대상 일반회원아이디
	 * @param userSearchVO 검색조건
	 * @param model 화면모델
	 * @return uss/umt/EgovMberSelectUpdt
	 * @throws Exception
	 */
	@RequestMapping("/updateGnrMyInfo.do")
	public String updateGnrMyInfo(@ModelAttribute("mberManageVO") MberManageVO mberManageVO,
																 @RequestParam("progressStauts") String progressStauts,
																 Model model) throws Exception {
		
		LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		LOGGER.debug("loginVOgetid정보"+loginVO.getId());
		LOGGER.debug("loginVOgetuserSe 정보"+loginVO.getUserSe());
		
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		String returnpage = "";
		
		mberManageService.updateMberMain(mberManageVO);
		//Exception 없이 진행시 수정성공메시지
		model.addAttribute("resultMsg", "success.common.update");
		
		
        if("F".equals(progressStauts)){
			return "forward:/myInfo/myInfoView.do";
   			
        }else{
    		//"H".equals(progressStauts)
        	return  ".basic_myInfo/grnMberMyInfoSub"; 
        }
	}
	
	/**
	 * 기업회원정보 수정
	 * @param mberId 상세조회대상 일반회원아이디
	 * @param userSearchVO 검색조건
	 * @param model 화면모델
	 * @return uss/umt/EgovMberSelectUpdt
	 * @throws Exception
	 */
	@RequestMapping("/updateEntMyInfo.do")
	public String updateEntMyInfo(@ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO,
																@RequestParam("progressStauts") String progressStauts,
																Model model) throws Exception {
		
		LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		LOGGER.debug("loginVOgetid정보"+loginVO.getId());
		LOGGER.debug("loginVOgetuserSe 정보"+loginVO.getUserSe());
		
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		String returnpage = "";
		
		entrprsManageService.updateEntrprsmberMain(entrprsManageVO);
		//Exception 없이 진행시 수정성공메시지
		model.addAttribute("resultMsg", "success.common.update");
		
        if("F".equals(progressStauts)){
        	return "forward:/myInfo/myInfoView.do";
        	
    			
        }else{
    		//"H".equals(progressStauts)
        	return  ".basic_myInfo/entMberMyInfoSub";
        }

	}	
	/**
	 * 일반회원정보 수정-부가정보
	 * @param mberId 상세조회대상 일반회원아이디
	 * @param userSearchVO 검색조건
	 * @param model 화면모델
	 * @return uss/umt/EgovMberSelectUpdt
	 * @throws Exception
	 */
	@RequestMapping("/updateGnrSubMyInfo.do")
	public String updateGnrSubMyInfo(
			@ModelAttribute("mberManageVO") MberManageVO mberManageVO, 
            
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
            
//            SessionStatus status,
            HttpServletRequest request,
            Model model) throws Exception {
		
		//수상기록
		List<MberManageAwardVO> mberManageAwardVOList = new ArrayList<MberManageAwardVO>();
		if(awardCd == null || awardCd.size() == 0 ){

		}else{
			LOGGER.debug("수상기록 갯수"+awardCd.size());
			MberManageAwardVO mberManageAwardVO = null;
			for(int i =  0 ;  i < awardCd.size() ; i++){
				mberManageAwardVO = new MberManageAwardVO();
				mberManageAwardVO.setMberId(mberManageVO.getMberId());
				mberManageAwardVO.setAwardCd( (String)awardCd.get(i) );
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
			MberManageCareerVO mberManageCareerVO = null;
			for(int i =  0 ;  i < careerCd.size() ; i++){
				mberManageCareerVO = new MberManageCareerVO();
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
			MberManageDegreeVO mberManageDegreeVO = null;
			for(int i =  0 ;  i < compltCd.size() ; i++){
				mberManageDegreeVO = new MberManageDegreeVO();
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
			MberManagePaperVO mberManagePaperVO = null;
			for(int i =  0 ;  i < paperCd.size() ; i++){
				mberManagePaperVO = new MberManagePaperVO();
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
		//Exception 없이 진행시 수정성공메시지
		model.addAttribute("resultMsg", "정상적으로 수정 처리 되었습니다.");
		return "redirect:/myInfo/myInfoSubView.do";

	}
	
	/**
	 * 일반회원정보 수정-부가정보
	 * @param mberId 상세조회대상 일반회원아이디
	 * @param userSearchVO 검색조건
	 * @param model 화면모델
	 * @return uss/umt/EgovMberSelectUpdt
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/jsonUpdateGnrSubMyInfo.do")
	public JsonObject jsonUpdateGnrSubMyInfo(
			@ModelAttribute("mberManageVO") MberManageVO mberManageVO, 
            
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
            
//            SessionStatus status,
            HttpServletRequest request,
            Model model) throws Exception {
		
		//수상기록
		List<MberManageAwardVO> mberManageAwardVOList = new ArrayList<MberManageAwardVO>();
		if(awardCd == null || awardCd.size() == 0 ){
			
		}else{
			LOGGER.debug("수상기록 갯수"+awardCd.size());
			MberManageAwardVO mberManageAwardVO = null;
			for(int i =  0 ;  i < awardCd.size() ; i++){
				if(! ((String)awardCd.get(i)).equals("NaN")){
					mberManageAwardVO = new MberManageAwardVO();
					mberManageAwardVO.setMberId(mberManageVO.getMberId());
					mberManageAwardVO.setAwardCd( (String)awardCd.get(i) );
					mberManageAwardVO.setAwardSn(i+"");
					mberManageAwardVO.setAwardYear((String)awardYear.get(i) );
					mberManageAwardVO.setAwardNm( (String)awardNm.get(i) );
					mberManageAwardVO.setAwardOrg((String)awardOrg.get(i) );		
					mberManageAwardVOList.add(mberManageAwardVO);					
				}

			}		
		}

		List<MberManageCareerVO> mberManageCareerVOList = new ArrayList<MberManageCareerVO>();
		if(careerCd == null || careerCd.size() == 0 ){

		}else{
			LOGGER.debug("경력기록 갯수"+careerCd.size());
			//경력기록
			MberManageCareerVO mberManageCareerVO = null;
			for(int i =  0 ;  i < careerCd.size() ; i++){
				if(! ((String)careerCd.get(i)).equals("NaN")){
					mberManageCareerVO = new MberManageCareerVO();
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
		}
				

		List<MberManageDegreeVO> mberManageDegreeVOList = new ArrayList<MberManageDegreeVO>();

		if(compltCd == null || compltCd.size() == 0 ){

		}else{
			LOGGER.debug("학위기록 갯수"+compltCd.size());
			//학위기록
			MberManageDegreeVO mberManageDegreeVO = null;
			for(int i =  0 ;  i < compltCd.size() ; i++){
				if(! ((String)compltCd.get(i)).equals("NaN")){
					mberManageDegreeVO = new MberManageDegreeVO();
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
		}
		
		List<MberManagePaperVO> mberManagePaperVOList = new ArrayList<MberManagePaperVO>();
		if(paperCd == null || paperCd.size() == 0 ){

		}else{
			LOGGER.debug("논문기록 갯수"+paperCd.size());
			//논문
			MberManagePaperVO mberManagePaperVO = null;
			for(int i =  0 ;  i < paperCd.size() ; i++){
				if(! ((String)paperCd.get(i)).equals("NaN")){
					mberManagePaperVO = new MberManagePaperVO();
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
		}

				
		mberManageVO.setMberManageAwardVOList(mberManageAwardVOList);
		mberManageVO.setMberManageCareerVOList(mberManageCareerVOList);
		mberManageVO.setMberManageDegreeVOList(mberManageDegreeVOList);
		mberManageVO.setMberManagePaperVOList(mberManagePaperVOList);
		
		mberManageService.updateMberSub(mberManageVO);	
		//Exception 없이 진행시 수정성공메시지
		
		
		
		JsonObject jo = new JsonObject();
		jo.IsSucceed = true;
		return jo;

	}	
	
	/**
	 * 일반회원정보 수정-부가정보
	 * @param mberId 상세조회대상 일반회원아이디
	 * @param userSearchVO 검색조건
	 * @param model 화면모델
	 * @return uss/umt/EgovMberSelectUpdt
	 * @throws Exception
	 */
	@RequestMapping("/updateEntSubMyInfo.do")
	public String updateEntSubMyInfo(
			@ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO,
            HttpServletRequest request,
            Model model) throws Exception {
		//escape된 문자열을 다시 원래 형태로 복원하여 DB에 저장한다. ckEditor의 사용상 화명에 태그 형태 대로 적용하기 위한 처리 방식임.
		entrprsManageVO.setNotice(StringEscapeUtils.unescapeHtml(entrprsManageVO.getNotice()));
		entrprsManageService.updateEntrprsmberSub(entrprsManageVO);	
		//Exception 없이 진행시 수정성공메시지
		model.addAttribute("resultMsg", "정상적으로 수정 처리 되었습니다.");
		return "redirect:/myInfo/myInfoSubView.do";

	}
	
	/**
	 * 일반회원정보 수정-부가정보
	 * @param mberId 상세조회대상 일반회원아이디
	 * @param userSearchVO 검색조건
	 * @param model 화면모델
	 * @return uss/umt/EgovMberSelectUpdt
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/jsonUpdateEntSubMyInfo.do")
	public JsonObject jsonUpdateEntSubMyInfo(
			@ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO,
            HttpServletRequest request,
            Model model) throws Exception {
		//escape된 문자열을 다시 원래 형태로 복원하여 DB에 저장한다. ckEditor의 사용상 화명에 태그 형태 대로 적용하기 위한 처리 방식임.
		entrprsManageVO.setNotice(StringEscapeUtils.unescapeHtml(entrprsManageVO.getNotice()));
		entrprsManageService.updateEntrprsmberSub(entrprsManageVO);	
		//Exception 없이 진행시 수정성공메시지
		JsonObject jo = new JsonObject();
		jo.IsSucceed = true;
		return jo;

	}
	
	// 탈퇴 처리 기능에 대한 예시
	@RequestMapping("/updateWithdraw.do")
	public String updateWithdraw(Model model) throws Exception {
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		String returnPage = "/"; // 탈퇴 처리 후 화면 지정

		if (!isAuthenticated) {
			model.addAttribute("resultMsg", "fail.common.delete");

			return "redirect:" + returnPage;
		}else{
			returnPage = "/login/actionLogout.do";
		}
		
		//일반 회원
		if(loginVO.getUserSe().equals("GNR")){			
			mberManageService.updateWithdraw(loginVO.getId());
		}else if(loginVO.getUserSe().equals("ENT")){
			entrprsManageService.updateWithdraw(loginVO.getId());
		}
		
		//Exception 없이 진행시 삭제성공메시지
		model.addAttribute("resultMsg", "success.common.delete");

		return "redirect:" + returnPage;
	}	
	
}