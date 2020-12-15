package com.jy.aboutme.pj;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jy.aboutme.ViewRef;

@Controller
@RequestMapping("/pj")
public class PjController {
	
	@RequestMapping("/pjList")
	public String pjList(Model model) {
		
		model.addAttribute("view", "pj/pjList");
		return ViewRef.DEFAULT_TEMP;
	}
	
	@RequestMapping("/hibabyTag")
	public String hiBaby(Model model) {
		model.addAttribute("view", "/pj/hibabyTag");
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	
	@RequestMapping("/ddmarketTag")
	public String ddMarket(Model model) {
		model.addAttribute("view", "/pj/ddmarketTag");
		return ViewRef.DEFAULT_TEMP;
	}
}
