package com.jy.aboutme.devel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jy.aboutme.SecurityUtils;
import com.jy.aboutme.ViewRef;
import com.jy.aboutme.admin.model.AdminPARAM;
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
	
	// (관리자만 가능)
	@RequestMapping(value="/main", method = RequestMethod.POST)
	public String develMain(DevelPARAM param, Model model,
			HttpServletRequest request, HttpSession hs, RedirectAttributes ra,
			AdminPARAM adminParam) {
		
		try { // 비로그인 상태로 접근시 로그인페이지로		
			int i_user = SecurityUtils.getLoginUserPk(hs);
			adminParam.setI_user(i_user);
			
		} catch (Exception e) {
			System.out.println("로그인 안되어있음");
			ra.addFlashAttribute("loginFail", "관리자만 접근 가능합니다");
			model.addAttribute("view", ViewRef.DEVEL_MAIN);
			return "redirect:/" + ViewRef.DEVEL_MAIN;
		}
		
		int result = service.insDevel(param);
			
		model.addAttribute("view", ViewRef.DEVEL_MAIN);
		return "redirect:/" + ViewRef.DEVEL_MAIN;
		
	}
	
	
	// 글 수정 (관리자만 가능)
	@RequestMapping(value="/updMain", method = RequestMethod.GET)
	public String updMainGet(DevelPARAM param, Model model) {
		
		model.addAttribute("data",service.selDevel());
		model.addAttribute("successCode", "success");
		model.addAttribute("view", ViewRef.DEVEL_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
	
	@RequestMapping(value="/updMain", method = RequestMethod.POST)
	public String updMainPost(DevelPARAM param, Model model,
			HttpSession hs, RedirectAttributes ra, AdminPARAM adminParam) {
		
		try { // 비로그인 상태로 접근시 로그인페이지로		
			int i_user = SecurityUtils.getLoginUserPk(hs);
			adminParam.setI_user(i_user);
			
		} catch (Exception e) {
			System.out.println("로그인 안되어있음");
			ra.addFlashAttribute("loginFail", "관리자만 접근 가능합니다");
			return "redirect:/" + ViewRef.DEVEL_MAIN;
		}
		
		int result = service.updDevel(param);
		
		return "redirect:/" + ViewRef.DEVEL_MAIN;
	}
	
	
	// 삭제(관리자만 가능)
	@RequestMapping(value="delMain", method = RequestMethod.GET)
	public String delMainPost(DevelPARAM param, HttpSession hs,
			RedirectAttributes ra, AdminPARAM adminParam) {
		
		try { // 비로그인 상태로 접근시 로그인페이지로		
			int i_user = SecurityUtils.getLoginUserPk(hs);
			adminParam.setI_user(i_user);
			
		} catch (Exception e) {
			System.out.println("로그인 안되어있음");
			ra.addFlashAttribute("loginFail", "관리자만 접근 가능합니다");
			return "redirect:/" + ViewRef.DEVEL_MAIN;
		}
		
		System.out.println("i_devel : 삭제 : " + param.getI_devel());
		int result = service.delDevel(param);
		
		
		return "redirect:/" + ViewRef.DEVEL_MAIN;
	}
}
