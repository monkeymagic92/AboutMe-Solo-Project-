package com.jy.aboutme.chat;

import org.apache.ibatis.annotations.Mapper;

import com.jy.aboutme.chat.model.ChatPARAM;

@Mapper
public interface ChatMapper {

	int insChat(ChatPARAM param);
}
