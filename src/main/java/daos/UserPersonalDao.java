/**
 * 
 */
package daos;

import models.UserPersonal;

/**
 * @author Kumar Ashutosh
 *
 */
public interface UserPersonalDao {
	UserPersonal getUserPersonal(String argUserId);
	int setUserPersonal(UserPersonal userPersonal);
	boolean updateUserPersonal(UserPersonal userPersonal);
}
