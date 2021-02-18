package com.jy.aboutme.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.aboutme.CommonUtils;
import com.jy.aboutme.chat.model.ChatPARAM;
import com.jy.aboutme.chat.model.ChatVO;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private ChatService service;
	

	@RequestMapping(value="/insChat", method=RequestMethod.POST)
	public @ResponseBody String insChat(@RequestBody ChatPARAM param, HttpServletRequest request) {
		
		String filterCtnt = swearWordFilter(param.getChatCtnt().toLowerCase());
		String filterCtnt2 = scriptFilter(filterCtnt);
		param.setChatCtnt(filterCtnt2);
		
		int result = service.insChat(param);
		return String.valueOf(result); 
	}
	
	
	// 댓글 뿌리기
	@RequestMapping(value="/selChat", method=RequestMethod.GET)
	private @ResponseBody List<ChatVO> selChat(Model model, ChatPARAM param){
		
		return service.selChat();
	}
	
	
	//욕 필터
	private String swearWordFilter(final String ctnt) {
		
		String[] filters = CommonUtils.filter();
		String result = ctnt;
		for(int i=0; i<filters.length; i++) {
			result = result.replace(filters[i], "***");
		}
		return result;
	}
	
	//스크립트 필터
	private String scriptFilter(final String ctnt) {
		
		String[] filters = {"<script>", "</script>"};
		String[] filterReplaces = {"&lt;script&gt;", "&lt;/script&gt;"};
		
		String result = ctnt.toLowerCase();
		System.out.println("result 값 : " + result);
		
		for(int i=0; i<filters.length; i++) {
			
			result = result.replace(filters[i], filterReplaces[i]);
		}
		return result;
	}
}
