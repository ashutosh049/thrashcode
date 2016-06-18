package models;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UploadItem {
	private String filename;
	private CommonsMultipartFile fileData;

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public CommonsMultipartFile getFileData() {
		return fileData;
	}

	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UploadItem [filename=");
		builder.append(filename);
		builder.append(", fileData=");
		builder.append(fileData);
		builder.append(", getFilename()=");
		builder.append(getFilename());
		builder.append(", getFileData()=");
		builder.append(getFileData());
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