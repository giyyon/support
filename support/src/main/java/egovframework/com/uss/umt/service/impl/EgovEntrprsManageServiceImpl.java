package egovframework.com.uss.umt.service.impl;

import java.util.List;

import egovframework.com.uss.umt.service.EgovEntrprsManageService;
import egovframework.com.uss.umt.service.EntrprsManageVO;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 기업회원관리에 관한 비지니스클래스를 정의한다.
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
@Service("entrprsManageService")
public class EgovEntrprsManageServiceImpl extends EgovAbstractServiceImpl implements EgovEntrprsManageService {
    
	/** userManageDAO */
    @Resource(name="userManageDAO")
    private UserManageDAO userManageDAO;
    
    /** mberManageDAO */
    @Resource(name="mberManageDAO")
    private MberManageDAO mberManageDAO;
    
    /** entrprsManageDAO */
    @Resource(name="entrprsManageDAO")
    private EntrprsManageDAO entrprsManageDAO;
    
    /** egovUsrCnfrmIdGnrService */
    @Resource(name="egovUsrCnfrmIdGnrService")
    private EgovIdGnrService idgenService;
    
    /**
	 * 기업회원의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
	 * @param entrprsManageVO 기업회원등록정보
	 * @return result 등록결과
	 * @throws Exception
	 */
    public String insertEntrprsmber(EntrprsManageVO entrprsManageVO) throws Exception  {
        //고유아이디 셋팅
    	String uniqId = idgenService.getNextStringId();
        entrprsManageVO.setUniqId(uniqId);
        //패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(entrprsManageVO.getEntrprsMberPassword());
		entrprsManageVO.setEntrprsMberPassword(pass);
		
        String result = entrprsManageDAO.insertEntrprsmber(entrprsManageVO);
        return result;
    }
    
    /**
	 * 기 등록된 사용자 중 검색조건에 맞는기업회원의 정보를 데이터베이스에서 읽어와 화면에 출력
	 * @param uniqId 조회대상 기업회원아이디
	 * @return entrprsManageVO 기업회원정보
	 * @throws Exception
	 */
    public EntrprsManageVO selectEntrprsmber(String uniqId) {
        EntrprsManageVO entrprsManageVO = entrprsManageDAO.selectEntrprsmber(uniqId);        
        return entrprsManageVO;
    }

    
	/**
	 * 기 등록된 사용자 중 검색조건에 맞는 일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
	 * @param mberId 상세조회대상 일반회원아이디
	 * @return entrprsManageVO 기업회원정보
	 * @throws Exception
	 */
	public EntrprsManageVO selectEntrprsmberById(String entrprsmberId) {
		EntrprsManageVO entrprsManageVO = entrprsManageDAO.selectEntrprsmberById(entrprsmberId);		
		return entrprsManageVO;
	}
	
	/**
	 * 화면에 조회된 기업회원의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 * @param entrprsManageVO 기업회원수정정보
	 * @throws Exception
	 */
    public void updateEntrprsmber(EntrprsManageVO entrprsManageVO) throws Exception {
    	//패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(entrprsManageVO.getEntrprsMberPassword());
		entrprsManageVO.setEntrprsMberPassword(pass);
		entrprsManageDAO.updateEntrprsmber(entrprsManageVO);
    }

	/**
	 * 화면에 조회된 기업회원의 정보를 데이터베이스에서 삭제
	 * @param checkedIdForDel 삭제대상기업회원아이디
	 * @throws Exception
	 */
    public void deleteEntrprsmber(String checkedIdForDel)  {
        //log.debug("jjyser_delete-->"+checkedIdForDel);
        String [] delId = checkedIdForDel.split(",");
        for (int i=0; i<delId.length ; i++){
            String [] id = delId[i].split(":");
            //log.debug("id[0]:"+id[0]);
            if (id[0].equals("USR03")){
                //업무사용자(직원)삭제
                userManageDAO.deleteUser(id[1]);                
            }else if(id[0].equals("USR01")){
                //일반회원삭제
                mberManageDAO.deleteMber(id[1]);
            }else if(id[0].equals("USR02")){
                //기업회원삭제
                entrprsManageDAO.deleteEntrprsmber(id[1]);
            }
        }
    }

	/**
	 * 기업회원용 약관정보 조회
	 * @param stplatId 기업회원약관아이디
	 * @return stplatList 기업회원약관정보
	 * @throws Exception
	 */
    public List selectStplat(String stplatId) {
    	List stplatList = entrprsManageDAO.selectStplat(stplatId);        
        return stplatList;
    }
	
	/**
	 * 기업회원 암호 수정
	 * @param passVO 기업회원수정정보(비밀번호)
	 * @throws Exception
	 */
	public void updatePassword(EntrprsManageVO passVO) {
		entrprsManageDAO.updatePassword(passVO);
	}

	/**
	 * 기업회원이 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
	 * @param passVO 기업회원암호 조회조건정보
	 * @return entrprsManageVO 기업회원암호정보
	 * @throws Exception
	 */
	public EntrprsManageVO selectPassword(EntrprsManageVO passVO) {
		EntrprsManageVO entrprsManageVO = entrprsManageDAO.selectPassword(passVO);
		return entrprsManageVO;
	}

	/**
	 * 기 등록된기업 회원 중 검색조건에 맞는 회원들의 정보를 데이터베이스에서 읽어와 화면에 출력
	 * @param userSearchVO 검색조건
	 * @return List<EntrprsManageVO> 기업회원목록정보
	 * @throws Exception
	 */
	public List<EntrprsManageVO> selectEntrprsMberList(UserDefaultVO userSearchVO) {
		return entrprsManageDAO.selectEntrprsMberList(userSearchVO);
	}

    /**
     * 기업회원 총 갯수를 조회한다.
     * @param userSearchVO 검색조건
     * @return 사용자 총 갯수(int)
     * @throws Exception
     */
    public int selectEntrprsMberListTotCnt(UserDefaultVO userSearchVO) {
    	return entrprsManageDAO.selectEntrprsMberListTotCnt(userSearchVO);
    }

	@Override
	public void updateEntrprsmberMain(EntrprsManageVO entrprsManageVO) throws Exception {

		entrprsManageDAO.updateEntrprsmberMain(entrprsManageVO);
		
	}

	@Override
	public void updateEntrprsmberSub(EntrprsManageVO entrprsManageVO) throws Exception {

		//부가정보 기록
		entrprsManageDAO.updateEntrprsmberSub(entrprsManageVO);
		
	}

	@Override
	public void updateWithdraw(String entrprsmberId) throws Exception {

		//부가정보 기록
		entrprsManageDAO.updateWithdraw(entrprsmberId);
		
	}
	

}