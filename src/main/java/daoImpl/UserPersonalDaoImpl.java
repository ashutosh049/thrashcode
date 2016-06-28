/**
 * 
 */
package daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import daos.UserPersonalDao;
import models.UserCredentials;
import models.UserPersonal;
import util.CommonUtil;

/**
 * @author Kumar Ashutosh
 *
 */
public class UserPersonalDaoImpl implements UserPersonalDao {

	private CommonUtil commonUtil;

	public void setCommonUtil(CommonUtil commonUtil) {
		this.commonUtil = commonUtil;
	}
	
	/**
	 * 
	 */
	public UserPersonalDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see daos.UserPersonalDao#getUserPersonal(java.lang.String)
	 */
	@Override
	public UserPersonal getUserPersonal(String argUserId) {
		String query = "SELECT "
					    + "user_id, user_fname, user_lname, user_dob, user_age, user_sex"
					+ " FROM "
						+ "user_personal";
		RowMapper<UserPersonal> rowMapper = new RowMapper<UserPersonal>() {
			@Override
			public UserPersonal mapRow(ResultSet resultSet, int rowNum) throws SQLException {
				//user_id, user_fname, user_lname, user_dob, user_age, user_sex, user_mobile_no
				return new UserPersonal(
						resultSet.getString("user_id"),
						resultSet.getString("user_fname"),
						resultSet.getString("user_lname"),
						resultSet.getDate("user_dob"),
						resultSet.getInt("user_age"),
						resultSet.getString("user_sex"),
						resultSet.getString("user_mobile_no"));
			}
		};
		return commonUtil.getJdbcTemplate().queryForObject(query, rowMapper);
	}

	/* (non-Javadoc)
	 * @see daos.UserPersonalDao#setUserPersonal(models.UserPersonal)
	 */
	@Override
	public int setUserPersonal(UserPersonal userPersonal) {
		return commonUtil.getJdbcTemplate().update(
				"INSERT INTO user_credential ("
				+ "user_id, "
				+ "user_fname, "
				+ "user_lname,"
				+ "user_dob,"
				+ "user_age,"
				+ "user_sex,"
				+"user_mobile_no"
				+ ")" + " values (?, ?, ?, ?, ?, ?, ?)", 
				userPersonal.getUser_id(),
				userPersonal.getUser_fname(),
				userPersonal.getUser_lname(),
				userPersonal.getUser_dob(),
				userPersonal.getUser_age(),
				userPersonal.getUser_sex(),
				userPersonal.getUser_mobile_no());
	}

	/* (non-Javadoc)
	 * @see daos.UserPersonalDao#updateUserPersonal(models.UserPersonal)
	 * user_id, user_fname, user_lname, user_dob, user_age, user_sex
	 */
	@Override
	public boolean updateUserPersonal(UserPersonal userPersonal) {
		if(commonUtil.getJdbcTemplate()
				.update("update user_personal " +
						"SET "
						+ "user_fname=?,"
						+ "user_lname=?,"
						+ "user_dob=?,"
						+ "user_age=?,"
						+ "user_sex=?, "
						+ "user_mobile_no=?"
						+" WHERE user_id= ?", 
						userPersonal.getUser_fname(),
						userPersonal.getUser_lname(),
						userPersonal.getUser_dob(),
						userPersonal.getUser_age(),
						userPersonal.getUser_sex(),
						userPersonal.getUser_mobile_no(),
						userPersonal.getUser_id())>0){
			return true;
		}
		return false;
	}

}
