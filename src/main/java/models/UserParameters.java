package models;

import java.util.List;

public class UserParameters {

	private List<ArticleNotifications> articleNotificationsList;
	private int articleNotificationsListCount;
	
	public UserParameters() {
		// TODO Auto-generated constructor stub
	}
	

	public UserParameters(List<ArticleNotifications> articleNotificationsList, int articleNotificationsListCount) {
		super();
		this.articleNotificationsList = articleNotificationsList;
		this.articleNotificationsListCount = articleNotificationsListCount;
	}



	/**
	 * @return the articleNotificationsList
	 */
	public List<ArticleNotifications> getArticleNotificationsList() {
		return articleNotificationsList;
	}

	/**
	 * @param articleNotificationsList the articleNotificationsList to set
	 */
	public void setArticleNotificationsList(List<ArticleNotifications> articleNotificationsList) {
		this.articleNotificationsList = articleNotificationsList;
	}

	/**
	 * @return the articleNotificationsListCount
	 */
	public int getArticleNotificationsListCount() {
		return articleNotificationsListCount;
	}

	/**
	 * @param articleNotificationsListCount the articleNotificationsListCount to set
	 */
	public void setArticleNotificationsListCount(int articleNotificationsListCount) {
		this.articleNotificationsListCount = articleNotificationsListCount;
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserParameters [articleNotificationsList=");
		builder.append(articleNotificationsList);
		builder.append(", articleNotificationsListCount=");
		builder.append(articleNotificationsListCount);
		builder.append(", getArticleNotificationsList()=");
		builder.append(getArticleNotificationsList());
		builder.append(", getArticleNotificationsListCount()=");
		builder.append(getArticleNotificationsListCount());
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
