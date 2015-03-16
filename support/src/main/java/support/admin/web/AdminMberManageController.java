package support.admin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
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
@RequestMapping(value = "/admin")
@Controller
public class AdminMberManageController {

	/** mberManageService */
	@Resource(name = "mberManageService")
	private EgovMberManageService mberManageService;

	/** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

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

		mberManageVO = mberManageService.selectMberById(mberManageVO.getMberId());
		
		//일반회원 상태코드를 코드정보로부터 조회
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		
		vo.setCodeId("SUP013");
		List<?> active_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("active_result", active_result);//활동분류코드목록
		
		vo.setCodeId("SUP011");
		List<?> mberSe_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("mberSe_result", mberSe_result);//회원분류코드목록
		
		vo.setCodeId("SUP012");
		List<?> mberType_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("mberType_result", mberType_result);//회원유형코드목록
		
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
	 * 일반회원등록화면으로 이동한다.
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovMberInsertView.do")
	public String insertMberView(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, @ModelAttribute("mberManageVO") MberManageVO mberManageVO, Model model)
			throws Exception {
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

		return "egovframework/com/uss/umt/EgovMberInsert";
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
	 * @param mberManageVO 일반회원수정정보(비밀번호)
	 * @return ResponseEntity
	 * @throws Exception
	 */
	@RequestMapping(value = "/jsonGnrDefaultPasswordChange.do")
	public ResponseEntity<String>  jsonGnrDefaultPasswordChange(
			@ModelAttribute("mberManageVO") MberManageVO mberManageVO) throws Exception {
		LOGGER.debug("getPassword정보 : "+mberManageVO.getPassword());
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();	

		// 1. 결과 리턴
		//직접 raw 데이터를 입력해서 JSON형태로 출력하는 방법.
		HashMap<String, Object> total  = new HashMap<String, Object>();
		
		mberManageVO.setUniqId(mberManageVO.getUniqId());
		mberManageVO.setPassword(EgovFileScrty.encryptPassword(mberManageVO.getPassword()));
		mberManageService.updatePassword(mberManageVO);
		
		//비밀번호 일치
		total.put("IsSucceed", Boolean.TRUE);
		total.put("Message",  "비밀번호가 성공적으로 변경되었습니다.");	

		return JSONResponseUtil.getJSONResponse(total);
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