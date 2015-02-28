package support.common.model;

/**
 * @Class Name : FileVO
 * @Description : 파일의 정보를 가지고 있는 VO 입니다. 이미지의 경우 섬네일을 생성하며 width, height의 값을 가지고 있어야 합니다.
 * @author 방은
 * @Modification Information
 * 
 * <pre>
 *      수정일          수정자                   수정내용
 *    -------          --------        ---------------------------
 *   2014. 12. 24.      방은                     최초 생성
 * </pre>
 * @see
 */
public class FileVO {

	private String fileId;
	private String createdDate;
	private String contentType;
	private long size;
	private String category;
	private String realName;
	private String virtualName;
	private String height;
	private String width;
	private boolean hasThumnail;

	public String getFileId() {

		return fileId;
	}

	public void setFileId(String fileId) {

		this.fileId = fileId;
	}

	public String getCreatedDate() {

		return createdDate;
	}

	public void setCreatedDate(String createdDate) {

		this.createdDate = createdDate;
	}

	public String getContentType() {

		return contentType;
	}

	public void setContentType(String contentType) {

		this.contentType = contentType;
	}

	public long getSize() {

		return size;
	}

	public void setSize(long size) {

		this.size = size;
	}

	public String getCategory() {

		return category;
	}

	public void setCategory(String category) {

		this.category = category;
	}

	public String getRealName() {

		return realName;
	}

	public void setRealName(String realName) {

		this.realName = realName;
	}

	public String getVirtualName() {

		return virtualName;
	}

	public void setVirtualName(String virtualName) {

		this.virtualName = virtualName;
	}

	public String getHeight() {

		return height;
	}

	public void setHeight(String height) {

		this.height = height;
	}

	public String getWidth() {

		return width;
	}

	public void setWidth(String width) {

		this.width = width;
	}

	public boolean isHasThumnail() {

		return hasThumnail;
	}

	public void setHasThumnail(boolean hasThumnail) {

		this.hasThumnail = hasThumnail;
	}

	@Override
	public String toString() {

		return "FileVO [fileId=" + fileId + ", createdDate=" + createdDate + ", contentType=" + contentType + ", size=" + size + ", category=" + category + ", realName=" + realName + ", virtualName=" + virtualName + ", height=" + height + ", width=" + width + ", hasThumnail=" + hasThumnail + "]";
	}

}
