package daos;

import java.util.List;

import models.UserActivity;

public interface UserActivityDao {

	int createUserActivity(UserActivity argUserActivity);
	int updateUserActivity(UserActivity argUserActivity);
	List<UserActivity> getUserActivitiesByUserId(String argUserId);
	List<UserActivity> getUserActivitiesByArticleIdByAllUsers(String argArtclId);
	List<UserActivity> getUserActivitiesByArticleIdByUserId(String argArtclId,String argUserId);
}
