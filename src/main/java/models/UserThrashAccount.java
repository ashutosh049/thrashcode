/**
 * 
 */
package models;

import java.util.Date;

/**
 * @author Kumar Ashutosh
 *
 */
public class UserThrashAccount {

	private String user_id; 
	private String user_tc_active_status; 
	private Date user_tc_join_date; 
	private Date user_tc_last_active_date;
	
	/**
	 * 
	 */
	public UserThrashAccount() {
		// TODO Auto-generated constructor stub
	}

	public UserThrashAccount(String user_id, String user_tc_active_status, Date user_tc_join_date,
			Date user_tc_last_active_date) {
		super();
		this.user_id = user_id;
		this.user_tc_active_status = user_tc_active_status;
		this.user_tc_join_date = user_tc_join_date;
		this.user_tc_last_active_date = user_tc_last_active_date;
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
	 * @return the user_tc_active_status
	 */
	public String getUser_tc_active_status() {
		return user_tc_active_status;
	}

	/**
	 * @param user_tc_active_status the user_tc_active_status to set
	 */
	public void setUser_tc_active_status(String user_tc_active_status) {
		this.user_tc_active_status = user_tc_active_status;
	}

	/**
	 * @return the user_tc_join_date
	 */
	public Date getUser_tc_join_date() {
		return user_tc_join_date;
	}

	/**
	 * @param user_tc_join_date the user_tc_join_date to set
	 */
	public void setUser_tc_join_date(Date user_tc_join_date) {
		this.user_tc_join_date = user_tc_join_date;
	}

	/**
	 * @return the user_tc_last_active_date
	 */
	public Date getUser_tc_last_active_date() {
		return user_tc_last_active_date;
	}

	/**
	 * @param user_tc_last_active_date the user_tc_last_active_date to set
	 */
	public void setUser_tc_last_active_date(Date user_tc_last_active_date) {
		this.user_tc_last_active_date = user_tc_last_active_date;
	}
	

}
