package com.jy.aboutme.devel;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jy.aboutme.Pagination;
import com.jy.aboutme.devel.model.DevelPARAM;

@Mapper
public interface DevelMapper {

	List<DevelPARAM> selDevel(Pagination p);	// devel main 값 뿌리기
	
	int selCountDevel();	// 총 devel 갯수
	
	DevelPARAM selDetail(DevelPARAM param);	// 수정시detail 화면
	
	int insDevel(DevelPARAM param);	// 오늘 할일 등록하기
	
	int updMain(DevelPARAM param);	// 체크 박스 체크하기
	
	int delMain(DevelPARAM param); // 삭제
}
