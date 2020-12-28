package com.jy.aboutme.cmt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.aboutme.cmt.model.CmtDMI;
import com.jy.aboutme.cmt.model.CmtPARAM;

@Service
public class CmtService {
	
	// 깃허브 푸시용
	// 깃허브 푸시용
	// 깃허브 푸시용
	// 깃허브 푸시용
	
	@Autowired
	private CmtMapper mapper;

	// 댓글 뿌리기
	public List<CmtDMI> selCmt(CmtPARAM param) {
		return mapper.selCmt(param);
	}
	
	// 댓글 삭제시 비밀번호 확인
	public CmtDMI selCmtPw(CmtPARAM param) {
		return mapper.selCmtPw(param);
	}
	
	// 댓글 총 갯수
	public int selCmtCount(CmtPARAM param) {
		return mapper.selCmtCount(param);
	}
	
	// 댓글 입력
	public int insCmt(CmtPARAM param) {
		return mapper.insCmt(param);
	}
	
	// 댓글 삭제
	public int delCmt(CmtPARAM param) {
		return mapper.delCmt(param);
	}
	
}
