package models;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class GenericWithImage {

	private Object classData;
	private CommonsMultipartFile imgData;
	private String contentType;
	private String encoding;
	private String timeAgo;
	
	public GenericWithImage() {
		// TODO Auto-generated constructor stub
	}
	
	
	/**
	 * @return the contentType
	 */
	public String getContentType() {
		return contentType;
	}


	/**
	 * @param contentType the contentType to set
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}


	/**
	 * @return the encoding
	 */
	public String getEncoding() {
		return encoding;
	}


	/**
	 * @param encoding the encoding to set
	 */
	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}


	public GenericWithImage(Object classData, CommonsMultipartFile imgData, String contentType, String encoding,
			String timeAgo) {
		super();
		this.classData = classData;
		this.imgData = imgData;
		this.contentType = contentType;
		this.encoding = encoding;
		this.timeAgo = timeAgo;
	}



	/**
	 * @return the classData
	 */
	public Object getClassData() {
		return classData;
	}
	/**
	 * @param classData the classData to set
	 */
	public void setClassData(Object classData) {
		this.classData = classData;
	}
	/**
	 * @return the imgData
	 */
	public CommonsMultipartFile getImgData() {
		return imgData;
	}
	/**
	 * @param imgData the imgData to set
	 */
	public void setImgData(CommonsMultipartFile imgData) {
		this.imgData = imgData;
	}
	

	/**
	 * @return the timeAgo
	 */
	public String getTimeAgo() {
		return timeAgo;
	}


	/**
	 * @param timeAgo the timeAgo to set
	 */
	public void setTimeAgo(String timeAgo) {
		this.timeAgo = timeAgo;
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GenericWithImage [classData=");
		builder.append(classData);
		builder.append(", imgData=");
		builder.append(imgData);
		builder.append(", contentType=");
		builder.append(contentType);
		builder.append(", encoding=");
		builder.append(encoding);
		builder.append(", getContentType()=");
		builder.append(getContentType());
		builder.append(", getEncoding()=");
		builder.append(getEncoding());
		builder.append(", getClassData()=");
		builder.append(getClassData());
		builder.append(", getImgData()=");
		builder.append(getImgData());
		builder.append(", getClass()=");
		builder.append(getClass());
		builder.append(", hashCode()=");
		builder.append(hashCode());
		builder.append(", toString()=");
		builder.append(super.toString());
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
