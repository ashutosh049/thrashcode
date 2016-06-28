package daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.RowMapper;

import daos.ArticleDao;
import models.Article;
import util.CommonUtil;
import util.ThrashConstants;

public class ArticleDaoImpl implements ArticleDao {

	private static final Logger logger = LoggerFactory.getLogger(ArticleDaoImpl.class);

	private CommonUtil commonUtil;

	public void setCommonUtil(CommonUtil commonUtil) {
		this.commonUtil = commonUtil;
	}


	
	@Override
	public List<Article> getArticlesByTag(String argArticleTag) {

		String query = "SELECT "
								+ "artcl_id," 
								+ "artcl_cat_id," 
								+ "artcl_owner_id," 
								+ "artcl_status," 
								+ "artcl_title," 
								+ "artcl_brf_desc," 
								+ "artcl_create_date," 
								+ "artcl_mod_date," 
								+ "artcl_tags," 
								+ "artcl_data," 
								+ "artcl_filepath," 
								+ "artcl_type," 
								+ "artcl_visits," 
								+ "artcl_hits_positive," 
								+ "artcl_hits_negetive "
						+ "FROM ARTICLES " 
						+ "WHERE artcl_tags LIKE \"%" + argArticleTag + "%\" "
						+ "ORDER BY artcl_create_date desc";
		
		List<Article> articles = commonUtil.getJdbcTemplate().query(
				query,
		        new RowMapper<Article>() {
		            public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
		            	Article article = new Article();
		            	article.setArtcl_id(rs.getString("artcl_id"));
		            	article.setArtcl_cat_id(rs.getString("artcl_cat_id")); 
						article.setArtcl_owner_id(rs.getString("artcl_owner_id")); 
						article.setArtcl_status(rs.getString("artcl_status")); 
						article.setArtcl_title(rs.getString("artcl_title")); 
						article.setArtcl_brf_desc(rs.getString("artcl_brf_desc")); 
						article.setArtcl_create_date(rs.getDate("artcl_create_date")); 
						article.setArtcl_mod_date(rs.getDate("artcl_mod_date")); 
						article.setArtcl_tags(Arrays.asList(rs.getString("artcl_tags").split(","))); 
						article.setArtcl_filePath(rs.getString("artcl_filepath")); 
						article.setArtcl_type(rs.getString("artcl_type")); 
						article.setArtcl_visits(rs.getInt("artcl_visits")); 
						article.setArtcl_hits_positive(rs.getInt("artcl_hits_positive")); 
						article.setArtcl_hits_negetive(rs.getInt("artcl_hits_negetive"));
		            	
		                return article;
		            }
		        });
		       		
		return articles;
	}
	
	@Override
	public List<Article> getUserArticle(String argUserID) {
		
		String query = "";
		
		if(argUserID != null){
			query = "SELECT "
							+ "artcl_id," 
							+ "artcl_cat_id," 
							+ "artcl_owner_id," 
							+ "artcl_status," 
							+ "artcl_title," 
							+ "artcl_brf_desc," 
							+ "artcl_create_date," 
							+ "artcl_mod_date," 
							+ "artcl_tags," 
							+ "artcl_data," 
							+ "artcl_filepath," 
							+ "artcl_type," 
							+ "artcl_visits," 
							+ "artcl_hits_positive," 
							+ "artcl_hits_negetive "
				      + "FROM articles " 
				      + "WHERE artcl_owner_id = \"" + argUserID + "\"";
		
		}else{
			query = "SELECT "
					+ "artcl_id," 
					+ "artcl_cat_id," 
					+ "artcl_owner_id," 
					+ "artcl_status," 
					+ "artcl_title," 
					+ "artcl_brf_desc," 
					+ "artcl_create_date," 
					+ "artcl_mod_date," 
					+ "artcl_tags," 
					+ "artcl_data," 
					+ "artcl_filepath," 
					+ "artcl_type," 
					+ "artcl_visits," 
					+ "artcl_hits_positive," 
					+ "artcl_hits_negetive "
		      + "FROM articles "; 

		}
		 
		List<Article> articles = commonUtil.getJdbcTemplate().query(
				query,
		        new RowMapper<Article>() {
		            public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
		            	Article article = new Article();
		            	article.setArtcl_id(rs.getString("artcl_id"));
		            	article.setArtcl_cat_id(rs.getString("artcl_cat_id")); 
						article.setArtcl_owner_id(rs.getString("artcl_owner_id")); 
						article.setArtcl_status(rs.getString("artcl_status")); 
						article.setArtcl_title(rs.getString("artcl_title")); 
						article.setArtcl_brf_desc(rs.getString("artcl_brf_desc")); 
						article.setArtcl_create_date(rs.getDate("artcl_create_date")); 
						article.setArtcl_mod_date(rs.getDate("artcl_mod_date")); 
						article.setArtcl_tags(Arrays.asList(rs.getString("artcl_tags").split(","))); 
						article.setArtcl_filePath(rs.getString("artcl_filepath")); 
						article.setArtcl_type(rs.getString("artcl_type")); 
						article.setArtcl_visits(rs.getInt("artcl_visits")); 
						article.setArtcl_hits_positive(rs.getInt("artcl_hits_positive")); 
						article.setArtcl_hits_negetive(rs.getInt("artcl_hits_negetive"));
		            	return article;
		            }
		        });
		       		
		return articles;
	
	
	}



	@Override 
	public int publishArticle(Article argArticle) {
			return commonUtil.getJdbcTemplate().update(
			        "insert into ARTICLES "
					+ "(artcl_id," 
					+ "artcl_cat_id," 
					+ "artcl_owner_id," 
					+ "artcl_status," 
					+ "artcl_title," 
					+ "artcl_brf_desc," 
					+ "artcl_create_date," 
					+ "artcl_mod_date," 
					+ "artcl_tags," 
					+ "artcl_data," 
					+ "artcl_filepath," 
					+ "artcl_type," 
					+ "artcl_visits," 
					+ "artcl_hits_positive," 
					+ "artcl_hits_negetive) "
			       +" values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
			       argArticle.getArtcl_id(),
			       argArticle.getArtcl_cat_id(),
			       argArticle.getArtcl_owner_id(),
			       argArticle.getArtcl_status(),
			       argArticle.getArtcl_title(),
			       argArticle.getArtcl_brf_desc(),
			       argArticle.getArtcl_create_date(),
			       argArticle.getArtcl_mod_date(),
			       commonUtil.ListToString(argArticle.getArtcl_tags()),
			       null,
			       argArticle.getArtcl_filePath(),
			       argArticle.getArtcl_type(),
			       argArticle.getArtcl_visits(),
			       argArticle.getArtcl_hits_positive(),
			       argArticle.getArtcl_hits_negetive());
	}



	@Override
	public Article getArticlesByArticleId(String argArtclId) {
		Article article = commonUtil.getJdbcTemplate().queryForObject(
			        "select "
							+ "artcl_id," 
							+ "artcl_cat_id," 
							+ "artcl_owner_id," 
							+ "artcl_status," 
							+ "artcl_title," 
							+ "artcl_brf_desc," 
							+ "artcl_create_date," 
							+ "artcl_mod_date," 
							+ "artcl_tags," 
							+ "artcl_data," 
							+ "artcl_filepath," 
							+ "artcl_type," 
							+ "artcl_visits," 
							+ "artcl_hits_positive," 
							+ "artcl_hits_negetive "
	        		+ "FROM ARTICLES "
			        + "WHERE artcl_id = ?",
			        new Object[]{argArtclId},
			        new RowMapper<Article>() {
			            public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
			            	Article article = new Article();
					    	article.setArtcl_id(rs.getString("artcl_id"));
					    	article.setArtcl_cat_id(rs.getString("artcl_cat_id")); 
							article.setArtcl_owner_id(rs.getString("artcl_owner_id")); 
							article.setArtcl_status(rs.getString("artcl_status")); 
							article.setArtcl_title(rs.getString("artcl_title")); 
							article.setArtcl_brf_desc(rs.getString("artcl_brf_desc")); 
							article.setArtcl_create_date(rs.getDate("artcl_create_date")); 
							article.setArtcl_mod_date(rs.getDate("artcl_mod_date")); 
							article.setArtcl_tags(Arrays.asList(rs.getString("artcl_tags").split(","))); 
							article.setArtcl_filePath(rs.getString("artcl_filepath")); 
							article.setArtcl_type(rs.getString("artcl_type")); 
							article.setArtcl_visits(rs.getInt("artcl_visits")); 
							article.setArtcl_hits_positive(rs.getInt("artcl_hits_positive")); 
							article.setArtcl_hits_negetive(rs.getInt("artcl_hits_negetive"));
					        return article;
			            }
			        });
			return article;
	}



	@Override
	public int updateArticleHits(String argArtclId) {
		return commonUtil.getJdbcTemplate().update("update articles "
				+ "SET artcl_visits = artcl_visits+1 "
				+ "WHERE artcl_id = ? ", argArtclId);
		}
	

	@Override
	public List<Article> getArticlesByCategory(String argArtclcatId) {
		String query = "SELECT "
				+ "artcl_id," 
				+ "artcl_cat_id," 
				+ "artcl_owner_id," 
				+ "artcl_status," 
				+ "artcl_title," 
				+ "artcl_brf_desc," 
				+ "artcl_create_date," 
				+ "artcl_mod_date," 
				+ "artcl_tags," 
				+ "artcl_data," 
				+ "artcl_filepath," 
				+ "artcl_type," 
				+ "artcl_visits," 
				+ "artcl_hits_positive," 
				+ "artcl_hits_negetive "
		+ "FROM ARTICLES " 
		+ " WHERE artcl_cat_id ='"+argArtclcatId+"'"
		+ "ORDER BY artcl_create_date desc";

			List<Article> articles = commonUtil.getJdbcTemplate().query(
			query,
			new RowMapper<Article>() {
			    public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
			    	Article article = new Article();
			    	article.setArtcl_id(rs.getString("artcl_id"));
			    	article.setArtcl_cat_id(rs.getString("artcl_cat_id")); 
					article.setArtcl_owner_id(rs.getString("artcl_owner_id")); 
					article.setArtcl_status(rs.getString("artcl_status")); 
					article.setArtcl_title(rs.getString("artcl_title")); 
					article.setArtcl_brf_desc(rs.getString("artcl_brf_desc")); 
					article.setArtcl_create_date(rs.getDate("artcl_create_date")); 
					article.setArtcl_mod_date(rs.getDate("artcl_mod_date")); 
					article.setArtcl_tags(Arrays.asList(rs.getString("artcl_tags").split(","))); 
					article.setArtcl_filePath(rs.getString("artcl_filepath")); 
					article.setArtcl_type(rs.getString("artcl_type")); 
					article.setArtcl_visits(rs.getInt("artcl_visits")); 
					article.setArtcl_hits_positive(rs.getInt("artcl_hits_positive")); 
					article.setArtcl_hits_negetive(rs.getInt("artcl_hits_negetive"));
			    	
			        return article;
			    }
			});
	return articles;
	}



	@Override
	public List<Article> getArticlesByOwnerId(String argUserId) {
		String query = "SELECT "
				+ "artcl_id," 
				+ "artcl_cat_id," 
				+ "artcl_owner_id," 
				+ "artcl_status," 
				+ "artcl_title," 
				+ "artcl_brf_desc," 
				+ "artcl_create_date," 
				+ "artcl_mod_date," 
				+ "artcl_tags," 
				+ "artcl_data," 
				+ "artcl_filepath," 
				+ "artcl_type," 
				+ "artcl_visits," 
				+ "artcl_hits_positive," 
				+ "artcl_hits_negetive "
		+ "FROM ARTICLES " 
	    + "WHERE artcl_owner_id = \"" + argUserId + "\" "
		+ "ORDER BY artcl_create_date desc";

			List<Article> articles = commonUtil.getJdbcTemplate().query(
			query,
			new RowMapper<Article>() {
			    public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
			    	Article article = new Article();
			    	article.setArtcl_id(rs.getString("artcl_id"));
			    	article.setArtcl_cat_id(rs.getString("artcl_cat_id")); 
					article.setArtcl_owner_id(rs.getString("artcl_owner_id")); 
					article.setArtcl_status(rs.getString("artcl_status")); 
					article.setArtcl_title(rs.getString("artcl_title")); 
					article.setArtcl_brf_desc(rs.getString("artcl_brf_desc")); 
					article.setArtcl_create_date(rs.getDate("artcl_create_date")); 
					article.setArtcl_mod_date(rs.getDate("artcl_mod_date")); 
					article.setArtcl_tags(Arrays.asList(rs.getString("artcl_tags").split(","))); 
					article.setArtcl_filePath(rs.getString("artcl_filepath")); 
					article.setArtcl_type(rs.getString("artcl_type")); 
					article.setArtcl_visits(rs.getInt("artcl_visits")); 
					article.setArtcl_hits_positive(rs.getInt("artcl_hits_positive")); 
					article.setArtcl_hits_negetive(rs.getInt("artcl_hits_negetive"));
			    	
			        return article;
			    }
			});
	return articles;
	
	}
	
	@Override
	public boolean hitArticle(String argArtclId,String argHitType) {
		if(argHitType.equals(ThrashConstants.ARTCL_HIT_POSITIVE)){
			String query ="UPDATE "
					           + "ARTICLES "
					     +"SET "
					           + "artcl_hits_positive = artcl_hits_positive+1 "
					     +"WHERE "
					           + "artcl_status='"+ThrashConstants.ARTCL_STATUS_ACTIVE+"' AND "
					           + "artcl_id = ?"; 
			if(commonUtil.getJdbcTemplate().update(query, argArtclId) > 0){
				return true;
			}
		}else if(argHitType.equals(ThrashConstants.ARTCL_HIT_NEGETIVE)){
			String query ="UPDATE ARTICLES "
					+"SET artcl_hits_negetive = artcl_hits_negetive+1 "
					+"WHERE artcl_status='"+ThrashConstants.ARTCL_STATUS_ACTIVE+"' AND artcl_id = ?"; 
			
			if(commonUtil.getJdbcTemplate().update(query, argArtclId) > 0){
				return true;
			}
		}
		return false;
	}



	@Override
	public boolean hitArticleUpdate(String argArtclId, String argHitType) {
		if(argHitType.equals(ThrashConstants.ARTCL_HIT_POSITIVE)){
			String query ="UPDATE "
					           + "ARTICLES "
					     +"SET "
					           + "artcl_hits_positive = artcl_hits_positive+1, "
					           + "artcl_hits_negetive = artcl_hits_negetive-1 "
					     +"WHERE "
					           + "artcl_status='"+ThrashConstants.ARTCL_STATUS_ACTIVE+"' AND "
					           + "artcl_id = ?"; 
			if(commonUtil.getJdbcTemplate().update(query, argArtclId) > 0){
				return true;
			}
		}else if(argHitType.equals(ThrashConstants.ARTCL_HIT_NEGETIVE)){
			String query ="UPDATE ARTICLES "
					+"SET "
							+ "artcl_hits_positive = artcl_hits_positive-1, "
							+ "artcl_hits_negetive = artcl_hits_negetive+1 "
					+"WHERE "
							+ "artcl_status='"+ThrashConstants.ARTCL_STATUS_ACTIVE+"' AND "
							+ "artcl_id = ?"; 
			
			if(commonUtil.getJdbcTemplate().update(query, argArtclId) > 0){
				return true;
			}
		}
		return false;
	}
}
