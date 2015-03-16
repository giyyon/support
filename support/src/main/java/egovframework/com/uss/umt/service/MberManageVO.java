package egovframework.com.uss.umt.service;

import java.util.List;

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
public class MberManageVO extends UserDefaultVO{

	/** 이전비밀번호 - 비밀번호 변경시 사용*/
    private String oldPassword = "";
    
    /* 계산성 항목*/
    private String birthYear="";
    private String birthMonth="";
    private String birthDay="";
    private String emailHead="";
    private String emailTail="";
    
    
    
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
	 * 끝전화번호
	 */
	private String endTelno;
	/**
	 * 팩스번호
	 */
	private String mberFxnum;
	/**
	 * 그룹 ID
	 */
	private String groupId;
	/**
	 * 주민등록번호
	 */
	private String ihidnum;
	/**
	 * 성별코드
	 */
	private String sexdstnCode;
	/**
	 * 회원 ID
	 */
	private String mberId;
	/**
	 * 회원명
	 */
	private String mberNm;
	/**
	 * 회원상태
	 */
	private String mberSttus;
	/**
	 * 지역번호
	 */
	private String areaNo;
	/**
	 * 중간전화번호
	 */
	private String middleTelno;
	/**
	 * 핸드폰번호
	 */
	private String moblphonNo;
	/**
	 * 비밀번호
	 */
	private String password;
	/**
	 * 비밀번호 정답
	 */
	private String passwordCnsr;
	/**
	 * 비밀번호 힌트
	 */
	private String passwordHint;
	/**
	 * 가입 일자
	 */
	private String sbscrbDe;
	/**
	 * 우편번호
	 */
	private String zip;
	/**
	 * 이메일주소
	 */
	private String mberEmailAdres;
	
	/**
	 * 양력음력
	 */
	private String sunLunar;
	
	/**
	 * 이름공개여부
	 */
	private String nmOthbcAt;
	/**
	 * 생일공개여부
	 */
	private String birthOthbcAt;             
	/**                                        
	 * 성별공개여부                            
	 */                                        
	private String sexdstnOthbcAt;           
	/**                                        
	 * 이메일공개여부                            
	 */                                        
	private String mberEmailAdresOthbcAt;  
	/**                                        
	 * 별명                            
	 */                                        
	private String nick;                       
	/**                                        
	 * 별명공개여부                            
	 */                                        
	private String nickOthbcAt;              
	/**                                        
	 * 직업분야                            
	 */                                        
	private String jobArea;                   
	/**                                        
	 * 직업업종                            
	 */                                        
	private String jobType;                   
	/**                                        
	 *직업직종                     
	 */                                        
	private String jobClass;                  
	/**                                        
	 * 직업공개여부                            
	 */                                        
	private String jobOthbcAt;               
	/**                                        
	 * 전화공개여부                
	 */                                        
	private String telOthbcAt;               
	/**                                        
	 * 주소공개여부                 
	 */                                        
	private String adresOthbcAt;             
	/**                                        
	 * 수신여부                 
	 */                                        
	private String recvAt;             
	
	/**                                        
	 * 소속기관              
	 */                                        
	private String pstinst;             
	/**                                        
	 * 소속기관부서           
	 */                                        
	private String pstinstDeptNm;             
	/**                                        
	 * 직위명               
	 */                                        
	private String ofcpsNm;             
	/**                                        
	 * 소속기관공개여부      
	 */                                        
	private String pstinstOthbcAt; 	
	/**                                        
	 *연락처공개여부
	 */                                        
	private String contacOthbcAt; 	

	/**                                        
	 *영문명
	 */                                        
	private String mberEngNm; 	
	/**                                        
	 *첨부대표사진파일ID
	 */                                        
	private String atchImgMainFileId; 	
	/**                                        
	 *첨부이력사진파일ID
	 */                                        
	private String atchImgJobFileId; 	
	/**                                        
	 *첨부인물사진파일ID
	 */                                        
	private String atchImgManFileId; 	
	/**                                        
	 *첨부1사진파일ID
	 */                                        
	private String atchImg1FileId; 	
	/**                                        
	 *첨부2사진파일ID
	 */                                        
	private String atchImg2FileId; 	
	/**                                        
	 *요약소개
	 */                                        
	private String shortNotice; 	
	/**                                        
	 *홈페이지
	 */                                        
	private String homepageUrl; 	
	/**                                        
	 *블로그
	 */                                        
	private String blogUrl; 	
	/**                                        
	 *쇼셜
	 */                                        
	private String socialUrl; 	
	/**                                        
	 *집지역번호
	 */                                        
	private String homeAreaNo; 	
	/**                                        
	 *집중간전화번호
	 */                                        
	private String homeMiddleTelno; 	
	/**                                        
	 *집끝전화번호
	 */                                        
	private String homeEndTelno; 	
	/**                                        
	 *자택우편번호
	 */                                        
	private String homeZip; 	
	/**                                        
	 *자택주소
	 */                                        
	private String homeAdres; 	
	/**                                        
	 *자택상세주소
	 */                                        
	private String homeDetailAdres; 	
	/**                                        
	 *우편발송처
	 */                                        
	private String mailSendTarget; 	
	/**                                        
	 *자기소개
	 */                                        
	private String notice; 	
	
	/**                                        
	 *이력서첨부파일
	 */                                        
	private String atchHistFileId; 	
	/**                                        
	 *포트폴리오 첨부파일
	 */                                        
	private String atchPortFileId; 	
	
	/**사업구분        */
	 private String bsnsSe ;     
	/**회원유형        */
	 private String mberType;
	/**회원분류        */
	 private String mberSe;
	 private String mberSeNm;	
	/**접속일자        */
	 private String loginDe;
	/**수정일자        */
	 private String updtDe;
	/**첨부관리용파일ID*/
	 private String atchManageFileId;


	/**                                        
	 * 학위
	 */                                        
	private List<MberManageDegreeVO> mberManageDegreeVOList;
	/**                                        
	 * 경력
	 */                                        
	private List<MberManageCareerVO> mberManageCareerVOList;
	/**                                        
	 * 수상
	 */                                        
	private List<MberManageAwardVO> mberManageAwardVOList;
	/**                                        
	 * 논문
	 */                                        
	private List<MberManagePaperVO> mberManagePaperVOList;
   
	/**                                        
	 * 활동분류
	 */                                        
	private List<MberManageActiveTyVO> mberManageActiveTyVOList;
   
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
	 * endTelno attribute 값을  리턴한다.
	 * @return String
	 */
	public String getEndTelno() {
		return endTelno;
	}
	/**
	 * endTelno attribute 값을 설정한다.
	 * @param endTelno String
	 */
	public void setEndTelno(String endTelno) {
		this.endTelno = endTelno;
	}
	/**
	 * mberFxnum attribute 값을  리턴한다.
	 * @return String
	 */
	public String getMberFxnum() {
		return mberFxnum;
	}
	/**
	 * mberFxnum attribute 값을 설정한다.
	 * @param mberFxnum String
	 */
	public void setMberFxnum(String mberFxnum) {
		this.mberFxnum = mberFxnum;
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
	 * ihidnum attribute 값을  리턴한다.
	 * @return String
	 */
	public String getIhidnum() {
		return ihidnum;
	}
	/**
	 * ihidnum attribute 값을 설정한다.
	 * @param ihidnum String
	 */
	public void setIhidnum(String ihidnum) {
		this.ihidnum = ihidnum;
	}
	/**
	 * sexdstnCode attribute 값을  리턴한다.
	 * @return String
	 */
	public String getSexdstnCode() {
		return sexdstnCode;
	}
	/**
	 * sexdstnCode attribute 값을 설정한다.
	 * @param sexdstnCode String
	 */
	public void setSexdstnCode(String sexdstnCode) {
		this.sexdstnCode = sexdstnCode;
	}
	/**
	 * mberId attribute 값을  리턴한다.
	 * @return String
	 */
	public String getMberId() {
		return mberId;
	}
	/**
	 * mberId attribute 값을 설정한다.
	 * @param mberId String
	 */
	public void setMberId(String mberId) {
		this.mberId = mberId;
	}
	/**
	 * mberNm attribute 값을  리턴한다.
	 * @return String
	 */
	public String getMberNm() {
		return mberNm;
	}
	/**
	 * mberNm attribute 값을 설정한다.
	 * @param mberNm String
	 */
	public void setMberNm(String mberNm) {
		this.mberNm = mberNm;
	}
	/**
	 * mberSttus attribute 값을  리턴한다.
	 * @return String
	 */
	public String getMberSttus() {
		return mberSttus;
	}
	/**
	 * mberSttus attribute 값을 설정한다.
	 * @param mberSttus String
	 */
	public void setMberSttus(String mberSttus) {
		this.mberSttus = mberSttus;
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
	 * middleTelno attribute 값을  리턴한다.
	 * @return String
	 */
	public String getMiddleTelno() {
		return middleTelno;
	}
	/**
	 * middleTelno attribute 값을 설정한다.
	 * @param middleTelno String
	 */
	public void setMiddleTelno(String middleTelno) {
		this.middleTelno = middleTelno;
	}
	/**
	 * moblphonNo attribute 값을  리턴한다.
	 * @return String
	 */
	public String getMoblphonNo() {
		return moblphonNo;
	}
	/**
	 * moblphonNo attribute 값을 설정한다.
	 * @param moblphonNo String
	 */
	public void setMoblphonNo(String moblphonNo) {
		this.moblphonNo = moblphonNo;
	}
	/**
	 * password attribute 값을  리턴한다.
	 * @return String
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * password attribute 값을 설정한다.
	 * @param password String
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * passwordCnsr attribute 값을  리턴한다.
	 * @return String
	 */
	public String getPasswordCnsr() {
		return passwordCnsr;
	}
	/**
	 * passwordCnsr attribute 값을 설정한다.
	 * @param passwordCnsr String
	 */
	public void setPasswordCnsr(String passwordCnsr) {
		this.passwordCnsr = passwordCnsr;
	}
	/**
	 * passwordHint attribute 값을  리턴한다.
	 * @return String
	 */
	public String getPasswordHint() {
		return passwordHint;
	}
	/**
	 * passwordHint attribute 값을 설정한다.
	 * @param passwordHint String
	 */
	public void setPasswordHint(String passwordHint) {
		this.passwordHint = passwordHint;
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
	 * mberEmailAdres attribute 값을  리턴한다.
	 * @return String
	 */
	public String getMberEmailAdres() {
		return mberEmailAdres;
	}
	/**
	 * mberEmailAdres attribute 값을 설정한다.
	 * @param mberEmailAdres String
	 */
	public void setMberEmailAdres(String mberEmailAdres) {
		this.mberEmailAdres = mberEmailAdres;
	}
	/**
	 * @return the sunLunar
	 */
	public String getSunLunar() {
	
		return sunLunar;
	}
	/**
	 * @param sunLunar the sunLunar to set
	 */
	public void setSunLunar(String sunLunar) {
	
		this.sunLunar = sunLunar;
	}
	/**
	 * @return the nmOthbcAt
	 */
	public String getNmOthbcAt() {
	
		return nmOthbcAt;
	}
	/**
	 * @param nmOthbcAt the nmOthbcAt to set
	 */
	public void setNmOthbcAt(String nmOthbcAt) {
	
		this.nmOthbcAt = nmOthbcAt;
	}
	/**
	 * @return the birthOthbcAt
	 */
	public String getBirthOthbcAt() {
	
		return birthOthbcAt;
	}
	/**
	 * @param birthOthbcAt the birthOthbcAt to set
	 */
	public void setBirthOthbcAt(String birthOthbcAt) {
	
		this.birthOthbcAt = birthOthbcAt;
	}
	/**
	 * @return the sexdstnOthbcAt
	 */
	public String getSexdstnOthbcAt() {
	
		return sexdstnOthbcAt;
	}
	/**
	 * @param sexdstnOthbcAt the sexdstnOthbcAt to set
	 */
	public void setSexdstnOthbcAt(String sexdstnOthbcAt) {
	
		this.sexdstnOthbcAt = sexdstnOthbcAt;
	}
	/**
	 * @return the mber_email_adresOthbcAt
	 */
	public String getMberEmailAdresOthbcAt() {
	
		return mberEmailAdresOthbcAt;
	}
	/**
	 * @param mber_email_adresOthbcAt the mber_email_adresOthbcAt to set
	 */
	public void setMberEmailAdresOthbcAt(String mberEmailAdresOthbcAt) {
	
		this.mberEmailAdresOthbcAt = mberEmailAdresOthbcAt;
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
	 * @return the recvAt
	 */
	public String getRecvAt() {
	
		return recvAt;
	}
	/**
	 * @param recvAt the recvAt to set
	 */
	public void setRecvAt(String recvAt) {
	
		this.recvAt = recvAt;
	}
	/**
	 * @return the pstinst
	 */
	public String getPstinst() {
	
		return pstinst;
	}
	/**
	 * @param pstinst the pstinst to set
	 */
	public void setPstinst(String pstinst) {
	
		this.pstinst = pstinst;
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
	 * @return the pstinstOthbcAt
	 */
	public String getPstinstOthbcAt() {
	
		return pstinstOthbcAt;
	}
	/**
	 * @param pstinstOthbcAt the pstinstOthbcAt to set
	 */
	public void setPstinstOthbcAt(String pstinstOthbcAt) {
	
		this.pstinstOthbcAt = pstinstOthbcAt;
	}
	/**
	 * @return the contacOthbcAt
	 */
	public String getContacOthbcAt() {
	
		return contacOthbcAt;
	}
	/**
	 * @param contacOthbcAt the contacOthbcAt to set
	 */
	public void setContacOthbcAt(String contacOthbcAt) {
	
		this.contacOthbcAt = contacOthbcAt;
	}
	
	
	/**
	 * @return the mberEngNm
	 */
	public String getMberEngNm() {
	
		return mberEngNm;
	}
	/**
	 * @param mberEngNm the mberEngNm to set
	 */
	public void setMberEngNm(String mberEngNm) {
	
		this.mberEngNm = mberEngNm;
	}
	/**
	 * @return the atchImgMainFileId
	 */
	public String getAtchImgMainFileId() {
	
		return atchImgMainFileId;
	}
	/**
	 * @param atchImgMainFileId the atchImgMainFileId to set
	 */
	public void setAtchImgMainFileId(String atchImgMainFileId) {
	
		this.atchImgMainFileId = atchImgMainFileId;
	}
	/**
	 * @return the atchImgJobFileId
	 */
	public String getAtchImgJobFileId() {
	
		return atchImgJobFileId;
	}
	/**
	 * @param atchImgJobFileId the atchImgJobFileId to set
	 */
	public void setAtchImgJobFileId(String atchImgJobFileId) {
	
		this.atchImgJobFileId = atchImgJobFileId;
	}
	/**
	 * @return the atchImgManFileId
	 */
	public String getAtchImgManFileId() {
	
		return atchImgManFileId;
	}
	/**
	 * @param atchImgManFileId the atchImgManFileId to set
	 */
	public void setAtchImgManFileId(String atchImgManFileId) {
	
		this.atchImgManFileId = atchImgManFileId;
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
	 * @return the homeAreaNo
	 */
	public String getHomeAreaNo() {
	
		return homeAreaNo;
	}
	/**
	 * @param homeAreaNo the homeAreaNo to set
	 */
	public void setHomeAreaNo(String homeAreaNo) {
	
		this.homeAreaNo = homeAreaNo;
	}
	/**
	 * @return the homeMiddleTelno
	 */
	public String getHomeMiddleTelno() {
	
		return homeMiddleTelno;
	}
	/**
	 * @param homeMiddleTelno the homeMiddleTelno to set
	 */
	public void setHomeMiddleTelno(String homeMiddleTelno) {
	
		this.homeMiddleTelno = homeMiddleTelno;
	}
	/**
	 * @return the homeEndTelno
	 */
	public String getHomeEndTelno() {
	
		return homeEndTelno;
	}
	/**
	 * @param homeEndTelno the homeEndTelno to set
	 */
	public void setHomeEndTelno(String homeEndTelno) {
	
		this.homeEndTelno = homeEndTelno;
	}
	/**
	 * @return the homeZip
	 */
	public String getHomeZip() {
	
		return homeZip;
	}
	/**
	 * @param homeZip the homeZip to set
	 */
	public void setHomeZip(String homeZip) {
	
		this.homeZip = homeZip;
	}
	/**
	 * @return the homeAdres
	 */
	public String getHomeAdres() {
	
		return homeAdres;
	}
	/**
	 * @param homeAdres the homeAdres to set
	 */
	public void setHomeAdres(String homeAdres) {
	
		this.homeAdres = homeAdres;
	}
	/**
	 * @return the homeDetailAdres
	 */
	public String getHomeDetailAdres() {
	
		return homeDetailAdres;
	}
	/**
	 * @param homeDetailAdres the homeDetailAdres to set
	 */
	public void setHomeDetailAdres(String homeDetailAdres) {
	
		this.homeDetailAdres = homeDetailAdres;
	}
	/**
	 * @return the mailSendTarget
	 */
	public String getMailSendTarget() {
	
		return mailSendTarget;
	}
	/**
	 * @param mailSendTarget the mailSendTarget to set
	 */
	public void setMailSendTarget(String mailSendTarget) {
	
		this.mailSendTarget = mailSendTarget;
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
	 * @return the mberManageDegreeVOList
	 */
	public List<MberManageDegreeVO> getMberManageDegreeVOList() {
	
		return mberManageDegreeVOList;
	}
	/**
	 * @param mberManageDegreeVOList the mberManageDegreeVOList to set
	 */
	public void setMberManageDegreeVOList(List<MberManageDegreeVO> mberManageDegreeVOList) {
	
		this.mberManageDegreeVOList = mberManageDegreeVOList;
	}
	/**
	 * @return the mberManageCareerVOList
	 */
	public List<MberManageCareerVO> getMberManageCareerVOList() {
	
		return mberManageCareerVOList;
	}
	/**
	 * @param mberManageCareerVOList the mberManageCareerVOList to set
	 */
	public void setMberManageCareerVOList(List<MberManageCareerVO> mberManageCareerVOList) {
	
		this.mberManageCareerVOList = mberManageCareerVOList;
	}
	/**
	 * @return the mberManageAwardVOList
	 */
	public List<MberManageAwardVO> getMberManageAwardVOList() {
	
		return mberManageAwardVOList;
	}
	/**
	 * @param mberManageAwardVOList the mberManageAwardVOList to set
	 */
	public void setMberManageAwardVOList(List<MberManageAwardVO> mberManageAwardVOList) {
	
		this.mberManageAwardVOList = mberManageAwardVOList;
	}
	/**
	 * @return the mberManagePaperVOList
	 */
	public List<MberManagePaperVO> getMberManagePaperVOList() {
	
		return mberManagePaperVOList;
	}
	/**
	 * @param mberManagePaperVOList the mberManagePaperVOList to set
	 */
	public void setMberManagePaperVOList(List<MberManagePaperVO> mberManagePaperVOList) {
	
		this.mberManagePaperVOList = mberManagePaperVOList;
	}
	/**
	 * @return the birthYear
	 */
	public String getBirthYear() {
		
		if (this.ihidnum == null || this.ihidnum.split("\\.").length != 3)
			return "";
		else
			return this.ihidnum.split("\\.")[0];
		//return birthYear;
	}
	/**
	 * @param birthYear the birthYear to set
	 */
	public void setBirthYear(String birthYear) {
	
		this.birthYear = birthYear;
	}
	/**
	 * @return the birthMonTh
	 */
	public String getBirthMonth() {
		if (this.ihidnum == null || this.ihidnum.split("\\.").length != 3)
			return "";
		else
			return this.ihidnum.split("\\.")[1];
		//return birthMonTh;
	}
	/**
	 * @param birthMonTh the birthMonTh to set
	 */
	public void setBirthMonth(String birthMonth) {
	
		this.birthMonth = birthMonth;
	}
	/**
	 * @return the birthDay
	 */
	public String getBirthDay() {
		if (this.ihidnum == null || this.ihidnum.split("\\.").length != 3)
			return "";
		else
			return this.ihidnum.split("\\.")[2];

		//return birthDay;
	}
	/**
	 * @param birthDay the birthDay to set
	 */
	public void setBirthDay(String birthDay) {
	
		this.birthDay = birthDay;
	}
	/**
	 * @return the emailHead
	 */
	public String getEmailHead() {	
		if (this.mberEmailAdres == null || this.mberEmailAdres.split("@").length != 2)
			return "";
		else
			return this.mberEmailAdres.split("@")[0];
	}
	/**
	 * @param emailHead the emailHead to set
	 */
	public void setEmailHead(String emailHead) {
	
		this.emailHead = emailHead;
	}
	/**
	 * @return the emailTail
	 */
	public String getEmailTail() {
		if (this.mberEmailAdres == null || this.mberEmailAdres.split("@").length != 2)
			return "";
		else
			return this.mberEmailAdres.split("@")[1];	
	}
	/**
	 * @param emailTail the emailTail to set
	 */
	public void setEmailTail(String emailTail) {
	
		this.emailTail = emailTail;
	}
	/**
	 * @return the atchHistFileId
	 */
	public String getAtchHistFileId() {
	
		return atchHistFileId;
	}
	/**
	 * @param atchHistFileId the atchHistFileId to set
	 */
	public void setAtchHistFileId(String atchHistFileId) {
	
		this.atchHistFileId = atchHistFileId;
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
	 * @return the bsnSe
	 */
	public String getBsnsSe() {
	
		return bsnsSe;
	}
	/**
	 * @param bsnSe the bsnSe to set
	 */
	public void setBsnsSe(String bsnsSe) {
	
		this.bsnsSe = bsnsSe;
	}
	/**
	 * @return the mberType
	 */
	public String getMberType() {
	
		return mberType;
	}
	/**
	 * @param mberType the mberType to set
	 */
	public void setMberType(String mberType) {
	
		this.mberType = mberType;
	}
	/**
	 * @return the mberSe
	 */
	public String getMberSe() {
	
		return mberSe;
	}
	/**
	 * @param mberSe the mberSe to set
	 */
	public void setMberSe(String mberSe) {
	
		this.mberSe = mberSe;
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
	 * @return the mberSeNm
	 */
	public String getMberSeNm() {
	
		return mberSeNm;
	}
	/**
	 * @param mberSeNm the mberSeNm to set
	 */
	public void setMberSeNm(String mberSeNm) {
	
		this.mberSeNm = mberSeNm;
	}
	/**
	 * @return the mberManageActiveTyVOList
	 */
	public List<MberManageActiveTyVO> getMberManageActiveTyVOList() {
	
		return mberManageActiveTyVOList;
	}
	/**
	 * @param mberManageActiveTyVOList the mberManageActiveTyVOList to set
	 */
	public void setMberManageActiveTyVOList(List<MberManageActiveTyVO> mberManageActiveTyVOList) {
	
		this.mberManageActiveTyVOList = mberManageActiveTyVOList;
	}

	
	
}