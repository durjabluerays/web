package com.bluerays.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LoginController {


	@RequestMapping(value = "/login")
	public String login(ModelMap model){
		return "login";
	}
	
	@RequestMapping(value = "/loginFailed")
	public String loginFailed(ModelMap model){
		System.out.println("Login Failed");
		model.addAttribute("error", "true");
		return "loginFailed";
	}
	
	@RequestMapping(value = "/403")
	public String login403(ModelMap model){
		System.out.println("Login 403");
		return "403";
	}
		
}
