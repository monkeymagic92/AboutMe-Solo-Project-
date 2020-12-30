package com.jy.aboutme.devel;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jy.aboutme.ViewRef;
import com.jy.aboutme.devel.model.DevelPARAM;

@Controller
@RequestMapping("/devel")
public class DevelController {

	@Autowired
	private DevelService service;
	
	// 개발일지  main 페이지
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String develMain(Model model) {
		
		model.addAttribute("view", ViewRef.DEVEL_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	@RequestMapping(value="/main", method = RequestMethod.POST)
	public String develMain(DevelPARAM param, Model model,
			HttpServletRequest request) {
		
		
		System.out.println("param1 : " + param.getCtn1());
		System.out.println("param2 : " + param.getCtn2());
		System.out.println("param3 : " + param.getCtn3());
		System.out.println("param4 : " + param.getCtn4());
		System.out.println("param5 : " + param.getCtn5());
		
		int result = service.insDevel(param);
		
			
		model.addAttribute("view", ViewRef.DEVEL_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
	
}
