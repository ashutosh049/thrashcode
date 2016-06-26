package daos;

import java.util.List;

import models.Activity;

public interface ActivityDao {
	public List<Activity> getActivities();
	public Activity getActivityById(String argActvtyId);
	public List<Activity> getActivitiesByCat(String argActvtyCat);
	public List<Activity> getActivitiesByType(String argActvtyType);
}
