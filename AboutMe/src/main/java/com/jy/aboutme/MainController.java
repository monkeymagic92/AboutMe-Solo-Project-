package com.jy.aboutme;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {

	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("hi", "반갑다 하이");
		return "/main/entrance";
	}
	
	@RequestMapping("/jy")
	public String jy(Model model) {
		
		return "/main/jy";
	}
	
}
