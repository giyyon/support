package support.admin.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringEscapeUtils;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import support.common.model.JsonObject;
import support.util.JSONResponseUtil;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.sec.rgm.service.AuthorGroup;
import egovframework.com.sec.rgm.service.EgovAuthorGroupService;
import egovframework.com.uss.umt.service.EgovEntrprsManageService;
import egovframework.com.uss.umt.service.EgovMberManageService;
import egovframework.com.uss.umt.service.EntrprsManageVO;
import egovframework.com.uss.umt.service.MberManageActiveTyVO;
import egovframework.com.uss.umt.service.MberManageAwardVO;
import egovframework.com.uss.umt.service.MberManageCareerVO;
import egovframework.com.uss.umt.service.MberManageDegreeVO;
import egovframework.com.uss.umt.service.MberManagePaperVO;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.com.utl.fcc.service.EgovNumberUtil;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
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
@RequestMapping(value = "/admin")
@Controller
public class AdminMberManageController {

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
	

    @Resource(name = "egovAuthorGroupService")
    private EgovAuthorGroupService egovAuthorGroupService;
    
	/** egovUsrCnfrmIdGnrService */
	@Resource(name="egovUsrCnfrmIdGnrService")
	private EgovIdGnrService idgenService;
    
	/** DefaultBeanValidator beanValidator */
	@Autowired
	private DefaultBeanValidator beanValidator;

	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminMberManageController.class);
	/**
	 * 일반회원목록을 조회한다. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberManage
	 * @throws Exception
	 */
	@RequestMapping(value = "/gnrMberList.do")
	public String gnrMberList(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,
			                                          ModelMap model) throws Exception {
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
		
		vo.setCodeId("SUP013");
		List<?> activeTy_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("activeTy_result", activeTy_result);//활동분류코드목록
		
		vo.setCodeId("SUP011");
		List<?> mberSe_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("mberSe_result", mberSe_result);//회원분류코드목록
		
		vo.setCodeId("SUP012");
		List<?> mberType_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("mberType_result", mberType_result);//회원유형코드목록
		
		return ".basic_admin/customer/gnrMberList";
	}
	
	/**
	 * 기업회원목록을 조회한다. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberManage
	 * @throws Exception
	 */
	@RequestMapping(value = "/entMberList.do")
	public String entMberList(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,
			                                          ModelMap model) throws Exception {
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
		
		List<?> mberList = entrprsManageService.selectEntrprsMberList(userSearchVO);
		model.addAttribute("resultList", mberList);

		int totCnt = entrprsManageService.selectEntrprsMberListTotCnt(userSearchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		//일반회원 상태코드를 코드정보로부터 조회
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		
		vo.setCodeId("SUP015");
		List<?> mberSe_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("mberSe_result", mberSe_result);//회원분류코드목록
		
		vo.setCodeId("SUP014");
		List<?> mberType_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("mberType_result", mberType_result);//회원유형코드목록
		
		return ".basic_admin/customer/entMberList";
	}
	
	
	/**
	 * 일반회원목록을 조회한다. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberManage
	 * @throws Exception
	 */
	@RequestMapping(value = "/gnrMberDetail.do")
	public String gnrMberDetail(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,
															@ModelAttribute("mberManageVO") MberManageVO mberManageVO,  
			                                          ModelMap model) throws Exception {

		// 등록 화면에서 등록 후  redirect 된 경우 mberId를 model 객체에서 뽑아와야 한다.
		String mberId = (String)model.get("mberId");
		if(mberId != null){
			if(!"".equals(mberId)){
				mberManageVO.setMberId(mberId);;
			}	
		}
		
		if(mberManageVO.getMberId() != null && !mberManageVO.getMberId().equals("")){
			mberManageVO = mberManageService.selectMberById(mberManageVO.getMberId());
			model.addAttribute("isNewRegister", "false");
		}else{
			//비회원 등록 처리의 경우 고유id를 미리 얻어와 화면에 보여준다.
			mberManageVO.setUniqId(idgenService.getNextStringId());
			model.addAttribute("isNewRegister", "true");
			
	    	// 2. 비회원용 아이디를 랜덤으로 발생시킨다.(영+숫=12자리)
	    	String ghostUserId = "";
	    	for (int i = 1; i <= 12; i++) {
	    		// 영자
	    		if (i % 3 != 0) {
	    			ghostUserId += EgovStringUtil.getRandomStr('a', 'z');
	    		// 숫자
	    		} else {
	    			ghostUserId += EgovNumberUtil.getRandomNum(0, 9);
	    		}
	    	}
	    	mberManageVO.setMberId(ghostUserId);
			
		}
		//일반회원 상태코드를 코드정보로부터 조회
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
				
		vo.setCodeId("SUP011");
		List<?> mberType_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("mberType_result", mberType_result);//회원분류코드목록

		vo.setCodeId("SUP012");
		List<?> mberSe_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("mberSe_result", mberSe_result);//회원유형코드목록
		
		vo.setCodeId("SUP010");
		List<?> bsnsSe_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("bsnsSe_result", bsnsSe_result);// 사업유형코드목록

		vo.setCodeId("SUP013");
		List<?> activeTy_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("activeTy_result", activeTy_result);// 활동분류코드목록
		
		vo.setCodeId("SUP002");
		List<?> email_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("email_result", email_result);// 이메일코드목록
		
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
		
		model.addAttribute("mberManageVO", mberManageVO); 
		
		return ".basic_admin/customer/grnMberDetail";
	}
	
	/**
	 * 기업회원상세 정보을 조회한다. ()
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberManage
	 * @throws Exception
	 */
	@RequestMapping(value = "/entMberDetail.do")
	public String entMberDetail(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,
			 												@ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO,
			                                          ModelMap model) throws Exception {

		// 등록 화면에서 등록 후  redirect 된 경우 entrprsmberId를 model 객체에서 뽑아와야 한다.
		String entrprsmberId = (String)model.get("entrprsmberId");
		if(entrprsmberId != null){
			if(!"".equals(entrprsmberId)){
				entrprsManageVO.setEntrprsmberId(entrprsmberId);;
			}	
		}
		
		
		if(entrprsManageVO.getEntrprsmberId() != null && !entrprsManageVO.getEntrprsmberId().equals("")){
			entrprsManageVO = entrprsManageService.selectEntrprsmberById(entrprsManageVO.getEntrprsmberId());
			model.addAttribute("isNewRegister", "false");
		}else{
			//비회원 등록 처리의 경우 고유번호와 아이디를 미리 얻어와 화면에 보여준다.
			entrprsManageVO.setUniqId(idgenService.getNextStringId());
			model.addAttribute("isNewRegister", "true");
			
	    	// 2. 비회원용 아이디를 랜덤으로 발생시킨다.(영+숫=12자리)
	    	String ghostUserId = "";
	    	for (int i = 1; i <= 12; i++) {
	    		// 영자
	    		if (i % 3 != 0) {
	    			ghostUserId += EgovStringUtil.getRandomStr('a', 'z');
	    		// 숫자
	    		} else {
	    			ghostUserId += EgovNumberUtil.getRandomNum(0, 9);
	    		}
	    	}
	    	entrprsManageVO.setEntrprsmberId(ghostUserId);
		}
		
		
		
		
		//일반회원 상태코드를 코드정보로부터 조회
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		
		vo.setCodeId("SUP014");
		List<?> mberType_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("mberType_result", mberType_result);//회원유형코드목록

		vo.setCodeId("SUP015");
		List<?> mberSe_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("mberSe_result", mberSe_result);//회원분류코드목록
		
		vo.setCodeId("SUP010");
		List<?> bsnsSe_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("bsnsSe_result", bsnsSe_result);// 사업유형코드목록

		
		vo.setCodeId("SUP002");
		List<?> email_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("email_result", email_result);// 이메일코드목록
		
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
				
		model.addAttribute("entrprsManageVO", entrprsManageVO); 
		
		return ".basic_admin/customer/entMberDetail";
	}


	/**
	 * 일반회원정보 수정-토탈
	 * @param mberId 상세조회대상 일반회원아이디
	 * @param userSearchVO 검색조건
	 * @param model 화면모델
	 * @return uss/umt/EgovMberSelectUpdt
	 * @throws Exception
	 */
	@RequestMapping("/updateGnrMberInfo.do")
	public String updateGnrMberInfo(
			@ModelAttribute("mberManageVO") MberManageVO mberManageVO, 
			@RequestParam("isNewRegister") String isNewRegister,
            
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
            
            @RequestParam(value="activeTyCd", required=false) List<String> activeTyCd,		
            RedirectAttributes redirectAttributes,
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
		
		
		List<MberManageActiveTyVO> mberManageActiveTyVOList = new ArrayList<MberManageActiveTyVO>();
		if(activeTyCd == null || activeTyCd.size() == 0 ){

		}else{
			LOGGER.debug("활동 분류 갯수"+activeTyCd.size());
			//논문
			MberManageActiveTyVO mberManageActiveTyVO = null;
			for(int i =  0 ;  i < activeTyCd.size() ; i++){
				mberManageActiveTyVO = new MberManageActiveTyVO();
				mberManageActiveTyVO.setMberId(mberManageVO.getMberId());			
				mberManageActiveTyVO.setActiveTyCd((String)activeTyCd.get(i) );
				mberManageActiveTyVOList.add(mberManageActiveTyVO);
			}
		}
				
		mberManageVO.setMberManageAwardVOList(mberManageAwardVOList);
		mberManageVO.setMberManageCareerVOList(mberManageCareerVOList);
		mberManageVO.setMberManageDegreeVOList(mberManageDegreeVOList);
		mberManageVO.setMberManagePaperVOList(mberManagePaperVOList);
		mberManageVO.setMberManageActiveTyVOList(mberManageActiveTyVOList);		
		
		if(isNewRegister.equals("true")){
			mberManageVO.setPassword(mberManageVO.getOldPassword());
			//가입상태 초기화 A:요청, P:승인 D:삭제
			mberManageVO.setMberSttus("P");
			mberManageService.insertMber(mberManageVO);
			
			//권한 부여
			AuthorGroup authorGroup = new AuthorGroup();
			authorGroup.setUniqId(mberManageVO.getUniqId());
			authorGroup.setAuthorCode("ROLE_USER");
			authorGroup.setMberTyCode("USR01");
			
			egovAuthorGroupService.insertAuthorGroup(authorGroup);
		}
		mberManageService.updateMber(mberManageVO);	
		
		//권한 부여. 관리자 권한 Role 대상 : A01.A02,A03
		String selectRole = mberManageVO.getMberSe();
		if(selectRole.equals("A01") || selectRole.equals("A02") || selectRole.equals("A03") ){
			LOGGER.debug("관리자 롤 부여 : "+selectRole);
			AuthorGroup authorGroup = new AuthorGroup();
			authorGroup.setUniqId(mberManageVO.getUniqId());
			authorGroup.setAuthorCode("ROLE_ADMIN");
			authorGroup.setMberTyCode("USR01");		
			egovAuthorGroupService.updateAuthorGroup(authorGroup);
		}else{
			LOGGER.debug("일반 관리자 롤 부여 : "+selectRole);
			AuthorGroup authorGroup = new AuthorGroup();
			authorGroup.setUniqId(mberManageVO.getUniqId());
			authorGroup.setAuthorCode("ROLE_USER");
			authorGroup.setMberTyCode("USR01");		
			egovAuthorGroupService.updateAuthorGroup(authorGroup);
		}
		//Exception 없이 진행시 수정성공메시지
//		model.addAttribute("resultMsg", "정상적으로 수정 처리 되었습니다.");
		redirectAttributes.addFlashAttribute("mberId",mberManageVO.getMberId());
		return "redirect:/admin/gnrMberDetail.do";

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
	@RequestMapping("/jsonUpdateGnrInfo.do")
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
	
		mberManageService.updateMber(mberManageVO);	
		
		//권한 부여. 관리자 권한 Role 대상 : A01.A02,A03
		String selectRole = mberManageVO.getMberSe();
		if(selectRole.equals("A01") || selectRole.equals("A02") || selectRole.equals("A03") ){
			LOGGER.debug("관리자 롤 부여 : "+selectRole);
			AuthorGroup authorGroup = new AuthorGroup();
			authorGroup.setUniqId(mberManageVO.getUniqId());
			authorGroup.setAuthorCode("ROLE_ADMIN");
			authorGroup.setMberTyCode("USR01");		
			egovAuthorGroupService.updateAuthorGroup(authorGroup);
		}else{
			LOGGER.debug("일반 관리자 롤 부여 : "+selectRole);
			AuthorGroup authorGroup = new AuthorGroup();
			authorGroup.setUniqId(mberManageVO.getUniqId());
			authorGroup.setAuthorCode("ROLE_USER");
			authorGroup.setMberTyCode("USR01");		
			egovAuthorGroupService.updateAuthorGroup(authorGroup);
		}
		JsonObject jo = new JsonObject();
		jo.IsSucceed = true;
		return jo;

	}	
	
	
	
	/**
	 * 기업회원정보 수정-토탈
	 * @param mberId 상세조회대상 일반회원아이디
	 * @param userSearchVO 검색조건
	 * @param model 화면모델
	 * @return uss/umt/EgovMberSelectUpdt
	 * @throws Exception
	 */
	@RequestMapping("/updateEntMberInfo.do")
	public String updateEntMberInfo(@ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO, 
																	 @RequestParam("isNewRegister") String isNewRegister,
														            RedirectAttributes redirectAttributes,
														            HttpServletRequest request,
														            Model model) throws Exception {
		//escape된 문자열을 다시 원래 형태로 복원하여 DB에 저장한다. ckEditor의 사용상 화명에 태그 형태 대로 적용하기 위한 처리 방식임.
		entrprsManageVO.setNotice(StringEscapeUtils.unescapeHtml(entrprsManageVO.getNotice()));

		if(isNewRegister.equals("true")){
			entrprsManageVO.setEntrprsMberPassword(entrprsManageVO.getOldPassword());
			//가입상태 초기화 A:요청, P:승인 D:삭제
			entrprsManageVO.setEntrprsMberSttus("P");
			entrprsManageService.insertEntrprsmber(entrprsManageVO);
			
			//권한 부여
			AuthorGroup authorGroup = new AuthorGroup();
			authorGroup.setUniqId(entrprsManageVO.getUniqId());
			authorGroup.setAuthorCode("ROLE_USER");
			authorGroup.setMberTyCode("USR02");
			
			egovAuthorGroupService.insertAuthorGroup(authorGroup);
		}
		
		entrprsManageService.updateEntrprsmber(entrprsManageVO);	

		//Exception 없이 진행시 수정성공메시지
//		model.addAttribute("resultMsg", "정상적으로 수정 처리 되었습니다.");
		redirectAttributes.addFlashAttribute("entrprsmberId",entrprsManageVO.getEntrprsmberId());
		return "redirect:/admin/entMberDetail.do";
	}
	
	/**
	 * 기업회원정보 수정-부가정보
	 * @param mberId 상세조회대상 일반회원아이디
	 * @param userSearchVO 검색조건
	 * @param model 화면모델
	 * @return uss/umt/EgovMberSelectUpdt
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/jsonUpdateEntInfo.do")
	public JsonObject jsonUpdateEntSubMyInfo(@ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO,
																				            HttpServletRequest request,
																				            Model model) throws Exception {
		
		//escape된 문자열을 다시 원래 형태로 복원하여 DB에 저장한다. ckEditor의 사용상 화명에 태그 형태 대로 적용하기 위한 처리 방식임.
		entrprsManageVO.setNotice(StringEscapeUtils.unescapeHtml(entrprsManageVO.getNotice()));
		entrprsManageService.updateEntrprsmber(entrprsManageVO);	
		
		//Exception 없이 진행시 수정성공메시지
		JsonObject jo = new JsonObject();
		jo.IsSucceed = true;
		return jo;

	}
	
	

	//  강제 탈퇴 처리 기능에 대한 예시. 개인.기업 공통 메소드
	@RequestMapping("/updateWithdraw.do")
	public String updateWithdraw(@RequestParam("withdrawId") String withdrawId,
			                                                    @RequestParam("userSe") String userSe,
			                                                    RedirectAttributes redirectAttributes,
			                                                   Model model) throws Exception {

		//일반 회원
		if(userSe.equals("GNR")){			
			mberManageService.updateWithdraw(withdrawId);
			redirectAttributes.addFlashAttribute("mberId",withdrawId);
		}else if(userSe.equals("ENT")){
			entrprsManageService.updateWithdraw(withdrawId);
			redirectAttributes.addFlashAttribute("entrprsmberId",withdrawId);
		}
		
		//Exception 없이 진행시 삭제성공메시지
		model.addAttribute("resultMsg", "강제 탈퇴 처리 되었습니다.");


		return "redirect:/admin/gnrMberDetail.do";
	}	


	
	/**
	 * @param mberManageVO 일반회원수정정보(비밀번호)
	 * @return ResponseEntity
	 * @throws Exception
	 */
	@RequestMapping(value = "/jsonGnrDefaultPasswordChange.do")
	public ResponseEntity<String>  jsonGnrDefaultPasswordChange(
			@ModelAttribute("mberManageVO") MberManageVO mberManageVO,
			@ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO,			
			@RequestParam("userSe") String userSe) throws Exception {
		
		LOGGER.debug("getPassword정보 : "+mberManageVO.getPassword());
		
		// 1. 결과 리턴
		//직접 raw 데이터를 입력해서 JSON형태로 출력하는 방법.
		HashMap<String, Object> total  = new HashMap<String, Object>();
		
		//일반 회원
		if(userSe.equals("GNR")){			
			LOGGER.debug("getPassword정보 : "+mberManageVO.getPassword());
			mberManageVO.setUniqId(mberManageVO.getUniqId());
			mberManageVO.setPassword(EgovFileScrty.encryptPassword(mberManageVO.getPassword()));
			mberManageService.updatePassword(mberManageVO);
		}else if(userSe.equals("ENT")){
			LOGGER.debug("getPassword정보 : "+entrprsManageVO.getEntrprsMberPassword());
    		entrprsManageVO.setEntrprsMberPassword(EgovFileScrty.encryptPassword(entrprsManageVO.getEntrprsMberPassword()));
    		entrprsManageService.updatePassword(entrprsManageVO);
		}
		
		
		//비밀번호 일치
		total.put("IsSucceed", Boolean.TRUE);
		total.put("Message",  "비밀번호가 성공적으로 변경되었습니다.");	

		return JSONResponseUtil.getJSONResponse(total);
	}	

}