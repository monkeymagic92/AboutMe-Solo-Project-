package com.jy.aboutme.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.aboutme.chat.model.ChatPARAM;

@Service
public class ChatService {
	
	@Autowired
	private ChatMapper mapper;

	// 챗 등록
	public int insChat(ChatPARAM param) {
		return mapper.insChat(param);
	}
}
