package handlers;

import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.ModelAndView;

import daoImpl.ArticleCategoriesDaoImpl;
import daoImpl.ArticleDaoImpl;
import daoImpl.UserDaoImpl;
import models.User;
import models.UserParameters;
import util.CommonUtil;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@Scope("session")
public class PosCodeCustomHandler extends HandlerInterceptorAdapter{
	
	
	@Autowired User user;
	@Autowired UserDaoImpl userDao;
	@Autowired UserParameters userParameters;
	@Autowired CommonUtil commonUtil;
	@Autowired ArticleCategoriesDaoImpl articleCategoriesDao;
	@Autowired ArticleDaoImpl articleDao;
	
/*	private User user;
	private UserParameters userParameters;
	private UserDaoImpl userDao;
*/	
	
	/**
	 * @param user the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * @param userParameters the userParameters to set
	 */
	public void setUserParameters(UserParameters userParameters) {
		this.userParameters = userParameters;
	}

	/**
	 * @param userDao the userDao to set
	 */
	public void setUserDao(UserDaoImpl userDao) {
		this.userDao = userDao;
	}

	@Value("poscode_root_dir") private String poscode_root_dir;
	@Value("poscode_log_file_name") private String poscode_log_file_name;
	
	private static final Logger logger = LoggerFactory.getLogger(PosCodeCustomHandler.class);
	
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	    
    	System.out.println("preHandle..........."+request.getRequestURL().toString());
    	request.getSession().setMaxInactiveInterval(60*5);
        return true;
    }

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)throws Exception {
		System.out.println("postHandle..........."+request.getRequestURL().toString());
		
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
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception exception)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("afterCompletion..........."+request.getRequestURL().toString());
		
	}


}
