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
public class MberManageActiveTyVO extends UserDefaultVO{

	/** 회원ID*/
    private String mberId = "";
    
    /** 활동분류코드*/
    private String activeTyCd = "";

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
	 * @return the activeTyCd
	 */
	public String getActiveTyCd() {
	
		return activeTyCd;
	}

	/**
	 * @param activeTyCd the activeTyCd to set
	 */
	public void setActiveTyCd(String activeTyCd) {
	
		this.activeTyCd = activeTyCd;
	}
    
    
}