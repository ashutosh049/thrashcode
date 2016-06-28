/**
 * 
 */
package daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.RowMapper;

import daos.UserActivityDao;
import models.UserActivity;
import util.CommonUtil;

/**
 * @author Kumar Ashutosh
 *
 */
public class UserActivityDaoImpl implements UserActivityDao {

	private static final Logger logger = LoggerFactory.getLogger(UserActivityDaoImpl.class);

	private CommonUtil commonUtil;

	public void setCommonUtil(CommonUtil commonUtil) {
		this.commonUtil = commonUtil;
	}
	
	@Override
	public int createUserActivity(UserActivity argUserActivity) {
		return commonUtil.getJdbcTemplate().update(
		        "insert into user_activity "
										+ "("
											+ "user_id," 
											+ "artcl_id," 
											+ "user_actvty_id," 
											+ "actvty_id," 
											+ "actvty_cat," 
											+ "user_actvty_desc," 
											+ "user_actvty_create_date," 
											+ "user_actvty_mod_date"
										+ ") " 
		       +" values (?, ?, ?, ?, ?, ?, ?, ?)",
		       argUserActivity.getUser_id(),
		       argUserActivity.getArtcl_id(),
		       argUserActivity.getUser_actvty_id(),
		       argUserActivity.getActvty_id(),
		       argUserActivity.getActvty_cat(),
		       argUserActivity.getUser_actvty_desc(),
		       argUserActivity.getUser_actvty_create_date(),
		       argUserActivity.getUser_actvty_mod_date());
	}

	@Override
	public List<UserActivity> getUserActivitiesByUserId(String argUserId) {
		String query = "SELECT "
							+ "user_id," 
							+ "artcl_id," 
							+ "user_actvty_id," 
							+ "actvty_id," 
							+ "actvty_cat," 
							+ "user_actvty_desc," 
							+ "user_actvty_create_date," 
							+ "user_actvty_mod_date " 
				      + "FROM user_activity "
				      + "WHERE user_id='"+argUserId+"'";
		RowMapper<UserActivity> rowMapper = new RowMapper<UserActivity>() {
			@Override
			public UserActivity mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserActivity activity = new UserActivity();
				activity.setUser_id(rs.getString("user_id"));
				activity.setArtcl_id(rs.getString("artcl_id"));
				activity.setUser_actvty_id(rs.getString("user_actvty_id"));
				activity.setActvty_id(rs.getString("actvty_id"));
				activity.setActvty_cat(rs.getString("actvty_cat"));
				activity.setUser_actvty_desc(rs.getString("user_actvty_desc"));
				activity.setUser_actvty_create_date(rs.getDate("user_actvty_create_date"));
				activity.setUser_actvty_mod_date(rs.getDate("user_actvty_mod_date"));
				return activity;
			}
		};
		List<UserActivity> userActivities = commonUtil.getJdbcTemplate().query(query,rowMapper);
		return userActivities;
	}

	@Override
	public List<UserActivity> getUserActivitiesByArticleIdByAllUsers(String argArtclId) {
		String query = "SELECT "
							+ "user_id," 
							+ "artcl_id," 
							+ "user_actvty_id," 
							+ "actvty_id," 
							+ "actvty_cat," 
							+ "user_actvty_desc," 
							+ "user_actvty_create_date," 
							+ "user_actvty_mod_date " 
				      + "FROM user_activity "
				      + "WHERE artcl_id='"+argArtclId+"'";
			RowMapper<UserActivity> rowMapper = new RowMapper<UserActivity>() {
			@Override
			public UserActivity mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserActivity activity = new UserActivity();
				activity.setUser_id(rs.getString("user_id"));
				activity.setArtcl_id(rs.getString("artcl_id"));
				activity.setUser_actvty_id(rs.getString("user_actvty_id"));
				activity.setActvty_id(rs.getString("actvty_id"));
				activity.setActvty_cat(rs.getString("actvty_cat"));
				activity.setUser_actvty_desc(rs.getString("user_actvty_desc"));
				activity.setUser_actvty_create_date(rs.getDate("user_actvty_create_date"));
				activity.setUser_actvty_mod_date(rs.getDate("user_actvty_mod_date"));
				return activity;
			}
			};
			List<UserActivity> userActivities = commonUtil.getJdbcTemplate().query(query,rowMapper);
			return userActivities;
	}

	@Override
	public List<UserActivity> getUserActivitiesByArticleIdByUserId(String argArtclId, String argUserId) {
		String query = "SELECT "
							+ "user_id," 
							+ "artcl_id," 
							+ "user_actvty_id," 
							+ "actvty_id," 
							+ "actvty_cat," 
							+ "user_actvty_desc," 
							+ "user_actvty_create_date," 
							+ "user_actvty_mod_date " 
				      + "FROM user_activity "
				      + "WHERE artcl_id='"+argArtclId+"' AND user_id='"+argUserId+"'";
			RowMapper<UserActivity> rowMapper = new RowMapper<UserActivity>() {
			@Override
			public UserActivity mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserActivity activity = new UserActivity();
				activity.setUser_id(rs.getString("user_id"));
				activity.setArtcl_id(rs.getString("artcl_id"));
				activity.setUser_actvty_id(rs.getString("user_actvty_id"));
				activity.setActvty_id(rs.getString("actvty_id"));
				activity.setActvty_cat(rs.getString("actvty_cat"));
				activity.setUser_actvty_desc(rs.getString("user_actvty_desc"));
				activity.setUser_actvty_create_date(rs.getDate("user_actvty_create_date"));
				activity.setUser_actvty_mod_date(rs.getDate("user_actvty_mod_date"));
				return activity;
			}
			};
			List<UserActivity> userActivities = commonUtil.getJdbcTemplate().query(query,rowMapper);
			return userActivities;
	}

	@Override
	public int updateUserActivity(UserActivity argUserActivity) {
		String query = "update user_activity "
				+ "SET "
				+ "user_actvty_id ='"+argUserActivity.getUser_actvty_id()+"', "
				+ "actvty_id='"+argUserActivity.getActvty_id()+"', "
				+ "actvty_cat='"+argUserActivity.getActvty_cat()+"', "
				+ "user_actvty_desc='"+argUserActivity.getUser_actvty_desc()+"', "
				+ "user_actvty_mod_date='"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(argUserActivity.getUser_actvty_mod_date())+"' "
				+ " WHERE user_id=? AND "
				+ "artcl_id=?";
		int i = commonUtil.getJdbcTemplate().update(query, argUserActivity.getUser_id(), argUserActivity.getArtcl_id());
		return i;
	}

}
