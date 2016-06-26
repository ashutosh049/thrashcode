package models;

import java.io.File;
import java.util.Date;

public class Comment {
	private String arctl_id; 
	private String cmnt_id;
	private String user_id;
	private String user_fname;
	private String user_lname;
	private Date cmt_date;
	private String cmt_filePath;
	private File cmt_file;
	private String cmt_data;
	private Long cmt_likes;
	private Long cmt_dislikes;
	
	/**
	 * @return the arctl_id
	 */
	public String getArctl_id() {
		return arctl_id;
	}
	/**
	 * @param arctl_id the arctl_id to set
	 */
	public void setArctl_id(String arctl_id) {
		this.arctl_id = arctl_id;
	}
	/**
	 * @return the cmnt_id
	 */
	public String getCmnt_id() {
		return cmnt_id;
	}
	/**
	 * @param cmnt_id the cmnt_id to set
	 */
	public void setCmnt_id(String cmnt_id) {
		this.cmnt_id = cmnt_id;
	}
	/**
	 * @return the user_id
	 */
	public String getUser_id() {
		return user_id;
	}
	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	/**
	 * @return the user_fname
	 */
	public String getUser_fname() {
		return user_fname;
	}
	/**
	 * @param user_fname the user_fname to set
	 */
	public void setUser_fname(String user_fname) {
		this.user_fname = user_fname;
	}
	/**
	 * @return the user_lname
	 */
	public String getUser_lname() {
		return user_lname;
	}
	/**
	 * @param user_lname the user_lname to set
	 */
	public void setUser_lname(String user_lname) {
		this.user_lname = user_lname;
	}
	/**
	 * @return the cmt_date
	 */
	public Date getCmt_date() {
		return cmt_date;
	}
	/**
	 * @param cmt_date the cmt_date to set
	 */
	public void setCmt_date(Date cmt_date) {
		this.cmt_date = cmt_date;
	}
	/**
	 * @return the cmt_filePath
	 */
	public String getCmt_filePath() {
		return cmt_filePath;
	}
	/**
	 * @param cmt_filePath the cmt_filePath to set
	 */
	public void setCmt_filePath(String cmt_filePath) {
		//create folder and file
		this.cmt_filePath = cmt_filePath;
	}
	/**
	 * @return the cmt_file
	 */
	public File getCmt_file() {
		return cmt_file;
	}
	/**
	 * @param cmt_file the cmt_file to set
	 */
	public void setCmt_file(File cmt_file) {
		this.cmt_file = cmt_file;
	}
	/**
	 * @return the cmt_data
	 */
	public String getCmt_data() {
		return cmt_data;
	}
	/**
	 * @param cmt_data the cmt_data to set
	 */
	public void setCmt_data(String cmt_data) {
		this.cmt_data = cmt_data;
	}
	/**
	 * @return the cmt_likes
	 */
	public Long getCmt_likes() {
		return cmt_likes;
	}
	/**
	 * @param cmt_likes the cmt_likes to set
	 */
	public void setCmt_likes(Long cmt_likes) {
		this.cmt_likes = cmt_likes;
	}
	/**
	 * @return the cmt_dislikes
	 */
	public Long getCmt_dislikes() {
		return cmt_dislikes;
	}
	/**
	 * @param cmt_dislikes the cmt_dislikes to set
	 */
	public void setCmt_dislikes(Long cmt_dislikes) {
		this.cmt_dislikes = cmt_dislikes;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Comment [arctl_id=");
		builder.append(arctl_id);
		builder.append(", cmnt_id=");
		builder.append(cmnt_id);
		builder.append(", user_id=");
		builder.append(user_id);
		builder.append(", user_fname=");
		builder.append(user_fname);
		builder.append(", user_lname=");
		builder.append(user_lname);
		builder.append(", cmt_date=");
		builder.append(cmt_date);
		builder.append(", cmt_filePath=");
		builder.append(cmt_filePath);
		builder.append(", cmt_file=");
		builder.append(cmt_file);
		builder.append(", cmt_data=");
		builder.append(cmt_data);
		builder.append(", cmt_likes=");
		builder.append(cmt_likes);
		builder.append(", cmt_dislikes=");
		builder.append(cmt_dislikes);
		builder.append(", getArctl_id()=");
		builder.append(getArctl_id());
		builder.append(", getCmnt_id()=");
		builder.append(getCmnt_id());
		builder.append(", getUser_id()=");
		builder.append(getUser_id());
		builder.append(", getUser_fname()=");
		builder.append(getUser_fname());
		builder.append(", getUser_lname()=");
		builder.append(getUser_lname());
		builder.append(", getCmt_date()=");
		builder.append(getCmt_date());
		builder.append(", getCmt_filePath()=");
		builder.append(getCmt_filePath());
		builder.append(", getCmt_file()=");
		builder.append(getCmt_file());
		builder.append(", getCmt_data()=");
		builder.append(getCmt_data());
		builder.append(", getCmt_likes()=");
		builder.append(getCmt_likes());
		builder.append(", getCmt_dislikes()=");
		builder.append(getCmt_dislikes());
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
