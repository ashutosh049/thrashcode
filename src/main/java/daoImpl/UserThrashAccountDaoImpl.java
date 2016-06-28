/**
 * 
 */
package daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import daos.UserThrashAccountDao;
import models.UserThrashAccount;
import util.CommonUtil;

/**
 * @author Kumar Ashutosh
 *
 */
public class UserThrashAccountDaoImpl implements UserThrashAccountDao {

	private CommonUtil commonUtil;

	public void setCommonUtil(CommonUtil commonUtil) {
		this.commonUtil = commonUtil;
	}
	/**
	 * 
	 */
	public UserThrashAccountDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see daos.UserThrashAccountDao#getUserThrashAccount(java.lang.String)
	 */
	@Override
	public UserThrashAccount getUserThrashAccount(String argUSerId) {
		String query = "SELECT "
					    + "user_id, user_tc_active_status, user_tc_join_date, user_tc_last_active_date"
					+ " FROM "
						+ "user_thrash_account";
		RowMapper<UserThrashAccount> rowMapper = new RowMapper<UserThrashAccount>() {
				@Override
				public UserThrashAccount mapRow(ResultSet resultSet, int rowNum) throws SQLException {
					return new UserThrashAccount(
						resultSet.getString("user_id"),
						resultSet.getString("user_tc_active_status"),
						resultSet.getDate("user_tc_join_date"),
						resultSet.getDate("user_tc_active_status")
						);
			}
		};
		return commonUtil.getJdbcTemplate().queryForObject(query, rowMapper);
	}

	/* (non-Javadoc)
	 * @see daos.UserThrashAccountDao#setUserThrashAccount(models.UserThrashAccount)
	 * user_id, user_tc_active_status, user_tc_join_date, user_tc_last_active_date
	 */
	@Override
	public int setUserThrashAccount(UserThrashAccount thrashAccount) {
		return commonUtil.getJdbcTemplate().update(
				"INSERT INTO user_credential ("
				+ "user_id, "
				+ "user_tc_active_status, "
				+ "user_lnuser_tc_join_dateame,"
				+ "user_tc_last_active_date"
				+ ")" + " values (?, ?, ?, ?)", 
				thrashAccount.getUser_id(),
				thrashAccount.getUser_tc_active_status(),
				thrashAccount.getUser_tc_join_date(),
				thrashAccount.getUser_tc_last_active_date());
	}

	/* (non-Javadoc)
	 * @see daos.UserThrashAccountDao#updateUserThrashAccount(models.UserThrashAccount)
	 * user_id, user_tc_active_status, user_tc_join_date, user_tc_last_active_date
	 */
	@Override
	public boolean updateUserThrashAccount(UserThrashAccount thrashAccount) {
		if(commonUtil.getJdbcTemplate()
				.update("update user_thrash_account " +
						"SET "
						+ "user_tc_active_status=?,"
						+ "user_tc_join_date=?,"
						+ "user_tc_last_active_date=?,"
						+" WHERE user_id= ?", 
						thrashAccount.getUser_tc_active_status(),
						thrashAccount.getUser_tc_join_date(),
						thrashAccount.getUser_tc_last_active_date(),
						thrashAccount.getUser_id())>0){
			return true;
		}
		return false;
	}

}
