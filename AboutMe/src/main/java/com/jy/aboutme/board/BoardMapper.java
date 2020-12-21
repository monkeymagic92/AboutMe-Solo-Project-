package com.jy.aboutme.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jy.aboutme.board.model.BoardPARAM;

@Mapper
public interface BoardMapper {

	List<BoardPARAM> boardList();
	
	int insReg(BoardPARAM param);
	
	BoardPARAM test(BoardPARAM param);	// 테스트용 board/detail 다되면 지우면됨
}
