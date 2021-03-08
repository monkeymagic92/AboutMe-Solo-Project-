package com.jy.aboutme.play;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jy.aboutme.kakaoLogin.KakaoAPI;
import com.jy.aboutme.kakaoLogin.model.GuestVO;

@Controller
@RequestMapping("/play")
public class PlayController {

	@Autowired
	private PlayService service;
	
	@Autowired
    private KakaoAPI kakao;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String playMain(Model model) {
		
		return "/play/main";
	}

	
	// 카카오 로그인
	@RequestMapping(value="/login")
	public String login(@RequestParam("code") String code, HttpSession session,
			GuestVO vo, Model model) {
		
		String access_Token = kakao.getAccessToken(code);
		
		vo = kakao.getUserInfo(access_Token);
	    
	    
	    if (vo.getEmail() != null) {
	    	vo.setToken(access_Token);
	        session.setAttribute("Guest", vo);
	    }
		
		return "redirect:/play/main";
	}
	
	
	// 카카오 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session, GuestVO vo) {
		
	    kakao.kakaoLogout((GuestVO)session.getAttribute("Guest"));
	    session.removeAttribute("Guest");
	    
	    return "redirect:/play/main";
	}
}
