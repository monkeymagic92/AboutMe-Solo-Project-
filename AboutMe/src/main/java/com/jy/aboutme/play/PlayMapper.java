package com.jy.aboutme.play;

import org.apache.ibatis.annotations.Mapper;

import com.jy.aboutme.kakaoLogin.model.GuestVO;

@Mapper
public interface PlayMapper {

	int insGuest(GuestVO vo);
	
	String selEmail(GuestVO vo);
}
