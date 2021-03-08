package com.jy.aboutme.play;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.aboutme.kakaoLogin.model.GuestPARAM;
import com.jy.aboutme.kakaoLogin.model.GuestVO;

@Service
public class PlayService {

	@Autowired
	private PlayMapper mapper;
	
	// 해당 유저가 있는지 체크
	public String selEmail(GuestVO vo) {
		return mapper.selEmail(vo);
	}
	
	
	// DB 카카오 정보 등록
	public int insGuest(GuestVO vo) {
		return mapper.insGuest(vo);
	}
}
