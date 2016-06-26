package models;

import java.util.Date;

public class ArticleNotifications {
	private String arctl_id; 
	private String cmnt_id; 
	private String user_id; 
	private String cmnt_by_user_fname; 
	private String cmnt_by_user_lname; 
	private Date cmt_date; 
	private boolean read_status;
	private String notification_type;
//	private Comment comment;
	private String notification_data;
	
	public ArticleNotifications() {
		// TODO Auto-generated constructor stub
	}

	public ArticleNotifications(String arctl_id, String cmnt_id, String user_id, String cmnt_by_user_fname,
			String cmnt_by_user_lname, Date cmt_date, boolean read_status, String notification_type,String notification_data) {
		super();
		this.arctl_id = arctl_id;
		this.cmnt_id = cmnt_id;
		this.user_id = user_id;
		this.cmnt_by_user_fname = cmnt_by_user_fname;
		this.cmnt_by_user_lname = cmnt_by_user_lname;
		this.cmt_date = cmt_date;
		this.read_status = read_status;
		this.notification_type=notification_type;
		this.notification_data = notification_data; 
	}
	
	/**
	 * @return the notification_data
	 */
	public String getNotification_data() {
		return notification_data;
	}

	/**
	 * @param notification_data the notification_data to set
	 */
	public void setNotification_data(String notification_data) {
		this.notification_data = notification_data;
	}

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
	 * @return the cmnt_by_user_fname
	 */
	public String getCmnt_by_user_fname() {
		return cmnt_by_user_fname;
	}

	/**
	 * @param cmnt_by_user_fname the cmnt_by_user_fname to set
	 */
	public void setCmnt_by_user_fname(String cmnt_by_user_fname) {
		this.cmnt_by_user_fname = cmnt_by_user_fname;
	}

	/**
	 * @return the cmnt_by_user_lname
	 */
	public String getCmnt_by_user_lname() {
		return cmnt_by_user_lname;
	}

	/**
	 * @param cmnt_by_user_lname the cmnt_by_user_lname to set
	 */
	public void setCmnt_by_user_lname(String cmnt_by_user_lname) {
		this.cmnt_by_user_lname = cmnt_by_user_lname;
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
	 * @return the read_status
	 */
	public boolean isRead_status() {
		return read_status;
	}

	/**
	 * @param read_status the read_status to set
	 */
	public void setRead_status(boolean read_status) {
		this.read_status = read_status;
	}

	/**
	 * @return the notification_type
	 */
	public String getNotification_type() {
		return notification_type;
	}

	/**
	 * @param notification_type the notification_type to set
	 */
	public void setNotification_type(String notification_type) {
		this.notification_type = notification_type;
	}
	
	/**
	 * @return the comment
	 *//*
	public Comment getComment() {
		return comment;
	}

	*//**
	 * @param comment the comment to set
	 *//*
	public void setComment(Comment comment) {
		this.comment = comment;
	}*/

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ArticleNotifications [arctl_id=");
		builder.append(arctl_id);
		builder.append(", cmnt_id=");
		builder.append(cmnt_id);
		builder.append(", user_id=");
		builder.append(user_id);
		builder.append(", cmnt_by_user_fname=");
		builder.append(cmnt_by_user_fname);
		builder.append(", cmnt_by_user_lname=");
		builder.append(cmnt_by_user_lname);
		builder.append(", cmt_date=");
		builder.append(cmt_date);
		builder.append(", read_status=");
		builder.append(read_status);
		builder.append(", getArctl_id()=");
		builder.append(getArctl_id());
		builder.append(", getCmnt_id()=");
		builder.append(getCmnt_id());
		builder.append(", getUser_id()=");
		builder.append(getUser_id());
		builder.append(", getCmnt_by_user_fname()=");
		builder.append(getCmnt_by_user_fname());
		builder.append(", getCmnt_by_user_lname()=");
		builder.append(getCmnt_by_user_lname());
		builder.append(", getCmt_date()=");
		builder.append(getCmt_date());
		builder.append(", isRead_status()=");
		builder.append(isRead_status());
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
