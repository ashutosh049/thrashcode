/**
 * 
 */
package daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;

import org.springframework.jdbc.core.RowMapper;

import daos.UserProfessionalDao;
import models.UserPersonal;
import models.UserProfessional;
import util.CommonUtil;

/**
 * @author Kumar Ashutosh
 *
 */
public class UserProfessionalDaoImpl implements UserProfessionalDao {

	private CommonUtil commonUtil;

	public void setCommonUtil(CommonUtil commonUtil) {
		this.commonUtil = commonUtil;
	}
	
	/**
	 * 
	 */
	public UserProfessionalDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see daos.UserProfessionalDao#getUserProfessional(java.lang.String)
	 */
	@Override
	public UserProfessional getUserProfessional(String argUserId) {
		String query = "SELECT "
			    + "user_id, user_wroks_as, user_worsk_in, user_skills"
			+ " FROM "
				+ "user_professional";
		RowMapper<UserProfessional> rowMapper = new RowMapper<UserProfessional>() {
				@Override
				public UserProfessional mapRow(ResultSet resultSet, int rowNum) throws SQLException {
					//user_id, user_wroks_as, user_worsk_in, user_skills
					return new UserProfessional(
						resultSet.getString("user_id"),
						resultSet.getString("user_wroks_as"),
						resultSet.getString("user_worsk_in"),
						Arrays.asList(resultSet.getString("user_skills").split(",")));
			}
		};
		return commonUtil.getJdbcTemplate().queryForObject(query, rowMapper);
	}

	/* (non-Javadoc)
	 * @see daos.UserProfessionalDao#setUserProfessional(models.UserProfessional)
	 * user_id, user_wroks_as, user_worsk_in, user_skills
	 */
	@Override
	public int setUserProfessional(UserProfessional userProfessional) {
		return commonUtil.getJdbcTemplate().update(
				"INSERT INTO user_professional ("
				+ "user_id, "
				+ "user_wroks_as, "
				+ "user_worsk_in,"
				+ "user_skills"
				+ ")" + " values (?, ?, ?, ?)", 
				userProfessional.getUser_id(),
				userProfessional.getUser_wroks_as(),
				userProfessional.getUser_worsk_in(),
				commonUtil.ListToString(userProfessional.getUser_skills()));
	}

	/* (non-Javadoc)
	 * @see daos.UserProfessionalDao#updateUserProfessional(models.UserProfessional)
	 * user_id, user_wroks_as, user_worsk_in, user_skills
	 */
	@Override
	public boolean updateUserProfessional(UserProfessional userProfessional) {
		if(commonUtil.getJdbcTemplate()
				.update("update user_professional " +
						"SET "
						+ "user_wroks_as=?,"
						+ "user_worsk_in=?,"
						+ "user_skills=?,"
						+" WHERE user_id= ?", 
						userProfessional.getUser_wroks_as(),
						userProfessional.getUser_worsk_in(),
						userProfessional.getUser_skills(),
						userProfessional.getUser_id())>0){
			return true;
		}
		return false;
	}

}
