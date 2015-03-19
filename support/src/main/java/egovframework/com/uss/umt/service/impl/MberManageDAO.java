package egovframework.com.uss.umt.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.uss.umt.service.MberManageActiveTyVO;
import egovframework.com.uss.umt.service.MberManageAwardVO;
import egovframework.com.uss.umt.service.MberManageCareerVO;
import egovframework.com.uss.umt.service.MberManageDegreeVO;
import egovframework.com.uss.umt.service.MberManagePaperVO;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;

import org.springframework.stereotype.Repository;

/**
 * 일반회원관리에 관한 데이터 접근 클래스를 정의한다.
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
@Repository("mberManageDAO")
public class MberManageDAO extends EgovComAbstractDAO{

    /**
     * 기 등록된 특정 일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
     * @param userSearchVO 검색조건
     * @return List<MberManageVO> 기업회원 목록정보
     */
    public List<MberManageVO> selectMberList(UserDefaultVO userSearchVO){
        return (List<MberManageVO>) list("mberManageDAO.selectMberList", userSearchVO);
    }

    /**
     * 일반회원 총 갯수를 조회한다.
     * @param userSearchVO 검색조건
     * @return int 일반회원총갯수
     */
    public int selectMberListTotCnt(UserDefaultVO userSearchVO) {
        return (Integer)select("mberManageDAO.selectMberListTotCnt", userSearchVO);
    }

    /**
     * 화면에 조회된 일반회원의 정보를 데이터베이스에서 삭제
     * @param delId 삭제 대상 일반회원아이디
     */
    public void deleteMber(String delId){
        delete("mberManageDAO.deleteMber_S", delId);
    }

    /**
     * 일반회원의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
     * @param mberManageVO 일반회원 등록정보
     * @return String 등록결과
     */
    public String insertMber(MberManageVO mberManageVO){
        return (String)insert("mberManageDAO.insertMber_S", mberManageVO);
    }

    /**
     * 기 등록된 사용자 중 검색조건에 맞는일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
     * @param mberId 상세조회대상 일반회원아이디
     * @return MberManageVO 일반회원 상세정보
     */
    public MberManageVO selectMber(String uniqId){
        return (MberManageVO) select("mberManageDAO.selectMber_S", uniqId);
    }
    
    /**
     * 기 등록된 사용자 중 검색조건에 맞는일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
     * @param mberId 상세조회대상 일반회원아이디
     * @return MberManageVO 일반회원 상세정보
     */
    public MberManageVO selectMberById(String mberId){
        return (MberManageVO) select("mberManageDAO.selectMberById", mberId);
    }
    /**
     * 화면에 조회된일반회원의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
     * @param mberManageVO 일반회원수정정보
     */
    public void updateMber(MberManageVO mberManageVO){
        update("mberManageDAO.updateMber_S",mberManageVO);
    }
    
    /**
     * 화면에 조회된일반회원의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
     * @param mberManageVO 일반회원수정정보
     */
    public void updateMberMain(MberManageVO mberManageVO){
        update("mberManageDAO.updateMber_Main",mberManageVO);
    }
    
    /**
     * 화면에 조회된일반회원의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
     * @param mberManageVO 일반회원수정정보
     */
    public void updateMberSub(MberManageVO mberManageVO){
        update("mberManageDAO.updateMber_Sub",mberManageVO);
    }
    
	   /**
     * 수상정보를 데이터베이스에서 삭제
     * @param delId 삭제 대상 일반회원아이디
     */
    public void deleteAward(String delId){
        delete("mberManageDAO.deleteAward", delId);
    }
    
    /**
     * 일반회원의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
     * @param mberManageAwardVOList 일반회원 등록정보
     * @return String 등록결과
     */
    public String insertAward(List<MberManageAwardVO> mberManageAwardVOList){
         
        MberManageAwardVO mberManageAwardVO = null;
		 for(int i = 0; i < mberManageAwardVOList.size() ; i++){
			 mberManageAwardVO = (MberManageAwardVO)mberManageAwardVOList.get(i);
			 insert("mberManageDAO.insertAward", mberManageAwardVO);
		 }
	     return "";
	     
    }
    
	   /**
	  * 경력정보를 데이터베이스에서 삭제
	  * @param delId 삭제 대상 일반회원아이디
	  */
	 public void deleteCareer(String delId){
	     delete("mberManageDAO.deleteCareer", delId);
	 }
	 
	 /**
	  * 경력일반회원의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
	  * @param mberManageCareerVOList 일반회원 등록정보
	  * @return String 등록결과
	  */
	 public String insertCareer(List<MberManageCareerVO> mberManageCareerVOList){
	     
	     MberManageCareerVO mberManageCareerVO = null;
		 for(int i = 0; i < mberManageCareerVOList.size() ; i++){
			 mberManageCareerVO = (MberManageCareerVO)mberManageCareerVOList.get(i);
			 insert("mberManageDAO.insertCareer", mberManageCareerVO);
		 }
	     return "";
	 }
	 
	   /**
	  * 학위정보를 데이터베이스에서 삭제
	  * @param delId 삭제 대상 일반회원아이디
	  */
	 public void deleteDegree(String delId){
	     delete("mberManageDAO.deleteDegree", delId);
	 }
	 
	 /**
	  *  학위일반회원의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
	  * @param mberManageCareerVOList 일반회원 등록정보
	  * @return String 등록결과
	  */
	 public String insertDegree(List<MberManageDegreeVO> mberManageDegreeVOList){
		 MberManageDegreeVO mberManageDegreeVO = null;
		 for(int i = 0; i < mberManageDegreeVOList.size() ; i++){
			 mberManageDegreeVO = (MberManageDegreeVO)mberManageDegreeVOList.get(i);
			 insert("mberManageDAO.insertDegree", mberManageDegreeVO);
		 }
	     return "";
	 }

	   /**
	  * 논문정보를 데이터베이스에서 삭제
	  * @param delId 삭제 대상 일반회원아이디
	  */
	 public void deletePaper(String delId){
	     delete("mberManageDAO.deletePaper", delId);
	 }
	 
	 /**
	  *  논문일반회원의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
	  * @param mberManageCareerVOList 일반회원 등록정보
	  * @return String 등록결과
	  */
	 public String insertPaper(List<MberManagePaperVO> mberManagePaperVOList){
     
	     MberManagePaperVO mberManagePaperVO = null;
		 for(int i = 0; i < mberManagePaperVOList.size() ; i++){
			 mberManagePaperVO = (MberManagePaperVO)mberManagePaperVOList.get(i);
			 insert("mberManageDAO.insertPaper", mberManagePaperVO);
		 }
	     return "";
	 }
	 
	   /**
	* 수상정보를 데이터베이스에서 삭제
	* @param delId 삭제 대상 일반회원아이디
	*/
	public void deleteActiveTy(String delId){
	   delete("mberManageDAO.deleteActiveTy", delId);
	}

	 /**
	  *  활동분류의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
	  * @param mberManageActiveTyVOList 일반회원 등록정보
	  * @return String 등록결과
	  */
	 public String insertActiveTy(List<MberManageActiveTyVO> mberManageActiveTyVOList){
    
		 MberManageActiveTyVO mberManageActiveTyVO = null;
		 for(int i = 0; i < mberManageActiveTyVOList.size() ; i++){
			 mberManageActiveTyVO = (MberManageActiveTyVO)mberManageActiveTyVOList.get(i);
			 insert("mberManageDAO.insertActiveTy", mberManageActiveTyVO);
		 }
	     return "";
	 }

    /**
     * 일반회원 약관확인
     * @param stplatId 일반회원약관아이디
     * @return List 일반회원약관정보
     */
    public List selectStplat(String stplatId){
    	return list("mberManageDAO.selectStplat_S", stplatId);
    }

    /**
     * 일반회원 암호수정
     * @param passVO 기업회원수정정보(비밀번호)
     */
    public void updatePassword(MberManageVO passVO) {
        update("mberManageDAO.updatePassword_S", passVO);
    }

    /**
     * 일반회원 탈퇴처리
     * @param mberId 일반회원ID
     */
    public void updateWithdraw(String mberId) {
        update("mberManageDAO.updateWithdraw", mberId);
    }

    /**
     * 일반회원이 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
     * @param mberManageVO 일반회원암호 조회조건정보
     * @return MberManageVO 일반회원 암호정보
     */
    public MberManageVO selectPassword(MberManageVO mberManageVO){
    	return (MberManageVO) select("mberManageDAO.selectPassword_S", mberManageVO);
    }

}