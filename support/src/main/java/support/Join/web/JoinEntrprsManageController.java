package support.Join.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.sec.rgm.service.AuthorGroup;
import egovframework.com.sec.rgm.service.EgovAuthorGroupService;
import egovframework.com.uss.umt.service.EgovEntrprsManageService;
import egovframework.com.uss.umt.service.EntrprsManageVO;
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

import support.login.web.LoginController;
import support.util.JSONResponseUtil;


/**
 * 기업회원관련 요청을  비지니스 클래스로 전달하고 처리된결과를  해당   웹 화면으로 전달하는  Controller를 정의한다
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
public class JoinEntrprsManageController {

    /** entrprsManageService */
    @Resource(name = "entrprsManageService")
    private EgovEntrprsManageService entrprsManageService;

    /** cmmUseService */
    @Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** DefaultBeanValidator beanValidator */
    @Autowired
	private DefaultBeanValidator beanValidator;

    @Resource(name = "egovAuthorGroupService")
    private EgovAuthorGroupService egovAuthorGroupService;
    
    private static final Logger LOGGER = LoggerFactory.getLogger(JoinEntrprsManageController.class);
	
	/**
	 * 기업회원등록화면 - 실명확인으로 이동한다.
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 기업회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/entMberInsertView1.do")
	public String entMberInsertView1( @ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO,
			                                                            @ModelAttribute("loginVO") LoginVO  loginVO, Model model)
			throws Exception {
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//이메일 목록
		vo.setCodeId("SUP002");
		List<?> email_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("email_result", email_result); //이메일 목록
		return ".basic_join/entMberInsert1";
	}    
    
	/**
	 * 일반회원등록화면 - 기초 정보 입력으로 이동한다.
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/entMberInsertView2.do")
	public String entMberInsertView2( 
			@ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO,
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
			
		return ".basic_join/entMberInsert2";
	}
    
	/**
	 * id 중복 검사
	 * @param vo - 아이디, 이름, 이메일주소, 비밀번호 힌트, 비밀번호 정답, 사용자구분이 담긴 LoginVO
	 * @return result - 임시비밀번호전송결과
	 * @exception Exception
	 */

	@RequestMapping(value = "/chkDuplicationEntId.do")
	public ResponseEntity<String>  chkDuplicationEntId(
			@ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO) throws Exception {

		LOGGER.debug("getMberId정보 : "+entrprsManageVO.getEntrprsmberId());

		EntrprsManageVO oldEntrprsManageVO = entrprsManageService.selectEntrprsmberById(entrprsManageVO.getEntrprsmberId());
		
    
		// 2. 결과 리턴
		//직접 raw 데이터를 입력해서 JSON형태로 출력하는 방법.
		HashMap<String, Object> total  = new HashMap<String, Object>();
		HashMap<String, Object> data  = new HashMap<String, Object>();
		
    	if(oldEntrprsManageVO != null ){
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
	 * 기업회원등록화면-최종 저장 .
	 * @param userSearchVO 검색조건정보
	 * @param entrprsManageVO 기업회원초기화정보
	 * @param model 화면모델
	 * @return F : .basic_join/entMberInsert4, H : .basic_join/entMberInsert3
	 * @throws Exception
	 */
	@RequestMapping("/entMberInsertMain.do")
	public String gnrMberInsertMain( @ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO, 
					                                                @ModelAttribute("loginVO") LoginVO  loginVO, 
					                                                @RequestParam("progressStauts") String progressStauts,
//					                                                SessionStatus status,
					                                                HttpServletRequest request,
					                                                Model model)
			throws Exception {
			
			entrprsManageVO.setOldPassword(entrprsManageVO.getEntrprsMberPassword());
			//가입상태 초기화 A:요청, P:승인 D:삭제
			entrprsManageVO.setEntrprsMberSttus("P");
			//그룹정보 초기화
			//mberManageVO.setGroupId("1");
			//일반회원가입신청 등록시 일반회원등록기능을 사용하여 등록한다.
			entrprsManageService.insertEntrprsmber(entrprsManageVO);
			
			//권한 부여
			EntrprsManageVO afterEntrprsManageVO = entrprsManageService.selectEntrprsmberById(entrprsManageVO.getEntrprsmberId());
			AuthorGroup authorGroup = new AuthorGroup();
			authorGroup.setUniqId(afterEntrprsManageVO.getUniqId());
			authorGroup.setAuthorCode("ROLE_USER");
			authorGroup.setMberTyCode("USR02");
			
			egovAuthorGroupService.insertAuthorGroup(authorGroup);
        
			
			
			HttpSession sesseion = request.getSession();
			sesseion.setAttribute("entrprsManageVO", afterEntrprsManageVO);
			sesseion.setAttribute("joinUserNm", entrprsManageVO.getApplcntNm());
			sesseion.setAttribute("joinUserId", entrprsManageVO.getEntrprsmberId());
			sesseion.setAttribute("joinUserPw", entrprsManageVO.getOldPassword());
        if("F".equals(progressStauts)){
        	// 일반회원과 동일 화면 공유
        	return  ".basic_join/grnMberInsert4";
    			
        }else if("H".equals(progressStauts)){
			return "redirect:/join/entMberInsertView3.do";
        }
		return "";
	}	
	
	/**
	 * 기업회원등록화면-부가 정보.  이 화면은 사용자가 직접 오지 못하고 entMberInsertMain을 거친 redirect Url이다. 세션에서 사용자 정보를 꺼내와 세팅이 필요하다
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/entMberInsertView3.do")
	public String gnrMberInsertView3( HttpServletRequest  request, Model model)
			throws Exception {
		
		EntrprsManageVO entrprsManageVO = (EntrprsManageVO)request.getSession().getAttribute("entrprsManageVO");
		model.addAttribute("entrprsManageVO", entrprsManageVO);
		
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
				
		//이메일 목록
		vo.setCodeId("SUP002");
		List<?> email_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("email_result", email_result); 
		
		return ".basic_join/entMberInsert3";
	}	
	
	/**
	 * 일반회원등록화면- 완료된 페이지로 이동한다.
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/entMberInsertView4.do")
	public String entMberInsertView4( HttpServletRequest request, Model model)
			throws Exception {

		EntrprsManageVO entrprsManageVO = (EntrprsManageVO)request.getSession().getAttribute("entrprsManageVO");
		model.addAttribute("entrprsManageVO", entrprsManageVO);
		return ".basic_join/grnMberInsert4";
	}
	/**
	 * 기업회원등록화면-  부가정보 저장 .
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return .basic_join/grnMberInsert4
	 * @throws Exception
	 */
	@RequestMapping("/entMberInsertSub.do")
	public String gnrMberInsertSub( 
			                                                       @ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO, 
					                                                @ModelAttribute("loginVO") LoginVO  loginVO, 
//					                                                SessionStatus status,
					                                                HttpServletRequest request,
					                                                Model model)
			throws Exception {

		entrprsManageService.updateEntrprsmberSub(entrprsManageVO);		
		
		entrprsManageVO = entrprsManageService.selectEntrprsmberById(entrprsManageVO.getEntrprsmberId());
		
		model.addAttribute("entrprsManageVO", entrprsManageVO);

		return  ".basic_join/grnMberInsert4";
		
	}
	
	
	
    /**
     * 기업회원 등록화면으로 이동한다.
     * @param userSearchVO 검색조건정보
     * @param entrprsManageVO 기업회원 초기화정보
     * @param model 화면모델
     * @return uss/umt/EgovEntrprsMberInsert
     * @throws Exception
     */
    @RequestMapping("/join/EntrprsMberInsertView.do")
    public String insertEntrprsMberView(
            @ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,
            @ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO,
            Model model
            )throws Exception {
        ComDefaultCodeVO vo = new ComDefaultCodeVO();

        //패스워드힌트목록을 코드정보로부터 조회
        vo.setCodeId("COM022");
        List passwordHint_result = cmmUseService.selectCmmCodeDetail(vo);
        //성별구분코드를 코드정보로부터 조회
        vo.setCodeId("COM014");
        List sexdstnCode_result = cmmUseService.selectCmmCodeDetail(vo);
        //사용자상태코드를 코드정보로부터 조회
        vo.setCodeId("COM013");
        List entrprsMberSttus_result = cmmUseService.selectCmmCodeDetail(vo);
        //그룹정보를 조회 - GROUP_ID정보
        vo.setTableNm("COMTNORGNZTINFO");
        List groupId_result = cmmUseService.selectGroupIdDetail(vo);
        //기업구분코드를 코드정보로부터 조회 - COM026
        vo.setCodeId("COM026");
        List entrprsSeCode_result = cmmUseService.selectCmmCodeDetail(vo);
        //업종코드를 코드정보로부터 조회 - COM027
        vo.setCodeId("COM027");
        List indutyCode_result = cmmUseService.selectCmmCodeDetail(vo);

        model.addAttribute("passwordHint_result",      passwordHint_result);     //패스워트힌트목록
        model.addAttribute("sexdstnCode_result",       sexdstnCode_result);      //성별구분코드목록
        model.addAttribute("entrprsMberSttus_result",entrprsMberSttus_result);//사용자상태코드목록
        model.addAttribute("groupId_result",         groupId_result);        //그룹정보 목록
        model.addAttribute("entrprsSeCode_result",  entrprsSeCode_result);  //기업구분코드 목록
        model.addAttribute("indutyCode_result",     indutyCode_result);        //업종코드목록

        return "egovframework/com/uss/umt/EgovEntrprsMberInsert";
    }

    /**
     * 기업회원등록처리후 목록화면으로 이동한다.
     * @param entrprsManageVO 신규기업회원정보
     * @param bindingResult   입력값검증용  bindingResult
     * @param model           화면모델
     * @return forward:/uss/umt/EgovEntrprsMberManage.do
     * @throws Exception
     */
    @RequestMapping("/uss/umt/EgovEntrprsMberInsert.do")
    public String insertEntrprsMber(
            @ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO,
            BindingResult bindingResult,
            Model model
            )throws Exception {

    	beanValidator.validate(entrprsManageVO, bindingResult);
    	if (bindingResult.hasErrors()){
    		return "egovframework/com/uss/umt/EgovEntrprsMberInsert";
		}else{
			if(entrprsManageVO.getGroupId().equals("")){
				entrprsManageVO.setGroupId(null);
			}
			entrprsManageService.insertEntrprsmber(entrprsManageVO);
	        //Exception 없이 진행시 등록성공메시지
	        model.addAttribute("resultMsg", "success.common.insert");
		}
    	return "forward:/uss/umt/EgovEntrprsMberManage.do";

    }

    /**
     * 기업회원정보 수정을 위해기업회원정보를 상세조회한다.
     * @param entrprsmberId 상세조회 대상 기업회원아이디
     * @param userSearchVO 조회조건정보
     * @param model 화면모델
     * @return uss/umt/EgovEntrprsMberSelectUpdt
     * @throws Exception
     */
    @RequestMapping("/uss/umt/EgovEntrprsMberSelectUpdtView.do")
    public String updateEntrprsMberView(
            @RequestParam("selectedId") String entrprsmberId ,
            @ModelAttribute("searchVO") UserDefaultVO userSearchVO,
            Model model
            )throws Exception {
        EntrprsManageVO entrprsManageVO = new EntrprsManageVO();
        entrprsManageVO = entrprsManageService.selectEntrprsmber(entrprsmberId);
        model.addAttribute("entrprsManageVO", entrprsManageVO);
        model.addAttribute("userSearchVO", userSearchVO);

        ComDefaultCodeVO vo = new ComDefaultCodeVO();
        //패스워드힌트목록을 코드정보로부터 조회
        vo.setCodeId("COM022");
        List passwordHint_result = cmmUseService.selectCmmCodeDetail(vo);
        //성별구분코드를 코드정보로부터 조회
        vo.setCodeId("COM014");
        List sexdstnCode_result = cmmUseService.selectCmmCodeDetail(vo);
        //사용자상태코드를 코드정보로부터 조회
        vo.setCodeId("COM013");
        List entrprsMberSttus_result = cmmUseService.selectCmmCodeDetail(vo);
        //그룹정보를 조회 - GROUP_ID정보
        vo.setTableNm("COMTNORGNZTINFO");
        List groupId_result = cmmUseService.selectGroupIdDetail(vo);
        //기업구분코드를 코드정보로부터 조회 - COM026
        vo.setCodeId("COM026");
        List entrprsSeCode_result = cmmUseService.selectCmmCodeDetail(vo);
        //업종코드를 코드정보로부터 조회 - COM027
        vo.setCodeId("COM027");
        List indutyCode_result = cmmUseService.selectCmmCodeDetail(vo);

        model.addAttribute("passwordHint_result",      passwordHint_result);     //패스워트힌트목록
        model.addAttribute("sexdstnCode_result",       sexdstnCode_result);      //성별구분코드목록
        model.addAttribute("entrprsMberSttus_result",entrprsMberSttus_result);//사용자상태코드목록
        model.addAttribute("groupId_result",         groupId_result);        //그룹정보 목록
        model.addAttribute("entrprsSeCode_result",  entrprsSeCode_result);  //기업구분코드 목록
        model.addAttribute("indutyCode_result",     indutyCode_result);        //업종코드목록

        return "egovframework/com/uss/umt/EgovEntrprsMberSelectUpdt";
    }

    /**
     * 기업회원정보 수정후 목록조회 화면으로 이동한다.
     * @param entrprsManageVO 수정할 기업회원정보
     * @param bindingResult 입력값 검증용 bindingResult
     * @param model 화면모델
     * @return forward:/uss/umt/EgovEntrprsMberManage.do
     * @throws Exception
     */
    @RequestMapping("/uss/umt/EgovEntrprsMberSelectUpdt.do")
    public String updateEntrprsMber(
            @ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO,
            BindingResult bindingResult,
            Model model
            )throws Exception {
    	beanValidator.validate(entrprsManageVO, bindingResult);
    	if (bindingResult.hasErrors()){
    		return "egovframework/com/uss/umt/EgovEntrprsMberSelectUpdt";
		}else{
			if(entrprsManageVO.getGroupId().equals("")){
				entrprsManageVO.setGroupId(null);
			}
			entrprsManageService.updateEntrprsmber(entrprsManageVO);
			//Exception 없이 진행시 수정성공메시지
	        model.addAttribute("resultMsg", "success.common.update");
		    return "forward:/uss/umt/EgovEntrprsMberManage.do";
		}
    }

    /**
     * 기업회원정보삭제후 목록조회 화면으로 이동한다.
     * @param checkedIdForDel 삭제대상아이디 정보
     * @param userSearchVO 조회조건정보
     * @param model 화면모델
     * @return "forward:/uss/umt/EgovUserManage.do"
     * @throws Exception
     */
    @RequestMapping("/uss/umt/EgovEntrprsMberDelete.do")
    public String deleteEntrprsMber(
            @RequestParam("checkedIdForDel") String checkedIdForDel ,
            @ModelAttribute("searchVO") UserDefaultVO userSearchVO,
            Model model
            )throws Exception {
    	//log.debug("jjycon_delete-->"+checkedIdForDel);
        entrprsManageService.deleteEntrprsmber(checkedIdForDel);
        //Exception 없이 진행시 삭제성공메시지
        model.addAttribute("resultMsg", "success.common.delete");
        return "forward:/uss/umt/EgovEntrprsMberManage.do";
    }

    /**
     * 기업회원목록을 조회한다. (pageing)
     * @param userSearchVO 검색조건정보
     * @param model 화면모델
     * @return uss/umt/EgovEntrprsMberManage
     * @throws Exception
     */
    @IncludedInfo(name="기업회원관리", order = 450 ,gid = 50)
    @RequestMapping(value="/uss/umt/EgovEntrprsMberManage.do")
    public String selectEntrprsMberList(
    		@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,
            ModelMap model
            )throws Exception {
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

        List entrprsList = entrprsManageService.selectEntrprsMberList(userSearchVO);
        model.addAttribute("resultList", entrprsList);

        int totCnt = entrprsManageService.selectEntrprsMberListTotCnt(userSearchVO);
        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

      //사용자상태코드를 코드정보로부터 조회
        ComDefaultCodeVO vo = new ComDefaultCodeVO();
        vo.setCodeId("COM013");
        List entrprsMberSttus_result = cmmUseService.selectCmmCodeDetail(vo);
        model.addAttribute("entrprsMberSttus_result",entrprsMberSttus_result);//기업회원상태코드목록

        return "egovframework/com/uss/umt/EgovEntrprsMberManage";
    }

    /**
     * 기업회원가입신청 등록화면으로 이동한다.
     * @param userSearchVO 검색조건정보
     * @param entrprsManageVO 기업회원초기화정보
     * @param commandMap 파라메터전송 commandMap
     * @param model 화면모델
     * @return uss/umt/EgovEntrprsMberSbscrb
     * @throws Exception
     */
    @RequestMapping("/uss/umt/EgovEntrprsMberSbscrbView.do")
    public String sbscrbEntrprsMberView(
    		@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,
    		@ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO,
    		@CommandMap Map<String, Object> commandMap,
    		Model model
    		)throws Exception {
        ComDefaultCodeVO vo = new ComDefaultCodeVO();

        //패스워드힌트목록을 코드정보로부터 조회
        vo.setCodeId("COM022");
        List passwordHint_result = cmmUseService.selectCmmCodeDetail(vo);
        //성별구분코드를 코드정보로부터 조회
        vo.setCodeId("COM014");
        List sexdstnCode_result = cmmUseService.selectCmmCodeDetail(vo);
        //기업구분코드를 코드정보로부터 조회 - COM026
        vo.setCodeId("COM026");
        List entrprsSeCode_result = cmmUseService.selectCmmCodeDetail(vo);
        //업종코드를 코드정보로부터 조회 - COM027
        vo.setCodeId("COM027");
        List indutyCode_result = cmmUseService.selectCmmCodeDetail(vo);

        model.addAttribute("passwordHint_result",      passwordHint_result);     //패스워트힌트목록
        model.addAttribute("sexdstnCode_result",       sexdstnCode_result);      //성별구분코드목록
        model.addAttribute("entrprsSeCode_result",  entrprsSeCode_result);        //기업구분코드 목록
        model.addAttribute("indutyCode_result",     indutyCode_result);           //업종코드목록
        if(!"".equals((String)commandMap.get("realname"))){
        	model.addAttribute("applcntNm",   (String)commandMap.get("realname"));      //실명인증된 이름 - 주민번호인증
        	model.addAttribute("applcntIhidnum",   (String)commandMap.get("ihidnum"));  //실명인증된 주민등록번호 - 주민번호 인증
        }
        if(!"".equals((String)commandMap.get("realName"))){
        	model.addAttribute("applcntNm",   (String)commandMap.get("realName"));      //실명인증된 이름 - ipin인증
        }
        //entrprsManageVO.setGroupId("DEFAULT");
        entrprsManageVO.setEntrprsMberSttus("DEFAULT");

        return "egovframework/com/uss/umt/EgovEntrprsMberSbscrb";
    }

    /**
     * 기업회원가입신청 등록처리후 로그인화면으로 이동한다.
     * @param entrprsManageVO 기업회원가입신청정보
     * @return forward:/uat/uia/egovLoginUsr.do
     * @throws Exception
     */
    @RequestMapping("/uss/umt/EgovEntrprsMberSbscrb.do")
    public String sbscrbEntrprsMber(
            @ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO
            )throws Exception {

        //가입상태 초기화
        entrprsManageVO.setEntrprsMberSttus("A");
        //그룹정보 초기화
        //entrprsManageVO.setGroupId("1");
        //기업회원가입신청 등록시 기업회원등록기능을 사용하여 등록한다.
        entrprsManageService.insertEntrprsmber(entrprsManageVO);
        return "forward:/uat/uia/egovLoginUsr.do";
    }

    /**
     * 기업회원 약관확인 화면을 조회한다.
     * @param model 화면모델
     * @return join/StplatCnfirmEntrprs
     * @throws Exception
     */
    @RequestMapping("/StplatCnfirmEntrprs.do")
    public String sbscrbEntrprsMber(Model model)
            throws Exception {
        //기업회원용 약관 아이디 설정
        String stplatId = "STPLAT_0000000000002";
        //회원가입유형 설정-기업회원
        String sbscrbTy = "USR02";
        //약관정보 조회
        List stplatList = entrprsManageService.selectStplat(stplatId);
        model.addAttribute("stplatList",      stplatList);     //약관정보포함
        model.addAttribute("sbscrbTy",        sbscrbTy);     //회원가입유형포함

        
        return ".basic_join/StplatCnfirm";
    }

    /**
     * 기업회원 암호 수정처리 후 화면 이동한다.
     * @param model 화면모델
     * @param commandMap 파라메터전달용 commandMap
     * @param userSearchVO 검색조건정보
     * @param entrprsManageVO 기업회원수정정보
     * @return uss/umt/EgovEntrprsPasswordUpdt
     * @throws Exception
     */
    @RequestMapping(value="/uss/umt/EgovEntrprsPasswordUpdt.do")
    public String updatePassword(
    		ModelMap model,
    		@CommandMap Map<String, Object> commandMap,
    		@ModelAttribute("searchVO") UserDefaultVO userSearchVO,
    		@ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO
    		)throws Exception {
    	String oldPassword = (String)commandMap.get("oldPassword");
        String newPassword = (String)commandMap.get("newPassword");
        String newPassword2 = (String)commandMap.get("newPassword2");
        String uniqId = (String)commandMap.get("uniqId");

        boolean isCorrectPassword=false;
        EntrprsManageVO resultVO = new EntrprsManageVO();
        entrprsManageVO.setEntrprsMberPassword(newPassword);
        entrprsManageVO.setOldPassword(oldPassword);
        entrprsManageVO.setUniqId(uniqId);

    	String resultMsg = "";
    	resultVO = entrprsManageService.selectPassword(entrprsManageVO);
    	//패스워드 암호화
		String encryptPass = EgovFileScrty.encryptPassword(oldPassword);
    	if (encryptPass.equals(resultVO.getEntrprsMberPassword())){
    		if (newPassword.equals(newPassword2)){
        		isCorrectPassword = true;
        	}else{
        		isCorrectPassword = false;
        		resultMsg="fail.user.passwordUpdate2";
        	}
    	}else{
    		isCorrectPassword = false;
    		resultMsg="fail.user.passwordUpdate1";
    	}

    	if (isCorrectPassword){
    		entrprsManageVO.setEntrprsMberPassword(EgovFileScrty.encryptPassword(newPassword));
    		entrprsManageService.updatePassword(entrprsManageVO);
            model.addAttribute("entrprsManageVO", entrprsManageVO);
            resultMsg = "success.common.update";
        }else{
        	model.addAttribute("entrprsManageVO", entrprsManageVO);
        }
    	model.addAttribute("userSearchVO", userSearchVO);
    	model.addAttribute("resultMsg", resultMsg);

        return "egovframework/com/uss/umt/EgovEntrprsPasswordUpdt";
    }

    /**
     * 기업회원암호 수정 화면 이동
     * @param model 화면모델
     * @param commandMap 파라메터전송용 commandMap
     * @param userSearchVO 검색조건정보
     * @param entrprsManageVO 기업회원수정정보
     * @return uss/umt/EgovEntrprsPasswordUpdt
     * @throws Exception
     */
    @RequestMapping(value="/uss/umt/EgovEntrprsPasswordUpdtView.do")
    public String updatePasswordView(
    		ModelMap model,
    		@CommandMap Map<String, Object> commandMap,
    		@ModelAttribute("searchVO") UserDefaultVO userSearchVO,
    		@ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO
    		) throws Exception {
    	String userTyForPassword = (String)commandMap.get("userTyForPassword");
    	entrprsManageVO.setUserTy(userTyForPassword);

    	model.addAttribute("userSearchVO", userSearchVO);
    	model.addAttribute("entrprsManageVO", entrprsManageVO);
    	return "egovframework/com/uss/umt/EgovEntrprsPasswordUpdt";
    }

}