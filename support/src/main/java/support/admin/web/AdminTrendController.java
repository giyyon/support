package support.admin.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringEscapeUtils;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.Board;
import egovframework.com.cop.bbs.service.BoardMaster;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.com.cop.bbs.service.EgovBBSCommentService;
import egovframework.com.cop.bbs.service.EgovBBSManageService;
import egovframework.com.cop.bbs.service.EgovBBSSatisfactionService;
import egovframework.com.cop.bbs.service.EgovBBSScrapService;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
@RequestMapping(value = "/admin")
public class AdminTrendController implements ApplicationContextAware, InitializingBean {
	
	//protected Logger log = Logger.getLogger(this.getClass());
	private static final Logger logger = LoggerFactory.getLogger(AdminTrendController.class);
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


    /**
     * 게시물에 대한 목록을 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/trendList.do") 
    public String trendList(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	//최신동향 게시판 아이디 : BBSMSTR_000000000001
	
	boardVO.setBbsId("BBSMSTR_000000000002");

	//최신동향 게시판 정렬 순서 
	logger.debug("최신동향 boardVO.getSortType()" + boardVO.getSortType());
	if("".equals(boardVO.getSortType())){
		logger.debug("최신동향 boardVO.getSortType() 빈공백");
		boardVO.setSortType("0");
    }
	
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
	Map<String, Object> map = bbsMngService.selectAdminTrendArticleList(boardVO, "");
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("boardVO", boardVO);
	model.addAttribute("paginationInfo", paginationInfo);

	return ".basic_admin/community/trendList";
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
    @RequestMapping("/trendModify.do")
    public String trendModify(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	// 조회수 증가 여부 지정
	boardVO.setPlusCount(true);

	//최신동향  아이디 : BBSMSTR_000000000002
	boardVO.setBbsId("BBSMSTR_000000000002");
	
	//최신동향  정렬 순서 
	logger.debug("최신동향 boardVO.getSortType()" + boardVO.getSortType());
	if("".equals(boardVO.getSortType())){
		logger.debug("최신동향 boardVO.getSortType() 빈공백");
		boardVO.setSortType("0");
    }

	// 등록 화면에서 등록 후  redirect 된 경우 nttId를 model 객체에서 뽑아와야 한다.
	if(model.get("nttId") != null){
		long nttId = (Long.parseLong(model.get("nttId").toString()));
		if(nttId != 0){
			boardVO.setNttId(nttId);
		}	
	}	
	
	BoardVO vo = new BoardVO();
	if(boardVO.getNttId() != 0){
		 vo = bbsMngService.selectBoardArticle(boardVO);
	}else{
		vo.setBbsId("BBSMSTR_000000000002");
		// 신규 등록인 경우
		vo.setFrstRegisterId(user.getId());
		vo.setFrstRegisterNm(user.getName());
		vo.setFrstRegisterPnttm(EgovDateUtil.getCurrentDate("yyyy-mm-dd"));
		vo.setNtcrId(user.getId());
		vo.setNtcrNm(user.getName());
		
		//공유 범위 지정. 관리자가 아닌 경우 공유 범위는 접속 중인 시스템의 범위를 따라간다.
		String bsnsSe = EgovProperties.getProperty("Globals.BsnsSe");
		String bsnsSeShare = "";
		if (bsnsSe.equals("A"))
			bsnsSeShare = "100";
		else if (bsnsSe.equals("B"))
			bsnsSeShare = "010";
		else if (bsnsSe.equals("C"))
			bsnsSeShare = "001";
		vo.setBsnsSeShare(bsnsSeShare);
	}

	model.addAttribute("result", vo);

	ComDefaultCodeVO codeVo = new ComDefaultCodeVO();
	//최신동향정보분류 목록
	codeVo.setCodeId("SUP016");
	List<?> trendSe_result = cmmUseService.selectCmmCodeDetail(codeVo);
	model.addAttribute("trendSe_result", trendSe_result); 

	return ".basic_admin/community/trendModify";
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
    @RequestMapping("/deleteTrendArticle.do")
    public String deleteTrendArticle(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model) throws Exception {
	
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	if (isAuthenticated) {
	    board.setLastUpdusrId(user.getUniqId());
	    
	    //최신동향 게시판 아이디 : BBSMSTR_000000000001
		board.setBbsId("BBSMSTR_000000000002");
		
	    bbsMngService.deleteBoardArticle(board);
	}

	return "redirect:/admin/trendList.do";
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
    @RequestMapping("/deleteCheckedTrendList.do")
    public String deleteCheckedTrendList(@ModelAttribute("searchVO") BoardVO boardVO,
    		                                                      @ModelAttribute("board") Board board,
    		                                                      @ModelAttribute("bdMstr") BoardMaster bdMstr, 
    		                                                      @RequestParam(value="delChk", required=true) List<String> delChk,
    		                                                      ModelMap model) throws Exception {
	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		if (isAuthenticated) {
		    board.setLastUpdusrId(user.getUniqId());
		    
		    //최신동향 아이디 : BBSMSTR_000000000002
			board.setBbsId("BBSMSTR_000000000002");
			
			//삭제
			if(delChk == null || delChk.size() == 0 ){

			}else{
				
				for(int i =  0 ;  i < delChk.size() ; i++){
					board.setNttId((Long.parseLong(delChk.get(i))));
					bbsMngService.deleteBoardArticle(board);
				}		
			}
		}
	
		return "redirect:/admin/trendList.do";
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
    @RequestMapping("/insertTrendArticle.do")
    public String insertTrendArticle(
//    		                                                      final MultipartHttpServletRequest multiRequest, 
    		                                                      @ModelAttribute("searchVO") BoardVO boardVO, 
	                                                              @ModelAttribute("board") Board board, 
	                                                              RedirectAttributes redirectAttributes,
                                                              	  ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		long nttId = 0;
		if (isAuthenticated) {
		    board.setFrstRegisterId(user.getId());
		    // 최신동향  게시판 아이디 : BBSMSTR_000000000001
		    board.setBbsId("BBSMSTR_000000000002");
		    	    
		    board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    
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
			return "redirect:/admin/trendModify.do";
		}else{
			//등록
			return "redirect:/admin/trendList.do";
		}
    }
}
