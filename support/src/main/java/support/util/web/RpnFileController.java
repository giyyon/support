package support.util.web;

import java.io.ByteArrayOutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import support.common.model.JsonObject;
import support.common.model.FileVO;

import support.util.file.FileUtil;

@Controller
@RequestMapping(value = "/files")
public class RpnFileController {



	/**
	 * @Method Name : uploadPage
	 * @Method 설명 : 파일을 업로드 하는 페이지
	 * @작성일 : 2014. 4. 17.오후 3:06:47
	 * @작성자 : 이방은
	 * @Modification Information
	 * 
	 * <pre>
		 *     수정일         수정자                   수정내용
		 *     -------          --------        ---------------------------
		 *   2014. 4. 17.      이방은                  최초 생성
		 * </pre>
	 * @return
	 */
	@RequestMapping(value = "/uploadPage.do", method = RequestMethod.GET)
	public String uploadPage() {

		return ".popup_files/upload";
	}

	/**
	 * @Method Name : listPage
	 * @Method 설명 : 파일 목록 팝업
	 * @작성일 : 2014. 4. 22.오전 11:03:49
	 * @작성자 : 이방은
	 * @Modification Information
	 * 
	 * <pre>
		 *     수정일         수정자                   수정내용
		 *     -------          --------        ---------------------------
		 *   2014. 4. 22.      이방은                  최초 생성
		 * </pre>
	 * @return
	 */
	@RequestMapping(value = "/listPage.do", method = RequestMethod.GET)
	public String listPage() {

		return ".popup_files/fileList";
	}

	/**
	 * @Method Name : upload
	 * @Method 설명 : 파일 업로드
	 * @작성일 : 2014. 4. 22.오전 10:37:22
	 * @작성자 : 이방은
	 * @Modification Information
	 * 
	 * <pre>
		 *     수정일         수정자                   수정내용
		 *     -------          --------        ---------------------------
		 *   2014. 4. 22.      이방은                  최초 생성
		 * </pre>
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
	public void upload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// upload to disk
		List<FileVO> list = FileUtil.uploadFiles(request);
		
		// add to DB
		///this.rpnFileService.upload(list);
		
		JsonObject jo = new JsonObject();
		jo.IsSucceed = true;
		jo.Data = list;

		// IE 9 이하 버전 호환성을 위해 plain으로 내려야 한다.
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		ObjectMapper objectMapper = new ObjectMapper();

		String userAgent = request.getHeader("User-Agent");
		boolean ie = userAgent.indexOf("MSIE") > -1;
		String regex = "/Trident.*rv[ :]*11\\./";
		boolean isIE11 = userAgent.matches(regex);
		if (ie || isIE11) {
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setRealName(URLEncoder.encode(list.get(i).getRealName(), "UTF-8"));
			}
		}

		JsonGenerator generator = objectMapper.getJsonFactory().createJsonGenerator(byteArrayOutputStream, JsonEncoding.UTF8);

		objectMapper.writeValue(generator, jo);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(new String(byteArrayOutputStream.toByteArray(), "UTF-8"));
		
	}

	/**
	 * @Method Name : getFiles
	 * @Method 설명 : 파일 목록을 가져온다.
	 * @작성일 : 2014. 4. 22.오전 10:37:32
	 * @작성자 : 이방은
	 * @Modification Information
	 * 
	 * <pre>
		 *     수정일         수정자                   수정내용
		 *     -------          --------        ---------------------------
		 *   2014. 4. 22.      이방은                  최초 생성
		 * </pre>
	 * @param fileIds
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getFiles.do", method = RequestMethod.GET)
	public JsonObject getFiles(String fileIds) {
		
		List<FileVO> fileList = null; ///this.rpnFileService.getFiles(fileIds);

		JsonObject jo = new JsonObject();
		jo.IsSucceed = true;
		jo.Data = fileList;
		return jo;
	}

	/**
	 * @Method Name : download
	 * @Method 설명 : 파일 다운로드
	 * @작성일 : 2014. 4. 22.오전 10:37:05
	 * @작성자 : 이방은
	 * @Modification Information
	 * 
	 * <pre>
		 *     수정일         수정자                   수정내용
		 *     -------          --------        ---------------------------
		 *   2014. 4. 22.      이방은                  최초 생성
		 * </pre>
	 * @param fileVO
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping(value = "/download.do", method = RequestMethod.GET)
	public void download(FileVO fileVO, HttpServletResponse response, HttpServletRequest request) throws Exception {

		boolean hasError = false;
		List<FileVO> fileList = null ; //this.rpnFileService.getFiles(fileVO.getFileId());

		if (fileList.size() == 0) {
			hasError = true;
		}
		FileVO dbFile = fileList.get(0);
		if (dbFile.getSize() == fileVO.getSize() && dbFile.getContentType().equals(fileVO.getContentType()) && dbFile.getVirtualName().equals(fileVO.getVirtualName())) {
			try {
				FileUtil.downloadFile(dbFile, request, response);
			}
			catch (Exception ex) {
				hasError = true;
			}
		}
		else {
			hasError = true;
		}
		if (hasError) {
			response.setHeader("Content-Type", "text/html; charset=utf-8");

			throw new Exception();
		}
		else {
			
			//Cookie cookie = new Cookie("fileDownload", "true"); cookie.setPath("/"); response.addCookie(cookie);
			 
			// String a = EgovSessionCookieUtil.getCookie(request, "fileDownload");
			//EgovSessionCookieUtil.setCookie(response, "fileDownload", "true");
			// String c = EgovSessionCookieUtil.getCookie(request, "fileDownload");
		}
	}

	@ResponseBody
	@RequestMapping(value = "/remove.do", method = RequestMethod.POST)
	public JsonObject remove(FileVO fileVO, HttpServletRequest request) {

		JsonObject jo = new JsonObject();
		List<FileVO> fileList = null ; //this.rpnFileService.getFiles(fileVO.getFileId());
		if (fileList.size() == 0) {
			jo.IsSucceed = false;
			jo.Message = "파일이 존재하지 않습니다.";
			return jo;
		}
		FileVO dbFile = fileList.get(0);
		if (dbFile.getSize() == fileVO.getSize() && dbFile.getContentType().equals(fileVO.getContentType()) && dbFile.getVirtualName().equals(fileVO.getVirtualName())) {

			// remove from db
			/*
			if (this.rpnFileService.remove(fileVO)) {

				// remove from disk
				try {
					FileUtil.removeFile(fileVO, request);
					jo.IsSucceed = true;
					jo.Message = "파일을 삭제하였습니다.";
					jo.Data = fileVO;
				}
				catch (Exception e) {
					jo.IsSucceed = false;
					jo.Message = e.getMessage();
				}
			}
			else {
				jo.IsSucceed = false;
				jo.Message = "파일을 삭제하는데 실패 하였습니다.";
			}
			*/
		}
		else {
			jo.IsSucceed = false;
			jo.Message = "파일 정보가 옳지 않습니다.";
		}
		return jo;
	}
}
