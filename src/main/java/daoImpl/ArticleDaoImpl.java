package daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.RowMapper;

import daos.ArticleDao;
import models.ArtclTags;
import models.Article;
import util.CommonUtil;

public class ArticleDaoImpl implements ArticleDao {

	private static final Logger logger = LoggerFactory.getLogger(ArticleDaoImpl.class);

	private CommonUtil commonUtil;

	public void setCommonUtil(CommonUtil commonUtil) {
		this.commonUtil = commonUtil;
	}


	
	@Override
	public List<Article> getArticlesByTag(String argArticleTag) {

		String query = "SELECT artcl_id, artcl_date, artcl_owner_name, artcl_tags, artcl_owner_id, artcle_title,"
				     + " artcle_brf_desc,  artcle_hits ,artcle_type, artcle_lastUpdateDate "
				      + "FROM poscode.articles " 
				      + "WHERE artcl_tags LIKE \"%" + argArticleTag + "%\" "
				      + " ORDER BY artcl_date desc";
		
		List<Article> articles = commonUtil.getJdbcTemplate().query(
				query,
		        new RowMapper<Article>() {
		            public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
		            	Article article = new Article();
		            	article.setArtcl_id(rs.getString("artcl_id"));
		            	article.setArtcl_date(rs.getDate("artcl_date"));
		            	article.setArtcl_owner_name(rs.getString("artcl_owner_name"));
		            	article.setArtcl_tags(Arrays.asList(rs.getString("artcl_tags").split(",")));
		            	article.setArtcl_owner_id(rs.getString("artcl_owner_id"));
		            	article.setArtcle_title(rs.getString("artcle_title"));
		            	article.setArtcle_brf_desc(rs.getString("artcle_brf_desc"));
		            	article.setArtcle_hits(rs.getInt("artcle_hits"));
		            	article.setArtcle_type(rs.getString("artcle_type"));
		            	article.setArtcle_lastUpdateDate(rs.getDate("artcle_lastUpdateDate"));
		                return article;
		            }
		        });
		       		
		return articles;
	}
	
	@Override
	public List<Article> getUserArticle(String argUserID) {
		
		String query = "";
		
		if(argUserID != null){
			query = "SELECT artcl_id, artcl_date, artcl_owner_name, artcl_tags, artcl_owner_id, artcle_title, artcle_brf_desc, artcle_hits, artcle_type "
				      + "FROM poscode.articles " 
				      + "WHERE artcl_owner_id = \"" + argUserID + "\"";
		
		}else{
			query = "SELECT artcl_id, artcl_date, artcl_owner_name, artcl_tags, artcl_owner_id, artcle_title, artcle_brf_desc, artcle_hits, artcle_type "
				      + "FROM poscode.articles "; 
		}
		 
		List<Article> articles = commonUtil.getJdbcTemplate().query(
				query,
		        new RowMapper<Article>() {
		            public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
		            	Article article = new Article();
		            	article.setArtcl_id(rs.getString("artcl_id"));
		            	article.setArtcl_date(rs.getDate("artcl_date"));
		            	article.setArtcl_owner_name(rs.getString("artcl_owner_name"));
		            	article.setArtcl_tags(Arrays.asList(rs.getString("artcl_tags").split(",")));
		            	article.setArtcl_owner_id(rs.getString("artcl_owner_id"));
		            	article.setArtcle_title(rs.getString("artcle_title"));
		            	article.setArtcle_brf_desc(rs.getString("artcle_brf_desc"));
		            	article.setArtcle_hits(rs.getInt("artcle_hits"));
		            	article.setArtcle_type(rs.getString("artcle_type"));
		            	return article;
		            }
		        });
		       		
		return articles;
	
	
	}



	@Override 
	public int publishArticle(Article argArticle) {
			return commonUtil.getJdbcTemplate().update(
			        "insert into poscode.articles "+
			       "(artcl_id, artcl_date, artcl_owner_name, artcl_tags, artcl_owner_id, artcle_title, artcle_brf_desc, artcle_Data,artcle_filePath, artcle_lastUpdateDate, artcle_hits, artcle_type, artcl_cat_id)"+
			       " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
			       argArticle.getArtcl_id(),
			       argArticle.getArtcl_date(), 
			       argArticle.getArtcl_owner_name(), 
			       ListToString(argArticle.getArtcl_tags()),
			       argArticle.getArtcl_owner_id(),
			       argArticle.getArtcle_title(), 
			       argArticle.getArtcle_brf_desc(),
			       null,
			       argArticle.getArtcle_filePath(),
			       new Date(),
			       0,
			       argArticle.getArtcle_type(),
			       argArticle.getArtcl_cat_id());
	}



	@Override
	public Article getArticle(String argArtclId) {
		Article article = commonUtil.getJdbcTemplate().queryForObject(
			        "select artcl_id, artcl_date, artcl_owner_name, artcl_tags, artcl_owner_id, artcle_title, artcle_brf_desc,"
			        + " artcle_filePath, artcle_lastUpdateDate, artcle_hits ,artcle_type "
			        + " from poscode.articles where artcl_id = ?",
			        new Object[]{argArtclId},
			        new RowMapper<Article>() {
			            public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
			            	Article article = new Article();
			                article.setArtcl_id(rs.getString("artcl_id"));
			                article.setArtcl_date(rs.getDate("artcl_date"));
			                article.setArtcl_owner_name(rs.getString("artcl_owner_name"));
			                article.setArtcl_tags(Arrays.asList(rs.getString("artcl_tags").split(",")));
			                article.setArtcl_owner_id(rs.getString("artcl_owner_id"));
			                article.setArtcle_title(rs.getString("artcle_title"));
			                article.setArtcle_brf_desc(rs.getString("artcle_brf_desc"));
			                article.setArtcle_filePath(rs.getString("artcle_filePath"));
			                article.setArtcle_lastUpdateDate(rs.getDate("artcle_lastUpdateDate"));
			                article.setArtcle_hits(rs.getInt("artcle_hits"));
			            	article.setArtcle_type(rs.getString("artcle_type"));
			                return article;
			            }
			        });
			return article;
	}



	@Override
	public int updateArticleHits(String argArtclId) {
		return commonUtil.getJdbcTemplate().update("update poscode.articles "
				+ "SET artcle_hits = artcle_hits+1 "
				+ "WHERE artcl_id = ? ", argArtclId);
		}
	
	public String ListToString(List<String> argList){
		String toString = "";
		if(argList!=null && argList.size()>0){
			for (String item : argList) {
				toString += item+",";
			}
			toString = toString.substring(0,toString.lastIndexOf(','));
		}
		
		return toString;
	}



	@Override
	public List<Article> getArticlesByCategory(String argArtclcatId) {

		List<Article> artclTags = commonUtil.getJdbcTemplate().query(
				"SELECT"
         		+ " artcl_id, artcl_date, artcl_owner_name, artcl_tags, artcl_owner_id, artcle_title, artcle_brf_desc, artcle_Data, artcle_filePath, artcle_lastUpdateDate, artcle_hits, artcle_type"
				+ " FROM poscode.articles"
				+ " WHERE artcl_cat_id ='"+argArtclcatId+"'", 
				new RowMapper<Article>(){
					public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
						Article article = new Article();
						article.setArtcl_id(rs.getString("artcl_id"));
		                article.setArtcl_date(rs.getDate("artcl_date"));
		                article.setArtcl_owner_name(rs.getString("artcl_owner_name"));
		                article.setArtcl_tags(Arrays.asList(rs.getString("artcl_tags").split(",")));
		                article.setArtcl_owner_id(rs.getString("artcl_owner_id"));
		                article.setArtcle_title(rs.getString("artcle_title"));
		                article.setArtcle_brf_desc(rs.getString("artcle_brf_desc"));
		                article.setArtcle_Data(rs.getString("artcle_Data"));
		                article.setArtcle_filePath(rs.getString("artcle_filePath"));
		                article.setArtcle_lastUpdateDate(rs.getDate("artcle_lastUpdateDate"));
		                article.setArtcle_hits(rs.getInt("artcle_hits"));
		            	article.setArtcle_type(rs.getString("artcle_type"));
						return article;
					}
		});
		return artclTags;
	
	}



	@Override
	public List<Article> getArticlesByOwnerId(String argUserId) {


		String query = "SELECT artcl_id, artcl_date, artcl_owner_name, artcl_tags, artcl_owner_id, artcle_title,"
				     + " artcle_brf_desc,  artcle_hits ,artcle_type, artcle_lastUpdateDate "
				      + "FROM poscode.articles " 
				      + "WHERE artcl_owner_id = \"" + argUserId + "\" "
				      + " ORDER BY artcl_date desc";
		
		List<Article> articles = commonUtil.getJdbcTemplate().query(
				query,
		        new RowMapper<Article>() {
		            public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
		            	Article article = new Article();
		            	article.setArtcl_id(rs.getString("artcl_id"));
		            	article.setArtcl_date(rs.getDate("artcl_date"));
		            	article.setArtcl_owner_name(rs.getString("artcl_owner_name"));
		            	article.setArtcl_tags(Arrays.asList(rs.getString("artcl_tags").split(",")));
		            	article.setArtcl_owner_id(rs.getString("artcl_owner_id"));
		            	article.setArtcle_title(rs.getString("artcle_title"));
		            	article.setArtcle_brf_desc(rs.getString("artcle_brf_desc"));
		            	article.setArtcle_hits(rs.getInt("artcle_hits"));
		            	article.setArtcle_type(rs.getString("artcle_type"));
		            	article.setArtcle_lastUpdateDate(rs.getDate("artcle_lastUpdateDate"));
		                return article;
		            }
		        });
		       		
		return articles;
	
	}
}
