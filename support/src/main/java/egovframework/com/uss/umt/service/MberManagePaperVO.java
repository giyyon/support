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
public class MberManagePaperVO extends UserDefaultVO{

	/** 회원ID*/
    private String mberId = "";
	/** 논문순번*/
    private String paperSn = "";
	/** 논문상태코드*/
    private String paperCd = "";
	/** 논문년도*/
    private String paperYear = "";
	/** 논문명*/
    private String paperNm = "";
	/** 발행기관*/
    private String paperOrg = "";
	/** 논문월*/
    private String paperMonth= "";
	/**
	 * @return the paperMonth
	 */
	public String getPaperMonth() {
	
		return paperMonth;
	}
	/**
	 * @param paperMonth the paperMonth to set
	 */
	public void setPaperMonth(String paperMonth) {
	
		this.paperMonth = paperMonth;
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
	 * @return the paperSn
	 */
	public String getPaperSn() {
	
		return paperSn;
	}
	/**
	 * @param paperSn the paperSn to set
	 */
	public void setPaperSn(String paperSn) {
	
		this.paperSn = paperSn;
	}
	/**
	 * @return the paperCd
	 */
	public String getPaperCd() {
	
		return paperCd;
	}
	/**
	 * @param paperCd the paperCd to set
	 */
	public void setPaperCd(String paperCd) {
	
		this.paperCd = paperCd;
	}
	/**
	 * @return the paperYear
	 */
	public String getPaperYear() {
	
		return paperYear;
	}
	/**
	 * @param paperYear the paperYear to set
	 */
	public void setPaperYear(String paperYear) {
	
		this.paperYear = paperYear;
	}
	/**
	 * @return the paperNm
	 */
	public String getPaperNm() {
	
		return paperNm;
	}
	/**
	 * @param paperNm the paperNm to set
	 */
	public void setPaperNm(String paperNm) {
	
		this.paperNm = paperNm;
	}
	/**
	 * @return the paperOrg
	 */
	public String getPaperOrg() {
	
		return paperOrg;
	}
	/**
	 * @param paperOrg the paperOrg to set
	 */
	public void setPaperOrg(String paperOrg) {
	
		this.paperOrg = paperOrg;
	}
    
    
}