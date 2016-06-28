/**
 * 
 */
package daoImpl;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import daos.UserSocialAccountDao;
import models.UserSocialAccount;
import util.CommonUtil;

/**
 * @author Kumar Ashutosh
 *
 */
public class UserSocialAccountDaoImpl implements UserSocialAccountDao {

	private CommonUtil commonUtil;

	public void setCommonUtil(CommonUtil commonUtil) {
		this.commonUtil = commonUtil;
	}
	
	/* (non-Javadoc)
	 * @see daos.UserSocialAccountDao#getUserSocialAccount(java.lang.String)
	 */
	@Override
	public UserSocialAccount getUserSocialAccount(String argUserId) {
		String query = "SELECT "
					    + "user_id, user_emai_primary, user_emai_secondary, user_github_id, user_stackoverflow_id, "
					    + "user_facebook_id, user_twitter_id, user_blog_url, user_image"
					+ " FROM "
						+ "user_social_account";
		RowMapper<UserSocialAccount> rowMapper = new RowMapper<UserSocialAccount>() {
				@Override
				public UserSocialAccount mapRow(ResultSet resultSet, int rowNum) throws SQLException {
					CommonsMultipartFile file = null;
					if (resultSet.getBlob(6).length() > 0) {
						try {
							file = new CommonsMultipartFile(commonUtil.getFileItemFromInputStream(
									resultSet.getBlob(6).getBinaryStream(1, resultSet.getBlob(6).length())));
						} catch (IOException e) {
							e.printStackTrace();
						}
					} 
					
					return new UserSocialAccount(
						resultSet.getString("user_id"),
						resultSet.getString("user_emai_primary"),
						resultSet.getString("user_emai_secondary"),
						resultSet.getString("user_github_id"),
						resultSet.getString("user_stackoverflow_id"),
						resultSet.getString("user_facebook_id"),
						resultSet.getString("user_twitter_id"),
						resultSet.getString("user_blog_url"),
						file);
			}
		};
		return commonUtil.getJdbcTemplate().queryForObject(query, rowMapper);
	}

	/* (non-Javadoc)
	 * @see daos.UserSocialAccountDao#setUserSocialAccount(models.UserSocialAccount)
	 * user_id, user_emai_primary, user_emai_secondary, user_github_id, 
	 * user_stackoverflow_id, user_facebook_id, user_twitter_id, user_blog_url, user_image
	 */
	@Override
	public int setUserSocialAccount(UserSocialAccount socialAccount) throws DataAccessException, IOException {
		return commonUtil.getJdbcTemplate().update(
				"INSERT INTO user_credential ("
				+ "user_id, "
				+ "user_emai_primary, "
				+ "user_emai_secondary,"
				+ "user_github_id,"
				+ "user_stackoverflow_id,"
				+ "user_facebook_id,"
				+ "user_twitter_id,"
				+ "user_blog_url,"
				+ "user_image"
				+ ")" + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)", 
				socialAccount.getUser_id(),
				socialAccount.getUser_emai_primary(),
				socialAccount.getUser_emai_secondary(),
				socialAccount.getUser_github_id(),
				socialAccount.getUser_stackoverflow_id(),
				socialAccount.getUser_facebook_id(),
				socialAccount.getUser_twitter_id(),
				socialAccount.getUser_blog_url(),
				socialAccount.getUser_image().getInputStream());
	}

	/* (non-Javadoc)
	 * @see daos.UserSocialAccountDao#updateUserSocialAccount(models.UserSocialAccount)
	 * user_id, user_emai_primary, user_emai_secondary, user_github_id, 
	 * user_stackoverflow_id, user_facebook_id, user_twitter_id, user_blog_url, user_image
	 * argUser.getUser_img().getInputStream()
	 */
	@Override
	public boolean updateUserSocialAccount(UserSocialAccount socialAccount) throws DataAccessException, IOException {
		if(commonUtil.getJdbcTemplate()
				.update("update user_social_account " +
						"SET "
						+ "user_emai_primary=?,"
						+ "user_emai_secondary=?,"
						+ "user_github_id=?,"
						+ "user_stackoverflow_id=?,"
						+ "user_facebook_id=?,"
						+ "user_twitter_id=?,"
						+ "user_blog_url=?,"
						+ "user_image=?,"
						+" WHERE user_id= ?", 
						socialAccount.getUser_emai_primary(),
						socialAccount.getUser_emai_secondary(),
						socialAccount.getUser_github_id(),
						socialAccount.getUser_stackoverflow_id(),
						socialAccount.getUser_github_id(),
						socialAccount.getUser_facebook_id(),
						socialAccount.getUser_stackoverflow_id(),
						socialAccount.getUser_blog_url(),
						socialAccount.getUser_image().getInputStream(),
						socialAccount.getUser_id())>0){
			return true;
		}
		return false;
	}

	

}
