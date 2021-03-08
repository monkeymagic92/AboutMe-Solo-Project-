package com.jy.aboutme.play;

import javax.servlet.http.HttpServletRequest;
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
	
	// 로그인 하는부분
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String playMain(Model model) {
		
		return "/play/main";
	}
	
	// 게임시작 화면
	@RequestMapping(value="/start", method=RequestMethod.GET)
	public String playStart(Model model) {
		
		return "/play/start";
	}

	
	// 카카오 로그인
	@RequestMapping(value="/login")
	public String login(@RequestParam("code") String code, HttpSession session,
			GuestVO vo, Model model, HttpServletRequest request) {
		
		String access_Token = kakao.getAccessToken(code);
		
		vo = kakao.getUserInfo(access_Token);
		
		String agent = request.getHeader("User-Agent");
		String os = getOs(agent);
		String browser = getBrowser(agent);
		String ip_addr = request.getRemoteAddr();
		
		vo.setOs(os);
		vo.setBrowser(browser);
		vo.setIp_addr(ip_addr);
		vo.setAgent(agent);
			    
	    if (vo.getEmail() != null) {	// 토큰을 이용해 정상적으로 상대 카카오 email 받아올 경우 (null 아닐때)
	    	
	    	String chkEmail = service.selEmail(vo);	// DB에 insert 중복방지
	    	
	    	if(chkEmail == null) {	// null이면 db등록 및 session 설정
	    		service.insGuest(vo);
	    		vo.setToken(access_Token);
		        session.setAttribute("Guest", vo);
		        
	    	} else {	// null 아니면 DB등록 X  ,  session만 설정
	    		vo.setToken(access_Token);
		        session.setAttribute("Guest", vo);
	    	}
	    }
		
		return "redirect:/play/start";
	}
	
	
	// 카카오 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session, GuestVO vo) {
		
	    kakao.kakaoLogout((GuestVO)session.getAttribute("Guest"));
	    session.removeAttribute("Guest");
	    
	    return "redirect:/play/main";
	}
	
	
	
	
	
	
	
	private String getBrowser(String agent) {
		if (agent.toLowerCase().contains("msie")) {
			return "ie";
		} else if (agent.toLowerCase().contains("chrome")) {
			return "chrome";
		} else if (agent.toLowerCase().contains("safari")) {
			return "safari";
		} else if (agent.toLowerCase().contains("trident")) {
			return "ie11";
		}

		return "";
	}

	private String getOs(String agent) {

		if (agent.contains("mac")) {
			return "mac";
		} else if (agent.toLowerCase().contains("windows")) {
			return "win";
		} else if (agent.toLowerCase().contains("x11")) {
			return "unix";
		} else if (agent.toLowerCase().contains("android")) {
			return "android";
		} else if (agent.toLowerCase().contains("iphone")) {
			return "iOS";
		} else if (agent.toLowerCase().contains("linux")) {
			return "linux";
		}

		return "";
	}
}
