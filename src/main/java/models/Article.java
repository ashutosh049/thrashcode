package models;

import java.util.Date;
import java.util.List;

public class Article {

	private String artcl_id;
	private String artcl_cat_id;
	private Date artcl_date;
	private String artcl_owner_name;
	private List<String> artcl_tags;
	private String artcl_owner_id;
	private String artcle_title;
	private String artcle_brf_desc;
	private String artcle_Data;
	private String artcle_filePath;
	private Date artcle_lastUpdateDate;
	private int artcle_hits;
	private String artcle_type;
	
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
	 * @return the artcl_date
	 */
	public Date getArtcl_date() {
		return artcl_date;
	}
	/**
	 * @param artcl_date the artcl_date to set
	 */
	public void setArtcl_date(Date artcl_date) {
		this.artcl_date = artcl_date;
	}
	/**
	 * @return the artcl_owner_id
	 */
	public String getArtcl_owner_id() {
		return artcl_owner_id;
	}
	/**
	 * @param artcl_owner_id the artcl_owner_id to set
	 */
	public void setArtcl_owner_id(String artcl_owner_id) {
		this.artcl_owner_id = artcl_owner_id;
	}
	/**
	 * @return the artcle_title
	 */
	public String getArtcle_title() {
		return artcle_title;
	}
	/**
	 * @param artcle_title the artcle_title to set
	 */
	public void setArtcle_title(String artcle_title) {
		this.artcle_title = artcle_title;
	}
	/**
	 * @return the artcle_brf_desc
	 */
	public String getArtcle_brf_desc() {
		return artcle_brf_desc;
	}
	/**
	 * @param artcle_brf_desc the artcle_brf_desc to set
	 */
	public void setArtcle_brf_desc(String artcle_brf_desc) {
		this.artcle_brf_desc = artcle_brf_desc;
	}
	/**
	 * @return the artcle_Data
	 */
	public String getArtcle_Data() {
		return artcle_Data;
	}
	/**
	 * @param artcle_Data the artcle_Data to set
	 */
	public void setArtcle_Data(String artcle_Data) {
		this.artcle_Data = artcle_Data;
	}
	/**
	 * @return the artcle_filePath
	 */
	public String getArtcle_filePath() {
		return artcle_filePath;
	}
	/**
	 * @param artcle_filePath the artcle_filePath to set
	 */
	public void setArtcle_filePath(String artcle_filePath) {
		this.artcle_filePath = artcle_filePath;
	}
	/**
	 * @return the artcle_lastUpdateDate
	 */
	public Date getArtcle_lastUpdateDate() {
		return artcle_lastUpdateDate;
	}
	/**
	 * @param artcle_lastUpdateDate the artcle_lastUpdateDate to set
	 */
	public void setArtcle_lastUpdateDate(Date artcle_lastUpdateDate) {
		this.artcle_lastUpdateDate = artcle_lastUpdateDate;
	}
	/**
	 * @return the artcle_hits
	 */
	public int getArtcle_hits() {
		return artcle_hits;
	}
	/**
	 * @param artcle_hits the artcle_hits to set
	 */
	public void setArtcle_hits(int artcle_hits) {
		this.artcle_hits = artcle_hits;
	}
	/**
	 * @return the artcl_owner_name
	 */
	public String getArtcl_owner_name() {
		return artcl_owner_name;
	}
	/**
	 * @param artcl_owner_name the artcl_owner_name to set
	 */
	public void setArtcl_owner_name(String artcl_owner_name) {
		this.artcl_owner_name = artcl_owner_name;
	}
	/**
	 * @return the artcl_tags
	 */
	public List<String> getArtcl_tags() {
		return artcl_tags;
	}
	/**
	 * @param artcl_tags the artcl_tags to set
	 */
	public void setArtcl_tags(List<String> artcl_tags) {
		this.artcl_tags = artcl_tags;
	}
	/**
	 * @return the artcle_type
	 */
	public String getArtcle_type() {
		return artcle_type;
	}
	/**
	 * @param artcle_type the artcle_type to set
	 */
	public void setArtcle_type(String artcle_type) {
		this.artcle_type = artcle_type;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Article [artcl_id=");
		builder.append(artcl_id);
		builder.append(", artcl_date=");
		builder.append(artcl_date);
		builder.append(", artcl_owner_name=");
		builder.append(artcl_owner_name);
		builder.append(", artcl_tags=");
		builder.append(artcl_tags);
		builder.append(", artcl_owner_id=");
		builder.append(artcl_owner_id);
		builder.append(", artcle_title=");
		builder.append(artcle_title);
		builder.append(", artcle_brf_desc=");
		builder.append(artcle_brf_desc);
		builder.append(", artcle_Data=");
		builder.append(artcle_Data);
		builder.append(", artcle_filePath=");
		builder.append(artcle_filePath);
		builder.append(", artcle_lastUpdateDate=");
		builder.append(artcle_lastUpdateDate);
		builder.append(", artcle_hits=");
		builder.append(artcle_hits);
		builder.append(", artcle_type=");
		builder.append(artcle_type);
		builder.append(", getArtcl_id()=");
		builder.append(getArtcl_id());
		builder.append(", getArtcl_date()=");
		builder.append(getArtcl_date());
		builder.append(", getArtcl_owner_id()=");
		builder.append(getArtcl_owner_id());
		builder.append(", getArtcle_title()=");
		builder.append(getArtcle_title());
		builder.append(", getArtcle_brf_desc()=");
		builder.append(getArtcle_brf_desc());
		builder.append(", getArtcle_Data()=");
		builder.append(getArtcle_Data());
		builder.append(", getArtcle_filePath()=");
		builder.append(getArtcle_filePath());
		builder.append(", getArtcle_lastUpdateDate()=");
		builder.append(getArtcle_lastUpdateDate());
		builder.append(", getArtcle_hits()=");
		builder.append(getArtcle_hits());
		builder.append(", getArtcl_owner_name()=");
		builder.append(getArtcl_owner_name());
		builder.append(", getArtcl_tags()=");
		builder.append(getArtcl_tags());
		builder.append(", getArtcle_type()=");
		builder.append(getArtcle_type());
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
