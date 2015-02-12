package support.admin.customer.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;




import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.com.cop.bbs.service.EgovBBSCommentService;
import egovframework.com.cop.bbs.service.EgovBBSManageService;
import egovframework.com.cop.bbs.service.EgovBBSSatisfactionService;
import egovframework.com.cop.bbs.service.EgovBBSScrapService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
@RequestMapping(value = "/admin/customer")
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

    //---------------------------------
    // 2009.06.29 : 2단계 기능 추가
    // 2011.07.01 : 댓글, 스크랩, 만족도 조사 기능의 종속성 제거
    //---------------------------------
    @Autowired(required=false)
    private EgovBBSCommentService bbsCommentService;
    
    @Autowired(required=false)
    private EgovBBSSatisfactionService bbsSatisfactionService;
    
    @Autowired(required=false)
    private EgovBBSScrapService bbsScrapService;
    
	@Override
	public void afterPropertiesSet() throws Exception {

		// TODO Auto-generated method stub
		
	}

	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {

		// TODO Auto-generated method stub
		
	}
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String index(ModelMap model) {
		return "basic_customer/noticeList";
	}
	@RequestMapping(value="/notice2.do", method = RequestMethod.GET)
	public String notice2(ModelMap model) {
		return "default";
	}
	
	@RequestMapping(value="/notice3.do", method = RequestMethod.GET)
	public ModelAndView notice(ModelMap model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		//String redirectUrl = request.getContextPath() + "/futures/topic/view.fts?"
		String redirectUrl = "/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000001";
		RedirectView rv = new RedirectView(redirectUrl);
		rv.setExposeModelAttributes(false);
		
		mav.setViewName(redirectUrl);
		
		return mav;
		
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
    public String selectNoticeBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	//log.debug(this.getClass().getName() + " user.getId() "+ user.getId());
	//log.debug(this.getClass().getName() + " user.getName() "+ user.getName());
	//log.debug(this.getClass().getName() + " user.getUniqId() "+ user.getUniqId());
	//log.debug(this.getClass().getName() + " user.getOrgnztId() "+ user.getOrgnztId());
	//log.debug(this.getClass().getName() + " user.getUserSe() "+ user.getUserSe());
	//log.debug(this.getClass().getName() + " user.getEmail() "+ user.getEmail());

	//String attrbFlag = "";
	
	
	//공지사항 게시판 아이디 : BBSMSTR_000000000001
	if("".equals(boardVO.getBbsId()))
			boardVO.setBbsId("BBSMSTR_000000000001");

	//공지사항 게시판 정렬 순서 
	logger.debug("공지게시판 boardVO.getSortType()" + boardVO.getSortType());
	if("".equals(boardVO.getSortType())){
		logger.debug("공지게시판 boardVO.getSortType() 빈공백");
		boardVO.setSortType("0");
    }
	
	boardVO.setBbsId(boardVO.getBbsId());
	boardVO.setBbsNm(boardVO.getBbsNm());

	BoardMasterVO vo = new BoardMasterVO();
	
	vo.setBbsId(boardVO.getBbsId());
	vo.setUniqId(user.getUniqId());
	
	BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);
	
	//-------------------------------
	// 방명록이면 방명록 URL로 forward
	//-------------------------------
	if (master.getBbsTyCode().equals("BBST04")) {
	    return "forward:/cop/bbs/selectGuestList.do";
	}
	////-----------------------------

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
	Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, master.getBbsAttrbCode());//2011.09.07
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

	return "basic_customer/noticeList";
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
    public String selectNoticeBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
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
	// 이전 / 이후 게시물 id 조회
//	if("prev".equals(boardVO.getArticleDirection()) || ("next".equals(boardVO.getArticleDirection()))
//			boardVO.setNttId(nttId);BbsId("BBSMSTR_000000000001");
//		

	
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
	////-----------------------------
	
	//----------------------------
	// 2009.06.29 : 2단계 기능 추가
	// 2011.07.01 : 댓글, 스크랩, 만족도 조사 기능의 종속성 제거
	//----------------------------
	if (bbsCommentService != null){
		if (bbsCommentService.canUseComment(boardVO.getBbsId())) {
		    model.addAttribute("useComment", "true");
		}
	}
	if (bbsSatisfactionService != null) {
		if (bbsSatisfactionService.canUseSatisfaction(boardVO.getBbsId())) {
		    model.addAttribute("useSatisfaction", "true");
		}
	}
	if (bbsScrapService != null ) {
		if (bbsScrapService.canUseScrap()) {
		    model.addAttribute("useScrap", "true");
		}
	}
	////--------------------------
	return "basic_customer/noticeInqire";
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
    public String selectNoticeBoardArticlePopUp(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
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
	////-----------------------------
	
	//----------------------------
	// 2009.06.29 : 2단계 기능 추가
	// 2011.07.01 : 댓글, 스크랩, 만족도 조사 기능의 종속성 제거
	//----------------------------
	if (bbsCommentService != null){
		if (bbsCommentService.canUseComment(boardVO.getBbsId())) {
		    model.addAttribute("useComment", "true");
		}
	}
	if (bbsSatisfactionService != null) {
		if (bbsSatisfactionService.canUseSatisfaction(boardVO.getBbsId())) {
		    model.addAttribute("useSatisfaction", "true");
		}
	}
	if (bbsScrapService != null ) {
		if (bbsScrapService.canUseScrap()) {
		    model.addAttribute("useScrap", "true");
		}
	}
	////--------------------------
	return "popup_noticeInqirePopUp";
    }
    
}
