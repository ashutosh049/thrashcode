package controllers;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

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

import daoImpl.UserDaoImpl;
import models.User;
import models.UserParameters;
import util.CstmDataAccessException;

@Scope("session")
@RestController
public class LoginController {

	@Autowired
	UserDaoImpl userDao;

	@Autowired
	User user;

	@Autowired
	UserParameters userParameters;
	
	private static final String SUCCESS = "success";
	
	@RequestMapping(value = "/handleAppLogin", method = RequestMethod.POST)
	public String login(Locale locale, Model model, @RequestParam("user_id") String user_id,
			@RequestParam("user_pwd") String user_pwd,HttpSession session) throws CstmDataAccessException, IOException {

		User newUser=null;
		
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
			
			session.setAttribute("user", user);
			
			return SUCCESS;
		}
	return null;
	}
	@RequestMapping(value = "/handAppLogout", method = RequestMethod.GET)
	public ModelAndView handAppLogout(Locale locale, Model model) {
		user.setUser_id(null);
		user.setUser_pwd(null);
		user.setUser_fname(null);
		user.setUser_lname(null);
		user.setUser_email(null);
		return new ModelAndView("redirect:index");
	}

	@RequestMapping(value = "/userRegistration", method = RequestMethod.GET)
	public ModelAndView userRegistration(Locale locale, Model model) throws IOException {
		ModelAndView modelAndView = new ModelAndView("userRegistration");
		return modelAndView;
	}
	
	@RequestMapping(value = "/handleUserRegistration", method = RequestMethod.POST)
	public ModelAndView handleuserRegistration(MultipartHttpServletRequest request, Locale locale, Model model) throws IOException {
		
		
		
		String user_id = (String)request.getParameter("user_id");
		String user_fname = (String)request.getParameter("user_fname");
		String user_lname = (String)request.getParameter("user_lname");
		String user_email = (String)request.getParameter("user_email");
		String user_pwd = (String)request.getParameter("user_pwd");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile multipartFile = multipartRequest.getFile("user_img");
		
        user.setUser_id(user_id);
        user.setUser_fname(user_fname);
        user.setUser_lname(user_lname);
        user.setUser_email(user_email);
        user.setUser_pwd(user_pwd);
        user.setUser_img((CommonsMultipartFile) multipartFile);
        
		
		userDao.createUser(user);
		
		return new ModelAndView("redirect:index");
	}
	


}
