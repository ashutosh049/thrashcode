/**
 * 
 */
package daos;

import models.UserThrashAccount;

/**
 * @author Kumar Ashutosh
 *
 */
public interface UserThrashAccountDao {

	UserThrashAccount getUserThrashAccount(String argUSerId);
	int setUserThrashAccount(UserThrashAccount account);
	boolean updateUserThrashAccount(UserThrashAccount account);
	
}
