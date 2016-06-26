package models;

public class ArticleRender {
	private Article article;
	private Comment comment;
	private UserActivity userActivity;
	
	public ArticleRender() {
		// TODO Auto-generated constructor stub
	}
	
	public ArticleRender(Article article, Comment comment, UserActivity userActivity) {
		super();
		this.article = article;
		this.comment = comment;
		this.userActivity = userActivity;
	}


	/**
	 * @return the article
	 */
	public Article getArticle() {
		return article;
	}
	/**
	 * @param article the article to set
	 */
	public void setArticle(Article article) {
		this.article = article;
	}
	/**
	 * @return the comment
	 */
	public Comment getComment() {
		return comment;
	}
	/**
	 * @param comment the comment to set
	 */
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	/**
	 * @return the userActivity
	 */
	public UserActivity getUserActivity() {
		return userActivity;
	}
	/**
	 * @param userActivity the userActivity to set
	 */
	public void setUserActivity(UserActivity userActivity) {
		this.userActivity = userActivity;
	}
	
	
}
