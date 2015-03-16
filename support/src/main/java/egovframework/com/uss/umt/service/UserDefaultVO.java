package egovframework.com.uss.umt.service;

import java.io.Serializable;


/**
 * 사용자정보 VO클래스로서일반회원, 기업회원, 업무사용자의  비지니스로직 처리시 기타조건성 항을 구성한다.
 * @author 박세은
 * @since 2015.03.15
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2015.03.15 박세은          최초 생성
 *
 * </pre>
 */
public class UserDefaultVO implements Serializable{
	
	/** 검색조건 사업유형 */
	private String searchBsnsSe = "";
	
	/** 검색조건 회원유형 /개인회원/기업회원/14세미만/해외/탈퇴/비회원*/
	private String searchMberType = "";
	private String searchMberTypeNm = "전체회원분류";
	
	
	/** 검색조건 회원분류 /최고관리자/개인정보관리자/일반관리자/운영위원/전문위원/장학생회원/인증회원/일반회원*/
	private String searchMberSe = "";
	private String searchMberSeNm = "전체회원유형";
	

	/** 검색조건 활동분류 /전문가/고등학교전문가/대학원전문가/강사/통신원*/
	private String searchActiveTyCd = "";
	private String searchActiveTyCdNm = "전체활동분류";
	

	/** 검색조건 */
    private String searchCnd = "";
    
    /** 검색Keyword */
    private String searchWrd = "";
    
    /** 검색사용여부 */
    private String searchUseYn = "";
    
    /** 정렬형태 Default:0*/
    private String sortType = "0";   
    
    /** 정렬 조건이름 */
    private String sortTypeNm = "";
    
    /** 현재페이지 */
    private int pageIndex = 1;
    
    /** 페이지갯수 */
    private int pageUnit = 10;
    
    /** 페이지사이즈 */
    private int pageSize = 10;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;


	/**
	 * @return the searchBsnsSe
	 */
	public String getSearchBsnsSe() {
	
		return searchBsnsSe;
	}

	/**
	 * @param searchBsnsSe the searchBsnsSe to set
	 */
	public void setSearchBsnsSe(String searchBsnsSe) {
	
		this.searchBsnsSe = searchBsnsSe;
	}

	/**
	 * @return the searchMberType
	 */
	public String getSearchMberType() {
	
		return searchMberType;
	}

	/**
	 * @param searchMberType the searchMberType to set
	 */
	public void setSearchMberType(String searchMberType) {
	
		this.searchMberType = searchMberType;
	}

	/**
	 * @return the searchMberSe
	 */
	public String getSearchMberSe() {
	
		return searchMberSe;
	}

	/**
	 * @param searchMberSe the searchMberSe to set
	 */
	public void setSearchMberSe(String searchMberSe) {
	
		this.searchMberSe = searchMberSe;
	}

	/**
	 * @return the searchCnd
	 */
	public String getSearchCnd() {
	
		return searchCnd;
	}

	/**
	 * @param searchCnd the searchCnd to set
	 */
	public void setSearchCnd(String searchCnd) {
	
		this.searchCnd = searchCnd;
	}

	/**
	 * @return the searchWrd
	 */
	public String getSearchWrd() {
	
		return searchWrd;
	}

	/**
	 * @param searchWrd the searchWrd to set
	 */
	public void setSearchWrd(String searchWrd) {
	
		this.searchWrd = searchWrd;
	}

	/**
	 * searchUseYn attribute 값을  리턴한다.
	 * @return String
	 */
	public String getSearchUseYn() {
		return searchUseYn;
	}

	/**
	 * searchUseYn attribute 값을 설정한다.
	 * @param searchUseYn String
	 */
	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}

	/**
	 * pageIndex attribute 값을  리턴한다.
	 * @return int
	 */
	public int getPageIndex() {
		return pageIndex;
	}

	/**
	 * pageIndex attribute 값을 설정한다.
	 * @param pageIndex int
	 */
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	/**
	 * pageUnit attribute 값을  리턴한다.
	 * @return int
	 */
	public int getPageUnit() {
		return pageUnit;
	}

	/**
	 * pageUnit attribute 값을 설정한다.
	 * @param pageUnit int
	 */
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	/**
	 * pageSize attribute 값을  리턴한다.
	 * @return int
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * pageSize attribute 값을 설정한다.
	 * @param pageSize int
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * firstIndex attribute 값을  리턴한다.
	 * @return int
	 */
	public int getFirstIndex() {
		return firstIndex;
	}

	/**
	 * firstIndex attribute 값을 설정한다.
	 * @param firstIndex int
	 */
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	/**
	 * lastIndex attribute 값을  리턴한다.
	 * @return int
	 */
	public int getLastIndex() {
		return lastIndex;
	}

	/**
	 * lastIndex attribute 값을 설정한다.
	 * @param lastIndex int
	 */
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	/**
	 * recordCountPerPage attribute 값을  리턴한다.
	 * @return int
	 */
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	/**
	 * recordCountPerPage attribute 값을 설정한다.
	 * @param recordCountPerPage int
	 */
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	/**
	 * @return the searchActiveTyCd
	 */
	public String getSearchActiveTyCd() {
	
		return searchActiveTyCd;
	}

	/**
	 * @param searchActiveTyCd the searchActiveTyCd to set
	 */
	public void setSearchActiveTyCd(String searchActiveTyCd) {
	
		this.searchActiveTyCd = searchActiveTyCd;
	}

	/**
	 * @return the sortType
	 */
	public String getSortType() {
	
		return sortType;
	}

	/**
	 * @param sortType the sortType to set
	 */
	public void setSortType(String sortType) {
	
		this.sortType = sortType;
	}
    
	/**
	 * @return the sortTypeNm
	 */
	public String getSortTypeNm() {
		if(sortType.equals("0")){
			sortTypeNm = "최근가입일순";
		}else if(sortType.equals("1")){
			sortTypeNm = "최근수정일순";
		}else if(sortType.equals("2")){
			sortTypeNm = "최근접속일순";
		}
		return sortTypeNm;
	}

	/**
	 * @return the searchMberTypeNm
	 */
	public String getSearchMberTypeNm() {
	
		return searchMberTypeNm;
	}

	/**
	 * @param searchMberTypeNm the searchMberTypeNm to set
	 */
	public void setSearchMberTypeNm(String searchMberTypeNm) {
	
		this.searchMberTypeNm = searchMberTypeNm;
	}

	/**
	 * @return the searchMberSeNm
	 */
	public String getSearchMberSeNm() {
	
		return searchMberSeNm;
	}

	/**
	 * @param searchMberSeNm the searchMberSeNm to set
	 */
	public void setSearchMberSeNm(String searchMberSeNm) {
	
		this.searchMberSeNm = searchMberSeNm;
	}

	/**
	 * @return the searchActiveTyCdNm
	 */
	public String getSearchActiveTyCdNm() {
	
		return searchActiveTyCdNm;
	}

	/**
	 * @param searchActiveTyCdNm the searchActiveTyCdNm to set
	 */
	public void setSearchActiveTyCdNm(String searchActiveTyCdNm) {
	
		this.searchActiveTyCdNm = searchActiveTyCdNm;
	}

}
