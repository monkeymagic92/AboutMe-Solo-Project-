package com.jy.aboutme.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.aboutme.Pagination;
import com.jy.aboutme.board.model.BoardDMI;
import com.jy.aboutme.board.model.BoardPARAM;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;
	
	// boardlist 메소드 만들기
	public List<BoardPARAM> boardList(Pagination p) {
		return mapper.boardList(p);
	}
	
	// 게시글 총 개수
	public int totalBoardCount() {
		return mapper.totalBoardCount();
	}
	
	// 게시글 비밀번호 입력
	public BoardDMI selScr(BoardPARAM param) {
		return mapper.selScr(param);
		
	}
	
	// 게시판 상세페에지
	public BoardPARAM boardDetail(BoardPARAM param) {
		return mapper.boardDetail(param);
	}
	 
	public List<BoardPARAM> searchNm(BoardPARAM param) {
		return mapper.searchNm(param);
	}
	
	public List<BoardPARAM> searchTitle(BoardPARAM param) {
		return mapper.searchTitle(param);
	}
	
	
	// 글등록 / 수정
	public int insReg(BoardPARAM param) {
		return mapper.insReg(param);
	}
	
	public int updReg(BoardPARAM param) {
		return mapper.updReg(param);
	}
	
	// 게시글 삭제
	public int delBoard(BoardPARAM param) {
		return mapper.delBoard(param);
	}
	 
	
	
	
	// 테스트용 지워도됨
	public BoardPARAM test(BoardPARAM param) {
		return mapper.test(param);
	}
}
