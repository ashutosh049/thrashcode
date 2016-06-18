package handlers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import daoImpl.ArticleCategoriesDaoImpl;
import daoImpl.ArticleDaoImpl;
import daoImpl.UserDaoImpl;
import models.User;
import models.UserParameters;
import util.CommonUtil;

public class PosCodeSessionHandler extends HandlerInterceptorAdapter{

	@Autowired User user;
	@Autowired UserDaoImpl userDao;
	@Autowired UserParameters userParameters;
	@Autowired CommonUtil commonUtil;
	@Autowired ArticleCategoriesDaoImpl articleCategoriesDao;
	@Autowired ArticleDaoImpl articleDao;
	
	public void setUser(User user) {
		this.user = user;
	}

	public void setUserParameters(UserParameters userParameters) {
		this.userParameters = userParameters;
	}

	public void setUserDao(UserDaoImpl userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("/handleAppLogin.....preHandle()");
		/*HttpSession session = request.getSession();
		session.invalidate();
		
		User newUser = null;
		
		String user_id = (String)request.getAttribute("user_id");
		String user_pwd = (String)request.getAttribute("user_pwd");
		
		if(userDao.ifUserExists(user_id)==1){
			newUser = userDao.getUserById(user_id);
		}
		
		if(newUser != null && newUser.getUser_pwd().equals(user_pwd)){
			user.setUser_id(newUser.getUser_id());
			user.setUser_pwd(newUser.getUser_pwd());
			user.setUser_fname(newUser.getUser_fname());
			user.setUser_lname(newUser.getUser_lname());
			user.setUser_email(newUser.getUser_email());
			user.setUser_img(newUser.getUser_img());
		}
		*/
		request.getSession().setMaxInactiveInterval(60*5);
        return true;
		
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
	
}
