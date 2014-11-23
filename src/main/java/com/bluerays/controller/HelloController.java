package com.bluerays.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

	@RequestMapping(value ="/dashBoard")
	public String sayHello (Model model) {
		
		model.addAttribute("greeting", "Hello World");
		
		return "dashBoard";
	}
	
	@RequestMapping(value ="/adminPanel")
	public String admin(Model model) {
		
		model.addAttribute("greeting", "Hello World");
		
		return "adminPanel";
	}
	
	@RequestMapping(value ="/mySearch")
	public String mySearch(Model model) {
		
		model.addAttribute("greeting", "Hello World");
		
		return "mySearch";
	}
	
}
