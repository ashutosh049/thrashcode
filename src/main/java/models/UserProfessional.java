/**
 * 
 */
package models;

import java.util.List;

/**
 * @author Kumar Ashutosh
 *
 */
public class UserProfessional {

	private String user_id; 
	private String user_wroks_as; 
	private String user_worsk_in; 
	private List<String> user_skills;
	
	/**
	 * 
	 */
	public UserProfessional() {
		// TODO Auto-generated constructor stub
	}

	
	
	public UserProfessional(String user_id, String user_wroks_as, String user_worsk_in, List<String> user_skills) {
		super();
		this.user_id = user_id;
		this.user_wroks_as = user_wroks_as;
		this.user_worsk_in = user_worsk_in;
		this.user_skills = user_skills;
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
	 * @return the user_wroks_as
	 */
	public String getUser_wroks_as() {
		return user_wroks_as;
	}

	/**
	 * @param user_wroks_as the user_wroks_as to set
	 */
	public void setUser_wroks_as(String user_wroks_as) {
		this.user_wroks_as = user_wroks_as;
	}

	/**
	 * @return the user_worsk_in
	 */
	public String getUser_worsk_in() {
		return user_worsk_in;
	}

	/**
	 * @param user_worsk_in the user_worsk_in to set
	 */
	public void setUser_worsk_in(String user_worsk_in) {
		this.user_worsk_in = user_worsk_in;
	}

	/**
	 * @return the user_skills
	 */
	public List<String> getUser_skills() {
		return user_skills;
	}

	/**
	 * @param user_skills the user_skills to set
	 */
	public void setUser_skills(List<String> user_skills) {
		this.user_skills = user_skills;
	}
	

}
