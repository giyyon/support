package support.admin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import support.util.JSONResponseUtil;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.Board;
import egovframework.com.cop.bbs.service.BoardMaster;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.com.cop.bbs.service.EgovBBSManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
@RequestMapping(value = "/admin")
public class AdminCustomerController implements ApplicationContextAware, InitializingBean {
	
	//protected Logger log = Logger.getLogger(this.getClass());
	private static final Logger logger = LoggerFactory.getLogger(AdminCustomerController.class);
	//protected Logger logger = Logger.getLogger(this.getClass());

    @Resource(name = "EgovBBSAttributeManageService")
    private EgovBBSAttributeManageService bbsAttrbService;
    
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;    // egovframework.com.cmm.service.EgovProperties.java
    
    @Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;
    
	/** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

    
	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminCustomerController.class);
	
	@Override
	public void afterPropertiesSet() throws Exception {

		// TODO Auto-generated method stub
		
	}

	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {

		// TODO Auto-generated method stub
		
	}
	
    /**
     * 게시물에 대한 목록을 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/noticeList.do")
    public String noticeList(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();


	//공지사항 게시판 아이디 : BBSMSTR_000000000001
	if("".equals(boardVO.getBbsId()))
			boardVO.setBbsId("BBSMSTR_000000000001");

	//공지사항 게시판 정렬 순서 
	logger.debug("공지게시판 boardVO.getSortType()" + boardVO.getSortType());
	if("".equals(boardVO.getSortType())){
		logger.debug("공지게시판 boardVO.getSortType() 빈공백");
		boardVO.setSortType("0");
    }
	
	//공지사항 공지유형 검색 조건 세팅 
	logger.debug("공지사항 공지유형 검색 조건 세팅 . 공지게시판 boardVO.getSearchNttTy()" + boardVO.getSearchNttTy());
	if(boardVO.getSearchNttTy() == null){
		logger.debug("공지게시판 boardVO.getSearchNttTy() 빈공백");
		boardVO.setNttTyCode("");
	}else {
		boardVO.setNttTyCode(boardVO.getSearchNttTy());
    }
	
	boardVO.setBbsId(boardVO.getBbsId());
	boardVO.setBbsNm(boardVO.getBbsNm());

	BoardMasterVO vo = new BoardMasterVO();
	
	vo.setBbsId(boardVO.getBbsId());
	vo.setUniqId(user.getUniqId());
	
	BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

	boardVO.setPageUnit(propertyService.getInt("pageUnit"));
	boardVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	
	paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
	paginationInfo.setPageSize(boardVO.getPageSize());

	boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
	boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	//Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
	Map<String, Object> map = bbsMngService.selectAdminBoardArticles(boardVO, master.getBbsAttrbCode());//2011.09.07
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
	paginationInfo.setTotalRecordCount(totCnt);

	//-------------------------------
	// 기본 BBS template 지정 
	//-------------------------------
	if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
	    master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
	}
	////-----------------------------

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("boardVO", boardVO);
	model.addAttribute("brdMstrVO", master);
	model.addAttribute("paginationInfo", paginationInfo);

	return ".basic_admin/customer/noticeList";
    }

    /**
     * 게시물에 대한 상세 정보를 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/noticeInqire.do")
    public String noticeInqire(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	// 조회수 증가 여부 지정
	boardVO.setPlusCount(true);

	//---------------------------------
	// 2009.06.29 : 2단계 기능 추가
	//---------------------------------
	if (!boardVO.getSubPageIndex().equals("")) {
	    boardVO.setPlusCount(false);
	}
	////-------------------------------

	//공지사항 게시판 아이디 : BBSMSTR_000000000001
	if("".equals(boardVO.getBbsId()))
			boardVO.setBbsId("BBSMSTR_000000000001");
	
	// 신규 등록 화면에서 등록 후  redirect 된 경우 nttId를 model 객체에서 뽑아와야 한다.
	if(model.get("nttId") != null){
		long nttId = (Long.parseLong(model.get("nttId").toString()));
		if(nttId != 0){
			boardVO.setNttId(nttId);
		}	
	}
	
	
	//공지사항 게시판 정렬 순서 
	logger.debug("공지게시판 boardVO.getSortType()" + boardVO.getSortType());
	if("".equals(boardVO.getSortType())){
		logger.debug("공지게시판 boardVO.getSortType() 빈공백");
		boardVO.setSortType("0");
    }
	// 이전 / 이후 게시물 id 조회
//	if("prev".equals(boardVO.getArticleDirection()) || ("next".equals(boardVO.getArticleDirection()))
//			boardVO.setNttId(nttId);BbsId("BBSMSTR_000000000001");
//		

	
	boardVO.setLastUpdusrId(user.getUniqId());
	BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

	model.addAttribute("result", vo);
	model.addAttribute("resultBefore", bbsMngService.selectAdminBeforeBoardArticle(boardVO));
	model.addAttribute("resultNext", bbsMngService.selectAdminNextBoardArticle(boardVO));
	
	//CommandMap의 형태로 개선????

	model.addAttribute("sessionUniqId", user.getUniqId());

	//----------------------------
	// template 처리 (기본 BBS template 지정  포함)
	//----------------------------
	BoardMasterVO master = new BoardMasterVO();
	
	master.setBbsId(boardVO.getBbsId());
	master.setUniqId(user.getUniqId());
	
	BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

	if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().equals("")) {
	    masterVo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
	}

	model.addAttribute("brdMstrVO", masterVo);
	////-----------------------------

	////--------------------------
	return ".basic_admin/customer/noticeInqire";
    }
	

    /**
     * 게시물에 대한 수정 화면으로 이동한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/noticeModifyPage.do")
    public String noticeModifyPage(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	// 조회수 증가 여부 지정
	boardVO.setPlusCount(true);

	//---------------------------------
	// 2009.06.29 : 2단계 기능 추가
	//---------------------------------
	if (!boardVO.getSubPageIndex().equals("")) {
	    boardVO.setPlusCount(false);
	}
	////-------------------------------

	//공지사항 게시판 아이디 : BBSMSTR_000000000001
	if("".equals(boardVO.getBbsId()))
			boardVO.setBbsId("BBSMSTR_000000000001");
	
	// 신규 등록 화면에서 등록 후  redirect 된 경우 nttId를 model 객체에서 뽑아와야 한다.
	if(model.get("nttId") != null){
		long nttId = (Long.parseLong(model.get("nttId").toString()));
		if(nttId != 0){
			boardVO.setNttId(nttId);
		}	
	}
	
	ComDefaultCodeVO codeVo = new ComDefaultCodeVO();
	//공지유형 목록
	codeVo.setCodeId("SUP001");
	List<?> nttTyCode_result = cmmUseService.selectCmmCodeDetail(codeVo);
	model.addAttribute("nttTyCode_result", nttTyCode_result); 
	
	
	//공지사항 게시판 정렬 순서 
	logger.debug("공지게시판 boardVO.getSortType()" + boardVO.getSortType());
	if("".equals(boardVO.getSortType())){
		logger.debug("공지게시판 boardVO.getSortType() 빈공백");
		boardVO.setSortType("0");
    }
	//공지사항 공지유형 정렬 순서 
		logger.debug("공지게시판 boardVO.getSearchNttTy()" + boardVO.getSearchNttTy());
		if("".equals(boardVO.getSearchNttTy())){
			logger.debug("공지게시판 boardVO.getSearchNttTy() 빈공백");
			boardVO.setSortType("0");
	    }
	
	boardVO.setLastUpdusrId(user.getUniqId());
	BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

	model.addAttribute("result", vo);
	
	//CommandMap의 형태로 개선????

	model.addAttribute("sessionUniqId", user.getUniqId());

	//----------------------------
	// template 처리 (기본 BBS template 지정  포함)
	//----------------------------
	BoardMasterVO master = new BoardMasterVO();
	
	master.setBbsId(boardVO.getBbsId());
	master.setUniqId(user.getUniqId());
	
	BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

	if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().equals("")) {
	    masterVo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
	}

	model.addAttribute("brdMstrVO", masterVo);
	////-----------------------------
	
	////--------------------------
	return ".basic_admin/customer/noticeModify";
    }
	    
    /**
     * 게시물에 대한 수정 화면으로 이동한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/noticeInsertPage.do")
    public String noticeInsertPage(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
    	
    	ComDefaultCodeVO codeVo = new ComDefaultCodeVO();
    	//공지유형 목록
    	codeVo.setCodeId("SUP001");
    	List<?> nttTyCode_result = cmmUseService.selectCmmCodeDetail(codeVo);
    	model.addAttribute("nttTyCode_result", nttTyCode_result); 
    	
		boardVO.setBbsId("BBSMSTR_000000000001");
    	model.addAttribute("result", boardVO);
    	return ".basic_admin/customer/noticeModify";
    }
	    
    
    /**
     * 게시물에 대한 상세 정보를 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/noticeInqirePopUp.do")
    public String noticeInqirePopUp(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	// 조회수 증가 여부 지정
	boardVO.setPlusCount(true);

	//---------------------------------
	// 2009.06.29 : 2단계 기능 추가
	//---------------------------------
	if (!boardVO.getSubPageIndex().equals("")) {
	    boardVO.setPlusCount(false);
	}
	////-------------------------------

	//공지사항 게시판 아이디 : BBSMSTR_000000000001
	if("".equals(boardVO.getBbsId()))
			boardVO.setBbsId("BBSMSTR_000000000001");
	
	//공지사항 게시판 정렬 순서 
	logger.debug("공지게시판 boardVO.getSortType()" + boardVO.getSortType());
	if("".equals(boardVO.getSortType())){
		logger.debug("공지게시판 boardVO.getSortType() 빈공백");
		boardVO.setSortType("0");
    }
	
	boardVO.setLastUpdusrId(user.getUniqId());
	BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

	model.addAttribute("result", vo);
	model.addAttribute("resultBefore", bbsMngService.selectBeforeBoardArticle(boardVO));
	model.addAttribute("resultNext", bbsMngService.selectNextBoardArticle(boardVO));
	
	//CommandMap의 형태로 개선????

	model.addAttribute("sessionUniqId", user.getUniqId());

	//----------------------------
	// template 처리 (기본 BBS template 지정  포함)
	//----------------------------
	BoardMasterVO master = new BoardMasterVO();
	
	master.setBbsId(boardVO.getBbsId());
	master.setUniqId(user.getUniqId());
	
	BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

	if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().equals("")) {
	    masterVo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
	}

	model.addAttribute("brdMstrVO", masterVo);

	return "popup_noticeInqirePopUp";
    }
    
    /**
     * 게시물을 등록한다.
     * 
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("/insertNoticeBoardArticle.do")
    public String insertNoticeBoardArticle(
//    		                                                      final MultipartHttpServletRequest multiRequest, 
    		                                                      @ModelAttribute("searchVO") BoardVO boardVO,
	                                                              @ModelAttribute("bdMstr") BoardMaster bdMstr, 
	                                                              @ModelAttribute("board") Board board, 
	                                                              RedirectAttributes redirectAttributes,
	    ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		long nttId = 0;
		if (isAuthenticated) {
		    board.setFrstRegisterId(user.getId());
		    //공지사항 게시판 아이디 : BBSMSTR_000000000001
			if("".equals(boardVO.getBbsId()))
					boardVO.setBbsId("BBSMSTR_000000000001");
		    	    
		    //board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    
		    board.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
		    board.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
		    
		    //board.setNttCn(board.getNttCn());	// XSS 방지
			//escape된 문자열을 다시 원래 형태로 복원하여 DB에 저장한다. ckEditor의 사용상 화명에 태그 형태 대로 적용하기 위한 처리 방식임.
		    board.setNttCn(StringEscapeUtils.unescapeHtml(board.getNttCn()));
		    
		    nttId = 0;
			if( board.getNttId() == 0 ){
				nttId = bbsMngService.insertBoardArticle(board);	
				board.setNttId(nttId);
			}else{
			    board.setLastUpdusrId(user.getId());
				bbsMngService.updateBoardArticle(board);
				nttId = board.getNttId();
			}	
		}
		model.addAttribute("result", board);
		
		redirectAttributes.addFlashAttribute("nttId",String.valueOf(nttId));
		
		if("01".equals(board.getNttSttusCode())){
			//임시 등록
			return "redirect:/admin/noticeModifyPage.do";
		}else{
			//등록
			return "redirect:/admin/noticeInqire.do";
		}
    }
    
    
    /**
     * 게시물의 등록 상태 정보를 수정한다. (01:임시, 02:등록)
     * 
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("/jsonUpdateBoardNttSttusCode.do")
    public ResponseEntity<String> jsonupdateBoardNttSttusCode(
	                                                              @ModelAttribute("board") Board board, 
	                                                              RedirectAttributes redirectAttributes,
	    ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		long nttId = 0;
		if (isAuthenticated) {
		    board.setFrstRegisterId(user.getId());
		    //각 화면별 게시판 아이디를 정확히 넘겨 받아야 한다. : 공지사항  BBSMSTR_000000000001, 최신 동향  : BBSMSTR_000000000002
		    logger.debug("게시판 오픈 상태 정보 : getBbsId : "+board.getBbsId());
		    logger.debug("게시판 오픈 상태 정보 : nttsttusCode : "+board.getNttSttusCode());
			bbsMngService.updateBoardNttSttusCode(board);
		}
		HashMap<String, Object> total  = new HashMap<String, Object>();
		total.put("IsSucceed", Boolean.TRUE);
		return JSONResponseUtil.getJSONResponse(total);
    }
    
    /**
     * 게시물에 대한 내용을 삭제한다.
     * 
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteBoardArticle.do")
    public String deleteBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model) throws Exception {
	
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	if (isAuthenticated) {
	    board.setLastUpdusrId(user.getUniqId());
	    
	    //공지사항 게시판 아이디 : BBSMSTR_000000000001
		if("".equals(board.getBbsId()))
			board.setBbsId("BBSMSTR_000000000001");
		
	    bbsMngService.deleteBoardArticle(board);
	}

	return "redirect:/admin/noticeList.do";
    }
    
    /**
     * 게시물에 대한 내용을 삭제한다.
     * 
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteCheckedNoticeList.do")
    public String deleteCheckedNoticeList(@ModelAttribute("searchVO") BoardVO boardVO,
    		                                                      @ModelAttribute("board") Board board,
    		                                                      @ModelAttribute("bdMstr") BoardMaster bdMstr, 
    		                                                      @RequestParam(value="delChk", required=true) List<String> delChk,
    		                                                      ModelMap model) throws Exception {
	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		if (isAuthenticated) {
		    board.setLastUpdusrId(user.getUniqId());
		    
		    //공지사항 게시판 아이디 : BBSMSTR_000000000001
			board.setBbsId("BBSMSTR_000000000001");
			
			//삭제
			if(delChk == null || delChk.size() == 0 ){

			}else{
				LOGGER.debug("삭제 갯수"+delChk.size());
				for(int i =  0 ;  i < delChk.size() ; i++){
					board.setNttId((Long.parseLong(delChk.get(i))));
					bbsMngService.deleteBoardArticle(board);
				}		
			}
		}
	
		return "redirect:/admin/noticeList.do";
    }
    
    
    
    
    /**
     * XSS 방지 처리.
     * 
     * @param data
     * @return
     */
    protected String unscript(String data) {
        if (data == null || data.trim().equals("")) {
            return "";
        }
        
        String ret = data;
        
        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");
        
        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");
        
        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");
        
        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        
        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

        return ret;
    }
}
