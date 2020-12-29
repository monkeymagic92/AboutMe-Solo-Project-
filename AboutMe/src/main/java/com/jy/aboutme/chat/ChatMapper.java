package com.jy.aboutme.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jy.aboutme.chat.model.ChatPARAM;
import com.jy.aboutme.chat.model.ChatVO;

@Mapper
public interface ChatMapper {

	List<ChatVO> selChat();	// 챗뿌리기
	
	int insChat(ChatPARAM param); // 챗 등록
}
