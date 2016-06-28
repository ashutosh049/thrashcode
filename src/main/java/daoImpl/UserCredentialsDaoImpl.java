/**
 * 
 */
package daoImpl;

import daos.UserCredentialsDao;
import models.UserCredentials;
import util.CommonUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
/**
 * @author Kumar Ashutosh
 *
 */
public class UserCredentialsDaoImpl implements UserCredentialsDao {

	private CommonUtil commonUtil;

	public void setCommonUtil(CommonUtil commonUtil) {
		this.commonUtil = commonUtil;
	}

	/**
	 * 
	 */
	public UserCredentialsDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see daos.UserCredentialsDao#getuserCredentials(java.lang.String)
	 */
	@Override
	public UserCredentials getuserCredentials(String argUserId) {
		String query = "SELECT user_id, user_password FROM user_credential";
		RowMapper<UserCredentials> rowMapper = new RowMapper<UserCredentials>() {
			@Override
			public UserCredentials mapRow(ResultSet resultSet, int rowNum) throws SQLException {
				return new UserCredentials(
						resultSet.getString("user_id"),
						resultSet.getString("user_password"));
			}
		};
		return commonUtil.getJdbcTemplate().queryForObject(query, rowMapper);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see daos.UserCredentialsDao#setuserCredentials(models.UserCredentials)
	 */
	@Override
	public int setuserCredentials(UserCredentials userCredentials) {
		return commonUtil.getJdbcTemplate().update(
				"INSERT INTO user_credential ("
				+ "user_id, "
				+ "user_password)" + " values (?, ?)", 
				userCredentials.getUserId(),
				userCredentials.getUserPassword());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * daos.UserCredentialsDao#updateUserCredentials(models.UserCredentials)
	 */
	@Override
	public boolean updateUserCredentials(UserCredentials userCredentials) {
		if(commonUtil.getJdbcTemplate()
				.update("update user_credential " + "SET user_password=?, " 
						+"WHERE user_id= ?", userCredentials.getUserPassword(),
						userCredentials.getUserId())>0){
			return true;
		}
		return false;
	}

}
