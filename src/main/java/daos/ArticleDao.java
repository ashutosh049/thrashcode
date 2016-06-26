package daos;

import java.util.List;

import models.Article;

public interface ArticleDao {

	public Article getArticlesByArticleId(String argArtclId);
	public List<Article> getArticlesByTag(String tag);
	public List<Article> getArticlesByOwnerId(String argUserId);
	public List<Article> getUserArticle(String argUserID);
	public int publishArticle(Article argArticle);
	public int updateArticleHits(String argArtclId);
	public List<Article> getArticlesByCategory(String argArtclcatId);
	boolean hitArticle(String argArtclId, String argHitType);
	boolean hitArticleUpdate(String argArtclId, String argHitType);
	
}
