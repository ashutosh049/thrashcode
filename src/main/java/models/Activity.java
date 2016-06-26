package models;

public class Activity {
	
	private String actvty_id;
	private String actvty_cat;
	private String actvty_type;
	private String actvty_desc;
	
	public Activity() {
		// TODO Auto-generated constructor stub
	}
	
	public Activity(String actvty_id, String actvty_cat, String actvty_type, String actvty_desc) {
		super();
		this.actvty_id = actvty_id;
		this.actvty_cat = actvty_cat;
		this.actvty_type = actvty_type;
		this.actvty_desc = actvty_desc;
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
	 * @return the actvty_type
	 */
	public String getActvty_type() {
		return actvty_type;
	}
	/**
	 * @param actvty_type the actvty_type to set
	 */
	public void setActvty_type(String actvty_type) {
		this.actvty_type = actvty_type;
	}
	/**
	 * @return the actvty_desc
	 */
	public String getActvty_desc() {
		return actvty_desc;
	}
	/**
	 * @param actvty_desc the actvty_desc to set
	 */
	public void setActvty_desc(String actvty_desc) {
		this.actvty_desc = actvty_desc;
	}

	
}
