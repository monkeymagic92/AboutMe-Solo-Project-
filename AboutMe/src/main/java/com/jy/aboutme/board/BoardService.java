package com.jy.aboutme.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.aboutme.board.model.BoardPARAM;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;
	
	// boardlist 메소드 만들기
	public List<BoardPARAM> boardList() {
		return mapper.boardList();
	}
	
	// 글등록 / 수정
	public int insReg(BoardPARAM param) {
		return mapper.insReg(param);
	}
	
	public BoardPARAM test(BoardPARAM param) {
		return mapper.test(param);
	}
}
