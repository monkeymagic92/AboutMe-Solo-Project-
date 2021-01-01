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
	public String develMain(Model model, DevelPARAM param) {
		
		model.addAttribute("data",service.selDevel());
		model.addAttribute("view", ViewRef.DEVEL_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	@RequestMapping(value="/main", method = RequestMethod.POST)
	public String develMain(DevelPARAM param, Model model,
			HttpServletRequest request) {
		
		int result = service.insDevel(param);
			
		model.addAttribute("view", ViewRef.DEVEL_MAIN);
		return "redirect:/" + ViewRef.DEVEL_MAIN;
	}
	
	
	// success 코드 수정할시
	@RequestMapping(value="/updMain", method = RequestMethod.GET)
	public String updMainGet(DevelPARAM param, Model model) {
		
		model.addAttribute("data",service.selDevel());
		model.addAttribute("successCode", "success");
		model.addAttribute("view", ViewRef.DEVEL_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
	
	@RequestMapping(value="/updMain", method = RequestMethod.POST)
	public String updMainPost(DevelPARAM param, Model model) {
		
		System.out.println("-------");
		System.out.println("i_devel : " + param.getI_devel());
		System.out.println("param1 : " + param.getCtnChk1());
		System.out.println("param2 : " + param.getCtnChk2());
		System.out.println("param3 : " + param.getCtnChk3());
		System.out.println("param4 : " + param.getCtnChk4());
		System.out.println("param5 : " + param.getCtnChk5());
		System.out.println("-------");
		int result = service.updDevel(param);
		
		return "redirect:/" + ViewRef.DEVEL_MAIN;
	}
	
}
