package daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.RowMapper;

import daos.ArticleCategoriesDao;
import daos.ArticleDao;
import daos.ArticleTagsDao;
import models.ArtclTags;
import models.Article;
import models.ArticleCategories;
import util.CommonUtil;

public class ArticleCategoriesDaoImpl implements ArticleCategoriesDao{


	private static final Logger logger = LoggerFactory.getLogger(ArticleCategoriesDaoImpl.class);
	private CommonUtil commonUtil;
	private ArticleTagsDaoImpl articleTagsDao;
	private ArticleDaoImpl articleDaoImpl;
	
	public void setCommonUtil(CommonUtil commonUtil) {
		this.commonUtil = commonUtil;
	}
	
	public void setArticleTagsDao(ArticleTagsDaoImpl articleTagsDaoImpl) {
		this.articleTagsDao = articleTagsDaoImpl;
	}
	
	


	/**
	 * @param articleDaoImpl the articleDaoImpl to set
	 */
	public void setArticleDaoImpl(ArticleDaoImpl articleDaoImpl) {
		this.articleDaoImpl = articleDaoImpl;
	}

	@Override
	public List<ArticleCategories> getAllArticleCategories() {
		String query = "SELECT artcl_cat_id, artcl_cat_name "
			         + "FROM poscode.article_categories ";
	
	List<ArticleCategories> articleCategories = commonUtil.getJdbcTemplate().query(
			query,
	        new RowMapper<ArticleCategories>() {
	            public ArticleCategories mapRow(ResultSet rs, int rowNum) throws SQLException {
	            	ArticleCategories artCat = new ArticleCategories();
	            	artCat.setArtcl_cat_id(rs.getString(1));
	            	artCat.setArtcl_cat_name(rs.getString(2));
	                return artCat;
	            }
	        });
	return articleCategories;
	}

	@Override
	public ArticleCategories getArticleCategoryByID(String argArticleCategoryId) {
		return null;
	}

	@Override
	public LinkedHashMap<ArticleCategories, List<ArtclTags>> getAllArticleCategoryTagsMap() {
		LinkedHashMap<ArticleCategories, List<ArtclTags>> artclCatMap= new LinkedHashMap<ArticleCategories, List<ArtclTags>>();
		List<ArticleCategories> artclCatList =  getAllArticleCategories();
		for (ArticleCategories articleCategories : artclCatList) {
			List<ArtclTags> artclTags = articleTagsDao.getArtclTagByArtclCatId(articleCategories.getArtcl_cat_id());
			artclCatMap.put(articleCategories, artclTags);
		}
		return artclCatMap;
	}

	@Override
	public LinkedHashMap<ArticleCategories, List<Article>> getAllArticleCategoryArticlesMap() {
		LinkedHashMap<ArticleCategories, List<Article>> artclCatMap= new LinkedHashMap<ArticleCategories, List<Article>>();
		List<ArticleCategories> artclCatList =  getAllArticleCategories();
		for (ArticleCategories articleCategories : artclCatList) {
			List<Article> article = articleDaoImpl.getArticlesByCategory(articleCategories.getArtcl_cat_id());
			artclCatMap.put(articleCategories, article);
		}
		return artclCatMap;
	}

}
