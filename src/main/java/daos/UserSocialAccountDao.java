/**
 * 
 */
package daos;

import java.io.IOException;

import org.springframework.dao.DataAccessException;

import models.UserSocialAccount;

/**
 * @author Kumar Ashutosh
 *
 */
public interface UserSocialAccountDao {

	UserSocialAccount getUserSocialAccount(String argUserId);
	int setUserSocialAccount(UserSocialAccount account) throws DataAccessException, IOException;
	boolean updateUserSocialAccount(UserSocialAccount account) throws DataAccessException, IOException;

}
