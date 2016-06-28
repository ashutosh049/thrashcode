/**
 * 
 */
package daos;

import models.UserProfessional;

/**
 * @author Kumar Ashutosh
 *
 */
public interface UserProfessionalDao {

	UserProfessional getUserProfessional(String argUserId);
	int setUserProfessional(UserProfessional userProfessional);
	boolean updateUserProfessional(UserProfessional userProfessional);

}
