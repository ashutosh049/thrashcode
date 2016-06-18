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
import models.Comment;
import models.GenericWithImage;
import models.User;
import models.UserParameters;
import util.CommonUtil;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;


@Scope("session")
@RestController
public class MessageController{

	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

	@Autowired UserDaoImpl userDao;
	@Autowired User user;
	@Autowired UserParameters userParameters;
	@Autowired CommonUtil commonUtil;
	@Autowired ArticleCategoriesDaoImpl articleCategoriesDao;
	@Autowired ArticleDaoImpl articleDao;
	
	@RequestMapping(value = "/allMessages", method = RequestMethod.GET)
	public ModelAndView allMessages(Locale locale, Model model) throws IOException {
		ModelAndView modelAndView = new ModelAndView("allMessages");
		modelAndView.addObject("peak_index", null);
		modelAndView.addObject("peak_article_read", null);
		modelAndView.addObject("peak_article_create", null);
		modelAndView.addObject("peak_notification", "allMessages");
		modelAndView.addObject("peak_user_profile", null);
		
		
		
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
		
	  // fetch all messages/notifications
	   
	        
		return modelAndView;
	}


}
