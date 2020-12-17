package com.jy.aboutme.intro;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jy.aboutme.ViewRef;

@Controller
@RequestMapping("/")
public class IntroController {

	@RequestMapping("/intro")
	public String intro(Model model) {
		
		model.addAttribute("cssResult", "1");
		model.addAttribute("view", ViewRef.INTRO);
		return ViewRef.DEFAULT_TEMP;
	}
}
