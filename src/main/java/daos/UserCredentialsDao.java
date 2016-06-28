/**
 * 
 */
package daos;

import models.UserCredentials;

/**
 * @author Kumar Ashutosh
 *
 */
public interface UserCredentialsDao {

	UserCredentials getuserCredentials(String argUserId);
	int setuserCredentials(UserCredentials userCredentials);
	boolean updateUserCredentials(UserCredentials userCredentials);

}
