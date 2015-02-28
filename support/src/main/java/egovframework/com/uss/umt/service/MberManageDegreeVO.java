package egovframework.com.uss.umt.service;

/**
 * 일반회원VO클래스로서 일반회원관리 비지니스로직 처리용 항목을 구성한다.
 * @author 박세은
 * @since 20150.02
 * @version 1.0
 * @see1
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   20150.02  박세은        최초 생성
 *
 * </pre>
 */
public class MberManageDegreeVO extends UserDefaultVO{

	/** 회원ID*/
    private String mberId = "";
    
    /** 순번*/
    private String degreeSn = "";
    /** 수료상태코드*/
    private String compltCd = "";
    /** 입학년도*/
    private String enterYear = "";
    /** 입학월*/
    private String enterMonth = "";
    
    /** 졸업년도*/
    private String grdYear = "";
    /** 졸업월*/
    private String grdMonth = "";
    /** 학교*/
    private String school = "";
    /** 학과*/
    private String major = "";
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
	 * @return the degreeSn
	 */
	public String getDegreeSn() {
	
		return degreeSn;
	}
	/**
	 * @param degreeSn the degreeSn to set
	 */
	public void setDegreeSn(String degreeSn) {
	
		this.degreeSn = degreeSn;
	}
	/**
	 * @return the compltCd
	 */
	public String getCompltCd() {
	
		return compltCd;
	}
	/**
	 * @param compltCd the compltCd to set
	 */
	public void setCompltCd(String compltCd) {
	
		this.compltCd = compltCd;
	}
	/**
	 * @return the enterYear
	 */
	public String getEnterYear() {
	
		return enterYear;
	}
	/**
	 * @param enterYear the enterYear to set
	 */
	public void setEnterYear(String enterYear) {
	
		this.enterYear = enterYear;
	}
	/**
	 * @return the enterMonth
	 */
	public String getEnterMonth() {
	
		return enterMonth;
	}
	/**
	 * @param enterMonth the enterMonth to set
	 */
	public void setEnterMonth(String enterMonth) {
	
		this.enterMonth = enterMonth;
	}
	/**
	 * @return the grdYear
	 */
	public String getGrdYear() {
	
		return grdYear;
	}
	/**
	 * @param grdYear the grdYear to set
	 */
	public void setGrdYear(String grdYear) {
	
		this.grdYear = grdYear;
	}
	/**
	 * @return the grdMonth
	 */
	public String getGrdMonth() {
	
		return grdMonth;
	}
	/**
	 * @param grdMonth the grdMonth to set
	 */
	public void setGrdMonth(String grdMonth) {
	
		this.grdMonth = grdMonth;
	}
	/**
	 * @return the school
	 */
	public String getSchool() {
	
		return school;
	}
	/**
	 * @param school the school to set
	 */
	public void setSchool(String school) {
	
		this.school = school;
	}
	/**
	 * @return the major
	 */
	public String getMajor() {
	
		return major;
	}
	/**
	 * @param major the major to set
	 */
	public void setMajor(String major) {
	
		this.major = major;
	}    
    
}