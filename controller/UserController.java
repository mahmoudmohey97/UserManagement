package com.jackrutorial.controller;

import javax.validation.Valid;

import org.apache.tomcat.jni.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jackrutorial.service.CompanyService;
import com.jackrutorial.service.UserService;
import com.jackrutorial.model.*;

@Controller
public class UserController 
{
	@Autowired
	private UserService userService;
	@Autowired
	private CompanyService companyService;
	
	@RequestMapping(value= {"/" ,"/login"} , method = RequestMethod.GET)
	public ModelAndView login()
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("user/login");
		return model;
	}
	
	@RequestMapping(value= {"/signup"}, method=RequestMethod.GET)
	public ModelAndView signup()
	{
		ModelAndView model = new ModelAndView();
		com.jackrutorial.model.User user = new com.jackrutorial.model.User();
		model.addObject("user",user);
		model.setViewName("user/signup");
		return model;
	}
	
	@RequestMapping(value= {"/signup"}, method = RequestMethod.POST)
	public ModelAndView signup(@Valid com.jackrutorial.model.User user, BindingResult bindingResult)
	{
		ModelAndView model= new ModelAndView();
		com.jackrutorial.model.User userExists = userService.findUserByEmail(user.getEmail());
		if(userExists != null)
		{
			bindingResult.rejectValue("email","error.user", "this email already exists");
		}
		if(bindingResult.hasErrors())
		{
			model.setViewName("user/signup");
		}
		else
		{
			userService.saveUser(user);
			model.addObject("msg", "User registerd succesfully");
			model.addObject("user", new com.jackrutorial.model.User());
			model.setViewName("user/signup");
		}
		return model;
	}
	
	
	@RequestMapping(value= {"/signupcompany"}, method=RequestMethod.GET)
	public ModelAndView signupcompany()
	{
		ModelAndView model = new ModelAndView();
		Company company = new Company();
		model.addObject("company",company);
		//model.addObject("skill" , new Skill());
		model.setViewName("company/signupcompany");
		return model;
	}
	
	@RequestMapping(value= {"/signupcompany"}, method = RequestMethod.POST)
	public ModelAndView signupcompany(@Valid Company company, BindingResult bindingResult)
	{
		ModelAndView model= new ModelAndView();
		Company companyExists = companyService.findCompanyByEmail(company.getEmail());
		if(companyExists != null)
		{
			bindingResult.rejectValue("email","error.user", "this email already exists");
		}
		if(bindingResult.hasErrors())
		{
			model.setViewName("company/signupcompany");
		}
		else
		{
			companyService.saveCompany(company);
			model.addObject("msg", "User registerd succesfully");
			model.addObject("company", new Company());
			//model.addObject("skill" , new Skill());
			model.setViewName("company/signupcompany");
		}
		return model;
	}
	
	@RequestMapping(value= {"/home/home"}, method=RequestMethod.GET)
	 public ModelAndView home() 
	{
	  ModelAndView model = new ModelAndView();
	  Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	  com.jackrutorial.model.User user = userService.findUserByEmail(auth.getName());
	  
	  model.addObject("userName", user.getFirstname() + " " + user.getLastname());
	  model.setViewName("home/home");
	  return model;
	 }
	
	@RequestMapping(value= {"/access_denied"}, method=RequestMethod.GET)
	 public ModelAndView accessDenied()
	{
	  ModelAndView model = new ModelAndView();
	  model.setViewName("errors/access_denied");
	  return model;
	}
	
	
}
