/**
 * 
 */
package models;

/**
 * @author Kumar Ashutosh
 *
 */
public class UserCredentials {
	private String userId;
	private String userPassword;
	
	public UserCredentials() {
		// TODO Auto-generated constructor stub
	}

	public UserCredentials(String userId, String userPassword) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
	}

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the userPassword
	 */
	public String getUserPassword() {
		return userPassword;
	}

	/**
	 * @param userPassword the userPassword to set
	 */
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	
}
