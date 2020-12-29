package com.jy.aboutme.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.aboutme.chat.model.ChatPARAM;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private ChatService service;
	

	@RequestMapping(value="/insChat", method=RequestMethod.POST)
	public @ResponseBody String cmtReg(@RequestBody ChatPARAM param) {
		
		int result = service.insChat(param);
		return String.valueOf(result); 
	}
	
	
}
