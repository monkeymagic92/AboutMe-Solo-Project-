package com.jy.aboutme.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jy.aboutme.admin.model.AdminPARAM;

@Controller
@RequestMapping("/")
public class AdminController {

	@Autowired
	private AdminService service;

	
	// 관리자 로그인 화면
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String admin(AdminPARAM param, Model model, HttpSession hs,
			RedirectAttributes ra) {
		
		return "/admin/admin";
	}
	
	// 관리자 로그인 성공 / 실패
	@RequestMapping(value="/admin", method = RequestMethod.POST)
	public String admin(AdminPARAM param, HttpSession hs, Model model,
			RedirectAttributes ra) {
		int result = service.selAdmin(param, hs);
		
		if(result == 1) {
			
			return "redirect:/";
		} else {
			
			ra.addFlashAttribute("loginErr", "정보 불일치 관리자가만 접근가능합니다");
			return "redirect:/admin";
		}
	}
	
	
	// 관리자 로그아웃
	@RequestMapping("/logOut")
	public String logOut(AdminPARAM param, HttpSession hs) {
		System.out.println("로그아웃");
		System.out.println(param.getI_user());
		hs.removeAttribute("loginUser");
		return "redirect:/";
	}
}
