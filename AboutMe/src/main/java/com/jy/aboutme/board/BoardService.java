package com.jy.aboutme.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.aboutme.board.model.BoardDMI;
import com.jy.aboutme.board.model.BoardPARAM;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;
	
	// boardlist 메소드 만들기
	public List<BoardPARAM> boardList() {
		return mapper.boardList();
	}
	
	// 게시글 비밀번호 입력
	public BoardDMI selScr(BoardPARAM param) {
		return mapper.selScr(param);
		
	}
	
	// 게시판 상세페에지
	public BoardPARAM boardDetail(BoardPARAM param) {
		return mapper.boardDetail(param);
	}
	
	// 글등록 / 수정
	public int insReg(BoardPARAM param) {
		return mapper.insReg(param);
	}
	

	
	
	
	
	// 테스트용 지워도됨
	public BoardPARAM test(BoardPARAM param) {
		return mapper.test(param);
	}
}
