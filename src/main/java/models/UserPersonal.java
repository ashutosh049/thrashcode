/**
 * 
 */
package models;

import java.util.Date;

/**
 * @author Kumar Ashutosh
 *
 */
public class UserPersonal {
	private String user_id; 
	private String user_fname; 
	private String user_lname; 
	private Date user_dob; 
	private int user_age; 
	private String user_sex;
	private String user_mobile_no;
	
	/**
	 * 
	 */
	public UserPersonal() {
		// TODO Auto-generated constructor stub
	}

	public UserPersonal(String user_id, String user_fname, String user_lname, Date user_dob, int user_age,
			String user_sex, String user_mobile_no) {
		super();
		this.user_id = user_id;
		this.user_fname = user_fname;
		this.user_lname = user_lname;
		this.user_dob = user_dob;
		this.user_age = user_age;
		this.user_sex = user_sex;
		this.user_mobile_no = user_mobile_no;
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
	 * @return the user_dob
	 */
	public Date getUser_dob() {
		return user_dob;
	}

	/**
	 * @param user_dob the user_dob to set
	 */
	public void setUser_dob(Date user_dob) {
		this.user_dob = user_dob;
	}

	/**
	 * @return the user_age
	 */
	public int getUser_age() {
		return user_age;
	}

	/**
	 * @param user_age the user_age to set
	 */
	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}

	/**
	 * @return the user_sex
	 */
	public String getUser_sex() {
		return user_sex;
	}

	/**
	 * @param user_sex the user_sex to set
	 */
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	/**
	 * @return the user_mobile_no
	 */
	public String getUser_mobile_no() {
		return user_mobile_no;
	}

	/**
	 * @param user_mobile_no the user_mobile_no to set
	 */
	public void setUser_mobile_no(String user_mobile_no) {
		this.user_mobile_no = user_mobile_no;
	}
	
}
