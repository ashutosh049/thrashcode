/**
 * 
 */
package models;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * @author Kumar Ashutosh
 *
 */
public class UserSocialAccount {

	private String user_id; 
	private String user_emai_primary; 
	private String user_emai_secondary; 
	private String user_github_id; 
	private String user_stackoverflow_id; 
	private String user_facebook_id; 
	private String user_twitter_id; 
	private String user_blog_url; 
	private CommonsMultipartFile user_image;
	
	/**
	 * 
	 */
	public UserSocialAccount() {
		// TODO Auto-generated constructor stub
	}

	
	public UserSocialAccount(String user_id, String user_emai_primary, String user_emai_secondary,
			String user_github_id, String user_stackoverflow_id, String user_facebook_id, String user_twitter_id,
			String user_blog_url, CommonsMultipartFile user_image) {
		super();
		this.user_id = user_id;
		this.user_emai_primary = user_emai_primary;
		this.user_emai_secondary = user_emai_secondary;
		this.user_github_id = user_github_id;
		this.user_stackoverflow_id = user_stackoverflow_id;
		this.user_facebook_id = user_facebook_id;
		this.user_twitter_id = user_twitter_id;
		this.user_blog_url = user_blog_url;
		this.user_image = user_image;
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
	 * @return the user_emai_primary
	 */
	public String getUser_emai_primary() {
		return user_emai_primary;
	}

	/**
	 * @param user_emai_primary the user_emai_primary to set
	 */
	public void setUser_emai_primary(String user_emai_primary) {
		this.user_emai_primary = user_emai_primary;
	}

	/**
	 * @return the user_emai_secondary
	 */
	public String getUser_emai_secondary() {
		return user_emai_secondary;
	}

	/**
	 * @param user_emai_secondary the user_emai_secondary to set
	 */
	public void setUser_emai_secondary(String user_emai_secondary) {
		this.user_emai_secondary = user_emai_secondary;
	}

	/**
	 * @return the user_github_id
	 */
	public String getUser_github_id() {
		return user_github_id;
	}

	/**
	 * @param user_github_id the user_github_id to set
	 */
	public void setUser_github_id(String user_github_id) {
		this.user_github_id = user_github_id;
	}

	/**
	 * @return the user_stackoverflow_id
	 */
	public String getUser_stackoverflow_id() {
		return user_stackoverflow_id;
	}

	/**
	 * @param user_stackoverflow_id the user_stackoverflow_id to set
	 */
	public void setUser_stackoverflow_id(String user_stackoverflow_id) {
		this.user_stackoverflow_id = user_stackoverflow_id;
	}

	/**
	 * @return the user_facebook_id
	 */
	public String getUser_facebook_id() {
		return user_facebook_id;
	}

	/**
	 * @param user_facebook_id the user_facebook_id to set
	 */
	public void setUser_facebook_id(String user_facebook_id) {
		this.user_facebook_id = user_facebook_id;
	}

	/**
	 * @return the user_twitter_id
	 */
	public String getUser_twitter_id() {
		return user_twitter_id;
	}

	/**
	 * @param user_twitter_id the user_twitter_id to set
	 */
	public void setUser_twitter_id(String user_twitter_id) {
		this.user_twitter_id = user_twitter_id;
	}

	/**
	 * @return the user_blog_url
	 */
	public String getUser_blog_url() {
		return user_blog_url;
	}

	/**
	 * @param user_blog_url the user_blog_url to set
	 */
	public void setUser_blog_url(String user_blog_url) {
		this.user_blog_url = user_blog_url;
	}

	/**
	 * @return the user_image
	 */
	public CommonsMultipartFile getUser_image() {
		return user_image;
	}

	/**
	 * @param user_image the user_image to set
	 */
	public void setUser_image(CommonsMultipartFile user_image) {
		this.user_image = user_image;
	}
	
	

}
