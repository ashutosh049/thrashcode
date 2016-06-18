package controllers;

import java.io.IOException;
import java.util.Locale;

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
public class SearchController {

	@Autowired
	UserDaoImpl userDao;

	@Autowired
	User user;

	@Autowired
	UserParameters userParameters;
	
	@RequestMapping(value = "handlePosCodeSearch", method = RequestMethod.GET)
	public String handlePosCodeSearch(@RequestParam("searchposcode") String searchposcode) throws CstmDataAccessException, IOException {
			return "you searched for..."+searchposcode;
	}
	


}
