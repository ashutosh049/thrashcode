package models;

import java.util.Date;

public class UserActivity {
	
	private String user_id; 
	private String artcl_id; 
	private String user_actvty_id; 
	private String actvty_id; 
	private String actvty_cat; 
	private String user_actvty_desc; 
	private Date user_actvty_create_date; 
	private Date user_actvty_mod_date;

	public UserActivity() {
		// TODO Auto-generated constructor stub
	}
	
	public UserActivity(String user_id, String artcl_id, String user_actvty_id, String actvty_id, String actvty_cat,
			String user_actvty_desc, Date user_actvty_create_date, Date user_actvty_mod_date) {
		super();
		this.user_id = user_id;
		this.artcl_id = artcl_id;
		this.user_actvty_id = user_actvty_id;
		this.actvty_id = actvty_id;
		this.actvty_cat = actvty_cat;
		this.user_actvty_desc = user_actvty_desc;
		this.user_actvty_create_date = user_actvty_create_date;
		this.user_actvty_mod_date = user_actvty_mod_date;
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
	 * @return the artcl_id
	 */
	public String getArtcl_id() {
		return artcl_id;
	}
	/**
	 * @param artcl_id the artcl_id to set
	 */
	public void setArtcl_id(String artcl_id) {
		this.artcl_id = artcl_id;
	}
	/**
	 * @return the user_actvty_id
	 */
	public String getUser_actvty_id() {
		return user_actvty_id;
	}
	/**
	 * @param user_actvty_id the user_actvty_id to set
	 */
	public void setUser_actvty_id(String user_actvty_id) {
		this.user_actvty_id = user_actvty_id;
	}
	/**
	 * @return the actvty_id
	 */
	public String getActvty_id() {
		return actvty_id;
	}
	/**
	 * @param actvty_id the actvty_id to set
	 */
	public void setActvty_id(String actvty_id) {
		this.actvty_id = actvty_id;
	}
	/**
	 * @return the actvty_cat
	 */
	public String getActvty_cat() {
		return actvty_cat;
	}
	/**
	 * @param actvty_cat the actvty_cat to set
	 */
	public void setActvty_cat(String actvty_cat) {
		this.actvty_cat = actvty_cat;
	}
	/**
	 * @return the user_actvty_desc
	 */
	public String getUser_actvty_desc() {
		return user_actvty_desc;
	}
	/**
	 * @param user_actvty_desc the user_actvty_desc to set
	 */
	public void setUser_actvty_desc(String user_actvty_desc) {
		this.user_actvty_desc = user_actvty_desc;
	}
	/**
	 * @return the user_actvty_create_date
	 */
	public Date getUser_actvty_create_date() {
		return user_actvty_create_date;
	}
	/**
	 * @param user_actvty_create_date the user_actvty_create_date to set
	 */
	public void setUser_actvty_create_date(Date user_actvty_create_date) {
		this.user_actvty_create_date = user_actvty_create_date;
	}
	/**
	 * @return the user_actvty_mod_date
	 */
	public Date getUser_actvty_mod_date() {
		return user_actvty_mod_date;
	}
	/**
	 * @param user_actvty_mod_date the user_actvty_mod_date to set
	 */
	public void setUser_actvty_mod_date(Date user_actvty_mod_date) {
		this.user_actvty_mod_date = user_actvty_mod_date;
	}
	
}
