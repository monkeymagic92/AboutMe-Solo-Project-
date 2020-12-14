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
	
	@RequestMapping("/HiBaby")
	public String hiBaby( ) {
		return "";
	}
	
	
	
	@RequestMapping("/DDmarket")
	public String ddMarket( ) {
		return "";
	}
}
