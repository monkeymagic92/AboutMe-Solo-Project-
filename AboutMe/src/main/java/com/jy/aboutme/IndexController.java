package com.jy.aboutme;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jy.aboutme.admin.model.AdminVO;

@Controller
@RequestMapping("/")
public class IndexController {

	@RequestMapping("/")
	public String index(Model model) {
		
		model.addAttribute("view", ViewRef.INDEX_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
	
}
