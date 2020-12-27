package com.jy.aboutme.cmt;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jy.aboutme.cmt.model.CmtDMI;
import com.jy.aboutme.cmt.model.CmtPARAM;

@Mapper
public interface CmtMapper {

	List<CmtDMI> selCmt(CmtPARAM param);	// 댓글 뿌리기
	
	CmtDMI selCmtPw(CmtPARAM param);	// 댓글 비번(삭제시)
	
	int selCmtCount(CmtPARAM param);	// 댓글 총 갯수
	
	int insCmt(CmtPARAM param);	// 댓글 등록
	
	int delCmt(CmtPARAM param);	// 댓글 삭제
}
