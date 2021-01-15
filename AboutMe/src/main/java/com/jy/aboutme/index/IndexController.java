package com.jy.aboutme.index;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.aboutme.ViewRef;
import com.jy.aboutme.admin.model.AdminPARAM;
import com.jy.aboutme.chat.model.ChatPARAM;
import com.jy.aboutme.index.model.HistoryVO;

@Controller
@RequestMapping("/")
public class IndexController {

	@Autowired
	private IndexService service;
	
	// 채팅창 세션을 활용하여 창 끌경우 새로고침해도 계속 창꺼짐( 반대로 켜지면 계속 켜짐 )
	@RequestMapping(value="/chatChk", method=RequestMethod.POST)
	public @ResponseBody void chatChk(@RequestBody ChatPARAM param,
			HttpSession hs) {
		
		hs.setAttribute("chatChk", param.getChatChk());
	}
	

	@RequestMapping("/")
	public String index(Model model, HistoryVO vo, HttpServletRequest request,
			HttpSession hs, AdminPARAM param) {
		String ipSession = request.getRemoteAddr();
		param = (AdminPARAM)hs.getAttribute("loginUser");
		hs.setAttribute("ipSession", ipSession);
		
		
		if(param == null) {
			System.out.println("null 실행");
			String agent = request.getHeader("User-Agent");
			String os = getOs(agent);
			String browser = getBrowser(agent);
			String ip_addr = request.getRemoteAddr();
			
			vo.setOs(os);
			vo.setBrowser(browser);
			vo.setIp_addr(ip_addr);
			vo.setAgent(agent);
			
			System.out.println("myIp : " + vo.getMyIp());
			System.out.println("os : " + vo.getOs());
			System.out.println("ip : " + vo.getIp_addr());
			
			int insResult = service.insIpIndex(vo);
		} 

		model.addAttribute("view", ViewRef.INDEX_MAIN);
		return ViewRef.DEFAULT_TEMP;

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
