package com.jy.aboutme.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jy.aboutme.board.model.BoardDMI;
import com.jy.aboutme.board.model.BoardPARAM;

@Mapper
public interface BoardMapper {

	List<BoardPARAM> boardList();	// 전체글 리스트
	
	BoardPARAM boardDetail(BoardPARAM param); // 상세글 페이지
	
	BoardDMI selScr(BoardPARAM param);
	
	int insReg(BoardPARAM param);	// 글 등록 
	
	BoardPARAM test(BoardPARAM param);	// 테스트용 board/detail 다되면 지우면됨
}
