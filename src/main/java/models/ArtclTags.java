package models;

public class ArtclTags {
	
	private String artcl_tag_id; 
	private String artcl_tag_name; 
	private String artcl_tag_description; 
	private String artcl_cat_id;
	
	public ArtclTags() {
		// TODO Auto-generated constructor stub
	}
	
	
	public ArtclTags(String artcl_tag_id, String artcl_tag_name, String artcl_tag_description, String artcl_cat_id) {
		super();
		this.artcl_tag_id = artcl_tag_id;
		this.artcl_tag_name = artcl_tag_name;
		this.artcl_tag_description = artcl_tag_description;
		this.artcl_cat_id = artcl_cat_id;
	}


	/**
	 * @return the artcl_tag_id
	 */
	public String getArtcl_tag_id() {
		return artcl_tag_id;
	}
	/**
	 * @param artcl_tag_id the artcl_tag_id to set
	 */
	public void setArtcl_tag_id(String artcl_tag_id) {
		this.artcl_tag_id = artcl_tag_id;
	}
	/**
	 * @return the artcl_tag_name
	 */
	public String getArtcl_tag_name() {
		return artcl_tag_name;
	}
	/**
	 * @param artcl_tag_name the artcl_tag_name to set
	 */
	public void setArtcl_tag_name(String artcl_tag_name) {
		this.artcl_tag_name = artcl_tag_name;
	}
	/**
	 * @return the artcl_tag_description
	 */
	public String getArtcl_tag_description() {
		return artcl_tag_description;
	}
	/**
	 * @param artcl_tag_description the artcl_tag_description to set
	 */
	public void setArtcl_tag_description(String artcl_tag_description) {
		this.artcl_tag_description = artcl_tag_description;
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


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ArtclTags [artcl_tag_id=");
		builder.append(artcl_tag_id);
		builder.append(", artcl_tag_name=");
		builder.append(artcl_tag_name);
		builder.append(", artcl_tag_description=");
		builder.append(artcl_tag_description);
		builder.append(", artcl_cat_id=");
		builder.append(artcl_cat_id);
		builder.append(", getArtcl_tag_id()=");
		builder.append(getArtcl_tag_id());
		builder.append(", getArtcl_tag_name()=");
		builder.append(getArtcl_tag_name());
		builder.append(", getArtcl_tag_description()=");
		builder.append(getArtcl_tag_description());
		builder.append(", getArtcl_cat_id()=");
		builder.append(getArtcl_cat_id());
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
