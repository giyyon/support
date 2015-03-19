package egovframework.com.uss.umt.service;

/**
 * 기업회원VO클래스로서 기업회원관리 비지니스로직 처리용 항목을 구성한다.
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
public class EntrprsManageVO  extends UserDefaultVO{

	/** 이전비밀번호 - 비밀번호 변경시 사용*/
    private String oldPassword = "";
    private String reprsntEmailAdresHead = "";
    private String reprsntEmailAdresTail = "";
    
    private String mngEmailAdresHead = "";
    private String mngEmailAdresTail = "";
    
    private String taxEmailAdresHead = "";
    private String taxEmailAdresTail = "";
    
    private String applcntEmailAdresHead = "";
    private String applcntEmailAdresTail = "";
   
    /**
	 * 사용자고유아이디
	 */
	private String uniqId="";
	/**
	 * 사용자 유형
	 */
	private String userTy;
	/**
	 * 주소
	 */
	private String adres;
	/**
	 * 상세주소
	 */
	private String detailAdres;
	/**
	 * 신청자 주민등록번호
	 */
	private String applcntIhidnum;
	/**
	 * 신청자 명
	 */
	private String applcntNm;
	/**
	 * 사업자번호
	 */
	private String bizrno;
	/**
	 * 회사명
	 */
	private String cmpnyNm;
	/**
	 * 대표이사
	 */
	private String cxfc;
	/**
	 * 기업 회원 ID
	 */
	private String entrprsmberId;
	/**
	 * 기업 회원 비밀번호
	 */
	private String entrprsMberPassword;
	/**
	 * 기업 회원 비밀번호 정답
	 */
	private String entrprsMberPasswordCnsr;
	/**
	 * 기업 회원 비밀번호 힌트
	 */
	private String entrprsMberPasswordHint;
	/**
	 * 기업 회원 상태
	 */
	private String entrprsMberSttus;
	/**
	 * 기업구분코드
	 */
	private String entrprsSeCode;
	/**
	 * 팩스번호
	 */
	private String fxnum;
	/**
	 * 그룹 ID
	 */
	private String groupId;
	/**
	 * 업종코드
	 */
	private String indutyCode;
	/**
	 * 법인등록번호
	 */
	private String jurirno;
	/**
	 * 지역번호
	 */
	private String areaNo;
	/**
	 * 회사끝전화번호
	 */
	private String entrprsEndTelno;
	/**
	 * 회사중간전화번호
	 */
	private String entrprsMiddleTelno;	
	/**
	 * 가입 일자
	 */
	private String sbscrbDe;
	/**
	 * 우편번호
	 */	
	private String zip;
	/**
	 * 신청자 이메일주소
	 */
	private String applcntEmailAdres;
	
	/** 이동전화번호              */
	private String mbtlnum                  ;
/** 별명                      */
	private String nick                     ;
/** 회사명공개여부            */
	private String cmpnyNmOthbcAt           ;
/** 사업자등록번호공개여부    */
	private String bizrnoOthbcAt            ;
/** 별명공개여부              */
	private String nickOthbcAt              ;
/** 직업분야                  */
	private String jobArea                  ;
/** 직업업종                  */
	private String jobType                  ;
/** 직업직종                  */
	private String jobClass                 ;
/** 직업공개여부              */
	private String jobOthbcAt               ;
/** 설립년도                  */
	private String establishYear            ;
/** 설립월                    */
	private String establishMonth           ;
/** 설립일                    */
	private String establishDay             ;
/** 설립일공개여부            */
	private String establishOthbcAt         ; 
/** 대표이메일주소            */
	private String reprsntEmailAdres        ;
/** 대표이메일주소공개여부    */
	private String reprsntEmailAdresOthbcAt ;
/** 대표수신여부              */
	private String reprsntRecvAt            ;
/** 대표지역번호              */
	private String reprsntAreaNo            ;
/** 대표중간전화번호          */
	private String reprsntEntrprsMiddleTelno;
/** 대표끝전화번호            */
	private String reprsntEntrprsEndTelno   ;
/** 전화공개여부              */
	private String telOthbcAt               ;
/** 팩스번호공개여부          */
	private String fxnumOthbcAt             ;
/** 사업자등록증첨부파일      */
	private String atchBizFileId            ;
/** 소속기관부서              */
	private String pstinstDeptNm            ;
/** 직위명                    */
	private String ofcpsNm                  ;
/** 담당자수신여부            */
	private String applcntRecvAt            ;
/** 첨부대표사진파일ID        */
	private String atchImgLogoFileId        ;
/** 첨부1사진파일ID           */
	private String atchImg1FileId           ;
/** 첨부2사진파일ID           */
	private String atchImg2FileId           ;
/** 첨부3사진파일ID           */
	private String atchImg3FileId           ;
/** 첨부4사진파일ID           */
	private String atchImg4FileId           ;
/** 요약소개                  */
	private String shortNotice              ;
/** 홈페이지                  */
	private String homepageUrl              ;
/** 블로그                    */
	private String blogUrl                  ;
/** 쇼셜                      */
	private String socialUrl                ;
/** 직원수                    */
	private int empCnt                      ;
/** 자본금                    */
	private int capitalMoney                ;
/** 매출액                    */
	private int salesMoney                  ;
/** 첨부소개파일ID            */
	private String atchReportFileId         ;
/** 첨부포트폴리오파일ID      */
	private String atchPortFileId           ;
/** 총괄책임자명              */
	private String mngNm                    ;
/** 총괄책임자소속기관부서    */
	private String mngPstinstDeptNm         ;
/** 총괄책임자직위명          */
	private String mngOfcpsNm               ;
/** 총괄책임자이메일주소      */
	private String mngEmailAdres            ;
/** 총괄책임자이동전화번호    */
	private String mngMbtlnum               ;
/** 총괄책임자대표지역번호    */
	private String mngAreaNo                ;
/** 총괄책임자대표중간전화번호*/
	private String mngEntrprsMiddleTelno    ;
/** 총괄책임자대표끝전화번호  */
	private String mngEntrprsEndTelno       ;
/** 세무담당자명              */
	private String taxNm                    ;
/** 세무담당자소속기관부서    */
	private String taxPstinstDeptNm         ;
/** 세무담당자직위명          */
	private String taxOfcpsNm               ;
/** 세무담당자이메일주소      */
	private String taxEmailAdres            ;
/** 세무담당자이동전화번호    */
	private String taxMbtlnum               ;
/** 세무담당자대표지역번호    */
	private String taxAreaNo                ;
/** 세무담당자대표중간전화번호*/
	private String taxEntrprsMiddleTelno    ;
/** 세무담당자대표끝전화번호  */
	private String taxEntrprsEndTelno       ;
/** 자기소개                  */
	private String notice                   ;

	/** 대표이사공개여부                  */
	private String cxfcOthbcAt                   ;
	
	/** 대표주소공개여부                  */
	private String adresOthbcAt                   ;
	
	/**사업구분        */
	 private String bsnsSe ;     
	/**회원유형        */
	 private String entrprsMberType;
	/**회원분류        */
	 private String entrprsMberSe;
	 private String entrprsMberSeNm;	
	/**접속일자        */
	 private String loginDe;
	/**수정일자        */
	 private String updtDe;
	 
	/**첨부관리용파일ID*/
	 private String atchManageFileId;
	
	/**
	 * oldPassword attribute 값을  리턴한다.
	 * @return String
	 */
	public String getOldPassword() {
		return oldPassword;
	}
	/**
	 * oldPassword attribute 값을 설정한다.
	 * @param oldPassword String
	 */
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	/**
	 * uniqId attribute 값을  리턴한다.
	 * @return String
	 */
	public String getUniqId() {
		return uniqId;
	}
	/**
	 * uniqId attribute 값을 설정한다.
	 * @param uniqId String
	 */
	public void setUniqId(String uniqId) {
		this.uniqId = uniqId;
	}
	/**
	 * userTy attribute 값을  리턴한다.
	 * @return String
	 */
	public String getUserTy() {
		return userTy;
	}
	/**
	 * userTy attribute 값을 설정한다.
	 * @param userTy String
	 */
	public void setUserTy(String userTy) {
		this.userTy = userTy;
	}
	/**
	 * adres attribute 값을  리턴한다.
	 * @return String
	 */
	public String getAdres() {
		return adres;
	}
	/**
	 * adres attribute 값을 설정한다.
	 * @param adres String
	 */
	public void setAdres(String adres) {
		this.adres = adres;
	}
	/**
	 * detailAdres attribute 값을  리턴한다.
	 * @return String
	 */
	public String getDetailAdres() {
		return detailAdres;
	}
	/**
	 * detailAdres attribute 값을 설정한다.
	 * @param detailAdres String
	 */
	public void setDetailAdres(String detailAdres) {
		this.detailAdres = detailAdres;
	}
	/**
	 * applcntIhidnum attribute 값을  리턴한다.
	 * @return String
	 */
	public String getApplcntIhidnum() {
		return applcntIhidnum;
	}
	/**
	 * applcntIhidnum attribute 값을 설정한다.
	 * @param applcntIhidnum String
	 */
	public void setApplcntIhidnum(String applcntIhidnum) {
		this.applcntIhidnum = applcntIhidnum;
	}
	/**
	 * applcntNm attribute 값을  리턴한다.
	 * @return String
	 */
	public String getApplcntNm() {
		return applcntNm;
	}
	/**
	 * applcntNm attribute 값을 설정한다.
	 * @param applcntNm String
	 */
	public void setApplcntNm(String applcntNm) {
		this.applcntNm = applcntNm;
	}
	/**
	 * bizrno attribute 값을  리턴한다.
	 * @return String
	 */
	public String getBizrno() {
		return bizrno;
	}
	/**
	 * bizrno attribute 값을 설정한다.
	 * @param bizrno String
	 */
	public void setBizrno(String bizrno) {
		this.bizrno = bizrno;
	}
	/**
	 * cmpnyNm attribute 값을  리턴한다.
	 * @return String
	 */
	public String getCmpnyNm() {
		return cmpnyNm;
	}
	/**
	 * cmpnyNm attribute 값을 설정한다.
	 * @param cmpnyNm String
	 */
	public void setCmpnyNm(String cmpnyNm) {
		this.cmpnyNm = cmpnyNm;
	}
	/**
	 * cxfc attribute 값을  리턴한다.
	 * @return String
	 */
	public String getCxfc() {
		return cxfc;
	}
	/**
	 * cxfc attribute 값을 설정한다.
	 * @param cxfc String
	 */
	public void setCxfc(String cxfc) {
		this.cxfc = cxfc;
	}
	/**
	 * entrprsmberId attribute 값을  리턴한다.
	 * @return String
	 */
	public String getEntrprsmberId() {
		return entrprsmberId;
	}
	/**
	 * entrprsmberId attribute 값을 설정한다.
	 * @param entrprsmberId String
	 */
	public void setEntrprsmberId(String entrprsmberId) {
		this.entrprsmberId = entrprsmberId;
	}
	/**
	 * entrprsMberPassword attribute 값을  리턴한다.
	 * @return String
	 */
	public String getEntrprsMberPassword() {
		return entrprsMberPassword;
	}
	/**
	 * entrprsMberPassword attribute 값을 설정한다.
	 * @param entrprsMberPassword String
	 */
	public void setEntrprsMberPassword(String entrprsMberPassword) {
		this.entrprsMberPassword = entrprsMberPassword;
	}
	/**
	 * entrprsMberPasswordCnsr attribute 값을  리턴한다.
	 * @return String
	 */
	public String getEntrprsMberPasswordCnsr() {
		return entrprsMberPasswordCnsr;
	}
	/**
	 * entrprsMberPasswordCnsr attribute 값을 설정한다.
	 * @param entrprsMberPasswordCnsr String
	 */
	public void setEntrprsMberPasswordCnsr(String entrprsMberPasswordCnsr) {
		this.entrprsMberPasswordCnsr = entrprsMberPasswordCnsr;
	}
	/**
	 * entrprsMberPasswordHint attribute 값을  리턴한다.
	 * @return String
	 */
	public String getEntrprsMberPasswordHint() {
		return entrprsMberPasswordHint;
	}
	/**
	 * entrprsMberPasswordHint attribute 값을 설정한다.
	 * @param entrprsMberPasswordHint String
	 */
	public void setEntrprsMberPasswordHint(String entrprsMberPasswordHint) {
		this.entrprsMberPasswordHint = entrprsMberPasswordHint;
	}
	/**
	 * entrprsMberSttus attribute 값을  리턴한다.
	 * @return String
	 */
	public String getEntrprsMberSttus() {
		return entrprsMberSttus;
	}
	/**
	 * entrprsMberSttus attribute 값을 설정한다.
	 * @param entrprsMberSttus String
	 */
	public void setEntrprsMberSttus(String entrprsMberSttus) {
		this.entrprsMberSttus = entrprsMberSttus;
	}
	/**
	 * entrprsSeCode attribute 값을  리턴한다.
	 * @return String
	 */
	public String getEntrprsSeCode() {
		return entrprsSeCode;
	}
	/**
	 * entrprsSeCode attribute 값을 설정한다.
	 * @param entrprsSeCode String
	 */
	public void setEntrprsSeCode(String entrprsSeCode) {
		this.entrprsSeCode = entrprsSeCode;
	}
	/**
	 * fxnum attribute 값을  리턴한다.
	 * @return String
	 */
	public String getFxnum() {
		return fxnum;
	}
	/**
	 * fxnum attribute 값을 설정한다.
	 * @param fxnum String
	 */
	public void setFxnum(String fxnum) {
		this.fxnum = fxnum;
	}
	/**
	 * groupId attribute 값을  리턴한다.
	 * @return String
	 */
	public String getGroupId() {
		return groupId;
	}
	/**
	 * groupId attribute 값을 설정한다.
	 * @param groupId String
	 */
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	/**
	 * indutyCode attribute 값을  리턴한다.
	 * @return String
	 */
	public String getIndutyCode() {
		return indutyCode;
	}
	/**
	 * indutyCode attribute 값을 설정한다.
	 * @param indutyCode String
	 */
	public void setIndutyCode(String indutyCode) {
		this.indutyCode = indutyCode;
	}
	/**
	 * jurirno attribute 값을  리턴한다.
	 * @return String
	 */
	public String getJurirno() {
		return jurirno;
	}
	/**
	 * jurirno attribute 값을 설정한다.
	 * @param jurirno String
	 */
	public void setJurirno(String jurirno) {
		this.jurirno = jurirno;
	}
	/**
	 * areaNo attribute 값을  리턴한다.
	 * @return String
	 */
	public String getAreaNo() {
		return areaNo;
	}
	/**
	 * areaNo attribute 값을 설정한다.
	 * @param areaNo String
	 */
	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}
	/**
	 * entrprsEndTelno attribute 값을  리턴한다.
	 * @return String
	 */
	public String getEntrprsEndTelno() {
		return entrprsEndTelno;
	}
	/**
	 * entrprsEndTelno attribute 값을 설정한다.
	 * @param entrprsEndTelno String
	 */
	public void setEntrprsEndTelno(String entrprsEndTelno) {
		this.entrprsEndTelno = entrprsEndTelno;
	}
	/**
	 * entrprsMiddleTelno attribute 값을  리턴한다.
	 * @return String
	 */
	public String getEntrprsMiddleTelno() {
		return entrprsMiddleTelno;
	}
	/**
	 * entrprsMiddleTelno attribute 값을 설정한다.
	 * @param entrprsMiddleTelno String
	 */
	public void setEntrprsMiddleTelno(String entrprsMiddleTelno) {
		this.entrprsMiddleTelno = entrprsMiddleTelno;
	}
	/**
	 * sbscrbDe attribute 값을  리턴한다.
	 * @return String
	 */
	public String getSbscrbDe() {
		return sbscrbDe;
	}
	/**
	 * sbscrbDe attribute 값을 설정한다.
	 * @param sbscrbDe String
	 */
	public void setSbscrbDe(String sbscrbDe) {
		this.sbscrbDe = sbscrbDe;
	}
	/**
	 * zip attribute 값을  리턴한다.
	 * @return String
	 */
	public String getZip() {
		return zip;
	}
	/**
	 * zip attribute 값을 설정한다.
	 * @param zip String
	 */
	public void setZip(String zip) {
		this.zip = zip;
	}
	/**
	 * applcntEmailAdres attribute 값을  리턴한다.
	 * @return String
	 */
	public String getApplcntEmailAdres() {
		return applcntEmailAdres;
	}
	/**
	 * applcntEmailAdres attribute 값을 설정한다.
	 * @param applcntEmailAdres String
	 */
	public void setApplcntEmailAdres(String applcntEmailAdres) {
		this.applcntEmailAdres = applcntEmailAdres;
	}
	/**
	 * @return the mbtlnum
	 */
	public String getMbtlnum() {
	
		return mbtlnum;
	}
	/**
	 * @param mbtlnum the mbtlnum to set
	 */
	public void setMbtlnum(String mbtlnum) {
	
		this.mbtlnum = mbtlnum;
	}
	/**
	 * @return the nick
	 */
	public String getNick() {
	
		return nick;
	}
	/**
	 * @param nick the nick to set
	 */
	public void setNick(String nick) {
	
		this.nick = nick;
	}
	/**
	 * @return the cmpnyNmOthbcAt
	 */
	public String getCmpnyNmOthbcAt() {
	
		return cmpnyNmOthbcAt;
	}
	/**
	 * @param cmpnyNmOthbcAt the cmpnyNmOthbcAt to set
	 */
	public void setCmpnyNmOthbcAt(String cmpnyNmOthbcAt) {
	
		this.cmpnyNmOthbcAt = cmpnyNmOthbcAt;
	}
	/**
	 * @return the bizrnoOthbcAt
	 */
	public String getBizrnoOthbcAt() {
	
		return bizrnoOthbcAt;
	}
	/**
	 * @param bizrnoOthbcAt the bizrnoOthbcAt to set
	 */
	public void setBizrnoOthbcAt(String bizrnoOthbcAt) {
	
		this.bizrnoOthbcAt = bizrnoOthbcAt;
	}
	/**
	 * @return the nickOthbcAt
	 */
	public String getNickOthbcAt() {
	
		return nickOthbcAt;
	}
	/**
	 * @param nickOthbcAt the nickOthbcAt to set
	 */
	public void setNickOthbcAt(String nickOthbcAt) {
	
		this.nickOthbcAt = nickOthbcAt;
	}
	/**
	 * @return the jobArea
	 */
	public String getJobArea() {
	
		return jobArea;
	}
	/**
	 * @param jobArea the jobArea to set
	 */
	public void setJobArea(String jobArea) {
	
		this.jobArea = jobArea;
	}
	/**
	 * @return the jobType
	 */
	public String getJobType() {
	
		return jobType;
	}
	/**
	 * @param jobType the jobType to set
	 */
	public void setJobType(String jobType) {
	
		this.jobType = jobType;
	}
	/**
	 * @return the jobClass
	 */
	public String getJobClass() {
	
		return jobClass;
	}
	/**
	 * @param jobClass the jobClass to set
	 */
	public void setJobClass(String jobClass) {
	
		this.jobClass = jobClass;
	}
	/**
	 * @return the jobOthbcAt
	 */
	public String getJobOthbcAt() {
	
		return jobOthbcAt;
	}
	/**
	 * @param jobOthbcAt the jobOthbcAt to set
	 */
	public void setJobOthbcAt(String jobOthbcAt) {
	
		this.jobOthbcAt = jobOthbcAt;
	}
	/**
	 * @return the establishYear
	 */
	public String getEstablishYear() {
	
		return establishYear;
	}
	/**
	 * @param establishYear the establishYear to set
	 */
	public void setEstablishYear(String establishYear) {
	
		this.establishYear = establishYear;
	}
	/**
	 * @return the establishMonth
	 */
	public String getEstablishMonth() {
	
		return establishMonth;
	}
	/**
	 * @param establishMonth the establishMonth to set
	 */
	public void setEstablishMonth(String establishMonth) {
	
		this.establishMonth = establishMonth;
	}
	/**
	 * @return the establishDay
	 */
	public String getEstablishDay() {
	
		return establishDay;
	}
	/**
	 * @param establishDay the establishDay to set
	 */
	public void setEstablishDay(String establishDay) {
	
		this.establishDay = establishDay;
	}
	/**
	 * @return the establishOthbcAt
	 */
	public String getEstablishOthbcAt() {
	
		return establishOthbcAt;
	}
	/**
	 * @param establishOthbcAt the establishOthbcAt to set
	 */
	public void setEstablishOthbcAt(String establishOthbcAt) {
	
		this.establishOthbcAt = establishOthbcAt;
	}
	/**
	 * @return the reprsntEmailAdres
	 */
	public String getReprsntEmailAdres() {
	
		return reprsntEmailAdres;
	}
	/**
	 * @param reprsntEmailAdres the reprsntEmailAdres to set
	 */
	public void setReprsntEmailAdres(String reprsntEmailAdres) {
	
		this.reprsntEmailAdres = reprsntEmailAdres;
	}
	/**
	 * @return the reprsntEmailAdresOthbcAt
	 */
	public String getReprsntEmailAdresOthbcAt() {
	
		return reprsntEmailAdresOthbcAt;
	}
	/**
	 * @param reprsntEmailAdresOthbcAt the reprsntEmailAdresOthbcAt to set
	 */
	public void setReprsntEmailAdresOthbcAt(String reprsntEmailAdresOthbcAt) {
	
		this.reprsntEmailAdresOthbcAt = reprsntEmailAdresOthbcAt;
	}
	/**
	 * @return the reprsntRecvAt
	 */
	public String getReprsntRecvAt() {
	
		return reprsntRecvAt;
	}
	/**
	 * @param reprsntRecvAt the reprsntRecvAt to set
	 */
	public void setReprsntRecvAt(String reprsntRecvAt) {
	
		this.reprsntRecvAt = reprsntRecvAt;
	}
	/**
	 * @return the reprsntAreaNo
	 */
	public String getReprsntAreaNo() {
	
		return reprsntAreaNo;
	}
	/**
	 * @param reprsntAreaNo the reprsntAreaNo to set
	 */
	public void setReprsntAreaNo(String reprsntAreaNo) {
	
		this.reprsntAreaNo = reprsntAreaNo;
	}
	/**
	 * @return the reprsntEntrprsMiddleTelno
	 */
	public String getReprsntEntrprsMiddleTelno() {
	
		return reprsntEntrprsMiddleTelno;
	}
	/**
	 * @param reprsntEntrprsMiddleTelno the reprsntEntrprsMiddleTelno to set
	 */
	public void setReprsntEntrprsMiddleTelno(String reprsntEntrprsMiddleTelno) {
	
		this.reprsntEntrprsMiddleTelno = reprsntEntrprsMiddleTelno;
	}
	/**
	 * @return the reprsntEntrprsEndTelno
	 */
	public String getReprsntEntrprsEndTelno() {
	
		return reprsntEntrprsEndTelno;
	}
	/**
	 * @param reprsntEntrprsEndTelno the reprsntEntrprsEndTelno to set
	 */
	public void setReprsntEntrprsEndTelno(String reprsntEntrprsEndTelno) {
	
		this.reprsntEntrprsEndTelno = reprsntEntrprsEndTelno;
	}
	/**
	 * @return the telOthbcAt
	 */
	public String getTelOthbcAt() {
	
		return telOthbcAt;
	}
	/**
	 * @param telOthbcAt the telOthbcAt to set
	 */
	public void setTelOthbcAt(String telOthbcAt) {
	
		this.telOthbcAt = telOthbcAt;
	}
	/**
	 * @return the fxnumOthbcAt
	 */
	public String getFxnumOthbcAt() {
	
		return fxnumOthbcAt;
	}
	/**
	 * @param fxnumOthbcAt the fxnumOthbcAt to set
	 */
	public void setFxnumOthbcAt(String fxnumOthbcAt) {
	
		this.fxnumOthbcAt = fxnumOthbcAt;
	}
	/**
	 * @return the atchBizFileId
	 */
	public String getAtchBizFileId() {
	
		return atchBizFileId;
	}
	/**
	 * @param atchBizFileId the atchBizFileId to set
	 */
	public void setAtchBizFileId(String atchBizFileId) {
	
		this.atchBizFileId = atchBizFileId;
	}
	/**
	 * @return the pstinstDeptNm
	 */
	public String getPstinstDeptNm() {
	
		return pstinstDeptNm;
	}
	/**
	 * @param pstinstDeptNm the pstinstDeptNm to set
	 */
	public void setPstinstDeptNm(String pstinstDeptNm) {
	
		this.pstinstDeptNm = pstinstDeptNm;
	}
	/**
	 * @return the ofcpsNm
	 */
	public String getOfcpsNm() {
	
		return ofcpsNm;
	}
	/**
	 * @param ofcpsNm the ofcpsNm to set
	 */
	public void setOfcpsNm(String ofcpsNm) {
	
		this.ofcpsNm = ofcpsNm;
	}
	/**
	 * @return the applcntRecvAt
	 */
	public String getApplcntRecvAt() {
	
		return applcntRecvAt;
	}
	/**
	 * @param applcntRecvAt the applcntRecvAt to set
	 */
	public void setApplcntRecvAt(String applcntRecvAt) {
	
		this.applcntRecvAt = applcntRecvAt;
	}
	/**
	 * @return the atchImgLogoFileId
	 */
	public String getAtchImgLogoFileId() {
	
		return atchImgLogoFileId;
	}
	/**
	 * @param atchImgLogoFileId the atchImgLogoFileId to set
	 */
	public void setAtchImgLogoFileId(String atchImgLogoFileId) {
	
		this.atchImgLogoFileId = atchImgLogoFileId;
	}
	/**
	 * @return the atchImg1FileId
	 */
	public String getAtchImg1FileId() {
	
		return atchImg1FileId;
	}
	/**
	 * @param atchImg1FileId the atchImg1FileId to set
	 */
	public void setAtchImg1FileId(String atchImg1FileId) {
	
		this.atchImg1FileId = atchImg1FileId;
	}
	/**
	 * @return the atchImg2FileId
	 */
	public String getAtchImg2FileId() {
	
		return atchImg2FileId;
	}
	/**
	 * @param atchImg2FileId the atchImg2FileId to set
	 */
	public void setAtchImg2FileId(String atchImg2FileId) {
	
		this.atchImg2FileId = atchImg2FileId;
	}
	/**
	 * @return the atchImg3FileId
	 */
	public String getAtchImg3FileId() {
	
		return atchImg3FileId;
	}
	/**
	 * @param atchImg3FileId the atchImg3FileId to set
	 */
	public void setAtchImg3FileId(String atchImg3FileId) {
	
		this.atchImg3FileId = atchImg3FileId;
	}
	/**
	 * @return the atchImg4FileId
	 */
	public String getAtchImg4FileId() {
	
		return atchImg4FileId;
	}
	/**
	 * @param atchImg4FileId the atchImg4FileId to set
	 */
	public void setAtchImg4FileId(String atchImg4FileId) {
	
		this.atchImg4FileId = atchImg4FileId;
	}
	/**
	 * @return the shortNotice
	 */
	public String getShortNotice() {
	
		return shortNotice;
	}
	/**
	 * @param shortNotice the shortNotice to set
	 */
	public void setShortNotice(String shortNotice) {
	
		this.shortNotice = shortNotice;
	}
	/**
	 * @return the homepageUrl
	 */
	public String getHomepageUrl() {
	
		return homepageUrl;
	}
	/**
	 * @param homepageUrl the homepageUrl to set
	 */
	public void setHomepageUrl(String homepageUrl) {
	
		this.homepageUrl = homepageUrl;
	}
	/**
	 * @return the blogUrl
	 */
	public String getBlogUrl() {
	
		return blogUrl;
	}
	/**
	 * @param blogUrl the blogUrl to set
	 */
	public void setBlogUrl(String blogUrl) {
	
		this.blogUrl = blogUrl;
	}
	/**
	 * @return the socialUrl
	 */
	public String getSocialUrl() {
	
		return socialUrl;
	}
	/**
	 * @param socialUrl the socialUrl to set
	 */
	public void setSocialUrl(String socialUrl) {
	
		this.socialUrl = socialUrl;
	}
	/**
	 * @return the empCnt
	 */
	public int getEmpCnt() {
	
		return empCnt;
	}
	/**
	 * @param empCnt the empCnt to set
	 */
	public void setEmpCnt(int empCnt) {
	
		this.empCnt = empCnt;
	}
	/**
	 * @return the capitalMoney
	 */
	public int getCapitalMoney() {
	
		return capitalMoney;
	}
	/**
	 * @param capitalMoney the capitalMoney to set
	 */
	public void setCapitalMoney(int capitalMoney) {
	
		this.capitalMoney = capitalMoney;
	}
	/**
	 * @return the salesMoney
	 */
	public int getSalesMoney() {
	
		return salesMoney;
	}
	/**
	 * @param salesMoney the salesMoney to set
	 */
	public void setSalesMoney(int salesMoney) {
	
		this.salesMoney = salesMoney;
	}
	/**
	 * @return the atchReportFileId
	 */
	public String getAtchReportFileId() {
	
		return atchReportFileId;
	}
	/**
	 * @param atchReportFileId the atchReportFileId to set
	 */
	public void setAtchReportFileId(String atchReportFileId) {
	
		this.atchReportFileId = atchReportFileId;
	}
	/**
	 * @return the atchPortFileId
	 */
	public String getAtchPortFileId() {
	
		return atchPortFileId;
	}
	/**
	 * @param atchPortFileId the atchPortFileId to set
	 */
	public void setAtchPortFileId(String atchPortFileId) {
	
		this.atchPortFileId = atchPortFileId;
	}
	/**
	 * @return the mngNm
	 */
	public String getMngNm() {
	
		return mngNm;
	}
	/**
	 * @param mngNm the mngNm to set
	 */
	public void setMngNm(String mngNm) {
	
		this.mngNm = mngNm;
	}
	/**
	 * @return the mngPstinstDeptNm
	 */
	public String getMngPstinstDeptNm() {
	
		return mngPstinstDeptNm;
	}
	/**
	 * @param mngPstinstDeptNm the mngPstinstDeptNm to set
	 */
	public void setMngPstinstDeptNm(String mngPstinstDeptNm) {
	
		this.mngPstinstDeptNm = mngPstinstDeptNm;
	}
	/**
	 * @return the mngOfcpsNm
	 */
	public String getMngOfcpsNm() {
	
		return mngOfcpsNm;
	}
	/**
	 * @param mngOfcpsNm the mngOfcpsNm to set
	 */
	public void setMngOfcpsNm(String mngOfcpsNm) {
	
		this.mngOfcpsNm = mngOfcpsNm;
	}
	/**
	 * @return the mngEmailAdres
	 */
	public String getMngEmailAdres() {
	
		return mngEmailAdres;
	}
	/**
	 * @param mngEmailAdres the mngEmailAdres to set
	 */
	public void setMngEmailAdres(String mngEmailAdres) {
	
		this.mngEmailAdres = mngEmailAdres;
	}
	/**
	 * @return the mngMbtlnum
	 */
	public String getMngMbtlnum() {
	
		return mngMbtlnum;
	}
	/**
	 * @param mngMbtlnum the mngMbtlnum to set
	 */
	public void setMngMbtlnum(String mngMbtlnum) {
	
		this.mngMbtlnum = mngMbtlnum;
	}
	/**
	 * @return the mngAreaNo
	 */
	public String getMngAreaNo() {
	
		return mngAreaNo;
	}
	/**
	 * @param mngAreaNo the mngAreaNo to set
	 */
	public void setMngAreaNo(String mngAreaNo) {
	
		this.mngAreaNo = mngAreaNo;
	}
	/**
	 * @return the mngEntrprsMiddleTelno
	 */
	public String getMngEntrprsMiddleTelno() {
	
		return mngEntrprsMiddleTelno;
	}
	/**
	 * @param mngEntrprsMiddleTelno the mngEntrprsMiddleTelno to set
	 */
	public void setMngEntrprsMiddleTelno(String mngEntrprsMiddleTelno) {
	
		this.mngEntrprsMiddleTelno = mngEntrprsMiddleTelno;
	}
	/**
	 * @return the mngEntrprsEndTelno
	 */
	public String getMngEntrprsEndTelno() {
	
		return mngEntrprsEndTelno;
	}
	/**
	 * @param mngEntrprsEndTelno the mngEntrprsEndTelno to set
	 */
	public void setMngEntrprsEndTelno(String mngEntrprsEndTelno) {
	
		this.mngEntrprsEndTelno = mngEntrprsEndTelno;
	}
	/**
	 * @return the taxNm
	 */
	public String getTaxNm() {
	
		return taxNm;
	}
	/**
	 * @param taxNm the taxNm to set
	 */
	public void setTaxNm(String taxNm) {
	
		this.taxNm = taxNm;
	}
	/**
	 * @return the taxPstinstDeptNm
	 */
	public String getTaxPstinstDeptNm() {
	
		return taxPstinstDeptNm;
	}
	/**
	 * @param taxPstinstDeptNm the taxPstinstDeptNm to set
	 */
	public void setTaxPstinstDeptNm(String taxPstinstDeptNm) {
	
		this.taxPstinstDeptNm = taxPstinstDeptNm;
	}
	/**
	 * @return the taxOfcpsNm
	 */
	public String getTaxOfcpsNm() {
	
		return taxOfcpsNm;
	}
	/**
	 * @param taxOfcpsNm the taxOfcpsNm to set
	 */
	public void setTaxOfcpsNm(String taxOfcpsNm) {
	
		this.taxOfcpsNm = taxOfcpsNm;
	}
	/**
	 * @return the taxEmailAdres
	 */
	public String getTaxEmailAdres() {
	
		return taxEmailAdres;
	}
	/**
	 * @param taxEmailAdres the taxEmailAdres to set
	 */
	public void setTaxEmailAdres(String taxEmailAdres) {
	
		this.taxEmailAdres = taxEmailAdres;
	}
	/**
	 * @return the taxMbtlnum
	 */
	public String getTaxMbtlnum() {
	
		return taxMbtlnum;
	}
	/**
	 * @param taxMbtlnum the taxMbtlnum to set
	 */
	public void setTaxMbtlnum(String taxMbtlnum) {
	
		this.taxMbtlnum = taxMbtlnum;
	}
	/**
	 * @return the taxAreaNo
	 */
	public String getTaxAreaNo() {
	
		return taxAreaNo;
	}
	/**
	 * @param taxAreaNo the taxAreaNo to set
	 */
	public void setTaxAreaNo(String taxAreaNo) {
	
		this.taxAreaNo = taxAreaNo;
	}
	/**
	 * @return the taxEntrprsMiddleTelno
	 */
	public String getTaxEntrprsMiddleTelno() {
	
		return taxEntrprsMiddleTelno;
	}
	/**
	 * @param taxEntrprsMiddleTelno the taxEntrprsMiddleTelno to set
	 */
	public void setTaxEntrprsMiddleTelno(String taxEntrprsMiddleTelno) {
	
		this.taxEntrprsMiddleTelno = taxEntrprsMiddleTelno;
	}
	/**
	 * @return the taxEntrprsEndTelno
	 */
	public String getTaxEntrprsEndTelno() {
	
		return taxEntrprsEndTelno;
	}
	/**
	 * @param taxEntrprsEndTelno the taxEntrprsEndTelno to set
	 */
	public void setTaxEntrprsEndTelno(String taxEntrprsEndTelno) {
	
		this.taxEntrprsEndTelno = taxEntrprsEndTelno;
	}
	/**
	 * @return the notice
	 */
	public String getNotice() {
	
		return notice;
	}
	/**
	 * @param notice the notice to set
	 */
	public void setNotice(String notice) {
	
		this.notice = notice;
	}
	/**
	 * @return the cxfcOthbcAt
	 */
	public String getCxfcOthbcAt() {
	
		return cxfcOthbcAt;
	}
	/**
	 * @param cxfcOthbcAt the cxfcOthbcAt to set
	 */
	public void setCxfcOthbcAt(String cxfcOthbcAt) {
	
		this.cxfcOthbcAt = cxfcOthbcAt;
	}
	/**
	 * @return the reprsntEmailAdresHead
	 */
	public String getReprsntEmailAdresHead() {
		if (this.reprsntEmailAdres == null || this.reprsntEmailAdres.split("@").length != 2)
			return "";
		else
			return this.reprsntEmailAdres.split("@")[0];	
	}
	/**
	 * @param reprsntEmailAdresHead the reprsntEmailAdresHead to set
	 */
	public void setReprsntEmailAdresHead(String reprsntEmailAdresHead) {
	
		this.reprsntEmailAdresHead = reprsntEmailAdresHead;
	}
	/**
	 * @return the reprsntEmailAdresTail
	 */
	public String getReprsntEmailAdresTail() {
		if (this.reprsntEmailAdres == null || this.reprsntEmailAdres.split("@").length != 2)
			return "";
		else
			return this.reprsntEmailAdres.split("@")[1];	
	}
	/**
	 * @param reprsntEmailAdresTail the reprsntEmailAdresTail to set
	 */
	public void setReprsntEmailAdresTail(String reprsntEmailAdresTail) {
	
		this.reprsntEmailAdresTail = reprsntEmailAdresTail;
	}
	/**
	 * @return the mngEmailAdresHead
	 */
	public String getMngEmailAdresHead() {
		if (this.mngEmailAdres == null || this.mngEmailAdres.split("@").length != 2)
			return "";
		else
			return this.mngEmailAdres.split("@")[0];	
	}
	/**
	 * @param mngEmailAdresHead the mngEmailAdresHead to set
	 */
	public void setMngEmailAdresHead(String mngEmailAdresHead) {
	
		this.mngEmailAdresHead = mngEmailAdresHead;
	}
	/**
	 * @return the mngEmailAdresTail
	 */
	public String getMngEmailAdresTail() {
		if (this.mngEmailAdres == null || this.mngEmailAdres.split("@").length != 2)
			return "";
		else
			return this.mngEmailAdres.split("@")[1];	
	}
	/**
	 * @param mngEmailAdresTail the mngEmailAdresTail to set
	 */
	public void setMngEmailAdresTail(String mngEmailAdresTail) {
	
		this.mngEmailAdresTail = mngEmailAdresTail;
	}
	/**
	 * @return the taxEmailAdresHead
	 */
	public String getTaxEmailAdresHead() {
		if (this.taxEmailAdres == null || this.taxEmailAdres.split("@").length != 2)
			return "";
		else
			return this.taxEmailAdres.split("@")[0];	
	}
	/**
	 * @param taxEmailAdresHead the taxEmailAdresHead to set
	 */
	public void setTaxEmailAdresHead(String taxEmailAdresHead) {
	
		this.taxEmailAdresHead = taxEmailAdresHead;
	}
	/**
	 * @return the taxEmailAdresTail
	 */
	public String getTaxEmailAdresTail() {
		if (this.taxEmailAdres == null || this.taxEmailAdres.split("@").length != 2)
			return "";
		else
			return this.taxEmailAdres.split("@")[1];
	}
	/**
	 * @param taxEmailAdresTail the taxEmailAdresTail to set
	 */
	public void setTaxEmailAdresTail(String taxEmailAdresTail) {
	
		this.taxEmailAdresTail = taxEmailAdresTail;
	}
	/**
	 * @return the applcntEmailAdresHead
	 */
	public String getApplcntEmailAdresHead() {
		if (this.applcntEmailAdres == null || this.applcntEmailAdres.split("@").length != 2)
			return "";
		else
			return this.applcntEmailAdres.split("@")[0];
	}
	/**
	 * @param applcntEmailAdresHead the applcntEmailAdresHead to set
	 */
	public void setApplcntEmailAdresHead(String applcntEmailAdresHead) {
	
		this.applcntEmailAdresHead = applcntEmailAdresHead;
	}
	/**
	 * @return the applcntEmailAdresTail
	 */
	public String getApplcntEmailAdresTail() {
		if (this.applcntEmailAdres == null || this.applcntEmailAdres.split("@").length != 2)
			return "";
		else
			return this.applcntEmailAdres.split("@")[1];
	}
	/**
	 * @param applcntEmailAdresTail the applcntEmailAdresTail to set
	 */
	public void setApplcntEmailAdresTail(String applcntEmailAdresTail) {
	
		this.applcntEmailAdresTail = applcntEmailAdresTail;
	}
	/**
	 * @return the adresOthbcAt
	 */
	public String getAdresOthbcAt() {
	
		return adresOthbcAt;
	}
	/**
	 * @param adresOthbcAt the adresOthbcAt to set
	 */
	public void setAdresOthbcAt(String adresOthbcAt) {
	
		this.adresOthbcAt = adresOthbcAt;
	}
	/**
	 * @return the atchManageFileId
	 */
	public String getAtchManageFileId() {
	
		return atchManageFileId;
	}
	/**
	 * @param atchManageFileId the atchManageFileId to set
	 */
	public void setAtchManageFileId(String atchManageFileId) {
	
		this.atchManageFileId = atchManageFileId;
	}

	/**
	 * @return the bsnsSe
	 */
	public String getBsnsSe() {
	
		return bsnsSe;
	}
	/**
	 * @param bsnsSe the bsnsSe to set
	 */
	public void setBsnsSe(String bsnsSe) {
	
		this.bsnsSe = bsnsSe;
	}
	/**
	 * @return the entrprsMberType
	 */
	public String getEntrprsMberType() {
	
		return entrprsMberType;
	}
	/**
	 * @param entrprsMberType the entrprsMberType to set
	 */
	public void setEntrprsMberType(String entrprsMberType) {
	
		this.entrprsMberType = entrprsMberType;
	}
	/**
	 * @return the entrprsMberSe
	 */
	public String getEntrprsMberSe() {
	
		return entrprsMberSe;
	}
	/**
	 * @param entrprsMberSe the entrprsMberSe to set
	 */
	public void setEntrprsMberSe(String entrprsMberSe) {
	
		this.entrprsMberSe = entrprsMberSe;
	}
	/**
	 * @return the loginDe
	 */
	public String getLoginDe() {
	
		return loginDe;
	}
	/**
	 * @param loginDe the loginDe to set
	 */
	public void setLoginDe(String loginDe) {
	
		this.loginDe = loginDe;
	}
	/**
	 * @return the updtDe
	 */
	public String getUpdtDe() {
	
		return updtDe;
	}
	/**
	 * @param updtDe the updtDe to set
	 */
	public void setUpdtDe(String updtDe) {
	
		this.updtDe = updtDe;
	}
	/**
	 * @return the entrprsMberSeNm
	 */
	public String getEntrprsMberSeNm() {
	
		return entrprsMberSeNm;
	}
	/**
	 * @param entrprsMberSeNm the entrprsMberSeNm to set
	 */
	public void setEntrprsMberSeNm(String entrprsMberSeNm) {
	
		this.entrprsMberSeNm = entrprsMberSeNm;
	}
	
	
}