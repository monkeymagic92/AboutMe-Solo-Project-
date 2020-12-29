package com.jy.aboutme.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.aboutme.chat.model.ChatPARAM;
import com.jy.aboutme.chat.model.ChatVO;

@Service
public class ChatService {
	
	@Autowired
	private ChatMapper mapper;

	// 챗 뿌리기
	public List<ChatVO> selChat() {
		return mapper.selChat();
	}
	
	// 챗 등록
	public int insChat(ChatPARAM param) {
		return mapper.insChat(param);
	}
	

}
