package controllers;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import daoImpl.UserDaoImpl;
import models.User;
import models.UserParameters;

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
	public String handlePosCodeSearch(@RequestParam("searchposcode") String searchposcode) throws  IOException {
			return "you searched for..."+searchposcode;
	}
	


}
