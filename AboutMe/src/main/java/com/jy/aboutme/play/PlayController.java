package com.jy.aboutme.play;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/play")
public class PlayController {

	@Autowired
	private PlayService service;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String playMain(Model model) {
		
		return "/play/main";
	}
}
