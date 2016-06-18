package daos;

import java.util.LinkedHashMap;
import java.util.List;

import models.ArtclTags;
import models.Article;
import models.ArticleCategories;

public interface ArticleCategoriesDao {
	
	ArticleCategories getArticleCategoryByID(String argArticleCategoryId);

	LinkedHashMap<ArticleCategories, List<ArtclTags>> getAllArticleCategoryTagsMap();
	LinkedHashMap<ArticleCategories, List<Article>> getAllArticleCategoryArticlesMap();
	
	List<ArticleCategories> getAllArticleCategories();
	
}
