package models;

public class ArticleCategories {

	private String artcl_cat_id;
	private String artcl_cat_name;
	
	public ArticleCategories() {
		// TODO Auto-generated constructor stub
	}

	
	public ArticleCategories(String artcl_cat_id, String artcl_cat_name) {
		super();
		this.artcl_cat_id = artcl_cat_id;
		this.artcl_cat_name = artcl_cat_name;
	}


	/**
	 * @return the artcl_cat_id
	 */
	public String getArtcl_cat_id() {
		return artcl_cat_id;
	}

	/**
	 * @param artcl_cat_id the artcl_cat_id to set
	 */
	public void setArtcl_cat_id(String artcl_cat_id) {
		this.artcl_cat_id = artcl_cat_id;
	}

	/**
	 * @return the artcl_cat_name
	 */
	public String getArtcl_cat_name() {
		return artcl_cat_name;
	}

	/**
	 * @param artcl_cat_name the artcl_cat_name to set
	 */
	public void setArtcl_cat_name(String artcl_cat_name) {
		this.artcl_cat_name = artcl_cat_name;
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ArticleCategories [artcl_cat_id=");
		builder.append(artcl_cat_id);
		builder.append(", artcl_cat_name=");
		builder.append(artcl_cat_name);
		builder.append(", getArtcl_cat_id()=");
		builder.append(getArtcl_cat_id());
		builder.append(", getArtcl_cat_name()=");
		builder.append(getArtcl_cat_name());
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
