package com.jy.aboutme.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main")
public class MainController {

	@RequestMapping(value="/boarder", method = RequestMethod.GET)
	public String index(Model model) {
		return "/main/boarder";
	}
}
