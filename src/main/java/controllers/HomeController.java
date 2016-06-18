package controllers;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import daoImpl.ArticleCategoriesDaoImpl;
import daoImpl.ArticleDaoImpl;
import daoImpl.UserDaoImpl;
import models.Article;
import models.GenericWithImage;
import models.User;
import models.UserParameters;
import util.CommonUtil;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;


//@Scope("session")
@RestController
public class HomeController{

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired UserDaoImpl userDao;
	@Autowired User user;
	@Autowired UserParameters userParameters;
	@Autowired CommonUtil commonUtil;
	@Autowired ArticleCategoriesDaoImpl articleCategoriesDao;
	@Autowired ArticleDaoImpl articleDao;
	
	@RequestMapping(value = { "/", "/index"}, method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) throws IOException {
		ModelAndView modelAndView = new ModelAndView("index");
		
		if (user.getUser_id() != null) {
			userParameters.setArticleNotificationsList(userDao.getUserArticleNotifications(user.getUser_id()));
			userParameters.setArticleNotificationsListCount(userDao.getUserArticleNotifications(user.getUser_id()).size());
			MultipartFile multipartFile = user.getUser_img();
	        InputStream stream = multipartFile.getInputStream();
	        byte[] bytes = IOUtils.toByteArray(stream);
	        modelAndView.addObject("userimage",Base64.encode(bytes));
	        modelAndView.addObject("fileoriginalsize", multipartFile.getSize());
	        modelAndView.addObject("contenttype", multipartFile.getContentType());
		}
		
		List<Article> articleList = new LinkedList<Article>();
		articleList = articleDao.getArticles("");
		List<GenericWithImage> articleListWithOwnerImg = null;
		
		if(articleList!=null && articleList.size()>0){
			articleListWithOwnerImg = commonUtil.bundleArticleToGenericWithImg(articleList);
			for (GenericWithImage genericList : articleListWithOwnerImg) {
				CommonsMultipartFile commonsMultipartFile = userDao.getUserImgData(((Article) genericList.getClassData()).getArtcl_owner_id());
				MultipartFile multipartFile = commonsMultipartFile;
				byte[] bytes = IOUtils.toByteArray(multipartFile.getInputStream());
				genericList.setImgData(commonsMultipartFile);
				genericList.setContentType(multipartFile.getContentType());
				genericList.setEncoding(Base64.encode(bytes));
			}
		}

		modelAndView.addObject("peak_index", "peak_index");
		modelAndView.addObject("peak_article_read", null);
		modelAndView.addObject("peak_article_create", null);
		modelAndView.addObject("peak_notification", null);
		modelAndView.addObject("peak_user_profile", null);

		modelAndView.addObject("loggedInUserId", user.getUser_id());
		modelAndView.addObject("loggedInUserFName", user.getUser_fname());
		modelAndView.addObject("loggedInUserLName", user.getUser_lname());
		modelAndView.addObject("loggedInUserEmail", user.getUser_email());
		modelAndView.addObject("articleNotificationsList", userParameters.getArticleNotificationsList());
		modelAndView.addObject("articleNotificationsListCount", userParameters.getArticleNotificationsListCount());
		modelAndView.addObject("articleListWithOwnerImg",articleListWithOwnerImg);
		return modelAndView;
	}

	@RequestMapping(value = "/userNotifications", method = RequestMethod.GET)
	public ModelAndView userNotifications(Locale locale, Model model) throws IOException {
		ModelAndView modelAndView = new ModelAndView("userNotifications");

		modelAndView.addObject("loggedInUserId", user.getUser_id());
		modelAndView.addObject("loggedInUserFName", user.getUser_fname());
		modelAndView.addObject("loggedInUserLName", user.getUser_lname());
		modelAndView.addObject("loggedInUserEmail", user.getUser_email());
		if (user.getUser_id() != null) {
			userParameters.setArticleNotificationsList(userDao.getUserArticleNotifications(user.getUser_id()));
			userParameters
					.setArticleNotificationsListCount(userDao.getUserArticleNotifications(user.getUser_id()).size());
			MultipartFile multipartFile = user.getUser_img();
	        InputStream stream = multipartFile.getInputStream();
	        byte[] bytes = IOUtils.toByteArray(stream);
	        modelAndView.addObject("userimage",Base64.encode(bytes));
	        modelAndView.addObject("fileoriginalsize", multipartFile.getSize());
	        modelAndView.addObject("contenttype", multipartFile.getContentType());
		}
		modelAndView.addObject("articleNotificationsList", userParameters.getArticleNotificationsList());
		modelAndView.addObject("articleNotificationsListCount", userParameters.getArticleNotificationsListCount());
		return modelAndView;
	}
	@RequestMapping(value = "/userprofile", method = RequestMethod.GET)
	public ModelAndView userprofile(Locale locale, Model model) throws IOException {
		
		ModelAndView modelAndView = new ModelAndView("userprofile");
		modelAndView.addObject("peak_index", null);
		modelAndView.addObject("peak_article_read", null);
		modelAndView.addObject("peak_article_create", null);
		modelAndView.addObject("peak_notification", null);
		modelAndView.addObject("peak_user_profile", "userprofile");
		
		
		modelAndView.addObject("loggedInUserId", user.getUser_id());
		modelAndView.addObject("loggedInUserFName", user.getUser_fname());
		modelAndView.addObject("loggedInUserLName", user.getUser_lname());
		modelAndView.addObject("loggedInUserEmail", user.getUser_email());
		modelAndView.addObject("articleNotificationsList", userParameters.getArticleNotificationsList());
		modelAndView.addObject("articleNotificationsListCount", userParameters.getArticleNotificationsListCount());
		
		modelAndView.addObject("user",user);
	        if (user.getUser_id() != null) {
				userParameters.setArticleNotificationsList(userDao.getUserArticleNotifications(user.getUser_id()));
				userParameters.setArticleNotificationsListCount(userDao.getUserArticleNotifications(user.getUser_id()).size());
				MultipartFile multipartFile = user.getUser_img();
		        InputStream stream = multipartFile.getInputStream();
		        byte[] bytes = IOUtils.toByteArray(stream);
		        modelAndView.addObject("userimage",Base64.encode(bytes));
		        modelAndView.addObject("fileoriginalsize", multipartFile.getSize());
		        modelAndView.addObject("contenttype", multipartFile.getContentType());
			}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public ModelAndView userUpdate(MultipartHttpServletRequest request, Model model) throws IOException, SQLException {
		
		String user_id = (String)request.getParameter("user_id");
		String user_fname = (String)request.getParameter("user_fname");
		String user_lname = (String)request.getParameter("user_lname");
		String user_email = (String)request.getParameter("user_email");
		String user_pwd = (String)request.getParameter("user_pwd");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile multipartFile = multipartRequest.getFile("user_img");
		
        user.setUser_fname(user_fname);
        user.setUser_lname(user_lname);
        user.setUser_email(user_email);
        user.setUser_pwd(user_pwd);
        user.setUser_img((CommonsMultipartFile) multipartFile);
        
		
		userDao.updateUser(user);
		
		return new ModelAndView("redirect:userprofile");
	}
	


	
	@RequestMapping(value = "/articleNotFound", method = RequestMethod.GET)
	public ModelAndView articleNotFound(Locale locale, Model model,@RequestParam("argArticleTitle") String argArticleTitle) throws IOException {
		ModelAndView modelAndView = new ModelAndView("articleNotFound");

		modelAndView.addObject("loggedInUserId", user.getUser_id());
		modelAndView.addObject("loggedInUserFName", user.getUser_fname());
		modelAndView.addObject("loggedInUserLName", user.getUser_lname());
		modelAndView.addObject("loggedInUserEmail", user.getUser_email());
		if (user.getUser_id() != null) {
			userParameters.setArticleNotificationsList(userDao.getUserArticleNotifications(user.getUser_id()));
			userParameters
					.setArticleNotificationsListCount(userDao.getUserArticleNotifications(user.getUser_id()).size());
			MultipartFile multipartFile = user.getUser_img();
	        InputStream stream = multipartFile.getInputStream();
	        byte[] bytes = IOUtils.toByteArray(stream);
	        modelAndView.addObject("userimage",Base64.encode(bytes));
	        modelAndView.addObject("fileoriginalsize", multipartFile.getSize());
	        modelAndView.addObject("contenttype", multipartFile.getContentType());
		}
		modelAndView.addObject("articleNotificationsList", userParameters.getArticleNotificationsList());
		modelAndView.addObject("articleNotificationsListCount", userParameters.getArticleNotificationsListCount());
		modelAndView.addObject("argArticleTitle", argArticleTitle);
		
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/ckeditor", method = RequestMethod.GET)
	public ModelAndView ckeditor() throws IOException {
		ModelAndView modelAndView = new ModelAndView("index");
		return modelAndView;
	}
	
	

	@RequestMapping(value = "/viewerProfile", method = RequestMethod.GET)
	public ModelAndView viewerProfile(Locale locale, Model model,@RequestParam("user_id") String argUserId) throws IOException {
		ModelAndView modelAndView = new ModelAndView("viewerprofile");

		modelAndView.addObject("loggedInUserId", user.getUser_id());
		modelAndView.addObject("loggedInUserFName", user.getUser_fname());
		modelAndView.addObject("loggedInUserLName", user.getUser_lname());
		modelAndView.addObject("loggedInUserEmail", user.getUser_email());
		if (user.getUser_id() != null) {
			userParameters.setArticleNotificationsList(userDao.getUserArticleNotifications(user.getUser_id()));
			userParameters
					.setArticleNotificationsListCount(userDao.getUserArticleNotifications(user.getUser_id()).size());
			MultipartFile multipartFile = user.getUser_img();
	        InputStream stream = multipartFile.getInputStream();
	        byte[] bytes = IOUtils.toByteArray(stream);
	        modelAndView.addObject("userimage",Base64.encode(bytes));
	        modelAndView.addObject("fileoriginalsize", multipartFile.getSize());
	        modelAndView.addObject("contenttype", multipartFile.getContentType());
		}
		modelAndView.addObject("articleNotificationsList", userParameters.getArticleNotificationsList());
		modelAndView.addObject("articleNotificationsListCount", userParameters.getArticleNotificationsListCount());
		
		/* view for user..informations */
		User viewUser = userDao.getUserById(argUserId);
		if (viewUser.getUser_id() != null) {
			MultipartFile multipartFile = viewUser.getUser_img();
	        InputStream stream = multipartFile.getInputStream();
	        byte[] bytes = IOUtils.toByteArray(stream);
	        modelAndView.addObject("viewUser_image",Base64.encode(bytes));
	        modelAndView.addObject("viewUser_fileoriginalsize", multipartFile.getSize());
	        modelAndView.addObject("viewUser_contenttype", multipartFile.getContentType());
	        modelAndView.addObject("viewUser_userId",viewUser.getUser_id());
	        modelAndView.addObject("viewUser_email",viewUser.getUser_email());
	        modelAndView.addObject("viewUser_fName",viewUser.getUser_fname());
	        modelAndView.addObject("viewUser_lName",viewUser.getUser_lname());
		}
		
		return modelAndView;
	}
}
