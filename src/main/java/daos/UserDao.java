package daos;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import models.ArticleNotifications;
import models.User;

public interface UserDao {

	public int ifUserExists(String argUserId);
	public int createUser(User argUser) throws DataAccessException, IOException;
	public int updateUser(User argUser) throws FileNotFoundException, IOException, SQLException;
	public User getUserById(String argUserId) throws IOException;
	public List<User> getAllUser();
	public List<ArticleNotifications> getUserArticleNotifications(String argUserId);
	public CommonsMultipartFile getUserImgData(String argUserId);
//	public int getUserArticleNotificationsCount(String argUserId);
}
