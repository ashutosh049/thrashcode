package daoImpl;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import daos.UserDao;
import models.ArticleNotifications;
import models.User;
import util.CommonUtil;

public class UserDaoImpl implements UserDao {

	private CommonUtil commonUtil;

	public void setCommonUtil(CommonUtil commonUtil) {
		this.commonUtil = commonUtil;
	}

	@Override
	public int createUser(User argUser) throws DataAccessException, IOException {
		return commonUtil.getJdbcTemplate()
				.update("INSERT INTO user (user_id, user_pwd, user_fname, user_lname, user_email, user_img)"
						+ " values (?, ?, ?, ?, ?, ?)", argUser.getUser_id(), argUser.getUser_pwd(),
				argUser.getUser_fname(), argUser.getUser_lname(), argUser.getUser_email(),
				argUser.getUser_img().getInputStream());
	}

	@Override
	public int ifUserExists(String argUserId) {
		String sql ="SELECT count(*) FROM user WHERE user_id=?";
		int i = commonUtil.getJdbcTemplate().queryForObject( sql, 
				new Object[] { argUserId }, Integer.class);
		return i;
	}
	
	@Override
	public User getUserById(String argUserId) throws IOException {
			User user = commonUtil.getJdbcTemplate()
					.queryForObject(
							"select user_id, user_pwd, user_fname, user_lname, user_email, user_img"
									+ " from user where user_id = ?",
							new Object[] { argUserId }, new RowMapper<User>() {
								public User mapRow(ResultSet rs, int rowNum) throws SQLException {
									User user = new User();
										user.setUser_id(rs.getString(1));
										user.setUser_pwd(rs.getString(2));
										user.setUser_fname(rs.getString(3));
										user.setUser_lname(rs.getString(4));
										user.setUser_email(rs.getString(5));
										if (rs.getBlob(6).length() > 0) {
											try {
												user.setUser_img(new CommonsMultipartFile(getFileItemFromInputStream(
														rs.getBlob(6).getBinaryStream(1, rs.getBlob(6).length()))));
											} catch (IOException e) {
												e.printStackTrace();
											}
										} else {
											user.setUser_img(null);
										}
										return user;
									}
							});
			return user;

	}

	@Override
	public List<User> getAllUser() {
		return null;
	}

	public List<ArticleNotifications> getUserArticleNotifications(String argUserId) {

		String sql = "SELECT "
						+ "arctl_id,"
						+ "cmnt_id,"
						+ "user_id,"
						+ "cmnt_by_user_fname,"
						+ "cmnt_by_user_lname,"
						+ "cmt_date,"
						+ "read_status,"
						+ "notification_type,"
						+ "notification_data "
					+ "FROM "
						+ "article_notifications artclnotify " 
					+ "INNER JOIN "
						+ "ARTICLES artcl "
					+ "ON "
						+ "artclnotify.arctl_id = artcl.artcl_id "
					+ "AND artcl.artcl_owner_id = ?";

		List<ArticleNotifications> notificationsList = commonUtil.getJdbcTemplate().query(sql,
				new Object[] { argUserId }, new RowMapper<ArticleNotifications>() {
					public ArticleNotifications mapRow(ResultSet rs, int rowNum) throws SQLException {
						ArticleNotifications articleNotifications = new ArticleNotifications();
						articleNotifications.setArctl_id(rs.getString("arctl_id"));
						articleNotifications.setCmnt_id(rs.getString("cmnt_id"));
						articleNotifications.setUser_id(rs.getString("user_id"));
						articleNotifications.setCmnt_by_user_fname(rs.getString("cmnt_by_user_fname"));
						articleNotifications.setCmnt_by_user_lname(rs.getString("cmnt_by_user_lname"));
						articleNotifications.setCmt_date(rs.getDate("cmt_date"));
						articleNotifications.setRead_status(rs.getBoolean("read_status"));
						articleNotifications.setNotification_type(rs.getString("notification_type"));
						articleNotifications.setNotification_data(rs.getString("notification_data"));
						return articleNotifications;
					}
				});

		return notificationsList;
	}

	@Override
	public int updateUser(User u) throws IOException, SQLException {

		final User argUser = u;

		/*
		 * final String sql = "update user " + "SET user_pwd=?, " +
		 * "user_fname=?, " + "user_lname=?, " + "user_email=?, " +
		 * "user_img=? " + "WHERE user_id= ?";
		 */
		// final int i = (int)argUser.getUser_img().getSize();
		// final InputStream blobIs = argUser.getUser_img().getInputStream();
		// LobHandler lobHandler = new DefaultLobHandler();

		return commonUtil.getJdbcTemplate()
				.update("update user " + "SET user_pwd=?, " + "user_fname=?, " + "user_lname=?, "
						+ "user_email=?, " + "user_img=? " + "WHERE user_id= ?", argUser.getUser_pwd(),
				argUser.getUser_fname(), argUser.getUser_lname(), argUser.getUser_email(),
				argUser.getUser_img().getInputStream(), argUser.getUser_id());

	}

	/*
	 * public int getUserArticleNotificationsCount(String argUserId) { return
	 * commonUtil.getJdbcTemplate().queryForObject(
	 * "select count(*) from t_actor", Integer.class); }
	 */

	/*
	 * public String getArticleUserName(String argArticleId){ String sql=
	 * "SELECT artcl_owner_name from articles WHERE artcl_id = ?"; String
	 * userName = (String)commonUtil.getJdbcTemplate().queryForObject( sql, new
	 * Object[] { argArticleId }, String.class); return userName; }
	 */

	@JsonIgnore
	private FileItem getFileItemFromInputStream(InputStream inputStream) throws IOException {
		int availableBytes = inputStream.available();
		File outFile = new File("c:/myTemp/myTemp2");
		FileItem fileItem = new DiskFileItem("fileUpload", "image/png", false, "sometext.png", availableBytes, outFile);
		OutputStream outputStream = fileItem.getOutputStream();
		int read = 0;
		byte[] bytes = new byte[1024];
		while ((read = inputStream.read(bytes)) != -1) {
			outputStream.write(bytes, 0, read);
		}
		inputStream.close();
		outputStream.flush();
		outputStream.close();
		return fileItem;
	}

	@Override
	public CommonsMultipartFile getUserImgData(String argUserId) {
		// byte[] rs = commonUtil.getJdbcTemplate().queryForObject("SELECT
		// user_img FROM user where user_id='"+argUserId+"' ",
		// byte[].class);
		// return new CommonsMultipartFile(getFileItemFromInputStream(null));

		CommonsMultipartFile cmpf = commonUtil.getJdbcTemplate().queryForObject(
				"SELECT user_img FROM user where user_id=?", new Object[] { argUserId },
				new RowMapper<CommonsMultipartFile>() {
					public CommonsMultipartFile mapRow(ResultSet rs, int rowNum) throws SQLException {
						CommonsMultipartFile user = null;
						try {
							user = new CommonsMultipartFile(getFileItemFromInputStream(
									rs.getBlob(1).getBinaryStream(1, rs.getBlob(1).length())));
						} catch (IOException e) {
							e.printStackTrace();
						}
						return user;
					}
				});
		return cmpf;
	}

}
