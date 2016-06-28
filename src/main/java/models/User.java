package models;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class User {

	private String user_id;
	private String user_pwd;
	private String user_fname;
	private String user_lname;
	private String user_email;
	private CommonsMultipartFile  user_img;
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	public User(String user_id, String user_pwd, String user_fname, String user_lname, String user_email) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_fname = user_fname;
		this.user_lname = user_lname;
		this.user_email = user_email;
	}
	
	public User(String user_id, String user_fname, String user_lname, String user_email) {
		super();
		this.user_id = user_id;
		this.user_fname = user_fname;
		this.user_lname = user_lname;
		this.user_email = user_email;
	}

/*	public User getCurrentUser(){
		User user = new User();
		user.s
		return user;
	}
*/
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
	 * @return the user_pwd
	 */
	public String getUser_pwd() {
		return user_pwd;
	}
	/**
	 * @param user_pwd the user_pwd to set
	 */
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
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
	 * @return the user_email
	 */
	public String getUser_email() {
		return user_email;
	}
	/**
	 * @param user_email the user_email to set
	 */
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	/**
	 * @return the user_img
	 */
	public CommonsMultipartFile getUser_img() {
		return user_img;
	}
	/**
	 * @param user_img the user_img to set
	 */
	public void setUser_img(CommonsMultipartFile user_img) {
		this.user_img = user_img;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [user_id=");
		builder.append(user_id);
		builder.append(", user_pwd=");
		builder.append(user_pwd);
		builder.append(", user_fname=");
		builder.append(user_fname);
		builder.append(", user_lname=");
		builder.append(user_lname);
		builder.append(", user_email=");
		builder.append(user_email);
		builder.append(", user_img=");
		builder.append(user_img);
		builder.append(", getUser_id()=");
		builder.append(getUser_id());
		builder.append(", getUser_pwd()=");
		builder.append(getUser_pwd());
		builder.append(", getUser_fname()=");
		builder.append(getUser_fname());
		builder.append(", getUser_lname()=");
		builder.append(getUser_lname());
		builder.append(", getUser_email()=");
		builder.append(getUser_email());
		builder.append(", getUser_img()=");
		builder.append(getUser_img());
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
