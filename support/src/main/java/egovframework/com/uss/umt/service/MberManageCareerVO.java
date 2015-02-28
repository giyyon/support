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
public class MberManageCareerVO extends UserDefaultVO{
	/** 회원ID*/
    private String mberId = "";
	/** 경력순번*/
    private String careerSn = "";
	/** 경력상태코드*/
    private String careerCd = "";
	/** 입사년도*/
    private String joinEnterYear = "";
	/** 입사월*/
    private String joinEnterMonth = "";
	/** 퇴사년도*/
    private String outYear = "";
	/** 퇴사월*/
    private String outMonth = "";
	/** 소속명*/
    private String commpany = "";
	/** 직위*/
    private String position = "";

    /** 업무*/
    private String task = "";

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
	 * @return the careerSn
	 */
	public String getCareerSn() {
	
		return careerSn;
	}

	/**
	 * @param careerSn the careerSn to set
	 */
	public void setCareerSn(String careerSn) {
	
		this.careerSn = careerSn;
	}

	/**
	 * @return the careerCd
	 */
	public String getCareerCd() {
	
		return careerCd;
	}

	/**
	 * @param careerCd the careerCd to set
	 */
	public void setCareerCd(String careerCd) {
	
		this.careerCd = careerCd;
	}

	

	/**
	 * @return the joinEnterYear
	 */
	public String getJoinEnterYear() {
	
		return joinEnterYear;
	}

	/**
	 * @param joinEnterYear the joinEnterYear to set
	 */
	public void setJoinEnterYear(String joinEnterYear) {
	
		this.joinEnterYear = joinEnterYear;
	}

	/**
	 * @return the joinEnterMonth
	 */
	public String getJoinEnterMonth() {
	
		return joinEnterMonth;
	}

	/**
	 * @param joinEnterMonth the joinEnterMonth to set
	 */
	public void setJoinEnterMonth(String joinEnterMonth) {
	
		this.joinEnterMonth = joinEnterMonth;
	}

	/**
	 * @return the outYear
	 */
	public String getOutYear() {
	
		return outYear;
	}

	/**
	 * @param outYear the outYear to set
	 */
	public void setOutYear(String outYear) {
	
		this.outYear = outYear;
	}

	/**
	 * @return the outMonth
	 */
	public String getOutMonth() {
	
		return outMonth;
	}

	/**
	 * @param outMonth the outMonth to set
	 */
	public void setOutMonth(String outMonth) {
	
		this.outMonth = outMonth;
	}

	/**
	 * @return the commpany
	 */
	public String getCommpany() {
	
		return commpany;
	}

	/**
	 * @param commpany the commpany to set
	 */
	public void setCommpany(String commpany) {
	
		this.commpany = commpany;
	}

	/**
	 * @return the position
	 */
	public String getPosition() {
	
		return position;
	}

	/**
	 * @param position the position to set
	 */
	public void setPosition(String position) {
	
		this.position = position;
	}

	/**
	 * @return the task
	 */
	public String getTask() {
	
		return task;
	}

	/**
	 * @param task the task to set
	 */
	public void setTask(String task) {
	
		this.task = task;
	}

	
}