package egovframework.com.uss.umt.service;

/**
 * 일반회원VO클래스로서 일반회원관리 비지니스로직 처리용 항목을 구성한다.
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
 *
 * </pre>
 */
public class MberManageAwardVO extends UserDefaultVO{
	/** 회원ID*/
    private String mberId = "";
	/** 수상순번*/
    private String awardSn = "";
	/** 수상상태코드*/
    private String awardCd = "";
	/** 수상년도*/
    private String awardYear = "";
	/** 수상명*/
    private String awardNm = "";
	/** 발행기관*/
    private String awardOrg = "";
	/**
	 * @return the awardCd
	 */
	public String getAwardCd() {
	
		return awardCd;
	}
	/**
	 * @param awardCd the awardCd to set
	 */
	public void setAwardCd(String awardCd) {
	
		this.awardCd = awardCd;
	}
	/**
	 * @return the mberId
	 */
	public String getMberId() {
	
		return mberId;
	}
	/**
	 * @param mberId the mberId to set
	 */
	public void setMberId(String mberId) {
	
		this.mberId = mberId;
	}
	/**
	 * @return the awardSn
	 */
	public String getAwardSn() {
	
		return awardSn;
	}
	/**
	 * @param awardSn the awardSn to set
	 */
	public void setAwardSn(String awardSn) {
	
		this.awardSn = awardSn;
	}
	/**
	 * @return the awardYear
	 */
	public String getAwardYear() {
	
		return awardYear;
	}
	/**
	 * @param awardYear the awardYear to set
	 */
	public void setAwardYear(String awardYear) {
	
		this.awardYear = awardYear;
	}
	/**
	 * @return the awardNm
	 */
	public String getAwardNm() {
	
		return awardNm;
	}
	/**
	 * @param awardNm the awardNm to set
	 */
	public void setAwardNm(String awardNm) {
	
		this.awardNm = awardNm;
	}
	/**
	 * @return the awardOrg
	 */
	public String getAwardOrg() {
	
		return awardOrg;
	}
	/**
	 * @param awardOrg the awardOrg to set
	 */
	public void setAwardOrg(String awardOrg) {
	
		this.awardOrg = awardOrg;
	}


	
}