package support.company.web;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.Globals;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.ems.service.SndngMailVO;
import egovframework.com.uat.uia.service.EgovLoginService;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovClntInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import support.common.model.JsonObject;
import support.util.JSONResponseUtil;
import support.util.SupportUtil;

@Controller
@RequestMapping(value = "/company")
public class CompanyController {


	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(CompanyController.class);

	/**
	 * 회사 소개  화면으로 들어간다
	 * @param 
	 * @return 회사 소개  화면
	 * @exception Exception
	 */
	@RequestMapping(value = "/ci.do")
	public String ci() throws Exception {
		return ".basic_company/ci";
	}

	/**
	 * 설립 목적  화면
	 * @param 
	 * @return 회사 소개  화면
	 * @exception Exception
	 */
	@RequestMapping(value = "/establish.do")
	public String establish() throws Exception {
		return ".basic_company/establish";
	}
	
	/**
	 * 약도  화면
	 * @param 
	 * @return 회사 소개  화면
	 * @exception Exception
	 */
	@RequestMapping(value = "map.do")
	public String map() throws Exception {
		return ".basic_company/map";
	}
	
	/**
	 * 인사말 목적  화면
	 * @param 
	 * @return 회사 소개  화면
	 * @exception Exception
	 */
	@RequestMapping(value = "/introduce.do")
	public String introduce() throws Exception {
		return ".basic_company/introduce";
	}
	
	/**
	 * 조직도 목적  화면
	 * @param 
	 * @return 회사 소개  화면
	 * @exception Exception
	 */
	@RequestMapping(value = "/orgMap.do")
	public String orgMap() throws Exception {
		return ".basic_company/orgMap";
	}
	
	/**
	 * 조직도 목적  화면
	 * @param 
	 * @return 회사 소개  화면
	 * @exception Exception
	 */
	@RequestMapping(value = "/family.do")
	public String family() throws Exception {
		return ".basic_company/family";
	}
}