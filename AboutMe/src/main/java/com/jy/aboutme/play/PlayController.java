package com.jy.aboutme.play;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jy.aboutme.kakaoLogin.KakaoAPI;

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
	public String login(@RequestParam("code") String code, HttpSession session) {
		String access_Token = kakao.getAccessToken(code);
		
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    // 	   현재 test용으로 session에 박아놨는데 추후 guestPARAM에 값 넣어서 DB에 저장하기
	    if (userInfo.get("email") != null) {
	        session.setAttribute("userId", userInfo.get("email"));
	        session.setAttribute("access_Token", access_Token);
	    }
		
		return "redirect:/play/main";
	}
	
	
	// 카카오 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
	    kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("userId");
	    return "redirect:/play/main";
	}
}
