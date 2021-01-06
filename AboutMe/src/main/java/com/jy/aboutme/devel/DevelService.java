package com.jy.aboutme.devel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.aboutme.Pagination;
import com.jy.aboutme.devel.model.DevelPARAM;

@Service
public class DevelService {

	@Autowired
	private DevelMapper mapper;
	
	// 값 뿌리기
	public List<DevelPARAM> selDevel(Pagination p) {
		return mapper.selDevel(p);
	}
	
	// 총 devel 갯수
	public int selCountDevel() {
		return mapper.selCountDevel();
	}
	
	
	// 수정시 detail 화면
	public DevelPARAM selDetail(DevelPARAM param) {
		return mapper.selDetail(param);
	}
	
	// 글 등록
	public int insDevel(DevelPARAM param) {
		return mapper.insDevel(param);
	}
	
	// 체크 수정
	public int updDevel(DevelPARAM param) {
		return mapper.updMain(param);
	}
	
	// 글 삭제
	public int delDevel(DevelPARAM param) {
		return mapper.delMain(param);
	}
	
	
}
